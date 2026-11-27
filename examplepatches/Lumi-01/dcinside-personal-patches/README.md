# DC Inside personal patches

Community-maintained Morphe patch bundle for `com.dcinside.app.android`. This repository contains patch code only. It does not contain the DC Inside APK, decompiled vendor code, account data, or signing keys, and is not affiliated with DC Inside or Morphe.

Bundle **1.2.5** adds the supplied **5.3.21** APK (`versionCode 100194`) and removes version-number filtering from all four patches. Code structure selects the reviewed legacy, 5.3.18/5.3.20 or 5.3.21 mapping. Instruction hashes still check the modern patch sites. Future code changes can require an updated mapping. Author IDs, IPs and displayed names are resolved from serialized field annotations and their getters, covering renamed response members. Remote-config cache and forced-refresh preference getters are resolved from the supplied APK rather than fixed obfuscated names. Build and all four patch applications, rebuild and signing pass on 5.3.21, 5.3.20 and 5.3.6. A manifest-only version change to 99.0.0 also passes without force mode; this checks the number filter, not future code compatibility. Runtime login, publishing and phone behavior have not been verified for this release. Earlier emulator checks are recorded in [MAINTAINING.md](MAINTAINING.md).

## Scope

- Stop selected app-owned ad configuration and loader paths, and remove selected ad SDK startup providers and advertising permissions.
- Remove specific ad layout gaps, set six ad-only dimensions to zero, and disable the in-app rating prompt.
- Collapse the remaining gallery ad rows and post footer ad views when their loaders are disabled.
- Keep repeated remote-configuration refresh suppression optional and off by default in the in-app Morphe settings. Enabling it can delay a server setting change until the next allowed refresh; startup and explicitly required refresh paths remain available.
- Reuse previously activated remote-configuration values when a transient fetch fails.
- Retain the vendor's signer allowlist while adding the certificate Morphe actually uses to sign the locally patched APK. A narrowly scoped native digest delegate maps only that installed certificate's public fingerprint to the original public fingerprint. Other digests are delegated unchanged.
- In-app **Morphe settings** entry at the top of the app's native settings screen. It has Korean explanations and switches for six home sections, `Page N` separators, author auto-image hiding, author IDs, IP estimates, Naver web analytics, residual web ad requests and repeated configuration refreshes. All controls can be changed without repatching. Naver analytics suppression, residual web ad blocking and collapsed IP details default to on; the other optional controls default to off.
- The optional auto-image filter removes only the leading DC Inside image with the observed long hash alt marker and no upload file marker. It leaves unknown images in place; the marker is a heuristic and may change in future app versions.
- Author IDs are shown beside the nickname only when supplied by the app, without an `아이디` label. The post header keeps the masked IP and part of its range description beside the nickname; the button at the right expands that same text to all lines and collapses it again. With the IP switch enabled, visible IPs are matched against the user-provided [흑백 갤러리 offline list](https://gall.dcinside.com/board/view/?id=monochrome&no=46651). `기타등등` is shown as `기타`. These are **unverified network-range estimates** and cannot identify a person, exact carrier or region. No IP lookup is sent to an external service.
- When enabled, the Naver web analytics setting omits the vendor's `wcslog.js` and `naver_analytics.js` script tags before the post WebView loads. A narrow WebView fallback covers residual requests to those analytics hosts. The separate residual web ad switch covers exact, known ad-only hosts; native ad loader removal remains a fixed part of this patch.

The [Ample DC Inside patch catalog](https://morphe-patches.software/?app=com.dcinside.app.android#apps) currently targets app 5.3.4. Memo presets, DCCon controls and gallery watch are **not** in this bundle. Morphe Manager's backup/restore/reset screen is already part of Manager itself. See [ATTRIBUTION.md](ATTRIBUTION.md) for the related GPLv3 project.

This bundle is separate from the manually rebuilt personal APK. See [MAINTAINING.md](MAINTAINING.md) for the feature checklist and gaps that must be verified before calling a newer version supported. Do not combine it with another DC Inside patch source without checking conflicts.

## Available patches

<!-- PATCHES_START -->
> **[v1.2.9](https://github.com/Lumi-01/dcinside-personal-patches/releases/tag/v1.2.9)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 DC Inside&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [DC Inside personal clean-up](#dc-inside-personal-clean-up) | Disable app ad loaders and keep the locally signed build usable. |  |
| [글 목록 페이지 표시 설정](#) | 앱의 Morphe 설정에서 글 목록과 검색 결과의 Page N 표시를 숨길 수 있습니다. |  |
| [디시 앱 업데이트 안내 설정](#) | 디시 앱 자체 업데이트 안내를 Morphe 설정에서 끄거나 켭니다. |  |
| [앱 안에서 홈 화면 설정](#) | 앱의 Morphe 설정에서 홈 화면 영역을 각각 숨길 수 있습니다. |  |
| [작성자 아이디·IP 정보](#ip) | 앱의 Morphe 설정에서 계정 아이디와 내장 IP 대역표의 추정 정보를 표시합니다. |  |

</details>

<!-- PATCHES_END -->

## Build and use

Morphe's official Gradle template requires GitHub Packages authentication with `read:packages`. Set `gpr.user` and `gpr.key` in your **user-level** Gradle properties, as described in the [Morphe setup guide](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md), then run:

```sh
./gradlew buildAndroid generatePatchesList
```

The `.mpp` file is written to `patches/build/libs/`. In Morphe Manager, add `https://github.com/Lumi-01/dcinside-personal-patches` as a [patch source](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md). Both main and dev distribute the same experimental bundle. The matching [bundle release](https://github.com/Lumi-01/dcinside-personal-patches/releases/tag/v1.2.5) is also available for a manual Morphe Desktop patch.

Morphe signs the patched APK with its own key. Keep Morphe's signing key and app data if you want later Morphe-patched updates to install over it. This public repository does not distribute a patched APK.

## Limits

Version 1.2.2 adds the reviewed 5.3.20 target. Its patched app classes match 5.3.18 (startup version strings differ), so it uses the same mapping and retains earlier targets. Changed target code still requires review. No additional optimization or animation change is included.

Version 1.2.1 reduces rendering-helper work: list/comment formatting reuses the nickname already read by the app instead of reflecting it again, disabled author features skip header model lookups and posted decoration, header resource IDs are resolved once, and the home filter copies only when it actually hides an item. These are targeted reductions in extension work, not a measured percentage reduction of overall app CPU or battery use. The native refresh cadence, content requests and animations are unchanged.

Version 1.2.0 ports the WebView, ad/footer/list, home, author-ID and configuration-fallback hooks to 5.3.18. The reported `wv/a.shouldInterceptRequest` failure was caused by renamed vendor code, not the phone model or free memory. The patch checks exact supported versions and retains 5.3.6 mappings; a future update still requires APK review.

Version 1.1.5 reduces extension overhead: disabled author-ID display skips the ID getter, offline IP-list validation reuses compiled patterns, IPv6 group checks avoid regex compilation, and ordinary WebView hosts skip ad/tracking preference reads. These changes preserve the existing options and host list. The bundle was built, but runtime tests and CPU measurements were skipped at the user's request; no quantified CPU or battery improvement is claimed.

No claim of battery-life improvement is made without device measurements. The optional refresh limiter may defer new server settings, so leave it off if immediate settings updates matter. Never disable push messaging, user-selected automatic backups, server configuration, login, or media features solely to save battery. The source may need revision after an app update; there is no safe unconditional patch for all future versions.

Version 1.2.3 removes the version-number gate and adds reviewed instruction-hash checks to the current bytecode profile. Existing 5.3.6 keeps its older mapping; other versions attempt the 5.3.20 mapping. This is not unconditional compatibility: changed instructions, references, literals, registers or branches in a target method cause fingerprint failure. Unreviewed versions additionally check the author-ID model getters. No original bytecode is bundled in the hash table. Native/resource anchors remain checked separately. If a new app fails, supply its APK for review rather than disabling validation.

Version 1.2.4 caches known Morphe options in a volatile bit mask rather than repeatedly calling the synchronized preferences API while rendering. The home filter reads all six options from one snapshot. A retained preference listener handles changes and clear/reset, and settings writes publish before returning. Defaults, persistence and unknown-option fallback are retained. This reduces helper work; no new overall CPU or battery percentage has been measured.

## 1.2.6 오류 처리 보완

설정 조회 실패 뒤 시도 시각만으로 재시도를 억제하지 않습니다. 최근 조회 시각이 유효하고 활성 설정 캐시가 있는 경우에만 기존 갱신 제한을 적용합니다. 기기 시간이 과거로 바뀐 경우는 갱신을 허용합니다. IP 목록 로딩 실패·부분 읽기는 캐시에 확정하지 않고 다음 조회에서 30초 간격으로 재시도합니다.
