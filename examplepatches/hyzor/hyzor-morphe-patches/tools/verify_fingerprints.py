#!/usr/bin/env python3
"""
Re-check the patch fingerprints against an APK, without running Gradle, Morphe
or a disassembler.

Morphe's `Fingerprint(name = ...)` matches the *exact DEX method name*, and
`definingClass` is compared exactly when written as a full class descriptor, so all
this needs to read is class descriptor + method name + return type + parameters.
Fingerprints anchored only on a string literal (`STRINGS`) are checked by scanning the
DEX string tables.

Usage:
    python3 tools/verify_fingerprints.py <app.apk|app.apkm|app.xapk>

The app is detected from the class descriptors that are present, so the command is
the same for every supported app. Bundles (APKM/XAPK/APKS) are opened through their
nested `base.apk`. Exit code 0 means every required fingerprint for the detected app
resolved.
"""
import io
import struct
import sys
import zipfile

# App -> class descriptor prefix used to pick the target set below.
MARKERS = {
    "Sleep as Android": "Lcom/urbandroid/sleep/",
    "SnoreLab": "Lcom/snorelab/",
    "NYT Games": "Lcom/nytimes/games/",
    "Duolingo": "Lcom/duolingo/",
    "Nova Launcher": "Lcom/teslacoilsw/launcher/",
    "FolderSync": "Ldk/tacit/",
    "Projectivy Launcher": "Lcom/spocky/projengmenu/",
    "Solid Explorer": "Lpl/solidexplorer/licensing/",
    "nzb360": "Lcom/kevinforeman/nzb360/",
    "Trakt": "Ltv/trakt/trakt/",
    "Sparkle TV": "Lse/hedekonsult/sparkle/",
}

# App -> (class descriptor, method name) -> (return type, required, patch, description)
TARGETS = {
    "Sleep as Android": {
        ("Lcom/urbandroid/sleep/TrialFilter;", "isTrial"):
            ("Z", True, "Enable Premium", "the paywall; 64 external call sites and isTrialExpired()"),
        ("Lcom/urbandroid/sleep/TrialFilter;", "hasUnlock"):
            ("Z", True, "Enable Premium", "drawer / unlock UI"),
        ("Lcom/urbandroid/common/util/PreferencesUtils;", "isUnlockAcked"):
            ("Z", True, "Enable Premium", "disables the Play Billing re-query"),
        ("Lcom/urbandroid/sleep/TrialFilter;", "isOurSignature"):
            ("Z", True, "Enable Premium", "unknown-signature warning strip"),
        ("Lcom/urbandroid/sleep/TrialFilter;", "isUnknownSource"):
            ("Z", True, "Enable Premium", "pirate icon / AI assistant block"),
        ("Lcom/urbandroid/common/util/PreferencesUtils;", "isCloudPremiumStatus"):
            ("Z", False, "Enable Cloud Premium", "cloud subscription flag"),
        ("Lcom/urbandroid/common/util/PreferencesUtils;", "isCloudPremiumStatusUnknown"):
            ("Z", False, "Enable Cloud Premium", "cloud state unresolved sentinel"),
    },
    # SnoreLab 2.33.7.7953:
    #   up.h.q()          remotePremiumActive getter (the class has three ()Z getters,
    #                     so the patch pins the obfuscated method name too). Moved from
    #                     vp.h in 2.33.5.7814; the fingerprint's string anchors do not care.
    #   mp.d.p(Lg80/g;)   premium expiration-date check in the local premium source
    "SnoreLab": {
        ("Lup/h;", "q"):
            ("Z", True, "Enable Premium", "remotePremiumActive getter"),
        ("Lmp/d;", "p"):
            ("Z", True, "Enable Premium", "premium expiry check"),
    },
    # NYT Games 6.50.0:
    #   SubauthEntitlementClientImpl  the subauth bridge; class is not obfuscated but all of
    #                                 its members are one letter. P() = isSubscribedForGames,
    #                                 D() = isSubscribedAndLinked, J() = isSubscribedViaGooglePlay,
    #                                 R() = hasUnlinkedSubscription (see the in-app dev settings).
    #                                 Only P() executes an iget-boolean (of NYTUserState.f),
    #                                 which the patch's IGET_BOOLEAN filter relies on. The
    #                                 letters move: 6.48.0 had E()/K() for the linked/Play checks.
    "NYT Games": {
        ("Lcom/nytimes/games/integrations/subauth/library/SubauthEntitlementClientImpl;", "P"):
            ("Z", True, "Unlock Subscription", "isSubscribedForGames; only iget-boolean of NYTUserState.f"),
        ("Lcom/nytimes/games/designsystem/theme/ExtendedColorsKt;", "<clinit>"):
            ("V", True, "AMOLED Black", "static light/dark palette; dark greys rewritten to #000000"),
    },
    # Nova Launcher 9.0.1 (versionName "90100 (9.0.1)"):
    #   rw.e1.b()                    the static "is Prime or Prime APK" gate; the patch
    #                                replaces its body with return true
    #   p00.i2.a(SharedPreferences)  derives Prime (p00.i2.h) from the persisted "1" value;
    #                                the patch overwrites the getInt() result with 0x200
    #   lx.v0.v(Context)             subscription-on-record check, which also gates the
    #                                licence revocation path; the patch returns true. 9.0.1
    #                                split 8.9.7's xx.b0.w() in two: v() is the subscription
    #                                check, w() additionally requires the Plus tier.
    # The class and method names are obfuscated and change with every release. They are pinned
    # here only as a fast exact-name pre-check; the fingerprints themselves match instruction
    # shapes (field access, literal sequence, string + opcode). Re-resolve all three when
    # bumping the supported version.
    "Nova Launcher": {
        ("Lrw/e1;", "b"):
            ("Z", True, "Enable Prime", "static isPrime gate"),
        ("Lp00/i2;", "a"):
            ("V", True, "Enable Prime", "prime state initialiser"),
        ("Llx/v0;", "v"):
            ("Z", True, "Enable Prime", "subscription-on-record check"),
    },
    # Duolingo 6.104.5:
    #   Most Duolingo fingerprints are structural (toString literals, field-usage shapes,
    #   opcode windows) and are validated by building and applying the bundle, not by method
    #   names here. The rows below are the pinned class/method anchors: the login request
    #   constructor, both EnergyConfig constructors and the two RampUp timer states.
    #   `Lus90` (was `Lss90`), `Lj3o` (was `Lk3o`), `Lgo3`, `Lz22` and the other short names
    #   change with every obfuscation pass,
    #   so they are deliberately not pinned here.
    "Duolingo": {
        ("Lcom/duolingo/data/signuplogin/LoginRequest$EmailLoginRequest;", "<init>"):
            ("V", True, "Disable login integrity", "constructor whose signal parameter is replaced"),
        ("Lcom/duolingo/core/energy/models/EnergyConfig;", "<init>"):
            ("V", True, "Enable Premium", "primary and Kotlinx default-args constructors"),
        ("Lcom/duolingo/data/session/state/RampupTimerState$Paused;", "<init>"):
            ("V", True, "Unlimited RampUp time", "timer state keeps the remaining seconds"),
        ("Lcom/duolingo/data/session/state/RampupTimerState$Tick;", "<init>"):
            ("V", True, "Unlimited RampUp time", "per-second tick state"),
    },
    # FolderSync 4.14.0:
    #   VersionFeaturesConfig(...Z...)  the data class whose second field is isPaidVersion;
    #                                   every premium/ad consumer reads it, and the billing
    #                                   flow rebuilds it, so the patch forces the constructor
    #                                   argument instead of the preference
    #   getPremiumVersionPurchased()Z   the "premium_version" preference read; seeds the initial
    #                                   config and backs the direct readers (ads, About screen)
    "FolderSync": {
        ("Ldk/tacit/foldersync/services/VersionFeaturesConfig;", "<init>"):
            ("V", True, "Unlock Premium", "isPaidVersion store; single 4-arg constructor"),
        ("Ldk/tacit/foldersync/services/AppPreferenceManager;", "getPremiumVersionPurchased"):
            ("Z", True, "Unlock Premium", "the \"premium_version\" preference"),
    },
    # Projectivy Launcher 4.73:
    #   PTApplication.<init>   seeds the Boolean StateFlow with Boolean.TRUE ("locked");
    #                          the patch swaps that one constant for FALSE
    #   PTApplication.d(Z)     the only later writer (billing + startup re-check); the patch
    #                          makes it return immediately. The name is obfuscated and moves
    #                          with the release, so it is pinned here only as a fast exact-name
    #                          pre-check; the real fingerprint matches the (Z)V shape plus the
    #                          cj3.l / PTApplication.x / ze4.h accesses.
    "Projectivy Launcher": {
        ("Lcom/spocky/projengmenu/PTApplication;", "<init>"):
            ("V", True, "Unlock Premium", "premium StateFlow seed (Boolean.TRUE)"),
        ("Lcom/spocky/projengmenu/PTApplication;", "d"):
            ("V", True, "Unlock Premium", "licence re-check writer"),
    },
    # Solid Explorer 3.6.5:
    #   LicenseDetails.<init>(LicenseState, String, Long, Long, String)V
    #                          the immutable licence record and the one place the state is
    #                          written; the patch rewrites it to PREMIUM_PRO while
    #                          adsEnabled() reports the free tier. The state field is named
    #                          `a` (R8), so the patch reads the name from that iput instead of
    #                          hard-coding it.
    #   LicenseDetails.adsEnabled()Z
    #                          the free-tier anchor the hook branches on.
    "Solid Explorer": {
        ("Lpl/solidexplorer/licensing/LicenseDetails;", "<init>"):
            ("V", True, "Enable Pro", "licence record; state field rewritten"),
        ("Lpl/solidexplorer/licensing/LicenseDetails;", "adsEnabled"):
            ("Z", True, "Enable Pro", "free-tier check used as the hook's condition"),
    },
    # nzb360 25.3:
    #   NZB360LicenseHelper    the singleton that owns both licence states: the All Access
    #                          flag and the per-service status list. isUnlocked(Service, Z)
    #                          combines them, and the two isLocked overloads are its inverted
    #                          delegating wrappers (147 call sites). The patch replaces all
    #                          five boolean bodies, so the exact names are pinned here as the
    #                          fast pre-check; they are not obfuscated in 25.3.
    #   Contract$UIState       the upgrade-center view state; isSubscribed() picks the paywall
    #                          vs the "already subscribed" UI.
    #   UpgradeCenterKt        SubscriptionSection seeds the plan toggle with "Monthly".
    "nzb360": {
        ("Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper;", "isAASubscriptionActive"):
            ("Z", True, "Unlock All Access", "cached All Access flag"),
        ("Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper;", "isUnlocked"):
            ("Z", True, "Unlock All Access", "the service gate (24 call sites)"),
        ("Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper;", "isLocked"):
            ("Z", True, "Unlock All Access", "both inverted wrappers (147 call sites)"),
        ("Lcom/kevinforeman/nzb360/upgradecenter/Contract$UIState;", "isSubscribed"):
            ("Z", True, "Unlock All Access", "upgrade-center subscribed state"),
        ("Lcom/kevinforeman/nzb360/upgradecenter/UpgradeCenterKt;", "SubscriptionSection"):
            ("V", True, "Unlock All Access", "plan toggle, seeded from \"Monthly\""),
    },
    # Trakt 3.28.0:
    #   User.<init>              the public 14-arg primary constructor; the app's API model is
    #                            mapped to User through it (UserKt.a)
    #   User.<init>(I, ...)      the synthetic Kotlinx-serialization constructor used when a
    #                            User is decoded from JSON (cached sessions, list responses).
    #                            3.28.0 stores the fields itself instead of delegating to the
    #                            primary constructor, so both are patched.
    #   s2j.b(MainActivity, String)Z
    #                            the AuthTab capability check; `Fix sign-in` forces it to false
    #                            so the OAuth flow uses a regular Custom Tab and the app's
    #                            https://app.trakt.tv/callback/app/trakt filter receives the code.
    # `User.h` (isVip) is obfuscated; REQUIRED_PARAMS pins both exact argument lists.
    "Trakt": {
        ("Ltv/trakt/trakt/common/model/User;", "<init>"):
            ("V", True, "Unlock VIP", "public + serializer constructors; isVip store into User.h"),
        ("Ls2j;", "b"):
            ("Z", True, "Fix sign-in", "AuthTab support check; forced to false so the flow uses a Custom Tab"),
    },
    # Sparkle TV 2.4.0:
    #   `LibUtils` is the JNI wrapper; its method names are pinned by the native library and
    #   were identical in 2.3.1 and 2.4.0. The gatekeeper and the sync distributor live in
    #   obfuscated classes (`kh/x` and `MainActivity.K`), so the patch finds them by shape and
    #   this check cannot pin them — re-resolve those against a new build with the patch itself.
    "Sparkle TV": {
        ("Lse/hedekonsult/sparkle/MainActivity;", "onCreate"):
            ("V", True, "Enable Plus", "startup_time seed for the native anti-tamper traps"),
        ("Lse/hedekonsult/utils/LibUtils;", "x"):
            ("V", True, "Enable Plus", "native anti-tamper handshake, skipped"),
        ("Lse/hedekonsult/utils/LibUtils;", "h"):
            ("I", True, "Enable Plus", "billing mask, forced to 0xFF"),
        ("Lse/hedekonsult/utils/LibUtils;", "w"):
            ("Z", True, "Enable Plus", "anti-debug check, forced false"),
        ("Lse/hedekonsult/utils/LibUtils;", "y"):
            ("Z", True, "Enable Plus", "purchase signature verify, forced true"),
        ("Lse/hedekonsult/utils/LibUtils;", "f"): ("I", True, "Enable Plus", "multi-source flag 0x1"),
        ("Lse/hedekonsult/utils/LibUtils;", "e"): ("I", True, "Enable Plus", "EPG cache flag 0x2"),
        ("Lse/hedekonsult/utils/LibUtils;", "c"): ("I", True, "Enable Plus", "live preview flag 0x4"),
        ("Lse/hedekonsult/utils/LibUtils;", "u"): ("I", True, "Enable Plus", "timeshift flag 0x8"),
        ("Lse/hedekonsult/utils/LibUtils;", "a"): ("I", True, "Enable Plus", "DVR flag 0x10"),
        ("Lse/hedekonsult/utils/LibUtils;", "v"): ("I", True, "Enable Plus", "VOD flag 0x20"),
        ("Lse/hedekonsult/utils/LibUtils;", "g"): ("I", True, "Enable Plus", "multiview flag 0x40"),
        ("Lse/hedekonsult/utils/LibUtils;", "b"): ("I", True, "Enable Plus", "editing flag 0x80"),
        ("Lse/hedekonsult/utils/LibUtils;", "i"): ("Ljava/lang/String;", True, "Enable Plus", "plan label"),
        ("Lse/hedekonsult/utils/LibUtils;", "j"): ("Ljava/lang/String;", True, "Enable Plus", "plan label"),
        ("Lse/hedekonsult/utils/LibUtils;", "k"): ("Ljava/lang/String;", True, "Enable Plus", "contribution SKU 1"),
        ("Lse/hedekonsult/utils/LibUtils;", "l"): ("Ljava/lang/String;", True, "Enable Plus", "contribution SKU 2"),
        ("Lse/hedekonsult/utils/LibUtils;", "m"): ("Ljava/lang/String;", True, "Enable Plus", "contribution SKU 3"),
        ("Lse/hedekonsult/utils/LibUtils;", "n"): ("Ljava/lang/String;", True, "Enable Plus", "Plus SKU"),
        ("Lse/hedekonsult/utils/LibUtils;", "o"): ("Ljava/lang/String;", True, "Enable Plus", "Plus connected SKU"),
        ("Lse/hedekonsult/utils/LibUtils;", "r"): ("Ljava/lang/String;", True, "Enable Plus", "monthly subscription id"),
        ("Lse/hedekonsult/utils/LibUtils;", "s"): ("Ljava/lang/String;", True, "Enable Plus", "yearly subscription id"),
        ("Lse/hedekonsult/utils/LibUtils;", "t"): ("Ljava/lang/String;", True, "Enable Plus", "shared-plan label"),
        ("Lse/hedekonsult/utils/LibUtils;", "p"): ("Ljava/lang/String;", True, "Enable Plus", "native string getter, blanked"),
        ("Lse/hedekonsult/utils/LibUtils;", "q"): ("Ljava/lang/String;", True, "Enable Plus", "native string getter, blanked"),
    },
}

# App -> (class, method) -> parameter lists that must each be present.
# Fingerprint `parameters` are matched with startswith(), so "L" pins any reference type.
REQUIRED_PARAMS = {
    "Nova Launcher": {
        ("Lrw/e1;", "b"): [[]],
        ("Lp00/i2;", "a"): [["Landroid/content/SharedPreferences;"]],
        ("Llx/v0;", "v"): [["Landroid/content/Context;"]],
    },
    "Duolingo": {
        ("Lcom/duolingo/data/signuplogin/LoginRequest$EmailLoginRequest;", "<init>"): [
            ["Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "L"],
        ],
        ("Lcom/duolingo/core/energy/models/EnergyConfig;", "<init>"): [
            ["I", "I", "J", "J", "J", "I", "J", "Ljava/lang/Integer;"],
            ["I", "I", "I", "J", "J", "J", "I", "J", "Ljava/lang/Integer;", "Z"],
        ],
        ("Lcom/duolingo/data/session/state/RampupTimerState$Paused;", "<init>"): [
            ["I", "L"],
        ],
        ("Lcom/duolingo/data/session/state/RampupTimerState$Tick;", "<init>"): [
            ["I"],
        ],
    },
    "FolderSync": {
        ("Ldk/tacit/foldersync/services/VersionFeaturesConfig;", "<init>"): [
            ["Ldk/tacit/foldersync/services/VersionIdentifier;", "Z", "I", "I"],
        ],
        ("Ldk/tacit/foldersync/services/AppPreferenceManager;", "getPremiumVersionPurchased"): [
            [],
        ],
    },
    "Projectivy Launcher": {
        ("Lcom/spocky/projengmenu/PTApplication;", "<init>"): [[]],
        ("Lcom/spocky/projengmenu/PTApplication;", "d"): [["Z"]],
    },
    "Solid Explorer": {
        ("Lpl/solidexplorer/licensing/LicenseDetails;", "<init>"): [
            [
                "Lpl/solidexplorer/licensing/LicenseState;",
                "Ljava/lang/String;",
                "Ljava/lang/Long;",
                "Ljava/lang/Long;",
                "Ljava/lang/String;",
            ],
        ],
        ("Lpl/solidexplorer/licensing/LicenseDetails;", "adsEnabled"): [[]],
    },
    "nzb360": {
        ("Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper;", "isAASubscriptionActive"): [[]],
        ("Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper;", "isUnlocked"): [
            ["Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper$Service;", "Z"],
        ],
        # Both overloads of the inverted wrapper.
        ("Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper;", "isLocked"): [
            ["Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper$Service;"],
            ["Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper$Service;", "Z"],
        ],
        ("Lcom/kevinforeman/nzb360/upgradecenter/Contract$UIState;", "isSubscribed"): [[]],
    },
    "Sparkle TV": {
        ("Lse/hedekonsult/sparkle/MainActivity;", "onCreate"):
            [["Landroid/os/Bundle;"]],
        ("Lse/hedekonsult/utils/LibUtils;", "x"): [["Lse/hedekonsult/sparkle/MainActivity;"]],
        ("Lse/hedekonsult/utils/LibUtils;", "h"):
            [["Landroid/content/Context;", "Ljava/util/ArrayList;"]],
        ("Lse/hedekonsult/utils/LibUtils;", "y"):
            [["Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"]],
        ("Lse/hedekonsult/utils/LibUtils;", "p"): [["Landroid/content/Context;"]],
        ("Lse/hedekonsult/utils/LibUtils;", "q"): [["Landroid/content/Context;"]],
    },
    "Trakt": {
        ("Ls2j;", "b"): [
            ["Ltv/trakt/trakt/MainActivity;", "Ljava/lang/String;"],
        ],
        ("Ltv/trakt/trakt/common/model/User;", "<init>"): [
            [
                "Ltv/trakt/trakt/common/model/Ids;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Z", "Z", "Z", "Z", "Z",
                "Ltv/trakt/trakt/common/model/User$Images;",
                "Ltv/trakt/trakt/common/model/User$Streamings;",
                "Ltv/trakt/trakt/common/model/User$Settings;",
            ],
            [
                "I",
                "Ltv/trakt/trakt/common/model/Ids;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Z", "Z", "Z", "Z", "Z",
                "Ltv/trakt/trakt/common/model/User$Images;",
                "Ltv/trakt/trakt/common/model/User$Streamings;",
                "Ltv/trakt/trakt/common/model/User$Settings;",
            ],
        ],
    },
}


# App -> literal strings that must be present in the app's DEX. These back fingerprints whose
# only anchor is a string literal: an obfuscated class or method name would not survive an update,
# so the name tables above cannot check them.
STRINGS = {
    "Trakt": {
        "mobile_https_auth_callback_enabled_2":
            "Fix sign-in: Remote Config key read by the auth coroutine",
    },
}


class Dex:
    def __init__(self, data):
        self.d = data
        self.n_str, self.o_str = struct.unpack_from("<II", data, 56)
        self.n_type, self.o_type = struct.unpack_from("<II", data, 64)
        self.n_proto, self.o_proto = struct.unpack_from("<II", data, 72)
        self.n_method, self.o_method = struct.unpack_from("<II", data, 88)

    def u32(self, off):
        return struct.unpack_from("<I", self.d, off)[0]

    def u16(self, off):
        return struct.unpack_from("<H", self.d, off)[0]

    def string(self, i):
        off = self.u32(self.o_str + 4 * i)
        o, length, shift = off, 0, 0
        while True:
            b = self.d[o]
            o += 1
            length |= (b & 0x7F) << shift
            shift += 7
            if not b & 0x80:
                break
        return self.d[o:o + length].decode("utf-8", "replace")

    def strings(self):
        for i in range(self.n_str):
            yield self.string(i)

    def type(self, i):
        return self.string(self.u32(self.o_type + 4 * i))

    def proto(self, i):
        _, ret_i, params_off = struct.unpack_from("<III", self.d, self.o_proto + 12 * i)
        params = []
        if params_off:
            n = self.u32(params_off)
            params = [self.type(self.u16(params_off + 4 + 2 * k)) for k in range(n)]
        return self.type(ret_i), params

    def methods(self):
        for i in range(self.n_method):
            c, p, n = struct.unpack_from("<HHI", self.d, self.o_method + 8 * i)
            yield self.type(c), self.string(n), self.proto(p)


def _dex_blobs(z):
    """Yield (label, bytes) for every DEX this archive carries.

    A plain APK has the DEX files at the top level. APKM/XAPK/APKS bundles (e.g. the
    NYT Games or SnoreLab downloads) keep the code in a nested `base.apk`, so that is
    opened too instead of silently finding no classes.
    """
    dex_names = sorted(
        n for n in z.namelist() if n.startswith("classes") and n.endswith(".dex")
    )
    if dex_names:
        for name in dex_names:
            yield name, z.read(name)
        return

    apks = sorted(
        (n for n in z.namelist() if n.endswith(".apk") and "/" not in n),
        key=lambda n: (n != "base.apk", n),
    )
    for apk in apks:
        with zipfile.ZipFile(io.BytesIO(z.read(apk))) as inner:
            for name in sorted(
                n for n in inner.namelist() if n.startswith("classes") and n.endswith(".dex")
            ):
                yield f"{apk}!{name}", inner.read(name)


def scan(path):
    """Return the class descriptors and every method signature seen per (class, name)."""
    classes = set()
    found = {}
    with zipfile.ZipFile(path) as z:
        for name, blob in _dex_blobs(z):
            dex = Dex(blob)
            for cls, meth, (ret, params) in dex.methods():
                classes.add(cls)
                # The DEX method_ids table lists every referenced method, so the same declared
                # method can appear many times (and in several DEX files); keep one entry per
                # signature, remembering the first DEX that referenced it.
                entry = (ret, tuple(params))
                found.setdefault((cls, meth), {}).setdefault(entry, name)
    return classes, found


def scan_strings(path, wanted):
    """Return the wanted literals that the archive's DEX string tables do not contain."""
    missing = set(wanted)
    with zipfile.ZipFile(path) as z:
        for _name, blob in _dex_blobs(z):
            for value in Dex(blob).strings():
                missing.discard(value)
            if not missing:
                break
    return missing


def signature_matches(signature, expected):
    """Whether a scanned signature matches an expected parameter list.

    Parameter types are compared with `startswith`, mirroring Morphe's prefix matching, so a
    short entry such as "L" pins any reference type without pinning the obfuscated class.
    """
    _dexname, _ret, params = signature
    return len(params) == len(expected) and all(
        actual.startswith(prefix) for actual, prefix in zip(params, expected)
    )


def required_signatures_present(signatures, required):
    """Whether every expected parameter list is present among the scanned signatures."""
    return all(
        any(signature_matches(signature, expected) for signature in signatures)
        for expected in required
    )


def main(path):
    classes, found = scan(path)

    apps = [app for app, marker in MARKERS.items() if any(c.startswith(marker) for c in classes)]
    if not apps:
        print("no supported app class found in", path)
        return 2

    ok = True
    for app in apps:
        print(f"[{app}]")
        for key, (ret, required, patch, why) in TARGETS[app].items():
            entries = found.get(key, {})
            signatures = [
                (dexname, ret, list(params)) for (ret, params), dexname in entries.items()
            ]
            expected = REQUIRED_PARAMS.get(app, {}).get(key)
            matches = expected is None or required_signatures_present(signatures, expected)
            status = "OK  " if signatures and matches else ("MISS" if required else "skip")
            dexname = signatures[0][0] if signatures else "-"
            sig = "; ".join(
                f"({''.join(params)}){fret}" for _dexname, fret, params in signatures
            ) or "-"
            print(f"  {status} {key[0]:<46} {key[1]:<28} {sig:<34} {dexname:<12} {patch}: {why}")
            ok = ok and (bool(signatures) and matches or not required)

        if STRINGS.get(app):
            missing = scan_strings(path, STRINGS[app])
            for literal, why in STRINGS[app].items():
                present = literal not in missing
                print(f"  {'OK  ' if present else 'MISS'} string {literal:<40} {why}")
                ok = ok and present
        print()

    print("all required fingerprints resolved" if ok else "MISSING REQUIRED FINGERPRINTS")
    return 0 if ok else 1


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(2)
    sys.exit(main(sys.argv[1]))
