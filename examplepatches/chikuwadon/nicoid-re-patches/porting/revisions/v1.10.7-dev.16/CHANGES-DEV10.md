# v1.10.2-dev.10 fixes based on Android 16 recording and logs

- Restore sidebar hamburger using the existing obfuscated ActionBar drawer toggle; avoid calling unavailable openDrawer method.
- Wire local playlist long-press actions into actual native b0$a popup generation; preserve native menus in unrelated lists.
- Restore visibility of thumbnail ImageViews hidden by native adapter after asynchronous artwork fetch.
- Restore video ID fallback for existing thumbnail loader when stored URLs are absent.
- Verify compiled method-delta DEX contains the popup bridge, in addition to merged helper DEX.
- Runtime device verification still required. Development only, no release or Issue closure.
