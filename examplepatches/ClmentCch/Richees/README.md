# Richyss Patches

Morphe patch bundle for **Discord for Android**. It adds the **Richyss Bridge**: a small,
credential-free integration layer that the [Richyss](../) Android app uses to detect a patched
Discord client and hand over Rich Presence payloads.

The companion application lives on the [`apk` branch](https://github.com/ClmentCch/Richees/tree/apk).

> [!IMPORTANT]
> These patches do **not** read your Discord account, session token, or password, and they never
> talk to Discord's API. The bridge is a local Android `ContentProvider` that only accepts calls
> from the Richyss package.

---

## 📦 What the bundle contains

| Patch | Default | Description |
| --- | --- | --- |
| **Richyss Bridge** | ✅ | Registers an exported `ContentProvider` (`com.discord.richyss.bridge`) in the Discord client and initialises its storage from `Application.onCreate()`. Richyss uses it to read the patched-client status and to deliver a Rich Presence payload. |
| **Richyss Bridge** also writes `com.richyss.bridge.version` and `com.richyss.bridge.protocol` manifest metadata | ✅ | Lets Richyss report the installed bridge version without opening the provider. |

The provider exposes four operations:

| Operation | Purpose |
| --- | --- |
| `query("content://com.discord.richyss.bridge/status")` | Bridge version, protocol version, Discord version, whether a payload is stored |
| `query("content://com.discord.richyss.bridge/presence")` | Last payload delivered by Richyss |
| `call("setPresence", json)` | Validate and store a payload (≤ 4096 bytes, ≤ 2 buttons, http(s) URLs only) |
| `call("clearPresence")` | Delete the stored payload |

Payloads are stored in Discord's private files directory, expire after 24 hours, and are never
transmitted anywhere.

---

## 🩹 Patch list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/ClmentCch/Richees/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Discord&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.discord`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Richyss Bridge](#richyss-bridge) | Adds a local, credential-free content provider that Richyss uses to detect this patch and hand over Rich Presence payloads. |  |

</details>

<!-- PATCHES_END -->

---

## 🚀 Installation

### 1. Install Morphe

Download and install the latest **Morphe Manager** from the official project:

- <https://github.com/MorpheApp>

### 2. Add this repository as a patch source

1. Open Morphe Manager.
2. Go to **Settings → Sources** (older builds: **Patches → Add source**).
3. Add the repository URL:

   ```
   https://github.com/ClmentCch/Richees
   ```

4. Let Morphe refresh its patch list. The bundle is published as
   `patches-<version>.mpp` on the [Releases](https://github.com/ClmentCch/Richees/releases) page and
   as `patches-list.json` for tools that read the patch index.

### 3. Patch Discord

1. Select **Discord** (`com.discord`) in Morphe.
2. Pick a Discord APK you obtained yourself (APKMirror / uptodown / your own dump).
3. Enable **Richyss Bridge**.
4. Patch and install the resulting APK.
5. Install the [Richyss app](https://github.com/ClmentCch/Richees/releases) and open
   **Patch Manager**: the bridge should be reported as detected with its version.

---

## 🧩 Compatibility

- **Application**: Discord for Android (`com.discord`), form factor mobile.
- **Supported versions**: declared as *experimental for any version* because the patch does not
  depend on obfuscated Discord internals: it only relies on the `<application>` element and the
  `Application.onCreate()` method, which every Discord build provides.
- **Verified matrix**: no exhaustive Discord version matrix was validated for 1.0.0. If patching
  fails on your build, Morphe stops with a clear message instead of producing a broken client
  (the patch throws when no `Application` class or `onCreate()` is found).

---

## ⚠️ Capabilities and honest limitations

**What works today:**

- The patched client exposes the bridge and reports a verifiable status to Richyss.
- Richyss validates a presence payload with the exact same rules the bridge enforces, delivers it,
  and reads it back to confirm the round trip.

**What does not exist yet:**

- **Displaying** the payload inside Discord's activity card. Discord renders the Rich Presence that
  its own presence pipeline publishes; hooking that pipeline requires fingerprints against
  obfuscated Discord internals that could not be developed or verified when this bundle was built.
  Richyss therefore reports the state as *delivered to the bridge*, never as *visible on Discord*.
- Publishing a presence from an unpatched client. The only officially supported route is Discord's
  **Social SDK for Android** (Rich Presence over the local RPC transport, SDK ≥ 1.10), which
  requires a Discord application and the SDK distributed through the Discord Developer Portal.
  Richyss documents that route and does not fake it.

No patch in this repository uses self-bots, user tokens, or undocumented Discord HTTP endpoints.

---

## 🛠️ Building the bundle

Requirements: JDK 17+ and a GitHub token with `read:packages` (the Morphe Gradle plugin is hosted on
GitHub Packages).

```bash
# ~/.gradle/gradle.properties
# gpr.user=<your-github-username>
# gpr.key=<token with read:packages>

./gradlew :patches:build          # produces patches/build/libs/patches-<version>.mpp
./gradlew :extensions:richyss:test # bridge protocol unit tests
./gradlew generatePatchesList     # refreshes patches-list.json
```

The release workflow in `.github/workflows/release.yml` is the official Morphe
semantic-release pipeline: it builds the bundle, regenerates `patches-list.json` and the patch
table above, and attaches the `.mpp` to a GitHub release.

---

## 📁 Repository layout

```
patches/src/main/kotlin/app/richyss/patches/   # patch declarations (Morphe Patcher API)
extensions/richyss/src/main/java/             # Java code merged into the patched Discord client
extensions/richyss/src/test/java/             # JVM unit tests for the bridge protocol
gradle/libs.versions.toml                     # dependency catalog
```

---

## 📄 License

GPL-3.0, following the Morphe patches template.
