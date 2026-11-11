# v1.10.2-dev.9 playlist runtime fixes

- Restore playlist-specific Move and Remove actions using the current playlist page and native video row identity.
- Render saved playlist artwork through the native row image view; recover missing thumbnails from video metadata and a CDN fallback.
- Route playlist toolbar home to the navigation drawer without returning to the playlist parent.
- Validate merged DEX hooks and payload version; no official release or issue state changes.
- Android device runtime validation remains required.
