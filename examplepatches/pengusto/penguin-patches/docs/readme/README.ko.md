# Penguin Patches

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="../assets/penguin-patches-banner-tailor-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="../assets/penguin-patches-banner-tailor.png">
  <img src="../assets/penguin-patches-banner-tailor.png" alt="Penguin Patches" width="1800">
</picture>

[English](../../README.md) · [Deutsch](README.de.md) · [简体中文](README.zh-CN.md) · [日本語](README.ja.md) · [Español](README.es.md) · [한국어](README.ko.md) · [Português (Brasil)](README.pt-BR.md) · [Français](README.fr.md)

[![Release](https://img.shields.io/github/v/release/pengusto/penguin-patches?label=release)](https://github.com/pengusto/penguin-patches/releases/latest) [![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue)](../../LICENSE) [![Android](https://img.shields.io/badge/platform-Android-3DDC84)](../SETUP.md) [![Morphe compatible](https://img.shields.io/badge/Morphe-compatible-6f42c1)](../SETUP.md)

**사용하는 앱을 조금 더 편리하게.**

Penguin Patches는 기존 앱의 기능을 개선하거나 문제를 고치는 Morphe Manager 호환 독립 Android 패치 모음입니다. Morphe 및 원본 앱 프로젝트와 제휴되어 있지 않습니다.

> 이 문서는 AI로 번역되었으며 원어민 검토를 거치지 않았습니다. 전체 패치 갤러리와 기술 안내서는 현재 영어로 제공되며, 내용이 다르면 영어판을 기준으로 합니다.

## 주요 기능

읽기 쉬운 Calendar 설명, Feeder 이미지 확대, Finamp 설정, Infinity+에서 사용할 개인 Reddit OAuth 클라이언트 등의 패치를 제공합니다. 변경 사항과 지원되는 원본 버전은 패치 목록과 각 앱 안내서에서 확인하세요.

**지원 앱:** [Feeder](../FEEDER.md) · [Finamp](../FINAMP_NATIVE.md) · [Fossify Calendar](../CALENDAR.md) · [Fossify Clock](../CLOCK.md) · [Fossify Contacts](../CONTACTS.md) · [Fossify File Manager](../FILE_MANAGER.md) · [Fossify Messages](../MESSAGES.md) · [Fossify Music Player](../MUSIC.md) · [Infinity+](../INFINITY.md) · [Komikku](../KOMIKKU.md) · [Kvaesitso](../KVAESITSO.md) · [Mihon](../MIHON.md) · [Read You](../READYOU.md) · [Tasks.org](../TASKS.md)

[**지원 앱과 정확한 버전 →**](../../README.md#generated-patch-catalogue)

## 적용 전과 후

예: Finamp 패치는 앨범 아티스트를 다른 참여자보다 먼저 표시합니다. 이미지는 가상 음악 데이터를 사용한 실제 Android APK 캡처입니다.

| 적용 전: 다른 참여자가 앨범 아티스트보다 먼저 표시됨 | 적용 후: 앨범 아티스트가 먼저 표시됨 |
| :---: | :---: |
| <img src="../../tests/finamp/evidence/2026-10-28/credits-before.png" alt="적용 전: 다른 참여자가 앨범 아티스트보다 먼저 표시됨" width="360"> | <img src="../../tests/finamp/evidence/2026-10-28/credits-after.png" alt="적용 후: 앨범 아티스트가 먼저 표시됨" width="360"> |

[모든 패치 비교 보기](../../README.md#patch-previews) · [캡처와 검증 기록](../../tests/finamp/evidence/2026-10-28/README.md)

## 패치 목록

- [화면에 보이는 대화의 알림 방지](../../README.md#preview-avoid-notifications-for-visible-conversations)
- [알람 사전 알림 시간 선택](../../README.md#preview-choose-upcoming-alarm-notification-time)
- [Infinity+에 개인 OAuth 클라이언트 설정](../../README.md#preview-configure-custom-oauth-for-infinity)
- [읽음 표시 시 알림 지우기](../../README.md#preview-dismiss-notifications-when-marking-conversations-read)
- [Finamp Complete: 7개 수정 사항](../../README.md#preview-finamp-complete-all-seven-fixes)
- [중첩 OPML 피드 가져오기](../../README.md#preview-import-nested-opml-feeds)
- [백그라운드 대화를 읽지 않음으로 유지](../../README.md#preview-keep-background-conversations-unread)
- [폴더 이름 변경 및 삭제 후 즐겨찾기 정리](../../README.md#preview-keep-favorites-consistent-after-folder-rename-or-removal)
- [제외 검색에서 로컬 만화 유지](../../README.md#preview-keep-local-manga-in-exclusion-searches)
- [상위 작업으로 이동](../../README.md#preview-navigate-to-the-parent-task)
- [각 곡에 포함된 표지 우선 사용](../../README.md#preview-prefer-each-track-s-embedded-cover)
- [삭제 제외된 기본 카테고리 다운로드 유지](../../README.md#preview-preserve-excluded-default-category-downloads)
- [캘린더 설명을 읽기 쉽게 표시](../../README.md#preview-readable-calendar-descriptions)
- [검색 메뉴의 위젯 편집 복원](../../README.md#preview-restore-widget-editing-from-the-search-menu)
- [하루 종일 일정의 기본 알림 분리](../../README.md#preview-separate-all-day-reminder-defaults)
- [병합된 연락처의 이메일과 메모 표시](../../README.md#preview-show-emails-and-notes-from-merged-contacts)
- [기사 이미지 확대](../../README.md#preview-zoom-article-images)

## 설치

1. [Penguin Patches → Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches). Penguin Patches를 Morphe 소스로 추가합니다. 링크가 열리지 않으면 Morphe Manager에서 “Sources → Add → Remote”를 선택하고 저장소 URL을 입력하세요.
2. 목록에서 앱 안내서를 열어 원본 APK의 정확한 버전, 배포 유형과 SHA-256을 확인한 다음 패치와 옵션을 선택합니다.
3. 패치를 적용하고 백업해 둔 Morphe 키로 서명하여 설치합니다. 실제 사용 전 삭제해도 되는 데이터로 동작을 확인하세요.

**먼저 백업하세요:** 패치는 원본 앱의 패키지 ID를 유지합니다. 다른 인증서로 서명한 APK는 기존 앱을 직접 업데이트할 수 없습니다. 앱 데이터와 서명 키를 백업하고 서명 충돌을 피하려고 기존 앱을 무작정 삭제하지 마세요.

[전체 설치 및 서명 안내서 →](../SETUP.md)

## 상태와 제한

각 안내서에 명시된 원본 APK만 검증되었습니다. 검증 기록은 패치된 공식 APK와 별도로 테스트한 소스 포크를 구분합니다. 실제 기기에서는 아직 검증하지 않았으며 다른 제한은 각 안내서를 확인하세요.

안정 릴리스는 `main`에서 제공됩니다. `dev` 프리릴리스는 예정된 변경을 시험할 때만 활성화하세요. Infinity+에는 별도로 승인받은 개인 Reddit OAuth 클라이언트가 필요합니다.

[검증 기록과 제한](../VERIFICATION.md) · [Infinity+](../INFINITY.md) · [Finamp](../FINAMP_NATIVE.md)

## 기술 구성

패치 정의에는 Kotlin, Android 런타임 보조 코드에는 Java를 사용하며 Gradle로 빌드합니다. 개발 안내서에서 Java 21, Android SDK와 패키지 레지스트리 접근 권한 등의 요구 사항을 확인할 수 있습니다.

## 개발과 도움말

[빌드 및 기여](../DEVELOPMENT.md) · [업스트림 작업과 로드맵](../ROADMAP.md) · [문제 보고](https://github.com/pengusto/penguin-patches/issues/new/choose) · [개발 후원](https://github.com/sponsors/pengusto)

## 라이선스와 출처

프로젝트 코드는 GPL-3.0을 따릅니다. 프로젝트 이름과 제3자 코드 및 이미지에 대한 설명은 NOTICE와 출처 문서를 확인하세요.

[GPL-3.0](../../LICENSE) · [NOTICE](../../NOTICE) · [출처 및 이미지 크레딧](../PROVENANCE.md)
