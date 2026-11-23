#!/usr/bin/env python3
"""
Gboard Pro v2.1.1 Rebranding & Smali Patcher.
Applies:
1. Rebrand AndroidManifest.xml to package="com.gboardpro.app", label="Gboard Pro", update provider authorities & permissions, add activity aliases & intent filters.
2. Resource branding: strings.xml (PixelBoard -> Gboard Pro across all locales), clipboard 24h retention array, settings.xml Pro menu, animations, drawables, and launcher icons.
3. Smali hooks into Gboard 18.6.3 base:
   - SettingsActivity: M3 Expressive slide transitions, 144Hz high refresh rate, notification permission
   - LatinFirstRunActivity: notification permission
   - pbk.smali: 144Hz IME window refresh rate enforcement
   - esj.smali: 144Hz window refresh rate enforcement
   - VibrationDurationPreference.smali: real-time haptic slider vibration preview
"""

import os
import re
import shutil
from pathlib import Path

ROOT = Path("temp_decompiled")
REF_1841 = Path("temp_decompiled_1841")


def patch_manifest():
    print("--- 1. Patching AndroidManifest.xml ---")
    manifest_path = ROOT / "AndroidManifest.xml"
    txt = manifest_path.read_text(encoding="utf-8")

    # Replace package name and app label
    txt = txt.replace('package="com.akshaykadam.pixelboard"', 'package="com.gboardpro.app"')
    txt = txt.replace('android:label="PixelBoard"', 'android:label="Gboard Pro"')

    # Replace provider authorities & permissions
    txt = txt.replace("com.akshaykadam.pixelboard.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION", "com.gboardpro.app.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION")
    txt = txt.replace("com.akshaykadam.pixelboard.androidx-startup", "com.gboardpro.app.androidx-startup")
    txt = txt.replace("com.akshaykadam.pixelboard.clipboard_content", "com.gboardpro.app.clipboard_content")
    txt = txt.replace("com.akshaykadam.pixelboard.feature.advanced_voice_typing", "com.gboardpro.app.feature.advanced_voice_typing")
    txt = txt.replace("com.akshaykadam.pixelboard.feature.ai_writing_tools", "com.gboardpro.app.feature.ai_writing_tools")
    txt = txt.replace("com.akshaykadam.pixelboard.fileprovider", "com.gboardpro.app.fileprovider")
    txt = txt.replace("com.akshaykadam.pixelboard.gboard_patches", "com.gboardpro.app.gboard_patches")
    txt = txt.replace("com.akshaykadam.pixelboard.inputactionprovider", "com.gboardpro.app.inputactionprovider")
    txt = txt.replace("com.akshaykadam.pixelboard.mlkitinitprovider", "com.gboardpro.app.mlkitinitprovider")
    txt = txt.replace("com.akshaykadam.pixelboard.pixelbundle.RECEIVER", "com.gboardpro.app.pixelbundle.RECEIVER")
    txt = txt.replace("com.akshaykadam.pixelboard.swissarmyknifefileprovider", "com.gboardpro.app.swissarmyknifefileprovider")
    txt = txt.replace("com.akshaykadam.pixelboard.tracing", "com.gboardpro.app.tracing")
    txt = txt.replace("com.akshaykadam.pixelboard.wdb", "com.gboardpro.app.wdb")
    txt = txt.replace('android:authorities="com.akshaykadam.pixelboard"', 'android:authorities="com.gboardpro.app"')
    txt = txt.replace('deeplink.com.akshaykadam.pixelboard', 'deeplink.com.gboardpro.app')

    # Phenotype registrations
    txt = txt.replace('com.google.android.gms.phenotype.registration.binarypb:com.akshaykadam.pixelboard', 'com.google.android.gms.phenotype.registration.binarypb:com.gboardpro.app')
    txt = txt.replace('com.google.android.gms.phenotype.registration.xml:com.akshaykadam.pixelboard', 'com.google.android.gms.phenotype.registration.xml:com.gboardpro.app')

    # Update LauncherActivity and add launcher aliases
    old_launcher = re.search(r'<activity[^>]+com\.google\.android\.libraries\.inputmethod\.launcher\.LauncherActivity[^>]*>.*?</activity>', txt, re.DOTALL)
    if old_launcher:
        new_launcher = """<activity android:configChanges="keyboardHidden|orientation|screenSize" android:enabled="true" android:exported="true" android:name="com.google.android.libraries.inputmethod.launcher.LauncherActivity" android:theme="@style/SettingsTheme.Transparent"/>
        <activity-alias
            android:name="com.gboardpro.app.launcher.Default"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="true"
            android:exported="true"
            android:icon="@mipmap/ic_app"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:name="com.gboardpro.app.launcher.Purple"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="false"
            android:exported="true"
            android:icon="@mipmap/icon_purple"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:name="com.gboardpro.app.launcher.Slate"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="false"
            android:exported="true"
            android:icon="@mipmap/icon_slate"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:name="com.gboardpro.app.launcher.ForestGreen"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="false"
            android:exported="true"
            android:icon="@mipmap/icon_forest_green"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:name="com.gboardpro.app.launcher.NavyBlue"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="false"
            android:exported="true"
            android:icon="@mipmap/icon_navy_blue"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>"""
        txt = txt.replace(old_launcher.group(0), new_launcher)
        print("[OK] Replaced LauncherActivity with activity aliases")
    else:
        print("[WARN] LauncherActivity pattern not found in manifest")

    # Update GboardPatchesSettingsActivity
    old_patches_act = re.search(r'<activity[^>]+GboardPatchesSettingsActivity[^>]*/>', txt)
    if old_patches_act:
        new_patches_act = """<activity android:exported="true" android:name="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" android:theme="@style/style_0x7f150431">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <action android:name="com.akshaykadam.pixelboard.action.UPDATES" />
                <action android:name="com.akshaykadam.pixelboard.action.APPEARANCE" />
                <action android:name="com.akshaykadam.pixelboard.action.BOARD_UI" />
                <action android:name="com.akshaykadam.pixelboard.action.ABOUT" />
                <action android:name="com.akshaykadam.pixelboard.action.PRO" />
                <category android:name="android.intent.category.DEFAULT" />
            </intent-filter>
        </activity>"""
        txt = txt.replace(old_patches_act.group(0), new_patches_act)
        print("[OK] Replaced GboardPatchesSettingsActivity with full intent filters")

    manifest_path.write_text(txt, encoding="utf-8")
    print("[OK] AndroidManifest.xml saved successfully")


def patch_resources():
    print("\n--- 2. Patching Resources ---")

    # 1. Copy animations
    anim_src = REF_1841 / "res" / "anim"
    anim_dst = ROOT / "res" / "anim"
    anim_dst.mkdir(parents=True, exist_ok=True)
    for anim_file in anim_src.glob("m3_slide_*.xml"):
        shutil.copy2(anim_file, anim_dst / anim_file.name)
        print(f"[OK] Copied animation {anim_file.name}")

    # 2. Copy drawables
    draw_src = REF_1841 / "res" / "drawable"
    draw_dst = ROOT / "res" / "drawable"
    draw_dst.mkdir(parents=True, exist_ok=True)
    for d_name in ["ic_help_feedback.xml", "ic_app_updates.xml", "ic_appearance.xml", "ic_board_ui.xml"]:
        if (draw_src / d_name).exists():
            shutil.copy2(draw_src / d_name, draw_dst / d_name)
            print(f"[OK] Copied drawable {d_name}")

    # 3. Copy launcher mipmaps
    for mip_dir in REF_1841.glob("res/mipmap*"):
        target_mip = ROOT / "res" / mip_dir.name
        target_mip.mkdir(parents=True, exist_ok=True)
        for icon_file in mip_dir.glob("icon_*.png"):
            shutil.copy2(icon_file, target_mip / icon_file.name)
        for icon_file in mip_dir.glob("ic_app*"):
            shutil.copy2(icon_file, target_mip / icon_file.name)
        for icon_file in mip_dir.glob("ic_launcher_*.xml"):
            shutil.copy2(icon_file, target_mip / icon_file.name)
    print("[OK] Copied custom mipmap icons")

    # 4. Patch strings.xml across all locales
    strings_count = 0
    for root, dirs, files in os.walk(ROOT / "res"):
        for f in files:
            if f.startswith("strings") and f.endswith(".xml"):
                fp = Path(root) / f
                content = fp.read_text(encoding="utf-8", errors="ignore")
                if "PixelBoard" in content:
                    content = content.replace("PixelBoard Settings", "Gboard Pro Settings")
                    content = content.replace("PixelBoard Spell Checker Settings", "Gboard Pro Spell Checker Settings")
                    content = content.replace("PixelBoard Spell Checker", "Gboard Pro Spell Checker")
                    content = content.replace("PixelBoard updates", "Gboard Pro Updates")
                    content = content.replace("PixelBoard", "Gboard Pro")
                    fp.write_text(content, encoding="utf-8")
                    strings_count += 1
    print(f"[OK] Replaced PixelBoard with Gboard Pro in {strings_count} strings.xml files")

    # 5. Patch arrays.xml for 24h clipboard retention
    arrays_path = ROOT / "res" / "values" / "arrays.xml"
    arrays_txt = arrays_path.read_text(encoding="utf-8")
    target_clip_array = """    <string-array name="array_0x7f03004a">
        <item>1</item>
        <item>2</item>
        <item>3</item>
        <item>6</item>
        <item>12</item>
        <item>18</item>
        <item>24</item>
    </string-array>"""
    arrays_txt = re.sub(
        r'<string-array name="array_0x7f03004a">.*?</string-array>',
        target_clip_array,
        arrays_txt,
        flags=re.DOTALL
    )
    arrays_path.write_text(arrays_txt, encoding="utf-8")
    print("[OK] Updated array_0x7f03004a with 24h retention options in arrays.xml")

    # 6. Patch settings.xml & settings_legacy.xml
    for s_name in ["res/xml/settings.xml", "res/xml/settings_legacy.xml"]:
        s_path = ROOT / s_name
        s_txt = s_path.read_text(encoding="utf-8")

        # Remove previous gboard_patches_entry or pixelboard_updates_entry
        s_txt = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="gboard_patches_entry"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', s_txt, flags=re.DOTALL)
        s_txt = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="pixelboard_updates_entry"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', s_txt, flags=re.DOTALL)
        s_txt = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="pref_key_pro"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', s_txt, flags=re.DOTALL)
        s_txt = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="pref_key_help_feedback"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', s_txt, flags=re.DOTALL)
        s_txt = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="pref_key_app_updates"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', s_txt, flags=re.DOTALL)

        # Make About preference selectable and point to GboardPatchesSettingsActivity action ABOUT
        about_pat = r'(<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="@string/string_0x7f140a50"[^>]*)(/>|>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>)'
        m_about = re.search(about_pat, s_txt, flags=re.DOTALL)
        if m_about:
            about_repl = """<com.google.android.libraries.inputmethod.settings.widget.HeaderPreference android:icon="?attr_0x7f040190" android:persistent="false" android:title="@string/string_0x7f140b1f" android:selectable="true" android:key="@string/string_0x7f140a50">
            <intent android:targetPackage="com.gboardpro.app" android:action="com.akshaykadam.pixelboard.action.ABOUT" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" />
        </com.google.android.libraries.inputmethod.settings.widget.HeaderPreference>
        <com.google.android.libraries.inputmethod.settings.widget.HeaderPreference android:icon="@drawable/ic_gemini_sparkle" android:persistent="false" android:title="Pro" android:summary="Appearance, Board UI &amp; Advanced Settings" android:selectable="true" android:key="pref_key_pro">
            <intent android:targetPackage="com.gboardpro.app" android:action="com.akshaykadam.pixelboard.action.PRO" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" />
        </com.google.android.libraries.inputmethod.settings.widget.HeaderPreference>
        <com.google.android.libraries.inputmethod.settings.widget.HeaderPreference android:icon="@drawable/ic_help_feedback" android:persistent="false" android:title="Help &amp; feedback" android:summary="Report issues &amp; feature requests on GitHub" android:key="pref_key_help_feedback">
            <intent android:action="android.intent.action.VIEW" android:data="https://github.com/smartworldarafath/Gboard_Pro/issues" />
        </com.google.android.libraries.inputmethod.settings.widget.HeaderPreference>
        <com.google.android.libraries.inputmethod.settings.widget.HeaderPreference android:icon="@drawable/ic_app_updates" android:persistent="false" android:title="Gboard Pro Updates" android:summary="Check for latest updates &amp; releases" android:selectable="true" android:key="pref_key_app_updates">
            <intent android:targetPackage="com.gboardpro.app" android:action="com.akshaykadam.pixelboard.action.UPDATES" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" />
        </com.google.android.libraries.inputmethod.settings.widget.HeaderPreference>"""
            s_txt = s_txt[:m_about.start()] + about_repl + s_txt[m_about.end():]
            print(f"[OK] Injected Pro, About, Help & Feedback, and Updates in {s_name}")
        else:
            print(f"[WARN] About HeaderPreference not found in {s_name}")

        s_path.write_text(s_txt, encoding="utf-8")


def patch_smali():
    print("\n--- 3. Patching Base Smali Hooks ---")

    # 1. SettingsActivity.smali
    sa = ROOT / "smali_classes2/com/google/android/apps/inputmethod/latin/preference/SettingsActivity.smali"
    sa_txt = sa.read_text(encoding="utf-8")
    if "GboardM3Helper;->applyActivityEnterTransition" in sa_txt:
        print("[SKIP] SettingsActivity already patched")
    else:
        # Hook onCreate
        old_super = "invoke-super {p0, p1}, Lezj;->onCreate(Landroid/os/Bundle;)V"
        new_super = """invoke-super {p0, p1}, Lezj;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/updater/GboardNotificationHelper;->requestNotificationPermission(Landroid/app/Activity;)V

    invoke-virtual {p0}, Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->enforceHighRefreshRate(Landroid/view/Window;)V

    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->applyActivityEnterTransition(Landroid/app/Activity;)V"""
        assert old_super in sa_txt, "SettingsActivity onCreate super call missing"
        sa_txt = sa_txt.replace(old_super, new_super, 1)

        # Add finish() method
        finish_method = """.method public finish()V
    .locals 0

    invoke-super {p0}, Lezj;->finish()V

    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->applyActivityExitTransition(Landroid/app/Activity;)V

    return-void
.end method
"""
        sa_txt = sa_txt + "\n" + finish_method
        sa.write_text(sa_txt, encoding="utf-8")
        print("[OK] SettingsActivity onCreate and finish patched")

    # 2. LatinFirstRunActivity.smali
    fra = ROOT / "smali_classes3/com/google/android/apps/inputmethod/latin/firstrun/LatinFirstRunActivity.smali"
    fra_txt = fra.read_text(encoding="utf-8")
    if "GboardNotificationHelper;->requestNotificationPermission" in fra_txt:
        print("[SKIP] LatinFirstRunActivity already patched")
    else:
        old_resume = "invoke-super {p0}, Lppw;->onResume()V"
        new_resume = """invoke-super {p0}, Lppw;->onResume()V

    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/updater/GboardNotificationHelper;->requestNotificationPermission(Landroid/app/Activity;)V"""
        assert old_resume in fra_txt, "LatinFirstRunActivity onResume super call missing"
        fra_txt = fra_txt.replace(old_resume, new_resume, 1)
        fra.write_text(fra_txt, encoding="utf-8")
        print("[OK] LatinFirstRunActivity onResume patched")

    # 3. pbk.smali (InputMethodService)
    pbk = ROOT / "smali_classes2/pbk.smali"
    pbk_txt = pbk.read_text(encoding="utf-8")
    if "GboardM3Helper;->enforceHighRefreshRateIme" in pbk_txt:
        print("[SKIP] pbk.smali already patched")
    else:
        # onCreate hook
        old_create = "invoke-super {p0}, Landroid/inputmethodservice/InputMethodService;->onCreate()V"
        new_create = """invoke-super {p0}, Landroid/inputmethodservice/InputMethodService;->onCreate()V

    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->enforceHighRefreshRateIme(Landroid/inputmethodservice/InputMethodService;)V"""
        assert old_create in pbk_txt, "pbk onCreate super call missing"
        pbk_txt = pbk_txt.replace(old_create, new_create, 1)

        # onWindowShown hook
        old_shown = "invoke-super {p0}, Landroid/inputmethodservice/InputMethodService;->onWindowShown()V"
        new_shown = """invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->enforceHighRefreshRateIme(Landroid/inputmethodservice/InputMethodService;)V

    invoke-super {p0}, Landroid/inputmethodservice/InputMethodService;->onWindowShown()V"""
        assert old_shown in pbk_txt, "pbk onWindowShown super call missing"
        pbk_txt = pbk_txt.replace(old_shown, new_shown, 1)

        # onConfigureWindow hook
        m_conf = re.search(r'(\.method public (?:final )?onConfigureWindow\(Landroid/view/Window;ZZ\)V\s*\.locals \d+)', pbk_txt)
        assert m_conf, "pbk onConfigureWindow method signature missing"
        old_conf_head = m_conf.group(1)
        new_conf_head = old_conf_head + "\n\n    invoke-static {p1}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->enforceHighRefreshRate(Landroid/view/Window;)V"
        pbk_txt = pbk_txt.replace(old_conf_head, new_conf_head, 1)

        pbk.write_text(pbk_txt, encoding="utf-8")
        print("[OK] pbk.smali onCreate, onWindowShown, onConfigureWindow patched")

    # 4. esj.smali
    esj = ROOT / "smali_classes2/esj.smali"
    esj_txt = esj.read_text(encoding="utf-8")
    if "GboardM3Helper;->enforceHighRefreshRate" in esj_txt:
        print("[SKIP] esj.smali already patched")
    else:
        m_esj = re.search(r'(\.method public (?:final )?onConfigureWindow\(Landroid/view/Window;ZZ\)V\s*\.locals \d+)', esj_txt)
        assert m_esj, "esj onConfigureWindow method signature missing"
        old_esj_head = m_esj.group(1)
        new_esj_head = old_esj_head + "\n\n    invoke-static {p1}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->enforceHighRefreshRate(Landroid/view/Window;)V"
        esj_txt = esj_txt.replace(old_esj_head, new_esj_head, 1)
        esj.write_text(esj_txt, encoding="utf-8")
        print("[OK] esj.smali onConfigureWindow patched")

    # 5. VibrationDurationPreference.smali
    vdp = ROOT / "smali_classes3/com/google/android/libraries/inputmethod/preferencewidgets/VibrationDurationPreference.smali"
    vdp_txt = vdp.read_text(encoding="utf-8")
    if "GboardHapticHelper;->vibratePreview" in vdp_txt:
        print("[SKIP] VibrationDurationPreference already patched")
    else:
        start = vdp_txt.find(".method public final ap(I)V")
        assert start != -1, "VibrationDurationPreference ap(I)V start missing"
        end = vdp_txt.find(".end method", start)
        assert end != -1, "VibrationDurationPreference ap(I)V end missing"
        new_ap = """.method public final ap(I)V
    .locals 1

    if-lez p1, :cond_0

    iget-object v0, p0, Landroidx/preference/Preference;->j:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/akshaykadam/pixelboard/extension/settings/GboardHapticHelper;->vibratePreview(Landroid/content/Context;I)V

    :cond_0
    return-void
.end method"""
        vdp_txt = vdp_txt[:start] + new_ap + vdp_txt[end + 11:]
        vdp.write_text(vdp_txt, encoding="utf-8")
        print("[OK] VibrationDurationPreference ap(I)V patched")


def main():
    print("=== Gboard Pro v2.1.1 Rebranding & Smali Patcher ===")
    patch_manifest()
    patch_resources()
    patch_smali()
    print("\nAll v2.1.1 rebranding and patches applied successfully!")


if __name__ == "__main__":
    main()
