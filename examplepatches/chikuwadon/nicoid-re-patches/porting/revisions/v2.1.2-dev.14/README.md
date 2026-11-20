# nicoid Re v2.1.2-dev.14

- Store edited video titles from their private preferences file inside settings backups, and restore that map independently from the main preferences
- Do not erase edited titles when older backups omit the title map; roll them back if a later settings commit fails
- Back up per-playlist sorting preferences and supply their default values for saved playlist folders
- Include known non-sensitive settings saved outside preference screens: playback-position saving, custom ranking preferences, playlist/series playback modes, and related controls
- Preserve backup JSON format version 1 and the Japanese, English and Traditional Chinese preference descriptions
- Continue excluding authentication, cookies, credentials and other secrets

This is a development candidate, not an official release.
