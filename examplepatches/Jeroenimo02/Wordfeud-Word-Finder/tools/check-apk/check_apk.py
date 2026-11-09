#!/usr/bin/env python3
"""Checks a new Wordfeud version for everything the patch relies on (standard library only).

Usage:  python3 tools/check-apk/check_apk.py Wordfeud_5.8.0_APKPure.xapk
Accepts .apk, .xapk (APKPure) and .apkm/.apks (split bundles). Prints the app version and one line per check:

  1. Bytecode hooks: the Java methods the patches inject into (patches/src/main/kotlin/...). If one is MISSING,
     patching fails; see docs/UPDATING.md for how to find the new name.
  2. Dart strings: names inside the Flutter code (libapp.so) that the extension depends on at run time: routes,
     platform channels, API fields. If one is MISSING the patch still applies, but that feature may stop working.

Exit code 0 when every check passes, 1 otherwise. Keep HOOKS in sync with the Fingerprint objects in
patches/src/main/kotlin/app/wordfeudwordfinder/patches/ and DART_STRINGS with the extension code named next to it.
"""
import io
import json
import struct
import sys
import zipfile

PACKAGE = "com.hbwares.wordfeud.free"

# (class, method, descriptor, used by) -- one entry per Fingerprint in the patches.
CALLBACK = "Lio/flutter/plugins/cronet_http/UrlRequestCallbackProxy;"
REQ, INFO = "Lorg/chromium/net/UrlRequest;", "Lorg/chromium/net/UrlResponseInfo;"
HOOKS = [
    ("Lcom/hbwares/wordfeud/ui/main/MainActivity;", "onCreate", "(Landroid/os/Bundle;)V",
     "ui/OverlayPatch.kt: starts the overlay"),
    ("Lio/flutter/embedding/engine/FlutterJNI;", "handlePlatformMessage", "(Ljava/lang/String;Ljava/nio/ByteBuffer;IJ)V",
     "platform/PlatformTapPatch.kt: routes, theme, banner; ads/RemoveAdsPatch.kt: answers the ad calls"),
    ("Lio/flutter/embedding/engine/FlutterJNI;", "invokePlatformMessageResponseCallback", "(ILjava/nio/ByteBuffer;I)V",
     "extension ads/AdBlock (called by reflection): the reply to a blocked ad call"),
    ("Lio/flutter/embedding/engine/FlutterJNI;", "cleanupMessageData", "(J)V",
     "extension ads/AdBlock (called by reflection): frees a blocked ad call"),
    ("Lio/flutter/embedding/engine/FlutterJNI;", "dispatchPlatformMessage", "(Ljava/lang/String;Ljava/nio/ByteBuffer;II)V",
     "extension play/JniDispatch (called by reflection): refresh after a move"),
    ("Lorg/chromium/net/CronetEngine$Builder;", "setUserAgent", None,
     "platform/UserAgentPatch.kt: the app's User-Agent"),
    ("Lorg/chromium/net/UrlResponseInfo;", "getUrl", "()Ljava/lang/String;",
     "extension hooks/NetworkTap (called by reflection): which API address a response belongs to"),
    (CALLBACK, "onResponseStarted", "(%s%s)V" % (REQ, INFO), "network/Fingerprints.kt: game data"),
    (CALLBACK, "onReadCompleted", "(%s%sLjava/nio/ByteBuffer;)V" % (REQ, INFO), "network/Fingerprints.kt"),
    (CALLBACK, "onSucceeded", "(%s%s)V" % (REQ, INFO), "network/Fingerprints.kt"),
    (CALLBACK, "onFailed", "(%s%sLorg/chromium/net/CronetException;)V" % (REQ, INFO), "network/Fingerprints.kt"),
    (CALLBACK, "onCanceled", "(%s%s)V" % (REQ, INFO), "network/Fingerprints.kt"),
]

# (string, used by) -- exact strings that must occur in libapp.so.
DART_STRINGS = [
    ("game/:gid", "hooks/PlatformMessages: the game route /game/<id> (button only on the game screen)"),
    ("dev.flutter.pigeon.wordfeud.AdApi.setBannerVisible", "hooks/RouteTap: ad banner state (button position)"),
    ("https://api.wordfeud.com/wf/", "hooks/NetworkTap, play/MoveRequest: API base address"),
    ("user/games/detail/", "game/GameStore: the games list with game logs"),
    ("/move/", "play/MoveRequest: sending a move"),
    ("game_format", "play/MoveRequest: ?game_format=log"),
    ("game_log", "game/ResponseParser: the move history of a game"),
    ("packed_move", "game/GameReplay: move events"),
    ("new_tiles", "game/GameReplay: own new rack tiles"),
    ("tile_points", "game/ResponseParser: letters and points per ruleset"),
    ("illegal_words", "play/MoveSubmitter: words the server rejected (V6)"),
    (".domains", "play/SessionReader: the session cookie file <filesDir>/.cookies/<store>/.domains"),
    ("package:cookie_jar/src/jar/persist.dart", "play/SessionReader: cookies kept by the cookie_jar package"),
] + [
    # Keep in sync with AdBlock.BLOCKED. A missing name means Wordfeud renamed that ad call: patching still works,
    # but that kind of ad may come back.
    ("dev.flutter.pigeon.wordfeud.AdApi." + m, "ads/AdBlock: blocked ad call")
    for m in ("setBannerAdUnitId", "setInterstitialAdUnitId", "setAutoLoadInterstitial", "setInterstitialInterval",
              "setInterstitialPreloading", "showInterstitial", "setLeaderboardAdUnitId", "setLeaderboardVisible",
              "setMrecAdUnitId", "setMrecVisible", "showConsentFormIfNeeded")
]


def uleb(b, p):
    r = s = 0
    while True:
        x = b[p]
        p += 1
        r |= (x & 0x7F) << s
        if x < 0x80:
            return r, p
        s += 7


class Dex:
    """Minimal DEX reader: the methods each class defines, as (class, name, descriptor)."""

    def __init__(self, b):
        self.b = b
        u = lambda o: struct.unpack_from("<I", b, o)[0]
        self.strings = [self._str(u(u(0x3C) + 4 * i)) for i in range(u(0x38))]
        self.types = [self.strings[u(u(0x44) + 4 * i)] for i in range(u(0x40))]
        protos = []
        for i in range(u(0x48)):
            o = u(0x4C) + 12 * i
            ret, poff = u(o + 4), u(o + 8)
            params = []
            if poff:
                n = u(poff)
                params = [self.types[struct.unpack_from("<H", b, poff + 4 + 2 * k)[0]] for k in range(n)]
            protos.append("(" + "".join(params) + ")" + self.types[ret])
        mids = []
        for i in range(u(0x58)):
            o = u(0x5C) + 8 * i
            c, pr = struct.unpack_from("<HH", b, o)
            mids.append((self.types[c], self.strings[u(o + 4)], protos[pr]))
        self.methods = set()
        for i in range(u(0x60)):
            data = u(u(0x64) + 32 * i + 24)
            if not data:
                continue
            p = data
            sf, p = uleb(b, p)
            inf, p = uleb(b, p)
            dm, p = uleb(b, p)
            vm, p = uleb(b, p)
            for _ in range(sf + inf):
                _, p = uleb(b, p)
                _, p = uleb(b, p)
            for count in (dm, vm):
                idx = 0
                for _ in range(count):
                    d, p = uleb(b, p)
                    idx += d
                    _, p = uleb(b, p)
                    _, p = uleb(b, p)
                    self.methods.add(mids[idx])

    def _str(self, off):
        _, p = uleb(self.b, off)
        end = self.b.index(b"\0", p)
        return self.b[p:end].decode("utf-8", "replace")


def open_apks(path):
    """The base APK and all split APKs of an .apk/.xapk/.apkm file, plus the version from manifest.json if any."""
    z = zipfile.ZipFile(path)
    names = z.namelist()
    if "AndroidManifest.xml" in names:
        return [z], None
    apks = [zipfile.ZipFile(io.BytesIO(z.read(n))) for n in names if n.endswith(".apk")]
    version = None
    for meta in ("manifest.json", "info.json"):
        if meta in names:
            m = json.loads(z.read(meta))
            version = m.get("version_name") or m.get("versionName")
    return apks, version


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        return 2
    apks, version = open_apks(sys.argv[1])
    methods = set()
    lib = None
    for a in apks:
        for n in a.namelist():
            if n.startswith("classes") and n.endswith(".dex"):
                methods |= Dex(a.read(n)).methods
            if n.endswith("arm64-v8a/libapp.so") or (lib is None and n.endswith("/libapp.so")):
                lib = a.read(n)
    print("Wordfeud version: %s" % (version or "unknown (no manifest.json)"))
    ok = True
    print("\nBytecode hooks (patching fails when one is missing):")
    for cls, name, desc, use in HOOKS:
        hit = [m for m in methods if m[0] == cls and m[1] == name and (desc is None or m[2] == desc)]
        ok &= bool(hit)
        print("  %-7s %s->%s%s   [%s]" % ("OK" if hit else "MISSING", cls, name, desc or "", use))
        if not hit:
            near = sorted({m[2] for m in methods if m[0] == cls and m[1] == name})
            if near:
                print("          same name, other parameters: %s" % ", ".join(near))
    print("\nDart strings in libapp.so (a feature may stop working when one is missing):")
    if lib is None:
        print("  MISSING libapp.so (no arm64-v8a split in this file?)")
        ok = False
    else:
        for s, use in DART_STRINGS:
            hit = s.encode() in lib
            ok &= hit
            print("  %-7s %-52s [%s]" % ("OK" if hit else "MISSING", s, use))
    print("\n" + ("All checks passed." if ok else "Some checks failed: see docs/UPDATING.md."))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
