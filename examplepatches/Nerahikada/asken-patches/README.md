# asken-patches

Morphe patches for [あすけん](https://play.google.com/store/apps/details?id=jp.co.greenhouse.asken) (`jp.co.greenhouse.asken`).

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Nerahikada/asken-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 あすけん&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 9.8.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [De-virtualize PairIP methods](#de-virtualize-pairip-methods) | PairIP relocated 20 framework-override method bodies into runtime-generated classes reached via reflected Methods that are null once PairIP is removed. Restores safe behavior: ContentProvider.onCreate returns true, other ContentProvider/onBind return null/0, Activity lifecycle overrides delegate to super. Third-party login/deeplink/health flows degrade gracefully; core features are unaffected. |  |
| [Disable PairIP](#disable-pairip) | Fully removes PairIP so no native code runs: skips the startup VM program (StartupLauncher.launch), prevents libpairipcore from loading (VMRunner.<clinit> return-void, where System.loadLibrary lives), and no-ops the signature/license gates. libpairipcore staying out is what keeps the Play-license paywall away; the only thing that needed its VM — YLPacker — is reimplemented in Java (see reimplementYlpackerPatch). Decrypted Strings and virtualized bodies are rebuilt by the Restore and De-virtualize patches. |  |
| [Disable ads](#disable-ads) | Disables all in-app advertising by preventing ad SDK initialization and suppressing ad containers. |  |
| [Disable tracking](#disable-tracking) | Blocks analytics and tracking SDKs (Repro, Firebase Analytics, Facebook) to prevent user profiling. |  |
| [Reimplement YLPacker in Java](#reimplement-ylpacker-in-java) | Replaces com.yl.pack.YLPacker's native packJNI/unpackJNI (HEX+AES-128-ECB, key "yolandakitnewhdr") with a pure-Java equivalent and skips loadLibrary("ylpacker"), so libylpacker.so — which is DT_NEEDED on libpairipcore.so and would drag PairIP + its Play-license paywall back in — never loads. Lets PairIP stay fully removed. |  |
| [Restore encrypted strings](#restore-encrypted-strings) | Repopulates the obfuscated static String holders that PairIP's startup VM decrypts at runtime (1466 values dumped from the original-signed app via am dumpheap), so removing PairIP no longer leaves them null. |  |
| [Unlock nutrient ranking](#unlock-nutrient-ranking) | Unlocks the full food nutrient ranking (食べたもの栄養素ランキング). The server already sends every ranked item with its real values to free accounts; the app merely masks the numbers based on the client-trusted enable_full_nut_ranking flag. Forcing that flag to 1 reveals the already-downloaded values and enables switching the ranked nutrient. |  |
| [Unlock premium](#unlock-premium) | Unlocks premium features by forcing the local premium status to Premium. |  |

</details>

<!-- PATCHES_END -->

### How to use

Add this patch source in Morphe Manager:

```
https://morphe.software/add-source?github=Nerahikada/asken-patches
```

### Supported versions

| Version | Status |
|---|---|
| 9.8.0 | Confirmed |
| Other | Experimental |

## Building locally

```sh
export GITHUB_ACTOR=your_github_username
export GITHUB_TOKEN=your_github_pat  # needs read:packages scope
./gradlew build
```

The built `.mpp` file is at `patches/build/libs/patches-*.mpp`.

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
