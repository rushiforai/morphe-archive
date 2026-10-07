# S Chzzk Patches

치지직을 보면서 채팅창을 내 화면에 맞게 조절하는 Android 패치 모음입니다. 채팅 폭을 드래그로 조절하고, 글자 크기와 배지·시각 표시, 플레이어 버튼을 바꿀 수 있습니다.

**지원 앱: 치지직 3.14.0** · [Morphe](https://morphe.software)에서 적용합니다.

## 설치하기

최신 Morphe를 설치한 다음, Android 기기에서 아래 링크를 여세요. 기본 설정으로 사용할 때는 전문가 모드가 필요하지 않습니다.

**[Morphe에 S Chzzk Patches 추가](https://morphe.software/add-source?github=snowyegret23/morphe-patches)**

수동으로 추가하려면 Morphe의 **소스 → + → 원격**에 저장소 주소를 입력하세요: [snowyegret23/morphe-patches](https://github.com/snowyegret23/morphe-patches)

소스를 추가한 뒤에는 다음 순서로 설치합니다.

1. [APKMirror의 치지직 3.14.0](https://www.apkmirror.com/apk/naver-corp/치지직-chzzk-네이버-게임의-새-이름/치지직-chzzk-3-14-0-release/)에서 기기에 맞는 **APKM** 파일을 내려받아 선택합니다.
2. **S Chzzk Patches**의 기본 선택을 사용합니다. 7개 패치가 모두 켜져 있습니다.
3. 패치 후 설치하면 원본과 별개인 **치지직 S**가 추가됩니다. 앱 이름·패키지 이름을 직접 지정하려면 전문가 모드에서 해당 패치 옵션을 바꾸세요.
4. **설정 → Morphe** 또는 **방송 화면의 ⋯ → Morphe 설정**에서 채팅과 시청 옵션을 조절합니다.

Morphe의 APK 찾기 기능은 직접 다운로드 주소가 등록되지 않은 앱에서 Google 검색 안내를 표시할 수 있습니다. 위 APKMirror 링크로 직접 이동해도 됩니다.

파일로 가져오려면 [Releases](https://github.com/snowyegret23/morphe-patches/releases/latest)에서 `.mpp`를 내려받아 Morphe의 **소스 → + → 로컬**에서 선택하세요. 파일 관리자에서 `.mpp`를 Morphe로 열어도 됩니다.

## 채팅창 맞추기

| 조절할 항목 | 설정할 수 있는 내용 |
| --- | --- |
| 채팅 폭 | 기본 100%, 50–300% 배율 · −/+ 버튼과 드래그로 조절 |
| 글자와 아이콘 | 글자·이모티콘·배지 크기 80–200%, 줄 간격 80–160% |
| 시각·접속 기기 | 닉네임 앞 시:분 표시, 초·12시간제·크기 선택, PC·모바일·iOS 아이콘 |
| 닉네임·배지 | 닉네임만 숨기기, 구독·후원 순위·활동·인증·채널·역할 배지 각각 숨기기 |
| 표시 방식 | 닉네임과 본문 줄 분리 |
| 메시지 필터 | 단어 포함·닉네임 일치 필터, 후원·구독·선물·시스템 등 메시지 숨기기 |
| 채팅 주변 요소 | 후원·통나무 순위, 승부예측, 게임 프로모션, 팔로우 권유 숨기기 |

채팅 폭은 영상과 채팅이 나란히 표시될 때 적용됩니다. 경계의 손잡이를 좌우로 드래그하면 비율이 저장됩니다. 손잡이를 가볍게 누르면 채팅 폭과 글자 크기를 바로 조절할 수 있습니다. 휴대폰·태블릿 모두 앱의 기본 채팅 폭이 100%입니다. −/+ 버튼은 5%씩 조절하며, 앱의 절반 너비 제한을 풀었습니다. 영상 공간을 남기도록 현재 창 크기에 따라 최대 폭은 제한됩니다.

닉네임과 배지는 독립적으로 설정합니다. PC는 모니터, 안드로이드는 휴대폰, iOS는 Apple 아이콘으로 구분합니다. 기기 정보가 없는 메시지에는 표시하지 않습니다.

클린봇 및 임시차단·블라인드 메시지는 **앱에 원문이 남아 있는 경우** 원래 내용을 표시할 수 있습니다. 임시차단·블라인드 원문 표시는 기본으로 꺼져 있으며, 서버가 보내지 않은 내용은 복원하지 못합니다.

최근 표시한 일반 채팅을 최대 200개까지 모아 보는 옵션도 있습니다. 최근 채팅 화면은 닉네임·시각과 본문을 구분하고, 가장 최근 메시지부터 보여 줍니다. 기본으로 꺼져 있고, 기록은 앱 실행 중 메모리에만 보관합니다. 최근 채팅의 커스텀 이모티콘은 텍스트 안내로 표시합니다.

## 방송 화면 조절

전체화면 버튼 왼쪽의 동심원 버튼은 플레이어가 제공하는 실시간 위치로 이동합니다. 재생을 새로 시작하지 않고 밀린 위치를 따라잡으며, 방송 자체의 전송 지연을 없애는 기능은 아닙니다.

**Morphe → 플레이어**에서 실시간 따라잡기 버튼과 클립 만들기·크롬캐스트·공유 버튼의 표시 여부를 설정할 수 있습니다.

## 함께 제공하는 패치

- **Chat customization**: 채팅·플레이어 설정, 최근 채팅과 설정 복사·붙여넣기
- **Playback without ads**: 플레이어 광고와 클립 피드 광고 카드 제거
- **CDN playback**: P2P 스트리밍 설정 비활성화
- **Home without promotions**: 홈 화면 프로모션 배너 숨기기
- **Auto claim TongPow**: 보상 팝업을 받으면 앱의 수령 버튼 동작 실행
- **Change package name**: 별도 패키지로 설치하기 위한 이름 지정
- **Custom app branding**: 홈 화면과 앱 목록에 표시할 이름 지정

광고 제거와 통나무 수령에는 채팅 설정 패치도 함께 적용됩니다. 통나무 자동 수령은 앱 안의 Morphe 설정에서 끌 수 있으며, 백그라운드 적립을 별도로 실행하지 않습니다.

## 설정 옮기기와 업데이트

**설정 → Morphe → 설정 관리**에서 설정을 복사한 뒤 다른 기기에 붙여넣을 수 있습니다. 채팅 폭·글자 크기·필터 등이 옮겨지며, 대상 기기의 기존 설정을 교체합니다. 채팅 기록과 패치할 때 지정한 앱 이름·패키지 이름은 포함하지 않습니다.

패키지 이름을 바꿔 설치하면 원본 앱을 지울 필요 없이 두 앱을 함께 사용할 수 있습니다. 각 앱의 로그인과 로컬 데이터는 별도로 저장됩니다. 패치 앱을 업데이트할 때는 처음 설치할 때와 **같은 패키지 이름, 같은 Morphe 서명 키**를 사용하세요.

## 지원 범위

3.14.0의 휴대폰용 480–640dpi APKM과 태블릿 등에 사용하는 120–480dpi APKM을 대상으로 만들었습니다. 120–480dpi 변형은 Android 12L 이상이 필요합니다.

두 변형 모두 패치 적용·병합·재서명과 서명 검증을 통과했습니다. 샤오신패드 TB128FU / Android 13에서 원본과 동시 설치, 로그인 후 덮어업데이트, 라이브 재생, 방송 메뉴의 설정, 드래그, 시각·기기 표시, 닉네임·배지 분리, 버튼 숨기기, 실시간 따라잡기, 최근 채팅과 설정 복사·붙여넣기를 확인했습니다. 휴대폰 실기기와 세로 화면, 통나무 자동 수령은 추가 확인이 필요합니다. 다른 앱 버전의 호환성은 보장하지 않습니다.

## 직접 빌드하기

JDK 21, Android SDK 36, Build Tools 36.0.0을 준비하고 `ANDROID_HOME`을 설정합니다. GitHub Packages 읽기 인증은 [Morphe 개발 환경 안내](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md)를 참고하세요.

~~~powershell
.\gradlew.bat :patches:buildAndroid
~~~

빌드한 `.mpp` 파일은 `patches/build/libs/`에 생성됩니다. GitHub 배포는 `main`에 푸시할 때 실행되는 Release 워크플로가 처리합니다. `feat:`·`fix:` 등 커밋 메시지에 따라 버전이 정해지며, 배포가 성공하면 Releases의 번들과 Morphe용 소스 정보가 갱신됩니다.

## 라이선스

[GNU General Public License v3.0](LICENSE)으로 배포합니다. 재사용한 코드의 저작권·라이선스 고지는 [THIRD_PARTY_NOTICES](THIRD_PARTY_NOTICES)와 [NOTICE](NOTICE)에 있습니다.

## Special Thanks

- [Chzzk Platter](https://github.com/lirpa62/Chzzk-Platter): 채팅과 화면 조절 기능의 참고 프로젝트
- [Ample Patches](https://github.com/AmpleReVanced/revanced-patches): 치지직 패치의 출발점과 호환성 참고
- [Morphe Patches Template](https://github.com/MorpheApp/morphe-patches-template): 빌드·릴리스 구조
