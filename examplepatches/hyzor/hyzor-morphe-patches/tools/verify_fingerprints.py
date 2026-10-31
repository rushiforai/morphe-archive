#!/usr/bin/env python3
"""
Re-check the patch fingerprints against an APK, without running Gradle, Morphe
or a disassembler.

Morphe's `Fingerprint(name = ...)` matches the *exact DEX method name*, and
`definingClass` is compared exactly when written as a full class descriptor, so all
this needs to read is class descriptor + method name + return type + parameters.

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
}

# App -> (class descriptor, method name) -> (return type, required, patch, description)
TARGETS = {
    "Sleep as Android": {
        ("Lcom/urbandroid/sleep/TrialFilter;", "isTrial"):
            ("Z", True, "Enable Premium", "the paywall; 58 call sites and isTrialExpired()"),
        ("Lcom/urbandroid/sleep/TrialFilter;", "hasUnlock"):
            ("Z", True, "Enable Premium", "drawer / unlock UI"),
        ("Lcom/urbandroid/common/util/PreferencesUtils;", "isUnlockAcked"):
            ("Z", True, "Enable Premium", "disables the Play Billing re-query"),
        ("Lcom/urbandroid/sleep/TrialFilter;", "isOurSignature"):
            ("Z", False, "Enable Premium", "unknown-signature warning strip"),
        ("Lcom/urbandroid/sleep/TrialFilter;", "isUnknownSource"):
            ("Z", False, "Enable Premium", "pirate icon / AI assistant block"),
        ("Lcom/urbandroid/common/util/PreferencesUtils;", "isCloudPremiumStatus"):
            ("Z", False, "Enable Cloud Premium", "cloud subscription flag"),
        ("Lcom/urbandroid/common/util/PreferencesUtils;", "isCloudPremiumStatusUnknown"):
            ("Z", False, "Enable Cloud Premium", "cloud state unresolved sentinel"),
    },
    # SnoreLab 2.33.5.7814:
    #   vp.h.q()          remotePremiumActive getter (the class has three ()Z getters,
    #                     so the patch pins the obfuscated method name too)
    #   mp.d.p(Lh80/g;)   premium expiration-date check in the local premium source
    "SnoreLab": {
        ("Lvp/h;", "q"):
            ("Z", True, "Enable Premium", "remotePremiumActive getter"),
        ("Lmp/d;", "p"):
            ("Z", True, "Enable Premium", "premium expiry check"),
    },
    # NYT Games 6.48.0:
    #   SubauthEntitlementClientImpl  the subauth bridge; class is not obfuscated but all of
    #                                 its members are one letter. P() = isSubscribedForGames,
    #                                 E() = isSubscribedAndLinked, K() = isSubscribedViaGooglePlay,
    #                                 R() = hasUnlinkedSubscription (see the in-app dev settings).
    #                                 Only P() reads NYTUserState.f, which the patch's
    #                                 IGET_BOOLEAN filter relies on.
    "NYT Games": {
        ("Lcom/nytimes/games/integrations/subauth/library/SubauthEntitlementClientImpl;", "P"):
            ("Z", True, "Unlock Subscription", "isSubscribedForGames; only boolean read of NYTUserState.f"),
        ("Lcom/nytimes/games/designsystem/theme/ExtendedColorsKt;", "<clinit>"):
            ("V", True, "AMOLED Black", "static light/dark palette; dark greys rewritten to #000000"),
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
    """Return the set of class descriptors and the first method signature seen per (class, name)."""
    classes = set()
    found = {}
    with zipfile.ZipFile(path) as z:
        for name, blob in _dex_blobs(z):
            dex = Dex(blob)
            for cls, meth, (ret, params) in dex.methods():
                classes.add(cls)
                found.setdefault((cls, meth), (name, ret, params))
    return classes, found


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
            hit = found.get(key)
            status = "OK  " if hit else ("MISS" if required else "skip")
            if hit:
                dexname, fret, params = hit
                sig = f"({''.join(params)}){fret}"
                print(f"  {status} {key[0]:<46} {key[1]:<28} {sig:<34} {dexname:<12} {patch}: {why}")
            else:
                print(f"  {status} {key[0]:<46} {key[1]:<28} {'-':<34} {'-':<12} {patch}: {why}")
            ok = ok and (bool(hit) or not required)
        print()

    print("all required fingerprints resolved" if ok else "MISSING REQUIRED FINGERPRINTS")
    return 0 if ok else 1


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(2)
    sys.exit(main(sys.argv[1]))
