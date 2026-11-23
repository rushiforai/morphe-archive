# LINE notification patches

**English**: [README.md](README.md) | **한국어**: README.ko.md

Morphe 원격 소스: https://github.com/gomjirak0803/line-notification-patches

[v0.1.12-dev 다운로드](https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.12-dev) · [배포 검증 결과](docs/PUBLICATION_STATUS.md) · [실기기 검증표](docs/DEVICE_TESTS.md)

[Morphe Manager에 소스 추가](https://morphe.software/add-source?github=gomjirak0803/line-notification-patches) · **Pre-release patches**와 **Experimental app versions**를 켜세요.

LINE `26.16.0` (`versionCode 261600106`, `minSdk 30`)용 **독립 실험 Morphe 패치**입니다. LINE, LY Corporation, Morphe의 공식 프로젝트가 아닙니다.

## 구현 범위

| 패치 이름 | 기본 포함 | 현재 동작 / 제한 |
| --- | --- | --- |
| Notification settings | 예 | LINE 기본 설정의 프로필 아래 **알림 패치 설정** 전체 화면을 추가합니다. **모든 기능 스위치는 최초 꺼짐**입니다. 모든 UI 문구는 앱·시스템 언어에 따라 7개 언어(영어 기본, 한국어, 일본어, 중국어 번체·간체, 태국어, 인도네시아어)로 표시됩니다(패치 고유명 4개는 영문 유지). |
| Not Too Much Silent | 아니오 | 켜 두면 일반 채팅방 메뉴, **채팅 목록 길게 누르기 메뉴**, 알림창의 기존 **알림 끄기**가 로컬 조용히 받기로 작동합니다. 푸시 수신을 유지한 채 무음 채널(`IMPORTANCE_LOW`)로 표시하고 **알림 켜기**로 복귀합니다. 채팅방 메뉴의 **알림 완전히 숨기기**는 LINE 기본 알림 끄기 + 로컬 차단을 함께 적용합니다. OS에서 차단한 원래 채널은 우회하지 않습니다. |
| More Chat Info | 아니오 | 최근 로컬 미확인 메시지 최대 25개를 시간순으로 Android `MessagingStyle` 대화형 알림에 전달합니다. 방 이름 옆 `[숫자]`는 전체 미확인 수입니다. 펼친 알림 프로필 사진은 1:1 원본 아이콘과 그룹 `contacts.picture_path` + LINE Glide 로컬 캐시 전용(`onlyRetrieveFromCache(true)`)으로만 읽습니다. |
| No reply | 아니오 | 추천 답장과 시스템 자동 제안을 해제합니다. 직접 입력 답장 버튼과 기존 PendingIntent는 유지합니다. |
| Mark as read | 아니오 | 일반 채팅방의 개별 알림을 **읽음 / 답장**으로 바꿉니다. 읽음을 누르면 LINE 기본 채팅 목록 읽음 객체(`qg3.e`)로 방 전체를 읽음 처리하고 해당 방 알림을 지웁니다. 로컬 저장 전에는 버튼을 보류하며 `More Chat Info` 없이 단독 동작합니다. |
| Restore push registration | 아니오 | 재서명 후 Firebase Installations 등록 실패에 대응하는 **별도 선택 패치**입니다. FIS 요청의 `X-Android-Cert` 헤더만 원본 인증서 SHA-1으로 교체하며 Remote Config나 LINE 인증 프로토콜은 변경하지 않습니다. |

* 패치 포함 여부와 앱 내 스위치 켜짐은 별도입니다. OpenChat, 서비스챗, 통화, 진행 중 알림은 변경 대상에서 제외합니다.
* 이전 버전이나 다른 기기에서 이미 LINE 기본 알림을 꺼 둔 방은 자동 전환하지 않습니다. 해당 방에서 **알림 켜기 → 알림 끄기**를 한 번 실행하면 로컬 조용히 받기로 지정됩니다.

## Morphe Manager에서 사용

1. Patcher `2.3.0` 이상을 지원하는 Morphe Manager에서 [Manager에 소스 추가](https://morphe.software/add-source?github=gomjirak0803/line-notification-patches)를 열거나 **Sources → + → Remote**에 `https://github.com/gomjirak0803/line-notification-patches`를 입력합니다.
2. 해당 소스의 **Pre-release patches**와 **Experimental app versions**를 켭니다.
3. **Expert mode**에서 본인이 준비한 원본 LINE `26.16.0` (`261600106`) **APKM 전체 파일**(`base.apk` 단독 불가)을 선택하고 원하는 패치를 적용합니다.
4. 공식 LINE과 서명이 다르므로 **기존 앱을 제거하기 전에 반드시 대화 백업과 계정 복구 수단을 확인하세요.**
5. 설치 후 LINE 설정 → 프로필 아래 **알림 패치 설정**에서 사용할 스위치를 켭니다.

## 로컬 빌드 (Windows x64)

```powershell
python scripts/bootstrap.py
python scripts/build.py
python scripts/validate.py
```

자세한 빌드·검증·배포 절차와 버전별 이력은 영문 [README.md](README.md) 및 `docs/` 문서를 참고하세요.

## 데이터·프라이버시·제한

* LINE 로컬 대화/연락처 DB는 `OPEN_READONLY` 읽기 전용으로만 조회하며, 펼친 알림 프로필 사진도 LINE Glide 로컬 캐시 전용(`onlyRetrieveFromCache(true)`)으로만 읽습니다. 별도 수집 서버, 주기적 폴링, 추가 이미지 다운로드, 대화 로그 저장은 없습니다.
* 사용자가 방 알림 설정 변경이나 `읽음`을 누를 때 LINE의 기존 내부 객체를 호출하므로 정상적인 LINE 서버 요청이 발생할 수 있습니다. 조용히 받기는 서버 푸시 구독을 켜 두고 로컬에서만 무음 처리하므로 PC·태블릿·보조폰 등 다른 기기에서는 알림 켜짐 상태로 보일 수 있습니다.
* LINE `메시지 내용 미리보기`가 꺼져 있으면 본문을 추가 조회하지 않으며, 잠금화면 공개 범위(`VISIBILITY_PRIVATE`)와 `publicVersion`을 유지합니다.
* **계정 정지 위험이 없다는 보장은 할 수 없습니다.** 변조·재서명 앱 사용은 서비스 약관과 별개이며, 모든 사용은 사용자 책임입니다.

## 라이선스

[GPL-3.0](LICENSE) · [이름·상표 고지](NOTICE) · [타사 출처 고지](THIRD_PARTY_NOTICES.md). LINE 및 Morphe의 공식 프로젝트가 아닙니다.
