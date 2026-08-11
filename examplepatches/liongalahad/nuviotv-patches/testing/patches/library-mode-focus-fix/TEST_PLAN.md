# Library Mode Focus Fix test plan

## Isolated

1. Apply only `Library Mode Focus Fix` to the official x86_64 APK.
2. Open Library with Saved selected.
3. Press Down once, then Up once; verify focus returns to Saved.
4. Select Cloud, press Down once, then Up once; verify focus returns to Cloud.
5. Verify no Morphe setting or manifest component is added by this patch.

## Combined

1. Apply the fix with Local Media and all other current optional patches.
2. Repeat the Saved and Cloud paths and verify neither returns to Storage.
3. Select Storage and verify its native Local Media navigation remains unchanged.
4. Check logs for crashes, verifier errors, and `MorpheLibraryFocus` errors.
