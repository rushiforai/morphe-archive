# v1.10.2-dev.3 additional fix

- Add opt-in "旧保存先のキャッシュを削除" alongside the ordinary cache deletion preference.
- Scan ONLY getExternalFilesDir(null)/nicoid/nicoid_cache for valid sm/so/nm/ss video cache files.
- Display video count, file count, and bytes before requesting explicit deletion confirmation.
- Re-scan before deletion; abort on changed inventory or active cache acquisition; reject symlinks and files outside the selected legacy root.
- Never delete the presently configured SAF/Downloads cache folder, app settings, downloaded MP4s, fonts, or playlist data.
- Source/CI compilation and smali verification; Android device tests not performed.
- No official release, main/tag edits, or issue closure.
