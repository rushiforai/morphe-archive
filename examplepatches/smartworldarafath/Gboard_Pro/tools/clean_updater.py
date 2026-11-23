import urllib.request
import os

files = [
    ('PixelBoardUpdateFeature.java', 'https://raw.githubusercontent.com/Akshayykadam/PixelBoard/main/pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateFeature.java'),
    ('PixelBoardUpdateManager.java', 'https://raw.githubusercontent.com/Akshayykadam/PixelBoard/main/pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateManager.java')
]

dest_dir = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater'

for fname, url in files:
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req) as resp:
        content = resp.read().decode('utf-8')

    if fname == 'PixelBoardUpdateManager.java':
        content = content.replace(
            'https://api.github.com/repos/Akshayykadam/PixelBoard/releases/latest',
            'https://api.github.com/repos/smartworldarafath/Gboard_Pro/releases/latest'
        )
        content = content.replace(
            'https://github.com/Akshayykadam/PixelBoard/releases',
            'https://github.com/smartworldarafath/Gboard_Pro/releases'
        )
    elif fname == 'PixelBoardUpdateFeature.java':
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
            ('"PixelBoard v"', '"Gboard Pro v"'),
        ]
        for old, new in replacements:
            content = content.replace(old, new)

        content = content.replace('import com.akshaykadam.pixelboard.extension.R;', '')
        content = content.replace('import com.akshaykadam.pixelboard.extension.settings.GboardSettingsText;', '')

    dest_path = os.path.join(dest_dir, fname)
    with open(dest_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f'Cleaned {fname} successfully!')
