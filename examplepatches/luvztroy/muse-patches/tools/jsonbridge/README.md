# Mobile Config override file bridge

The bridge uses the app's private `getFilesDir()/mobileconfig/mc_overrides.json` file, rather than a hard-coded filesystem location. Export copies that file unchanged to a user-selected document. Import accepts a raw overrides JSON object or an Instafel `.ibackup` JSON envelope and extracts its `backup` object. It validates the staged content before replacing the existing file, preserving the current file if validation or replacement fails.

`AuraMCDebugJsonBridge.java` is compiled against the pinned Android API jar and converted to DEX by the repository build. The options-menu methods in `src/replacements/jsonhooks` add the two picker actions and forward activity results to the bridge. The resulting DEX files are bundled as patch resources, not checked in as generated binaries.
