# Install Cordly (Discord add-on) on Android

**This archive is modified Morphe patch source, not an APK or `.mpp` yet.** It patches the original **Discord 350.8 Stable** APKM. **The Android app stays named Discord**, with its existing `com.discord` package and icon. Cordly names the in-app settings page only. The source is based on Venus Patches under GPL-3.0; see NOTICE and LICENSE.

## Add Cordly from GitHub (remote, auto-updating)

**Morphe installation link:** https://morphe.software/add-source?github=lildanlid1/Cordly

This deep link opens Morphe Manager's confirmation to add the GitHub repository as a patch source. It **does not** build an APK or install an uncompiled source ZIP. The source becomes installable only once the workflow publishes a `patches-1.24.0.mpp` release and adds valid metadata to the repository.

If the repository is empty, upload the **contents** of the prepared Cordly project ZIP to the repository root on GitHub, including `.github/`. In GitHub **Settings → Actions → General**, enable **Read and write permissions** for workflows. Open **Actions → Build and publish Cordly → Run workflow**. Once the workflow finishes successfully, Morphe can read the repository directly.

For later releases, increment `version`, `releaseTag`, and `releaseAsset` in `gradle.properties`. Publishing the exact same version again is deliberately skipped to avoid overwriting an already published `.mpp`.

## Compile the patch

**Phone + GitHub:** Upload the contents of this project folder to the `lildanlid1/Cordly` repository root. Run **Actions → Build and publish Cordly → Run workflow** and open the resulting GitHub release to obtain `patches-1.24.0.mpp`.

**Computer:** Install Java 21, Node.js 22 and Python 3, then from the extracted project directory run `python3 scripts/build.py`. The output is `patches/build/libs/patches-1.24.0.mpp`. Network access is required for fixed build dependencies.

## Apply on Android

1. Install the latest compatible [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases).
2. In **Sources → + → Local**, select the compiled `patches-1.24.0.mpp`, **not** this source ZIP.
3. Select the original **Discord 350.8 Stable APKM** (not a previously patched app).
4. Keep **Cordly settings** and **Server info** selected, then patch. **No Custom branding or App name option is included.**
5. Since the app remains `com.discord`, it normally cannot be installed beside a differently-signed official Discord. Back up important local data before uninstalling the original app; use the same signing key on later updates.
6. Open the patched **Discord → Settings → Cordly → Features → Server info** and enable the feature.
7. Hold a server icon → **Server info**. Tap artwork to preview it and use the overlaid save icon to download. Tap the **Emojis** or **Stickers** counter to open its gallery. Tap an item to preview; hold an item to start selection, then tap others to select them. Use Download selected/all for a ZIP and choose a folder in the Save to interface.

**Limitations:** Media saving depends on the Discord 350.8 file bridge; this source has been syntax-checked and unit-tested but cannot be verified end-to-end without building, patching and running it on an Android device. Exports allow up to 500 items and 32 MiB of downloaded media. Lottie stickers are stored as original `.json` (not converted to GIF).

## Upgrading from the earlier Cordly-branded copy

The previous archive's default package was `com.discord.cordly`. This revision intentionally uses `com.discord` and cannot update that other installed package in place. Use the previous copy's Cordly settings backup/restore if needed. The two installations keep separate local data.

## Clone a server layout (optional)

In Discord, open a server once to load its channels and roles. **Hold the server icon → Server info → Save server blueprint**. The `.json` file contains the available server name and description, role definitions and permissions, channel/category definitions, their role overwrites, and icon/banner/splash URLs. **It does not contain messages, members, memberships, bots, webhooks, invites, emojis, stickers or boost perks.** Member-specific channel overwrites cannot be transferred automatically.

To restore a server layout, create a destination Discord server manually, create a bot at the [Discord Developer Portal](https://discord.com/developers/applications) and invite it to the **destination** with Manage Server, Manage Channels and Manage Roles permissions. Use a personal computer with Node.js 22. **Never enter your account/user token.**

```bash
# Dry run (no token or network needed)
node tools/cordly-server-import.mjs my-server-blueprint.json TARGET_SERVER_ID

# Actual import (run in a terminal with a bot token environment variable)
DISCORD_BOT_TOKEN=YOUR_BOT_TOKEN node tools/cordly-server-import.mjs my-server-blueprint.json TARGET_SERVER_ID --apply --copy-assets
```

By default, ADMINISTRATOR role permissions are stripped, @everyone is left untouched, and the importer refuses to append into a nonempty server without `--allow-existing`. Re-running `--apply` may create duplicate roles/channels. Do not share the blueprint if it contains private server configuration. Review the cloned permissions carefully before inviting members. New role/channel IDs are assigned by Discord, not reused.

## Inspect a message's embed or Components V2 payload

Enable **Settings → Cordly → Features → Inspect message JSON**. Hold a message with an embed or a component to choose **View message JSON**. The inspector has All fields, Embeds and Components views; select, copy or save the JSON using Android's file picker. Components V2 are identified by message flag 32768. The inspector reads the message record already in Discord's cache; it does not retrieve private messages or bypass channel permissions. The saved JSON can contain message content and author IDs.
