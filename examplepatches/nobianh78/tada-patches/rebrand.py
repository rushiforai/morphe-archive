import os
import re

kt_replacements = {
    "patches/src/main/kotlin/app/tada/patches/reddit/misc/settings/SettingsPatch.kt": [
        ("implement TADa settings", "implement TADa settings"),
        ("textContent = \"TADa\"", "textContent = \"TADa\"")
    ],
    "patches/src/main/kotlin/app/tada/patches/reddit/layout/branding/name/CustomBrandingNamePatch.kt": [
        ("Reddit TADa", "Reddit TADa")
    ],
    "patches/src/main/kotlin/app/tada/patches/youtube/misc/announcements/AnnouncementsPatch.kt": [
        ("announcements from TADa", "announcements from TADa")
    ],
    "patches/src/main/kotlin/app/tada/patches/youtube/misc/settings/SettingsPatch.kt": [
        ("settings for TADa", "settings for TADa")
    ],
    "patches/src/main/kotlin/app/tada/patches/youtube/layout/flyout/AddToQueuePatch.kt": [
        ("with the TADa video queue", "with the TADa video queue")
    ],
    "patches/src/main/kotlin/app/tada/patches/youtube/layout/playbackinfeeds/PlaybackInFeedsPatch.kt": [
        ("to the TADa settings", "to the TADa settings")
    ],
    "patches/src/main/kotlin/app/tada/patches/youtube/layout/music/OverrideYouTubeMusicButtonsPatch.kt": [
        ("open TADa Music or any", "open any")
    ],
    "patches/src/main/kotlin/app/tada/patches/shared/misc/debugging/EnableDebuggingPatch.kt": [
        ("exporting TADa logs", "exporting TADa logs")
    ],
    "patches/src/main/kotlin/app/tada/patches/shared/layout/branding/AddBrandLicensePatch.kt": [
        ("modified with TADa patches", "modified with TADa patches")
    ],
    "patches/src/main/kotlin/app/tada/patches/music/misc/settings/SettingsPatch.kt": [
        ("settings for TADa", "settings for TADa")
    ]
}

# Update KT files
for filepath, replacements in kt_replacements.items():
    if os.path.exists(filepath):
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        for old, new in replacements:
            content = content.replace(old, new)
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)

# Update strings.xml files
for root, dirs, files in os.walk("patches/src/main/resources/addresources/"):
    for file in files:
        if file == "strings.xml":
            filepath = os.path.join(root, file)
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            # We want to replace TADa with TADa, but be careful with XML attributes? No, it's safe to replace the text content.
            # But wait, there are strings like name="tada_..." we shouldn't touch these since they are keys? 
            # The user said: "KHÔNG đổi package names, ... tên class, key trong code — trừ khi đã xác minh đổi không gãy build và không gãy chức năng."
            # The key 'tada_...' is an xml resource name. If we change it, we might break R.string.tada_... in code unless we also change the Kotlin files. It's safer to ONLY change the text inside XML nodes, or just change "TADa" (capitalized). Since resource names are usually lowercase "tada_", replacing only "TADa" (case sensitive) will only match the display strings and comments!
            # Let's replace "TADa" with "TADa" and "tada" with "tada" if they are inside > <, but actually case-sensitive "TADa" is enough for display strings.
            
            content = content.replace("TADa", "TADa")
            # For Spanish/French etc, it might be "tada" in lowercase in some translations? Let's check if there are lowercase "tada" in display strings. Usually translations capitalize it.
            
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
