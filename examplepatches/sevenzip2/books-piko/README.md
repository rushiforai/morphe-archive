# Books Piko

Google Play 북(`com.google.android.apps.books`)을 위한 [Morphe](https://github.com/MorpheApp) 패치 번들입니다.
[Piko](https://github.com/crimera/piko)(Twitter/X·Instagram)와 같은 구조로 만들었습니다.

- **루팅 없이** 재서명한 Play 북에서 Google 로그인, Books OAuth, 라이브러리 사용 (ReVanced GmsCore 경유)
- 책 본문(EPUB 리플로우)에 **사용자 TTF/OTF 글꼴 적용**

고정된 smali 줄 번호는 쓰지 않습니다. 모든 패치 지점은 문자열·시그니처·opcode fingerprint로 찾고,
치환할 리터럴의 개수와 사용처(예: `Account.<init>`의 type 인자)를 확인한 뒤에만 바꿉니다.
Play 북이 업데이트돼 코드 의미가 바뀌면 엉뚱한 곳을 고치지 않고 패치가 실패합니다.

## 패치 목록

| 패치 | 기본값 | 설명 |
|---|---|---|
| GmsCore support | 켜짐 | 계정 조회, 토큰(GetToken), 계정 선택기만 GmsCore로 보냅니다. clearcut, phenotype 같은 나머지 Play 서비스 API는 설치된 Play 서비스를 그대로 씁니다. |
| Custom reader font | 켜짐 | 리더 WebView의 글꼴 요청을 사용자 글꼴로 바꿉니다. Play 북 **설정 → Ebook reading → 사용자 글꼴**에서 글꼴을 고릅니다. |
| Attributed copy fallback | 켜짐 | 복사가 허용되면 본문만 복사합니다. 복사 금지·한도 소진 상태에서는 책 제목·저자·링크를 붙여 선택한 본문을 복사합니다. |
| GmsCore account type (extended) | 꺼짐 | 실험 기능입니다. 앱 안에 남아 있는 `Account(name, "com.google")` 생성(업로드, 컬렉션, 고객센터 페이지, 백그라운드 동기화)도 GmsCore 계정 타입으로 바꿉니다. |

### GmsCore support 옵션

- `gmsCoreVendorGroupId` (기본값 `app.revanced`): 사용할 GmsCore의 패키지는 `<vendor>.android.gms`, 계정 타입은 `<vendor>`입니다.
- `spoofedPackageSignature` (기본값 `38918a453d07199354f8b19af05ec6562ced5788`): GmsCore가 Google OAuth에 보고하는 서명입니다.
  Android 13에서 쓰이는 v3.1 서명자 `bd32424203e0…`를 넣으면 `UNREGISTERED_ON_API_CONSOLE` 오류가 납니다.

### Custom reader font 옵션

- `fontSettingsLauncherShortcut` (기본값 꺼짐): 설정 화면 항목과 별도로 런처에 "Books 글꼴" 아이콘도 추가합니다.
- `bundledFontPath` (선택): 패치할 때 APK에 넣을 TTF/OTF 파일 경로입니다. 기기에서 글꼴을 고르기 전까지 이 글꼴을 씁니다.

### Attributed copy fallback

**Attributed copy fallback**은 기본으로 켜져 있으며, 리더의 기존 **복사** 메뉴가 다음처럼 동작합니다.

- 원래 복사가 가능한 상태: 출처 문구 없이 본문만 복사합니다. 제한된 복사 한도가 있는 책은 기존과 같이 한도를 차감합니다.
- 복사 금지 또는 한도 소진 상태: 선택한 본문 뒤에 `- <책 제목>, 저자 - Google Play 북`과 도서 링크를 붙여 복사합니다.
- 복사 허용 정보가 아직 없을 때도 출처를 붙입니다. 복사 시 앱 내부에 저장된 도서 정보를 직접 조회하므로 기존에 내려받은 책이나 메타데이터 캐시가 비워진 책에서도 제목·저자를 읽습니다.
- 링크는 `https://play.google.com/store/books/details?id=도서ID` 형식의 **책 소개 페이지**입니다. 리더 링크는 사용하지 않습니다. 도서 정보를 읽지 못하면 책 소개 링크만 출처로 남깁니다.

선택한 텍스트를 복사하는 기능입니다. 이미지·스캔 페이지에서 텍스트를 추출하지는 않습니다.
출처 정보는 앱 내부의 도서 메타데이터를 사용하며, 추가 네트워크 요청이나 선택한 본문 저장은 하지 않습니다.

출력 형식과 분기 테스트는 JDK가 있는 환경에서 `bash tests/test-attributed-copy.sh`로 실행할 수 있습니다.

## 사용 방법

1. Play 북 split APK(APKM/APKS)를 준비합니다. 지원 버전은 `2026.10.16.0 (395681)`입니다. 다른 버전도 패치할 수 있지만 Manager에는 지원 목록 밖 버전으로 표시됩니다.
2. 패치합니다. 셋 중 하나를 고르세요.
   - **Morphe Manager (링크)**: 폰에서 아래 링크를 열면 Manager에 패치 소스로 추가됩니다. 새 버전이 나오면 Manager가 알아서 업데이트합니다.

     **https://morphe.software/add-source?github=sevenzip2/books-piko&name=Books%20Piko**

     링크가 열리지 않으면 Manager의 패치 소스 추가에서 URL `https://github.com/sevenzip2/books-piko`를 입력하세요.
     추가한 뒤 홈에서 Play 북을 누르고 APKM을 고릅니다. "Split APK detected" 경고가 떠도 진행하면 됩니다.
     원본이 없으면 **APK 없음**을 누르세요. Manager가 지원 버전의 원본 다운로드 페이지를 안내합니다.
     번들에 Google 원본 서명이 들어 있어서, 받은 파일이 원본이 아니면 Manager가 경고합니다.
   - **Morphe Manager (파일)**: [Releases](https://github.com/sevenzip2/books-piko/releases/latest)에서 `patches-<version>.mpp`를 받아 Manager의 패치 소스 추가 → Local로 넣습니다.
   - **[Morphe Desktop/CLI](https://github.com/MorpheApp/morphe-cli)**:
     ```bash
     java -jar morphe-desktop-*-all.jar patch -p patches-<version>.mpp play-books.apkm
     ```
   직접 빌드하려면 `read:packages` 권한이 있는 GitHub 토큰이 필요합니다.
   ```bash
   GITHUB_ACTOR=<사용자명> GITHUB_TOKEN=<토큰> ./gradlew buildAndroid
   # 결과: patches/build/libs/patches-<version>.mpp
   ```
3. 기존 Play 북을 지우고 패치한 APK를 설치합니다. 서명이 바뀌므로 덮어쓰기는 되지 않습니다.
4. [ReVanced GmsCore](https://github.com/ReVanced/GmsCore)를 설치하고 GmsCore에서 Google 계정에 로그인합니다.
5. Play 북을 처음 실행하면 **연락처** 권한(GET_ACCOUNTS)을 요청합니다. 허용하세요. 이 권한이 없으면 GmsCore가 계정을 넘겨주지 않아 로그인 화면에서 넘어가지 못합니다.
   창을 놓쳤다면 설정 → 애플리케이션 → Play 북 → 권한 → 연락처에서 허용하세요.

NPatch 같은 도구를 함께 쓸 때는 전체 **MicroG/GMS redirect를 꺼야** 합니다. 필요한 경로는 이 패치가 직접 리디렉션합니다.
전체 리디렉션을 켜면 GmsCore에 없거나 동작이 다른 서비스까지 넘어가서 초기화가 깨집니다.

## 사용자 글꼴

- Play 북 **설정 → Ebook reading → 사용자 글꼴**에서 기본(Regular) 글꼴을 고릅니다. 굵게/기울임/굵은 기울임 글꼴은 선택 사항입니다.
  따로 넣지 않으면 기본 글꼴에서 자동으로 합성됩니다.
- 파일 관리자에서 글꼴 파일을 **Play 북으로 열기/공유**해도 기본 글꼴로 설치됩니다.
- 설정 항목:
  - **글꼴 메뉴에서 무엇을 골라도 내 글꼴로 보기**: 책 읽는 화면의 글꼴 메뉴에서 어떤 글꼴을 골라도 내 글꼴로 보입니다. 끄면 Literata를 골랐을 때만 바뀝니다.
  - **책에 들어 있는 글꼴도 무시하고 항상 내 글꼴로 보기**: 책이 자체 글꼴을 쓰더라도, 글꼴 메뉴 선택과 상관없이 항상 내 글꼴로 보입니다.
  - **굵은 글씨를 외곽선으로 표시** (기본 켜짐): 굵게 글꼴 파일을 넣지 않았을 때 굵은 글씨에 얇은 외곽선(`-webkit-text-stroke`)을 그립니다. 일부 Android WebView는 웹 글꼴의 굵게를 합성하지 않아서 넣었습니다. 글자 폭은 바뀌지 않습니다.
  - **코드/고정폭 글꼴 유지**: `pre`, `code`, `kbd`, `samp`, `tt`는 강제 적용에서 뺍니다.
- 글꼴이나 설정을 바꾼 뒤에는 글꼴 화면의 **Play 북 다시 시작** 버튼을 누르세요. 리더가 앱이 켜져 있는 동안 글꼴을 캐시합니다.
- 확인: `adb logcat -s BooksPiko`에 `Serving custom font`가 보이면 적용된 것입니다.

동작 방식은 [docs/ANALYSIS.md](docs/ANALYSIS.md)를 보세요.

## 릴리스

`main`에 푸시하면 `.github/workflows/release.yml`이 다음을 합니다.
1. 패치 번호를 올립니다(`gradle.properties`의 `version`).
2. `.mpp`를 빌드해 GitHub Release에 올립니다.
3. Manager가 읽는 `patches-bundle.json`을 갱신합니다.

부 버전이나 주 버전을 올리려면 `gradle.properties`의 `version`을 아직 릴리스하지 않은 값(예: `0.2.0`)으로 바꿔 푸시하세요.

## 새 Play 북 버전에 대응하기

1. 새 APKM으로 패치를 실행합니다. 실패한 패치는 fingerprint 이름과 이유
   (예: `Expected 1 occurrence(s) of "com.google" in Lpir;->onResume but found 2`)를 출력합니다.
2. [docs/ANALYSIS.md](docs/ANALYSIS.md)의 패치 지점 표를 보고 새 버전에서 같은 의미의 코드를 찾아 fingerprint를 고칩니다.
3. `patches/.../shared/Constants.kt`의 `COMPATIBILITY_PLAY_BOOKS`에서 버전을 새 버전으로 바꿉니다. 버전은 하나만 둡니다(이유는 그 파일의 주석 참고).

## 라이선스

GPLv3. Morphe와 Piko의 구조를 참고했습니다.
