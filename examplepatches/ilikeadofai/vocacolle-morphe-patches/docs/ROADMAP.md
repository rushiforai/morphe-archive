# VocaColle Morphe Patches 로드맵

> 기준 앱: VocaColle 7.40.0 (`jp.nicovideo.nicobox`, versionCode 177)
>
> 목표: 원본 앱의 UI·navigation·resource를 최대한 재사용하면서, 번역·가사·광고 제어·로컬 기능을 Morphe 설정에서 선택적으로 제공한다.

## 1. 결론

개발 순서는 사용자가 체감하는 기능 순서와 조금 다르게 가져간다.

1. **Morphe 설정 기반과 공통 runtime**을 먼저 만든다.
2. **한국어·영어 UI localization과 광고 제어**를 각각 독립 patch로 완성한다.
3. **VocaDB + AI BYOK 번역 core**를 만든 뒤 곡 제목·작품 설명·YouTube 링크 공유·공지 번역을 연결한다.
4. **LRCLIB 중심 외부 가사 loader**를 기존 VocaColle 가사 모델과 UI에 주입한다.
5. 태그·가사 번역처럼 공통 번역 core를 재사용하는 기능을 추가한다.
6. 계정 수량 제한, 게스트, 오프라인, 트렌드, 고음질은 먼저 client/server gate를 실험으로 구분한다.
7. 서버가 premium entitlement나 계정 quota를 강제하는 기능은 클라이언트가 성공한 것처럼 위조하지 않는다. 가능한 경우 **로컬 전용 대체 기능**으로 제공한다.

추천 release train은 다음과 같다.

| Release | 핵심 범위 |
|---|---|
| v1.1 | Morphe 설정 화면, 선택형 앱 이름·아이콘, patch version 표시, 공통 settings/network/cache, 한국어·영어 UI |
| v1.2 | app-open/player 광고 및 premium 홍보 UI 제어 |
| v1.3 | VocaDB metadata + AI BYOK 번역 core, 곡 제목·작품 상세 번역, YouTube 링크 공유 |
| v1.4 | 공지 제목·본문 번역 |
| v2.0 | 외부 가사 표시, 가사 표시 제한 우회가 아닌 external-source fallback |
| v2.1 | 태그 번역, 원문 기반 검색 유지 |
| v2.2 | 가사 발음·번역 다층 표시와 line sync |
| v3.x | 로컬 리스트/즐겨찾기, guest·offline·trend 실험 기능 |
| Research | 고음질·premium 영상처럼 server entitlement 가능성이 큰 기능 |

## 2. 조사로 확인된 앱 구조

VocaColle 7.40.0 APK를 JADX 1.5.6과 Android resource table로 조사했다.

### 2.1 재사용 가능한 native 경로

- 설정 화면은 `SettingFragment`가 만든 단일 `ComposeView`다.
- fragment 이동은 앱의 기존 navigation helper와 `MainContentActivity`를 재사용할 수 있다.
- 가사 화면은 `PlayerLyricsCenterContentView`다.
- 가사 데이터는 다음 native 모델로 이미 표현된다.
  - `LyricsWithMetadata(videoId, lyricSegments, hasTimeInformation)`
  - `LyricsSegment(lines, startMs, endMs)`
- 작품 상세는 `MediaDetailData`에 다음 값이 한 번에 담긴다.
  - `mediaId`, `title`, `description`, `ownerName`, `duration`, `tags`
- 태그는 `Tag(name, isLocked)`이고 NicoNico watch 응답에서 전달된다.
- 공지는 native 화면에 `title`, `articleUrl`, `updateTime`만 들어온다. 공지 본문은 URL을 열어야 얻을 수 있다.
- media cache DB와 cache UI가 이미 존재한다.
- 고음질 상태와 bitrate/quality label을 표현하는 모델도 이미 존재한다.

### 2.2 서버 제한으로 확인된 항목

- 공식 가사 API에는 `LYRICS_ACCESS_LIMIT_EXCEEDED` 오류가 있다.
- resource 문구상 무료 가사 표시는 **월간 제한**이고 premium은 무제한이다.
- 좋아요는 `DAILY_LIMIT_EXCEEDED` 서버 오류가 있다.
- 사용자 follow, 공개 mylist follow, mylist 생성, 곡 등록에도 limit error가 있다.
- premium 안내에는 다음 수치가 명시돼 있다.
  - 공개 mylist follow: 20개 → 50개
  - 전체 mylist 등록곡: 100개 → 25,000개
- 따라서 숫자나 popup만 바꿔서는 서버 요청이 성공하지 않는다.

### 2.3 광고 경로

광고는 하나가 아니라 최소 세 경로다.

1. `AppOpenAdProvider`: 앱 시작·복귀 시 full-screen 광고
2. `PlayerAdCenterContentView` 및 player service의 `isAdReserved`: 재생 중 광고/음성 광고
3. `PremiumMeritLeadDialog`와 premium registration surface: 가입 홍보 UI

광고 patch는 이 경로를 따로 제어해야 하며, 단순히 SDK class를 삭제해서 앱 시작을 깨뜨리면 안 된다.

## 3. 공통 설계 원칙

### 3.1 fail closed

- fingerprint가 정확히 한 경로를 찾지 못하면 build를 실패시킨다.
- 알 수 없는 문자열·tag·API 응답은 원문 그대로 표시한다.
- network/AI 오류 시 원본 앱 동작으로 돌아간다.
- 번역 결과를 요청 ID, URL, 검색 query 같은 내부 값에 다시 넣지 않는다.

### 3.2 display 값과 request 값을 분리

모든 동적 번역은 다음 구조를 지킨다.

```text
originalValue  -> 서버 요청, 검색, tag click, cache key
translatedView -> 화면 표시 전용
```

특히 tag를 눌렀을 때는 한국어/영어 표시명이 아니라 일본어 `Tag.name`으로 NicoNico 검색을 수행한다.

### 3.3 네트워크 전송은 opt-in

- VocaDB·LRCLIB처럼 공개 metadata lookup은 기능별 toggle을 켰을 때만 호출한다.
- AI 번역은 기본값 OFF다.
- AI를 켜기 전에 전송되는 text 종류를 설정 화면에 명시한다.
- API key, authorization header, 원문 전체를 log에 남기지 않는다.

### 3.4 cache first

- network 호출 전에 local cache를 조회한다.
- cache key에 `source`, `sourceId/mediaId`, `targetLanguage`, `provider`, `model`, `promptVersion`을 포함한다.
- 원문이 바뀌거나 prompt version이 바뀌면 기존 AI 결과를 재사용하지 않는다.
- settings에서 metadata cache, lyrics cache, AI cache를 각각 삭제할 수 있게 한다.

### 3.5 source 표시

동적 metadata와 가사 화면에는 가능하면 source를 표시한다.

- VocaDB
- LRCLIB
- VocaColle official
- LyricsPlus/custom endpoint
- AI provider/model

가사·번역 출처를 사용자가 확인할 수 있어야 잘못된 match를 빠르게 신고하거나 원문으로 되돌릴 수 있다.

## 4. 0순위 — 기반과 핵심 UX

## 4.1 P0-A: 설정에 Morphe 메뉴 추가

**상태: COMPLETE — v1.1 자동화·FULL DEX APK gate 통과, 기기 UI smoke는 별도 승인 사항**

### 구현된 첫 수직 슬라이스

- `SettingFragment`의 native toolbar overflow에 `Morphe` 항목을 추가했다.
- marker Intent가 있을 때만 기존 `OssLicensesMenuActivity`를 Morphe 설정 host로 재사용한다.
- framework `PreferenceFragment`에 runtime 기능 공통 switch와 진단 정보를 제공한다.
- extension-owned `SharedPreferences` store와 일본어 기본/영어/한국어 locale catalog를 추가했다.
- 원본 license Activity 진입은 marker가 없으면 기존 flow를 그대로 실행한다.
- 앱 정보의 원본 `7.40.0` 표시에 `Morphe 1.1.0-dev.1`을 병기하고 Gradle patch version을 자동 추종한다.
- optional branding patch로 launcher 앱 이름과 아이콘을 바꿀 수 있다.
- branding 기본값은 일본어 원문 `ボカコレ`와 원본 아이콘이며, custom 값을 주지 않으면 resource pixel을 바꾸지 않는다.
- 표시 언어를 시스템 기본값/일본어/영어/한국어로 저장하고 application lifecycle에서 적용한다.
- 저장 공간 섹션에서 extension-owned cache 사용량을 확인하고 삭제할 수 있다.
- HTTPS-only bounded client와 SHA-256·TTL·atomic-write cache 기반을 추가했지만 v1.1에서는 외부 요청을 만들지 않는다.

### 목표

VocaColle 설정 안에 `Morphe` 진입점을 추가하고 모든 후속 patch의 toggle·provider·cache·진단 UI를 한곳에 모은다.

### native UX 전략

우선순위대로 시도한다.

1. `SettingFragment`의 기존 Compose 설정 목록에 원본 composable과 navigation callback을 이용해 row를 삽입한다.
2. 1번 fingerprint가 버전 변화에 너무 취약하면 설정 toolbar의 native menu item으로 제공한다.
3. 독립적인 별도 launcher Activity는 마지막 fallback으로만 사용한다.

7.40.0 첫 구현은 Compose 내부 구조보다 fingerprint가 안정적인 **2번 toolbar menu**를 선택했다. Morphe MPE가 extension manifest/resource를 target APK에 병합하지 않으므로 새 Activity를 등록하지 않고, 이미 manifest에 등록된 `OssLicensesMenuActivity`를 marker Intent로만 분기해 theme·action bar·back navigation을 재사용한다. UI 문구와 preferences는 extension DEX에서 programmatic하게 구성한다.

Morphe 상세 화면은 다음을 재사용한다.

- 앱의 기존 theme, toolbar, back navigation
- Android framework `PreferenceFragment` 또는 앱에서 이미 쓰는 setting component
- 앱의 color/string/dimen resource
- 기존 fragment navigation helper

### 설정 섹션

- 일반
  - Morphe 기능 전체 활성화
  - 표시 언어: 시스템 / 일본어 / 영어 / 한국어
  - 진단 정보
- 광고
  - app-open 광고
  - 재생 중 광고·음성 광고
  - premium 홍보 UI
- 번역
  - metadata 번역
  - target 언어
  - AI provider/model/base URL/API key
  - 연결 테스트
- 공유
  - 기본 공유 링크: 매번 선택 / YouTube / NicoNico
  - YouTube 원본이 없을 때 NicoNico fallback
- 가사
  - source 우선순위
  - sync 가사 선호
  - 발음/번역 표시
- 저장 공간
  - metadata/lyrics/AI cache 용량
  - cache 삭제
- 실험실
  - guest diagnostics
  - trend page size
  - offline 실험 기능

### 주요 구현 파일

- `patches/src/main/kotlin/io/github/ilikeadofai/vocacolle/patches/VocaColleMorpheSettingsPatch.kt`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/settings/MorpheSettingsFragment.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/settings/MorpheSettingsLauncher.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/settings/MorpheSettingsActivity.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/settings/MorpheSettingsStrings.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/settings/SettingsStore.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/settings/SettingKeys.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/settings/MorphePatchInfo.java`
- `patches/src/main/kotlin/io/github/ilikeadofai/vocacolle/patches/VocaColleBrandingPatch.kt`

### 현재 검증 상태

- Python catalog/renderer, extension unit, patch unit, patch metadata, MPP build 통과
- 원본 7.40.0 APK에 settings-only/localization-only/full-default 3-way FULL DEX rebuild 통과
- menu create/select hook, host Activity hook, extension class 포함을 최종 APK DEX에서 확인
- settings-only 산출물의 `AndroidManifest.xml`과 `resources.arsc`가 원본과 동일하고 세 matrix APK의 zip alignment가 유효함을 확인
- 한국어 patch를 포함한 full-default smoke에서 locale별 override 없이 `app_name=ボカコレ`가 유지됨을 확인
- full-custom smoke에서 locale별 override 없이 custom `app_name`과 legacy/adaptive mdpi~xxxhdpi icon 15개 변경을 확인
- apostrophe/quote 포함 앱 이름의 AAPT2 rebuild와 20 MiB/4096px 이전 bounded icon validation을 확인
- settings+branding 통합 APK에서 AppInfo version formatter, menu create/select, host Activity hook을 함께 확인
- Waydroid는 연결되어 있으나 설치는 사용자 앱 상태를 바꾸므로 명시적 허락 전까지 보류

### 완료 기준

- VocaColle 설정에서 두 번 이내의 tap으로 Morphe 설정에 진입한다.
- 뒤로가기, process restart, 앱 업데이트 후에도 설정값이 유지된다.
- Morphe patch를 사용하지 않은 원본 앱 flow에는 변화가 없다.
- unsupported VocaColle version에서는 patch가 명확히 실패한다.

## 4.2 P0-B: 한국어·영어 UI localization

**상태: COMPLETE — v1.1 catalog/runtime/APK gate 통과**

한국어 patch 3개의 이름과 symbol을 유지하면서 language-neutral catalog 구조로 확장했다.

### 단계

1. `translations/ui/ko.csv` schema를 공통 catalog 형식으로 일반화했다.
2. 1,619행의 `translations/ui/en.csv`를 추가했다.
3. static resource에 `values-ko`와 `values-en`을 함께 넣었다.
4. hardcoded Compose 문자열은 locale-aware lookup table을 사용한다.
5. server UI whitelist는 일본어 passthrough와 영어/한국어 출력을 제공한다.
6. Morphe 표시 언어가 `시스템`일 때 Android locale을 따른다.
7. 강제 locale은 Android 13 application locale과 구버전 resource override를 각각 적용한다.
8. 공통 renderer가 plural/array/markup/format token/newline/`formatted` metadata를 보존하는지 자동 검증한다.

### 호환성

- v1.0의 `Korean static UI`, `Korean hardcoded UI`, `Korean native server UI` patch 이름은 당장 제거하지 않는다.
- 영어 static resource는 별도 `English static UI` patch로 추가하고 기존 한국어 patch 이름과 symbol을 유지한다.
- 일본어 원본을 항상 선택할 수 있게 한다.

### 완료 기준

- 일본어/영어/한국어 세 locale에서 navigation, dialog, plural, array가 깨지지 않는다.
- 재생 중 locale 변경 후 필요한 경우 한 번의 Activity recreation으로 반영된다.
- server 문자열은 whitelist 외 항목을 번역하지 않는다.

### 현재 검증 상태

- en/ko 1,619행 catalog와 generated resource의 deterministic byte comparison 통과
- format token, markup, escaped newline, duplicate identity, `formatted=false` 보존 test 통과
- lifecycle locale hook과 hardcoded/server display-boundary hook의 exact 7.40.0 fingerprint 통과
- settings-only/localization-only/full-default APK rebuild·서명·zip alignment 통과

## 4.3 P0-C: 광고 제거 기능

**상태: READY, 세 개 toggle로 분리**

### C1. app-open 광고

- `AppOpenAdProvider.isAdAllowed`의 stable decision point를 hook한다.
- 광고 load/show를 시작하기 전에 `false`를 반환한다.
- SDK class나 manifest provider를 무작정 제거하지 않는다.

### C2. 재생 중 광고·음성 광고

- player command의 `isAdReserved`가 생성되는 지점을 hook한다.
- 광고 media item이 queue에 들어오기 전에 차단한다.
- `PlayerAdCenterContentView`를 숨기는 것만으로 끝내지 않는다. 소리는 남고 UI만 없어질 수 있기 때문이다.

### C3. premium 홍보 UI

- 광고 제거와 직접 관련된 `PremiumMeritLeadDialog`·registration notice를 숨긴다.
- 고음질, mylist 제한 등 실제 기능 오류는 숨기지 않는다.
- 이 toggle은 premium entitlement를 `true`로 위조하지 않는다.

### planned files

- `patches/src/main/kotlin/io/github/ilikeadofai/vocacolle/patches/VocaColleAdControlPatch.kt`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/ads/AdControl.java`

### 완료 기준

- cold start, background 복귀, 연속 재생 각각에서 광고가 나오지 않는다.
- 광고 위치에서 무음 대기, spinner, queue skip, playback crash가 발생하지 않는다.
- toggle OFF에서는 원본 광고 flow가 그대로 작동한다.

## 4.4 P0-D: 번역 core와 AI BYOK

**상태: READY, metadata/공지/가사 번역의 공통 의존성**

### provider 순서

1. 사람이 작성한 기존 번역
2. VocaDB exact PV match
3. static tag/phrase dictionary
4. AI BYOK fallback
5. 실패 시 원문

### AI provider 지원 순서

#### MVP

- OpenAI-compatible
  - OpenAI
  - OpenRouter
  - Groq 등 호환 endpoint
  - 사용자가 지정한 local endpoint
- Gemini native API

#### 다음 단계

- Anthropic native API
- custom provider template

OpenAI-compatible 하나로 여러 서비스를 먼저 지원하고, request/response schema가 다른 Gemini와 Anthropic만 adapter를 따로 둔다.

### BYOK 보안

- API key는 Android Keystore의 AES-GCM key로 암호화한 뒤 app-private preferences에 ciphertext만 저장한다.
- key는 export/import 대상에서 제외한다.
- key 입력란은 기본 masking하고 clipboard 복사는 제공하지 않는다.
- connection test는 짧은 최소 request로 수행한다.
- HTTP가 아닌 base URL은 local debugging을 명시적으로 허용한 경우가 아니면 거부한다.

### AI 응답 규칙

- structured JSON만 허용한다.
- title/description/notice/lyrics마다 prompt version을 분리한다.
- 가사 번역은 segment ID를 포함해 line 수와 순서를 검증한다.
- JSON parse 실패, line mismatch, empty translation이면 원문을 유지한다.
- timeout, cancellation, exponential backoff, provider rate limit을 처리한다.

### planned files

- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/network/HttpClient.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/security/SecretStore.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/translation/TranslationProvider.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/translation/OpenAiCompatibleProvider.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/translation/GeminiProvider.java`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/translation/TranslationCache.java`

## 4.5 P0-E: 곡 제목·작품 상세 번역

**상태: READY**

### source/matching

1. `mediaId`로 VocaDB `/api/songs/byPv` exact lookup
2. exact PV가 없을 때만 title + artist + duration 후보 검색
3. 후보 검색은 score threshold를 넘지 못하면 사용하지 않는다.

VocaDB API는 NicoNico `pvId`, English/Japanese/Romaji names, artists, lyrics, tags를 반환하는 것을 확인했다.

### 표시 정책

- 영어 제목이 있으면 VocaDB `names[English]`를 우선한다.
- 한국어 이름은 exact PV entry의 `additionalNames` 중 명확한 한글 alias만 제한적으로 사용한다.
- typed Korean name을 확정할 수 없으면 AI fallback을 사용한다.
- 작품 설명은 NicoNico 원문 description을 AI로 번역한다.
- 기본 표시는 번역 제목이고 tap/long-press로 원문을 볼 수 있게 한다.
- creator name과 고유명사는 기본적으로 번역하지 않는다.

### 구현 흐름

- 작품 상세 ViewModel이 `MediaDetailData`를 받은 뒤 async lookup을 시작한다.
- network를 getter 안에서 동기 호출하지 않는다.
- 첫 frame은 원문을 표시하고 cache/network 결과가 오면 해당 UI state만 갱신한다.
- list/card 전체를 즉시 번역하지 않고 player 및 작품 상세부터 시작한다.

### 범위 확장 순서

1. player title
2. 작품 상세 title/description
3. playlist/search card title
4. home dynamic container title

### 완료 기준

- exact NicoNico PV가 아닌 다른 곡의 번역을 표시하지 않는다.
- offline에서는 cache hit만 사용한다.
- 번역을 꺼도 원문 metadata와 검색 결과가 변하지 않는다.

## 4.6 P0-F: YouTube 링크로 공유

**상태: READY, v1.3 목표**

### 목표

VocaColle의 기존 공유 동작에서 NicoNico URL 대신 같은 작품의 YouTube 원본 URL을 선택해 공유할 수 있게 한다. Android의 native share sheet와 기존 공유 문구는 그대로 재사용한다.

### URL 판정 순서

1. 현재 NicoNico `mediaId`로 VocaDB `/api/songs/byPv` exact lookup을 수행한다.
2. 같은 VocaDB song의 `pvs` 중 `service=Youtube`, `pvType=Original`, `disabled=false`인 항목만 후보로 사용한다.
3. 후보가 여러 개면 creator 일치와 duration 차이가 가장 작은 항목을 우선하고, 동률이면 사용자가 고르게 한다.
4. exact original 후보가 없으면 자동으로 관련 없는 cover·reprint를 공유하지 않고 NicoNico 원본 링크로 fallback한다.
5. 선택 사항으로 `YouTube에서 검색` URL을 제공할 수 있지만 direct video URL처럼 표시하지 않는다.

### UX와 설정

- 기본 공유 링크: `매번 선택`, `YouTube`, `NicoNico`
- 매번 선택 모드: `YouTube 링크`, `NicoNico 링크`, `두 링크 모두`
- YouTube 매핑이 없으면 이유를 짧게 표시하고 NicoNico 공유를 계속한다.
- 작품 title·공유 문구는 유지하고 URL만 선택적으로 교체한다.
- copy link, browser open, API request URL을 전역 치환하지 않고 share `Intent` 생성 경로에서만 바꾼다.

### cache와 planned files

- `mediaId -> YouTube videoId, pvType, fetchedAt`을 VocaDB metadata cache에 함께 저장한다.
- `patches/src/main/kotlin/io/github/ilikeadofai/vocacolle/patches/VocaColleYouTubeSharePatch.kt`
- `extensions/extension/src/main/java/io/github/ilikeadofai/vocacolle/extension/sharing/ShareLinkResolver.java`

### 완료 기준

- VocaDB exact PV에 YouTube Original이 있는 작품은 `https://www.youtube.com/watch?v=...`로 공유된다.
- YouTube Original이 없는 작품은 잘못된 cover/reprint 대신 NicoNico URL로 안전하게 fallback한다.
- toggle OFF에서는 원본 VocaColle 공유 결과와 byte-for-byte 동일한 URL을 사용한다.
- Android share target 취소, 재선택, process recreation에서 crash가 없다.

## 4.7 P0-G: 공지·게시글 번역

**상태: PARTIAL READY**

앱 내부 공지 model에는 title과 article URL만 있다. 따라서 두 단계로 나눈다.

### F1. 공지 title inline 번역

- `VocacolleNiconicoInfo.title` display boundary에서 번역한다.
- stable notice ID가 없으므로 `articleUrl + targetLanguage`를 cache key로 사용한다.

### F2. 공지 본문 번역 reader

- 공지 tap 시 기존 browser 열기와 `Morphe로 번역해서 열기`를 선택할 수 있게 한다.
- allowlist된 HTTPS 도메인만 fetch한다.
- HTML에서 script/style/navigation을 제거하고 본문 text만 추출한다.
- 원문/번역 전환과 원본 URL 열기를 제공한다.
- login, cookie, form submit이 필요한 page는 자동 번역하지 않는다.

### 완료 기준

- 외부 URL의 script를 앱 권한으로 실행하지 않는다.
- 본문 추출 실패 시 기존 browser로 안전하게 fallback한다.

## 5. 1순위 — 가사와 태그

## 5.1 P1-A: 외부 가사 보기와 표시 무제한

**상태: READY, v2.0 목표**

이 기능은 official premium 상태를 위조하지 않는다. 공식 가사 API 대신 공개 external source에서 가사를 가져와 native 가사 화면에 표시한다.

### source 우선순위

기본값:

1. Morphe local lyrics cache
2. LRCLIB exact metadata match
3. VocaDB exact `pvId` lyrics
4. VocaColle official lyrics — 사용자가 켠 경우만
5. custom LyricsPlus-compatible endpoint — 명시적 opt-in

### LRCLIB를 기본값으로 선택하는 이유

- 무료 API가 plain lyrics와 synced LRC를 함께 반환한다.
- `track_name`, `artist_name`, `album_name`, `duration` exact lookup을 지원한다.
- duration은 서버에서 ±2초 범위를 고려한다.
- LRC timestamp를 VocaColle의 `startMs/endMs`에 직접 매핑할 수 있다.
- 서버 구현 코드는 MIT지만, 개별 가사 text의 저작권·재배포 조건은 별도로 다뤄야 한다.

### 다른 후보의 취급

- **Lyrically (`shkcodes/Lyrically`)**: Google search + website scraping 기반의 오래된 구현이라 사용하지 않는다.
- **SongSync/Paxsenix**: LRCLIB parser와 multi-provider matching의 참고 자료로 사용한다. 프로젝트는 GPLv3다.
- **YouLy+/LyricsPlus**: word sync와 provider aggregation 참고용이다. public server는 부하·계정 의존 문제가 있어 기본 source로 고정하지 않는다.
- LyricsPlus README는 Apache 2.0이라고 적지만 현재 clone에는 license file이 보이지 않았으므로, license가 확인되기 전에는 코드를 복사하지 않는다.

### match 규칙

- VocaDB exact PV로 정규화된 title/artist를 먼저 얻는다.
- LRCLIB에는 title + artist + duration을 보낸다.
- exact lookup 실패 후에만 search endpoint를 사용한다.
- duration 차이, title similarity, artist overlap에 threshold를 적용한다.
- instrumental 결과는 빈 가사가 아니라 `연주곡` 상태로 표시한다.
- 낮은 confidence 후보는 자동 선택하지 않고 source picker에서 고르게 한다.

### native model 주입

LRCLIB/VocaDB 결과를 다음 구조로 변환한다.

```text
ExternalLyrics
  -> LyricsWithMetadata(videoId, segments, hasTimeInformation)
  -> PlayerLyricsCenterContentView.setLyricList(...)
```

- synced LRC: 각 timestamp를 `startMs`, 다음 timestamp를 `endMs`로 사용한다.
- plain lyrics: timestamp를 null로 두고 일반 scroll mode를 사용한다.
- timestamp가 없는 가사에 임의 sync를 만들지 않는다.

### cache

- official app의 last-played 단일 cache와 별도로 mediaId별 cache를 둔다.
- source response, normalized lyrics, match confidence, fetchedAt을 저장한다.
- offline에서도 저장된 가사를 읽는다.

### 완료 기준

- official monthly limit 오류가 발생해도 external source 결과가 있으면 가사를 볼 수 있다.
- sync/unsynced/기악곡/not-found/network-offline 상태를 구분한다.
- 잘못 매칭된 가사를 원문 곡 ID에 영구 고정하지 않는다.

## 5.2 P1-B: 태그 번역

**상태: READY, hybrid dictionary + AI**

NicoNico tag는 `Tag(name,isLocked)`로 서버에서 임의 생성될 수 있으므로 완전한 고정 목록이 아니다.

### 전략

1. 검토된 high-frequency static dictionary
2. VocaDB tag alias가 exact PV에서 명확히 일치하면 사용
3. AI BYOK fallback
4. unknown이면 일본어 원문

### 중요한 불변식

- UI에는 `displayName`을 표시한다.
- tag tap/search에는 반드시 `originalName`을 전달한다.
- AI 번역을 NicoNico API request parameter에 넣지 않는다.
- locked 상태와 tag 순서를 유지한다.

### dictionary 생성

- 테스트 계정/API fixture에서 자주 등장하는 tag를 빈도순으로 수집한다.
- 상위 tag를 사람이 검토한 후 `translations/tags/{ko,en}.json`으로 배포한다.
- 고유 행사명·P명·캐릭터명은 번역보다 표기 alias를 우선한다.

### 완료 기준

- 번역 tag를 눌러도 원래 일본어 tag 결과가 열린다.
- 같은 tag는 list/detail/search에서 동일하게 표시된다.
- AI가 꺼져 있어도 static dictionary만으로 동작한다.

## 5.3 P1-C: 가사 발음·번역 다층 표시

**상태: UI SPIKE 후 구현, v2.2 목표**

### 한 segment의 표시 순서

1. **일본어 원문** — 가장 큰 기본 text
2. **한국어 발음** — 가장 작고 연한 text
3. **한국어 번역** — 원문보다 작고 발음보다 큰 text

### toggle

- 원문: 항상 표시
- 한국어 발음: ON/OFF
- 한국어 번역: ON/OFF
- sync highlight: ON/OFF
- translation source/model 표시: ON/OFF

### 번역 pipeline

- segment 단위가 아니라 여러 segment를 batch해 context를 유지한다.
- 요청에는 stable segment ID와 원문 배열을 보낸다.
- 응답은 `segmentId`, `pronunciation`, `translation` 배열로 받는다.
- line 수가 맞지 않는 segment는 해당 번역만 버린다.
- 반복 chorus는 hash cache로 중복 요청하지 않는다.
- 원문 timestamp를 그대로 재사용하며 AI가 timing을 만들게 하지 않는다.

### UI 단계

1. unsynced 다층 text
2. line-synced highlight
3. word-synced source가 있을 때만 word highlight

word sync는 LRCLIB line sync와 별개 기능이며 초기 버전에 포함하지 않는다.

### 완료 기준

- 긴 곡에서도 scroll/jank가 과도하게 늘지 않는다.
- 번역이 늦게 도착해도 현재 sync 위치가 튀지 않는다.
- provider 오류 시 원문 가사는 계속 표시된다.

## 6. 2순위 — 수량 제한과 로컬 대체

## 6.1 판정 원칙

다음 항목은 먼저 request/response를 계측하는 `limit probe`를 만든다.

| 기능 | 현재 근거 | 계획 |
|---|---|---|
| mylist 생성 수 증가 | server limit error + premium dialog | client constant이면 patch, server entitlement이면 제외 |
| mylist 등록곡 수 증가 | 100→25,000 premium 문구 + server error | 서버 bypass 대신 Morphe local list 제공 |
| 공개 mylist follow 증가 | 20→50 premium 문구 + server error | 서버 bypass 대신 local subscribed-list 제공 |
| 사용자 follow 증가 | server follow limit error | 서버 bypass 대신 local creator watchlist 제공 |
| 좋아요 수 증가 | daily limit server error | 서버 bypass 대신 local favorite 제공 |

HTTP status, structured error reason, response body shape만 기록하고 token/cookie는 기록하지 않는다.

## 6.2 Morphe local library

서버 제한이 확인되면 다음 대체 기능을 우선한다.

- unlimited local playlists
- unlimited local favorites
- local creator watchlist
- JSON export/import
- 원본 NicoNico mediaId 보존
- 실제 NicoNico mylist/follow/like 상태와 UI를 구분

이 기능은 다른 기기에 자동 sync되지 않으며 server의 실제 like/follow count에도 영향을 주지 않는다고 명확히 표시한다.

## 7. 3순위 — 실험 기능

## 7.1 guest 기능 복구

**상태: SPIKE**

앱에는 official guest login flow가 존재하지만 `FORBIDDEN`, `SIGNATURE_EXPIRED`, `GENERAL` 오류가 있다.

### 조사 순서

1. device time/timezone 및 signature timestamp 확인
2. guest request의 endpoint, method, required headers 확인
3. 일본/비일본 네트워크에서 동일 APK A/B 테스트
4. 앱 signer 변경이 request signature나 attestation에 영향을 주는지 확인
5. server가 guest 신규 발급을 중단했는지 확인

### 구현 판단

- header/time/client bug면 patch한다.
- 지역 제한이면 원인과 요구 조건을 진단 UI에 표시한다.
- server가 신규 guest를 막은 경우 성공 상태를 위조하지 않는다.

## 7.2 offline 저장

**상태: PARTIAL READY**

앱에는 이미 `media_cache_item` DB, download session, cache 설정과 offline playback 안내가 있다.

### 단계

1. 기존 cache 버튼과 free account 동작 범위를 확인한다.
2. 합법적으로 받은 non-DRM stream을 기존 cache pipeline으로 저장한다.
3. cache 만료·삭제·저장 공간 quota를 원본 DB와 일치시킨다.
4. playlist 일괄 cache와 background progress를 추가한다.
5. 가사·metadata cache를 media cache와 함께 offline 제공한다.

DRM, 만료 token, account entitlement를 우회해 영구 파일로 export하는 기능은 범위 밖이다.

## 7.3 trend 표시 개수 증가

**상태: SPIKE**

- ranking/trend API의 `limit`, `page`, cursor를 찾는다.
- server가 더 큰 page size를 허용하면 설정값으로 확장한다.
- server가 page size를 고정하면 여러 page를 정상 pagination해 native list에 합친다.
- premium-only endpoint이면 entitlement를 위조하지 않는다.

완료 기준은 실제 추가 item이 server 응답에서 왔으며 scroll/중복/cursor가 정상인 것이다.

## 8. 4순위 — entitlement 연구 항목

## 8.1 고음질 지원

**상태: RESEARCH**

앱에는 `isHighQualityAudio`, `audioQualityLabel`, `audioBitrateLabel`, high-quality play/cache 설정이 이미 있다.

### 검증

1. free account의 watch/download response에 고음질 asset이 포함되는지 확인한다.
2. 포함되면 client selection gate만 수정해 재생 가능한지 확인한다.
3. server가 asset을 주지 않거나 요청을 거부하면 구현하지 않는다.
4. 실제 decoder 입력 bitrate/codec을 측정해 label만 바뀐 가짜 성공을 막는다.

## 8.2 premium 영상 재생

**상태: BLOCKED UNTIL ENTITLEMENT EVIDENCE**

- 영상 URL, license, session이 server-side premium authorization을 요구하면 클라이언트 patch로 제공하지 않는다.
- 이미 premium인 사용자인데 VocaColle UI bug로 영상이 막히는 경우에만 compatibility fix로 다룬다.
- UI를 열거나 premium flag만 바꾼 것을 “재생 지원”으로 간주하지 않는다.

## 9. patch 구성안

각 기능을 한 개의 거대한 patch로 만들지 않는다.

| Patch | 역할 | 공통 extension |
|---|---|---|
| VocaColle Morphe settings | 설정 진입점과 기반 | 필수 |
| VocaColle localization | ko/en resource·hardcoded·server UI | 사용 |
| VocaColle ad control | app-open/player/promotion 제어 | 사용 |
| VocaColle metadata translation | VocaDB + AI title/detail | 사용 |
| VocaColle YouTube share | exact PV의 YouTube Original URL 공유 | 사용 |
| VocaColle notice translation | 공지 title/reader | 사용 |
| VocaColle external lyrics | LRCLIB/VocaDB/custom source | 사용 |
| VocaColle tag translation | static dictionary + AI | 사용 |
| VocaColle lyrics translation | pronunciation/translation UI | 사용 |
| VocaColle local library | local list/favorite/watchlist | 사용 |
| VocaColle experiments | guest/offline/trend 중 검증된 기능만 | 사용 |

공통 extension은 기능별 package로 나누되 MPE는 하나로 유지한다.

## 10. 테스트와 release gate

## 10.1 unit test

- translation catalog 중복·placeholder·format specifier 검증
- LRCLIB LRC parser와 timestamp 변환
- VocaDB exact PV response parser
- title/artist/duration match score
- YouTube Original 후보 선택, 복수 후보, NicoNico fallback
- AI structured JSON schema와 line alignment
- encrypted secret round-trip
- cache key/version invalidation
- tag display/original request 분리

## 10.2 patch test

각 fingerprint마다 다음을 검증한다.

- defining class/method/parameter/return type
- expected match count
- injection register safety
- extension method descriptor
- unsupported version에서 실패

## 10.3 device test matrix

- system locale: ja-JP, en-US, ko-KR
- account: guest, free login, premium은 보유 계정이 있을 때만
- network: online, offline, timeout, HTTP 404/429/500
- lyrics: synced, unsynced, instrumental, not found, wrong-match 후보
- share: YouTube Original 1개/복수/없음, cover·reprint만 존재, offline cache hit
- player: cold start, background resume, manual skip, queue auto-advance
- patch toggle: ON/OFF 후 process restart
- fresh install과 split APK update 모두 Package Manager `Success` 확인

## 10.4 release 절차

1. `dev`에 feature commit
2. prerelease MPP 생성
3. 실제 APK patch/build/sign/install
4. test matrix smoke test
5. `main` merge
6. semantic-release stable release
7. release asset MPP hash와 patch list 검증
8. `main` 결과를 `dev`로 backmerge

## 11. 첫 두 sprint

## Sprint 1 — v1.1 기반

1. `VocaColleMorpheSettingsPatch` fingerprint spike
2. native 설정 entry + settings fragment
3. typed settings와 cache directory
4. API key encrypted storage
5. 최소 `HttpURLConnection + org.json` client
6. 영어 catalog 추가와 localization 구조 일반화
7. 선택형 앱 이름·아이콘 branding과 AppInfo patch version 표시
8. ja/en/ko device smoke test

Sprint 1에서는 AI 호출이나 가사 기능까지 욕심내지 않는다. 설정값 저장, locale, navigation, extension 초기화가 안정적이어야 다음 기능이 모두 단순해진다.

## Sprint 2 — v1.2 광고 제어

1. app-open ad decision hook
2. player `isAdReserved` hook
3. premium promotion surface 분류
4. 세 toggle 연결
5. cold start/background/queue playback 검증
6. 광고 SDK를 제거하지 않은 상태에서 no-op path 확인

## 12. 다음 구현 착수점

다음 구현 착수점은 **v1.2 app-open 광고 decision hook과 player `isAdReserved` hook 식별**이다.

v1.1의 표시 언어·영어 catalog·runtime localization·공통 HTTPS/cache/storage 기반은 구현 및 자동 release gate를 통과했다. 실제 기기에서의 launcher cache, locale 전환, settings navigation acceptance는 코드 완료와 분리해 추적한다.

## 13. 외부 source 검증 기록

조사 시 직접 확인한 source:

- VocaDB Swagger: <https://vocadb.net/swagger/v1/swagger.json>
- VocaDB NicoNico PV lookup: `/api/songs/byPv`
- LRCLIB: <https://github.com/tranxuanthang/lrclib>
  - `GET /api/get`
  - `GET /api/search`
  - plain/synced lyrics 응답 확인
- SongSync: <https://github.com/Paxsenix0/SongSync>
- YouLy+: <https://github.com/Paxsenix0/YouLyPlus>
- LyricsPlus: <https://github.com/ibratabian17/lyricsplus>
- Lyrically: <https://github.com/shkcodes/Lyrically>

API availability, terms, attribution 요구사항은 실제 기능 구현 직전 다시 확인한다.
