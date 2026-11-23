with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateFeature.java', 'r', encoding='utf-8') as f:
    content = f.read()

replacements = [
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_title)', '"Gboard Pro Updates"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_summary)', '"Check for latest updates & releases"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_header_badge)', '"Beta"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_header_title)', '"Gboard Pro Updates"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_header_summary)', '"Stay updated with the latest features and fixes"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_status_available_title)', '"Update Available"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_status_available_summary)', '"A new version of Gboard Pro is ready to install."'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_status_error_summary)', '"Unable to check for updates. Please verify your connection."'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_status_error_title)', '"Check Failed"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_action_download)', '"Download and Install"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_action_view_github)', '"View on GitHub"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_action_view_github_summary)', '"Open the release page on GitHub"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_action_check_now)', '"Check for Updates"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_action_view_all_releases)', '"All Releases"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_action_view_all_releases_summary)', '"Browse past changelogs on GitHub"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_section_actions)', '"ACTIONS"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_pref_autocheck_title)', '"Check for updates automatically"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_pref_autocheck_summary)', '"Automatically query GitHub for new releases on launch"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_section_preferences)', '"PREFERENCES"'),
    ('GboardSettingsText.get(context, R.string.gboard_patches_update_section_info)', '"VERSION INFO"'),
    ('PixelBoard', 'Gboard Pro'),
    ('pixelboard', 'gboardpro'),
]

for old, new in replacements:
    content = content.replace(old, new)

# Remove unused imports if needed
content = content.replace('import com.akshaykadam.pixelboard.extension.R;', '')
content = content.replace('import com.akshaykadam.pixelboard.extension.settings.GboardSettingsText;', '')

with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateFeature.java', 'w', encoding='utf-8') as f:
    f.write(content)

print("PixelBoardUpdateFeature strings updated successfully!")
