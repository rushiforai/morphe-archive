import re

def update_xml(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove Appearance HeaderPreference
    content = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="pref_key_appearance"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', content, flags=re.DOTALL)

    # Remove Board UI HeaderPreference
    content = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="pref_key_board_ui"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', content, flags=re.DOTALL)

    # Remove old gboard_patches_entry HeaderPreference
    content = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="gboard_patches_entry"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', content, flags=re.DOTALL)

    # Remove existing pref_key_pro if any
    content = re.sub(r'<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="pref_key_pro"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*', '', content, flags=re.DOTALL)

    # New Pro HeaderPreference
    pro_entry = """        <com.google.android.libraries.inputmethod.settings.widget.HeaderPreference android:icon="@drawable/ic_gemini_sparkle" android:persistent="false" android:title="Pro" android:summary="Appearance, Board UI &amp; Advanced Settings" android:selectable="true" android:key="pref_key_pro">
            <intent android:targetPackage="com.gboardpro.app" android:action="com.akshaykadam.pixelboard.action.PRO" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" />
        </com.google.android.libraries.inputmethod.settings.widget.HeaderPreference>
"""

    # Insert right below About
    # About key is @string/string_0x7f140a65 or pref_key_about
    about_match = re.search(r'(<com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference[^>]*key="@string/string_0x7f140a65"[^>]*>.*?</com\.google\.android\.libraries\.inputmethod\.settings\.widget\.HeaderPreference>\s*)', content, flags=re.DOTALL)
    if about_match:
        pos = about_match.end()
        content = content[:pos] + pro_entry + content[pos:]
        print(f"Inserted Pro below About in {path}")
    else:
        print(f"Could not find About in {path}")

    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)

update_xml('temp_decompiled/res/xml/settings.xml')
update_xml('temp_decompiled/res/xml/settings_legacy.xml')
