# kmaps-nav-patches

High-rate GNSS patches for **NAVER Map** and **KakaoMap** car navigation, for use with Morphe.

헤드유닛에 u-blox 수신기(F9R/F9P, 8~10 Hz)를 시스템 GPS로 붙였을 때, 네이버 지도와 카카오맵 차량 내비가 1 Hz보다 빠른 위치 갱신을 제대로 쓰도록 고치는 패치 묶음입니다.
두 앱에는 "위치 갱신 1회 = 1초"를 전제한 카운터·버퍼가 많습니다. 이 패치는 그런 지점을 경과 시간 기준으로 바꾸거나, 엔진 입력 주기를 원래대로 지킵니다.

> NAVER, Kakao, Morphe 프로젝트와 관계없는 개인 프로젝트입니다. 1 Hz 위치(일반 휴대폰 GPS)에서는 원본과 같게 동작하도록 만들었습니다.

## 사용법

Morphe Manager에 이 저장소를 패치 소스로 추가하거나, [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)으로 릴리스의 `patches-*.mpp`를 적용합니다.

<a href="https://morphe.software/add-source?github=ocel07/kmaps-nav-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

- 원본 서명과 달라지므로 Play 설치본 위에 덮어쓸 수 없습니다(삭제 후 설치).
- NAVER Map은 split APK(base + ABI + 밀도)라 split도 같은 키로 다시 서명해 함께 설치합니다. Android 14 이상에서는 `adb install-multiple -r --no-incremental`.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/ocel07/kmaps-nav-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 KakaoMap&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `net.daum.android.map`

**🎯 Supported versions:**

| 6.32.0 | 5.17.8 |
| :---: | :---: |
| APKPure XAPK (not on APKMirror) | APKMirror universal APK |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [KakaoMap high-rate GNSS](#kakaomap-high-rate-gnss) | Lets the location SDK use every GNSS fix (up to 25 Hz) while KNSDK keeps its 1 Hz origin rate, and fixes a map-matching result chain that leaked memory for the whole drive. |  |

</details>

<details open>
<summary>📦 NAVER Map&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.nhn.android.nmap`

**🎯 Supported versions:**

| 6.12.2.4 | 6.11.2.2 | 6.10.0.16 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [NAVER Map high-rate GNSS](#naver-map-high-rate-gnss) | Runs map matching on every new GNSS fix (max 20 Hz) with time-weighted counters and requests location updates every 125 ms. |  |

</details>

<!-- PATCHES_END -->

## 구조

```
patches/src/main/kotlin/app/kmaps/patches/
  shared/SiteEngine.kt   앵커 기반 편집 엔진: 클래스 안 모든 메서드에서 정규화한 smali 명령 텍스트로 지점을 찾음
                         (R8 메서드 이름 변경에 강함). cls = "src:Foo.kt"면 SourceFile로 클래스를 찾음(카카오맵처럼
                         클래스 이름이 버전마다 바뀌는 앱)
  naver/                 NaverPatch.kt(손작성 지점·패치 정의), NaverSites.kt(편집 지점 67개)
  kakao/KakaoPatch.kt    카카오맵 지점 K1~K3
extensions/naver/        RateGate(맵매칭 주기·시간 가중 도우미), stub/ = 컴파일용 네이버 클래스 스텁
extensions/kakao/        UbxKakao(origin 게이트)
ledger/                  분류 원장: 1초 전제 후보 전부의 판정. 새 버전에서 새 코드를 찾는 기준 (ledger/README.md)
tools/                   원장 도구(dexclasses, scan_smali, ledger, export_patches_*), 비교 도구(compare_naver, compare_edits)
legacy/                  예전 smali 텍스트 패치(네이버 rate8v4)와 Morphe 지점으로 한 번 변환한 생성기
```

## 새 앱 버전이 나왔을 때

1. 원본 서명 확인, 필요한 APK/split 추출.
2. 패치 적용: 앵커 일치 수가 다르면 그 지점에서 실패합니다 → 해당 클래스를 보고 지점을 고칩니다.
3. **분류 원장**(`ledger/README.md`)으로 새 1초 전제 코드를 찾습니다. 미분류 0이 될 때까지 판정·패치합니다.
4. `tools/compare_edits.py`로 이전 버전과 "원본 → 패치" 편집을 클래스별로 비교합니다.
5. 기기 확인: `cmd package compile -m verify -f <패키지>`, 길안내 중 VerifyError·크래시 없음, 재탐색·터널·구간단속.

## 개발

- 템플릿([morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template)) 방식: 모든 변경은 `dev` 브랜치, 커밋은 `feat:` / `fix:` / `chore:`.
  `feat`·`fix`는 dev 사전 릴리스를 만들고, `main`에 병합하면 정식 릴리스가 됩니다. 릴리스는 `release.yml`만 만듭니다.
- 로컬 빌드: `./gradlew buildAndroid` → `patches/build/libs/patches-*.mpp`.
  GitHub Packages에서 플러그인을 받으므로 `~/.gradle/gradle.properties`에 `gpr.user`와 `read:packages` 권한이 있는 토큰(`gpr.key`)이 필요합니다.
- 적용: `java -jar morphe-desktop-*-all.jar patch --patches=patches/build/libs/patches-*.mpp --exclusive -e "<패치 이름>" <원본.apk>`

## 📜 License

GNU General Public License v3.0 ([LICENSE](LICENSE)).
