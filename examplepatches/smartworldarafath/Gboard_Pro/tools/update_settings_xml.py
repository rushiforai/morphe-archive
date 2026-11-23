def update_xml(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Appearance
    content = content.replace(
        '<intent android:targetPackage="com.gboardpro.app" android:action="android.intent.action.MAIN" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardAppearanceActivity" />',
        '<intent android:targetPackage="com.gboardpro.app" android:action="com.akshaykadam.pixelboard.action.APPEARANCE" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" />'
    )

    # Board UI
    content = content.replace(
        '<intent android:targetPackage="com.gboardpro.app" android:action="android.intent.action.MAIN" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardBoardUiActivity" />',
        '<intent android:targetPackage="com.gboardpro.app" android:action="com.akshaykadam.pixelboard.action.BOARD_UI" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" />'
    )

    # About
    content = content.replace(
        '<intent android:targetPackage="com.gboardpro.app" android:action="android.intent.action.MAIN" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardAboutActivity" />',
        '<intent android:targetPackage="com.gboardpro.app" android:action="com.akshaykadam.pixelboard.action.ABOUT" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" />'
    )

    # Gboard Pro Updates
    content = content.replace(
        '<intent android:targetPackage="com.gboardpro.app" android:action="android.intent.action.MAIN" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardAppUpdatesActivity" />',
        '<intent android:targetPackage="com.gboardpro.app" android:action="com.akshaykadam.pixelboard.action.UPDATES" android:targetClass="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" />'
    )

    # Ensure selectable="true" on all these HeaderPreferences
    content = content.replace('android:key="pref_key_appearance">', 'android:selectable="true" android:key="pref_key_appearance">')
    content = content.replace('android:key="pref_key_board_ui">', 'android:selectable="true" android:key="pref_key_board_ui">')
    content = content.replace('android:key="pref_key_app_updates">', 'android:selectable="true" android:key="pref_key_app_updates">')
    content = content.replace('android:key="@string/string_0x7f140a65">', 'android:selectable="true" android:key="@string/string_0x7f140a65">')

    # Avoid duplicate selectable="true"
    content = content.replace('android:selectable="true" android:selectable="true"', 'android:selectable="true"')

    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Updated {path} successfully!")

update_xml('temp_decompiled/res/xml/settings.xml')
update_xml('temp_decompiled/res/xml/settings_legacy.xml')
