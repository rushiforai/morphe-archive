#!/usr/bin/env python3
"""
apply_v131_patches.py — apply all v1.3.1 patches to a fresh apktool decompile
of Opera Beta base.apk (104.0.5262.91143).

Usage:
    python3 apply_v131_patches.py /path/to/beta_base

Where /path/to/beta_base is the directory produced by:
    java -jar apktool.jar d -f -o beta_base base.apk

The script is idempotent: each patch checks whether it has already been
applied and skips if so. It exits non-zero on any unexpected state.

Patches applied (in order):
    02a  WelcomeActivity T&C bypass         (2 sites)
    02b  r65.l(Z)Z always returns false
    02c  mm6 default-browser dialog bypass
    03a  AndroidManifest: strip 3 VPN Pro components
    03b  wdn.a()Z always returns false
    03c  strings.xml: blank 5 VPN Pro strings

Patch 01 (disable spoof) requires NO action — it means "do not apply the
old spoof patch".
"""
import sys
import re
from pathlib import Path


def must(cond, msg):
    if not cond:
        print(f"FAIL: {msg}", file=sys.stderr)
        sys.exit(1)


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def patch_file(path: Path, transform):
    """Read path, apply transform(text)->text, write back if changed."""
    text = path.read_text(encoding="utf-8")
    new = transform(text)
    if new is None:
        print(f"  skip (already patched or pattern not found): {path}")
        return
    if new == text:
        print(f"  skip (no change): {path}")
        return
    path.write_text(new, encoding="utf-8")
    print(f"  patched: {path}")


# ---------------------------------------------------------------------------
# 02a — WelcomeActivity T&C bypass
# ---------------------------------------------------------------------------

def patch_02a(base: Path):
    print("[02a] WelcomeActivity T&C bypass")
    f = base / "smali_classes3/com/opera/android/startup/WelcomeActivity.smali"
    must(f.exists(), f"missing {f}")

    # Site 1: onCreate, registers v4/v6
    site1_old = (
        '    invoke-virtual {v4, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z\n'
        '\n'
        '    move-result v4\n'
        '\n'
        '    if-eqz v4, :cond_7\n'
    )
    site1_new = (
        '    invoke-virtual {v4, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z\n'
        '\n'
        '    move-result v4\n'
        '\n'
        '    const/4 v4, 0x1\n'
        '\n'
        '    if-eqz v4, :cond_7\n'
    )

    # Site 2: onStart, registers v0/v1
    site2_old = (
        '    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z\n'
        '\n'
        '    move-result v0\n'
        '\n'
        '    if-nez v0, :cond_1\n'
    )
    site2_new = (
        '    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z\n'
        '\n'
        '    move-result v0\n'
        '\n'
        '    const/4 v0, 0x1\n'
        '\n'
        '    if-nez v0, :cond_1\n'
    )

    def transform(text):
        changed = False
        if site1_old in text:
            text = text.replace(site1_old, site1_new, 1)
            changed = True
        if site2_old in text:
            text = text.replace(site2_old, site2_new, 1)
            changed = True
        return text if changed else None

    patch_file(f, transform)


# ---------------------------------------------------------------------------
# 02b — r65.l(Z)Z always returns false
# ---------------------------------------------------------------------------

def patch_02b(base: Path):
    print("[02b] r65.l(Z)Z always returns false")
    f = base / "smali_classes3/r65.smali"
    must(f.exists(), f"missing {f}")

    # Match the entire method body and replace.
    pattern = re.compile(
        r'\.method public final l\(Z\)Z\s*\n\s*\.locals 1\s*\n.*?\.end method',
        re.DOTALL,
    )

    replacement = (
        '.method public final l(Z)Z\n'
        '    .locals 1\n'
        '\n'
        '    const/4 v0, 0x0\n'
        '\n'
        '    return v0\n'
        '.end method'
    )

    def transform(text):
        if not pattern.search(text):
            return None
        new = pattern.sub(replacement, text, count=1)
        # Idempotency: if the new body is already present, the sub is a no-op.
        if 'const/4 v0, 0x0\n\n    return v0\n.end method' not in new:
            return None
        return new

    patch_file(f, transform)


# ---------------------------------------------------------------------------
# 02c — mm6 default-browser dialog bypass
# ---------------------------------------------------------------------------

def patch_02c(base: Path):
    print("[02c] mm6 default-browser dialog bypass")
    f = base / "smali_classes3/mm6.smali"
    must(f.exists(), f"missing {f}")

    old = (
        '    invoke-interface {v9, v12, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z\n'
        '\n'
        '    move-result v13\n'
        '\n'
        '    if-eqz v13, :cond_5\n'
    )
    new = (
        '    invoke-interface {v9, v12, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z\n'
        '\n'
        '    move-result v13\n'
        '\n'
        '    const/4 v13, 0x0\n'
        '\n'
        '    if-eqz v13, :cond_5\n'
    )

    def transform(text):
        if old not in text:
            return None
        return text.replace(old, new, 1)

    patch_file(f, transform)


# ---------------------------------------------------------------------------
# 03a — AndroidManifest: strip 3 VPN Pro components
# ---------------------------------------------------------------------------

def patch_03a(base: Path):
    print("[03a] AndroidManifest: strip 3 VPN Pro components")
    f = base / "AndroidManifest.xml"
    must(f.exists(), f"missing {f}")

    # Use regex with DOTALL to remove the 3 blocks. Each block is anchored on
    # its android:name="…VpnPro…" attribute.

    block_re_1 = re.compile(
        r'\n        <receiver android:exported="false" android:name="com\.opera\.android\.vpn\.VpnProReceiver">.*?</receiver>\n',
        re.DOTALL,
    )
    block_re_2 = re.compile(
        r'\n        <service android:exported="true" android:icon="@drawable/ic_material_vpn_on"[^>]*android:name="com\.opera\.android\.vpn\.quick_settings_tile\.VpnProQuickSettingsTileService"[^>]*>.*?</service>\n',
        re.DOTALL,
    )
    block_re_3 = re.compile(
        r'\n        <receiver android:exported="false" android:label="@string/vpn_pro_title" android:name="com\.opera\.android\.vpn\.app_widget\.VpnProAppWidget">.*?</receiver>\n',
        re.DOTALL,
    )

    def transform(text):
        changed = False
        for rx in (block_re_1, block_re_2, block_re_3):
            new = rx.sub('\n', text)
            if new != text:
                changed = True
                text = new
        return text if changed else None

    patch_file(f, transform)


# ---------------------------------------------------------------------------
# 03b — wdn.a()Z always returns false
# ---------------------------------------------------------------------------

def patch_03b(base: Path):
    print("[03b] wdn.a()Z always returns false")
    f = base / "smali_classes3/wdn.smali"
    must(f.exists(), f"missing {f}")

    pattern = re.compile(
        r'\.method public final a\(\)Z\s*\n\s*\.locals 1\s*\n.*?\.end method',
        re.DOTALL,
    )
    replacement = (
        '.method public final a()Z\n'
        '    .locals 1\n'
        '\n'
        '    const/4 v0, 0x0\n'
        '\n'
        '    return v0\n'
        '.end method'
    )

    def transform(text):
        if not pattern.search(text):
            return None
        new = pattern.sub(replacement, text, count=1)
        return new

    patch_file(f, transform)


# ---------------------------------------------------------------------------
# 03c — strings.xml: blank 5 VPN Pro strings
# ---------------------------------------------------------------------------

def patch_03z_mbridge(base: Path):
    """Pre-existing apktool/aapt2 incompatibility, not a v1.3.1 patch per se:
    the mbridge SDK manifest declares `android:theme="@-2113273852"` (a
    negative resource ID) which aapt2 refuses to link. apktool 2.11.1 fails
    the rebuild with "'@-2113273852' is incompatible with attribute theme".
    The original Vogelkop build script handled this; we replicate the fix
    here so the patched tree builds standalone.
    """
    print("[03z] (workaround) mbridge MBCommonActivity negative-theme fixup")
    f = base / "AndroidManifest.xml"
    must(f.exists(), f"missing {f}")

    bad = 'android:theme="@-2113273852"'
    # The other mbridge activities in this manifest use Translucent.NoTitleBar;
    # reuse the same theme so visual behavior is unchanged.
    good = 'android:theme="@android:style/Theme.Translucent.NoTitleBar"'

    def transform(text):
        if bad not in text:
            return None
        return text.replace(bad, good, 1)

    patch_file(f, transform)


def patch_03c(base: Path):
    print("[03c] strings.xml: blank 5 VPN Pro strings")
    f = base / "res/values/strings.xml"
    must(f.exists(), f"missing {f}")

    blanks = {
        "vpn_pro_title": " ",
        "omnibox_suggested_vpn_pro_title": " ",
        "switch_to_vpn_pro_button": " ",
        "switch_to_vpn_pro_banner_body": " ",
        "switch_to_vpn_pro_reminder_dialog_title": " ",
    }

    def transform(text):
        changed = False
        for name, val in blanks.items():
            # Match: <string name="NAME">ANYTHING</string>
            rx = re.compile(
                r'(<string name="' + re.escape(name) + r'">).*?(</string>)',
                re.DOTALL,
            )
            new = rx.sub(lambda m: m.group(1) + val + m.group(2), text, count=1)
            if new != text:
                changed = True
                text = new
        return text if changed else None

    patch_file(f, transform)


# ---------------------------------------------------------------------------
# main
# ---------------------------------------------------------------------------

def main():
    if len(sys.argv) != 2:
        print(__doc__, file=sys.stderr)
        sys.exit(2)
    base = Path(sys.argv[1]).resolve()
    must(base.is_dir(), f"not a directory: {base}")
    must((base / "AndroidManifest.xml").exists(),
         f"no AndroidManifest.xml in {base} — is this an apktool decompile?")

    print(f"Applying v1.3.1 patches to: {base}\n")
    patch_02a(base)
    patch_02b(base)
    patch_02c(base)
    patch_03a(base)
    patch_03b(base)
    patch_03c(base)
    patch_03z_mbridge(base)
    print("\nAll v1.3.1 patches applied. Next steps:")
    print("  1. java -jar apktool.jar b beta_base -o beta_patched.apk")
    print("  2. zipalign -p -f 4 beta_patched.apk beta_aligned.apk")
    print("  3. apksigner sign --ks morphe.keystore --ks-pass pass:Morphe \\")
    print("       --ks-key-alias morphe --key-pass pass:Morphe \\")
    print("       --v1-signing-enabled true --v2-signing-enabled true \\")
    print("       --v3-signing-enabled true beta_aligned.apk")
    print("  4. Merge with the .apkm splits (use apkmtool or the build_bisect.sh")
    print("     script from the Vogelkop repo) to produce the final installable.")


if __name__ == "__main__":
    main()
