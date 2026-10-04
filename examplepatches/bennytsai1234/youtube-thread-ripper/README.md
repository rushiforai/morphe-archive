# Thread Ripper patches

Patches for YouTube on Android, for use with [Morphe](https://github.com/MorpheApp). They make
playback with spoofed (non-SABR) video streams smoother:

| Patch | What it does |
|---|---|
| **Multi-connection video download** | Splits each video byte range into 1 MiB chunks, downloads them over 8 concurrent requests on the app's own network stack (Cronet, HTTP/3), and hands the bytes to the player strictly in order. The chunk the player is waiting for gets the highest request priority, so startup is not slowed by chunks further ahead. |
| **Video buffer preload** | Lets the player keep loading until 900 s of video is buffered or the buffer holds 250 MiB, whichever comes first. YouTube itself stops at about 21 MB, which is only 10–25 s of 4K. |
| **Stall recovery** | Adds an option, off by default, to resume playback after a stall once 1.6 s of video is buffered instead of the app's 5 s. It may stall again sooner, so try it and keep it only if it feels better. |

All patches are on by default and need no setup. Their options are in **YouTube → Settings →
Morphe → Thread Ripper** (this screen needs the official Morphe Patches, which add the Morphe
settings menu).

**Recommended:** also set Morphe's own **Playback buffer size** to **Maximum**. The preload patch
only turns the app's "stop loading" into "continue"; it never stops loading earlier than the app
would. With both, you get the larger of the two: at 1080p the official Maximum alone buffers up to
about 650 s, at 4K the preload patch goes past the official 128 MiB cap (about 120 s instead of
about 60 s).

[繁體中文說明](#繁體中文說明)

## When it helps

Morphe's **Spoof video streams** can make YouTube use a client without SABR (for example
*visionOS* or *Android VR Downgraded*). With those clients the app downloads plain
`/videoplayback` byte ranges, one request per ~10 s segment, and keeps only about 21 MB buffered.
At high resolutions or playback speeds that buffer lasts a few seconds, and a single request is
often slower than the video's bitrate, so playback stalls.

The patches do nothing for SABR streams (the default YouTube client), live streams, or
non-googlevideo hosts: those requests are left to the app unchanged. If the first response of a
range is not 2xx (for example 403), the range is handed back to the app so its own error handling
runs.

## Results

Measured on one phone (Android 16, YouTube 21.16.256, Morphe Patches 1.45.0, Spoof video streams
= visionOS), 4K (itag 313) at 3x speed, home broadband over Wi-Fi. Stalls were counted from screen
recordings (ffmpeg freezedetect), not from player state.

- **Multi-connection download**: without the patch, 5 stalls totalling 6.7 s in 3 × 45 s; with it,
  0 stalls. Per-range throughput 85–300 Mbps with 8 connections, against 33–85 Mbps for the app's
  single request. Small sample, but a clear direction.
- **Buffer**: without preload the 4K buffer cycled between 10 and 25 s of video (3–8 s of real time
  at 3x). With preload it reached 90 s of video within about 6 s of playback and stayed near the
  limit; 250 MiB holds about 120 s of 4K.
- **Memory**: YouTube's Java heap limit is 512 MiB. With a 300 MiB buffer the heap peaked at
  464 MiB, so the default is 250 MiB.
- **Startup**: playback started 3–5 s after launching the app, the same as without the patches.

Network capacity still matters: when the whole connection drops (seen once: 5–14 Mbps across all
8 connections for a few minutes), playback right after starting or seeking can still stall, because
the buffer has not been built yet.

## Install

Requires [Morphe Manager](https://github.com/MorpheApp) with the official Morphe Patches, and
**Spoof video streams** set to a non-SABR client (visionOS or Android VR Downgraded).

1. In Morphe Manager, add a patch source:
   `https://raw.githubusercontent.com/bennytsai1234/youtube-thread-ripper/main/patches-bundle.json`
   (or download `patches-*.mpp` from the [releases](https://github.com/bennytsai1234/youtube-thread-ripper/releases) and import it).
2. Patch YouTube with both the official patches and these patches.

Verified on YouTube **21.16.256**. The hooks match media3 structure and strings rather than
obfuscated names, so other versions may work; they are marked experimental.

## Settings

**Morphe → Thread Ripper** has: buffer preload on/off, preload target (seconds of video), preload
memory limit (MiB, 16–300), multi-connection download on/off, connections per range (1–32),
"resume sooner after a stall" on/off and its threshold (milliseconds of video, 0–5000).
Changes apply to the next media request; no restart needed.

### Overrides for testing (adb)

Android system properties override the settings screen. They are read at runtime and reset on
reboot; an empty value falls back to the settings screen.

| Property | Default | Meaning |
|---|---|---|
| `debug.tr.enabled` | `true` | Multi-connection download on/off |
| `debug.tr.threads` | `8` | Concurrent requests per range |
| `debug.tr.chunk_kib` | `1024` | Chunk size |
| `debug.tr.min_split_kib` | `1024` | Smaller ranges stay with the app |
| `debug.tr.preload_s` | `900` | Preload target in seconds of video; `0` turns preload off |
| `debug.tr.preload_mib` | `250` | Preload memory limit. Keep it at 300 or below: the app itself uses 100–170 MiB of its 512 MiB heap |
| `debug.tr.rebuffer_ms` | off | After a stall, resume once this much video is buffered (ms, at most 5000); `0` = off |
| `debug.tr.log` | `false` | Log each range and buffer decision (tag `ThreadRipper`, info level) |

Example: `adb shell setprop debug.tr.preload_s 120`

## Build

```sh
GITHUB_ACTOR=<user> GITHUB_TOKEN=$(gh auth token) ./gradlew buildAndroid
```

The token needs `read:packages` (Morphe's Gradle plugin and patcher are on GitHub Packages).
Output: `patches/build/libs/patches-<version>.mpp`. See [AGENTS.md](AGENTS.md) for the hook
details, the on-device test scripts in `scripts/device/`, and how measurements were taken.

## Credits and license

- The chunked, in-order download design follows
  [Bilibili-thread-ripper](https://github.com/MrTangLuyao/Bilibili-thread-ripper) (BTR); `archive/web-userscript/` keeps an earlier
  browser userscript with BTR's license and attribution.
- Built with the Morphe patcher and patch template. This project is not affiliated with or endorsed
  by Morphe; see [NOTICE](NOTICE).
- License: [GPLv3](LICENSE).

---

## 繁體中文說明

**Thread Ripper patches** 是給 Android 版 YouTube 用的 Morphe 補丁，解決「Spoof video streams」改用非 SABR 用戶端（例如 visionOS）之後，播放容易轉圈的問題。

- **多線下載（Multi-connection video download）**：把每段影片切成 1 MiB 小塊，8 條連線同時下載，再按順序交給播放器。播放器正在等的那一塊優先下載，開播不會被拖慢。
- **預載（Video buffer preload）**：YouTube 原本只存約 21 MB（4K 約 10–25 秒），網路一頓就轉圈。這個補丁讓它持續補到 900 秒影片或 250 MiB 記憶體為止，以先到者為準。4K 約可存 120 秒，1080p 會先碰到 900 秒。

**建議設定**：Morphe 自己的「Playback buffer size」也改成 **Maximum**。預載補丁只會把 App 的「停止下載」改成「繼續」，不會讓它提早停，所以兩者一起開等於取大：1080p 用官方 Maximum 可存到約 650 秒，4K 用我們的補丁可超過官方 128 MiB 的上限（約 120 秒，官方約 60 秒）。

**卡住後恢復（Stall recovery）**：預設關閉。開啟後，卡住時只要緩衝 1.6 秒影片就恢復播放，不用等 App 原本的 5 秒；但緩衝較薄，可能比較快又卡住，覺得有改善再留著。

**設定**：YouTube → 設定 → Morphe → **Thread Ripper**，可調預載開關、秒數、記憶體上限、多線下載開關與連線數，以及卡住後恢復的開關與門檻。改完下一個影片請求就生效，不用重開 App。需要和官方 Morphe Patches 一起修補（設定選單是官方補丁加的）。

**安裝**：在 Morphe Manager 新增補丁來源
`https://raw.githubusercontent.com/bennytsai1234/youtube-thread-ripper/main/patches-bundle.json`
（或從 Releases 下載 `.mpp` 匯入），和官方 Morphe Patches 一起修補 YouTube。「Spoof video streams」要選 visionOS 或 Android VR Downgraded。目前只在 YouTube 21.16.256 驗證過。

**實測**（4K、3 倍速）：沒有補丁時 3 組 45 秒共卡 5 次、6.7 秒；開多線後 0 次。開預載後，開播約 6 秒內緩衝就到 90 秒。記憶體方面，緩衝放到 300 MiB 時 App 最高用到 464／512 MiB，所以預設值是 250 MiB。

**限制**：家裡網路整體掉速時（曾遇到 8 條連線加總只剩 5–14 Mbps），剛開播或剛跳轉、緩衝還沒存起來時，仍可能轉圈。
