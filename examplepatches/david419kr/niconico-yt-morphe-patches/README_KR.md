[English](README.md) | [한국어](README_KR.md) | [日本語](README_JP.md)

# Niconico YT Comments

안드로이드 YouTube 플레이어 위에 라이브 채팅과 채팅 다시보기를 니코니코식 탄막 코멘트로 표시하는 Morphe 패치입니다.

## 주요 기능

- 공개 라이브 채팅 및 채팅 다시보기 표시
- YouTube 커스텀 이모지, 멤버십 코멘트 및 Super Chat 색상
- 코멘트를 켜고 끄는 플레이어의 `弾` 버튼
- `弾` 버튼을 길게 눌러 폰트 크기와 투명도 설정

※로그인이 필요한 비공개, 멤버 전용, 연령 제한 채팅 등은 지원하지 않습니다.

<img width="480" height="412" alt="image" src="https://github.com/user-attachments/assets/aebf4f85-b6c4-40d0-8df0-3e2a75655b4f" />
<img width="480" height="412" alt="image" src="https://github.com/user-attachments/assets/1e6fcc4c-1a60-499c-9c9b-deaced660d17" />

https://github.com/user-attachments/assets/f29e2231-e159-43ad-8999-8451dfaef7f3

## 요구 사항

- Morphe
- Android 9 이상(API 28+)
- 수정되지 않은 YouTube `21.20.405` APK (`21.04.223` 지원도 유지)
- Morphe Expert mode 활성화

번들 `1.3.3`은 Morphe Patcher 2에서 발생하는 `VideoTimeReferenceFingerprint` 매칭 오류를 해결하며, 기존 재생속도 호환성 수정도 포함합니다. YouTube `21.20.405`와 Morphe Patches `1.48.0` 조합에서 선택한 105개 패치 적용과 APK 재생성이 모두 성공했습니다. 이번 업데이트에서 기기 재생 동작과 구버전 APK는 다시 검증하지 않았습니다.

## 설치 방법

### 1. Expert mode 활성화

이 패치는 Simple mode에서 자동으로 선택되지 않습니다. Morphe에서 다음 메뉴를 엽니다.

```text
Settings → Advanced → Expert settings → Expert mode
```

Expert mode를 활성화하고 확인 메시지를 승인합니다.

### 2. 패치 소스 추가

#### 원격 소스(권장)

Morphe에서 다음 메뉴를 엽니다.

```text
Sources → ＋ → Remote
```

아래 저장소 주소를 입력하고 **Add**를 누릅니다.

```text
https://github.com/david419kr/niconico-yt-morphe-patches
```

안드로이드 기기에서 [Morphe로 열기](https://morphe.software/add-source?github=david419kr%2Fniconico-yt-morphe-patches&name=Niconico%20YT%20Comments) 링크를 사용할 수도 있습니다.

#### 로컬 `.mpp` 소스

1. [최신 GitHub Release](https://github.com/david419kr/niconico-yt-morphe-patches/releases/latest)에서 `patches-1.3.3.mpp`를 다운로드합니다.
2. Morphe에서 `Sources → ＋ → Local`을 엽니다.
3. 다운로드한 `.mpp` 파일을 선택하고 **Add**를 누릅니다.

파일 이름이나 확장자를 바꾸거나 다시 압축하지 마세요. 안드로이드 파일 관리자에서 `.mpp`를 직접 열고 Morphe를 선택해도 됩니다.

### 3. YouTube 패치

1. Morphe 홈 화면에서 **YouTube**를 선택합니다.
2. 버전 `21.20.405`를 선택하고 수정되지 않은 `.apk` 파일을 지정합니다. `21.04.223`을 계속 사용하는 경우 해당 버전을 지원하는 공식 패치와 조합합니다.
3. **Morphe Patches** 탭에서 추천 패치를 활성화합니다.
4. **Niconico YT Comments Patches** 탭에서 다음 패치를 활성화합니다.

   ```text
   Niconico-style live/replay comments (Experimental)
   ```

5. **Proceed to patching**을 누릅니다.
6. 여러 패치 소스 사용 경고를 확인합니다. 공식 Morphe 패치와 이 패치를 함께 선택한 것은 정상입니다.
7. 패치된 APK를 설치합니다. Android가 알 수 없는 앱 설치 권한을 요청하면 Morphe에 권한을 허용합니다.

비루트 기기에서는 공식 Morphe 추천 패치와 이 패치를 함께 사용하는 것을 권장합니다. 이 코멘트 패치에 포함되지 않은 일반적인 패키지명 변경과 로그인 지원을 공식 패치가 제공합니다.

## 업데이트

- **원격 소스:** `Sources`에서 **Niconico YT Comments Patches**를 선택하고 **Update**를 누릅니다. 버전 `1.3.3`로 갱신됐는지 확인한 뒤 원본 YouTube APK에 다시 패치합니다. 위 저장소 URL은 항상 현재 배포된 번들을 가리킵니다.
- **로컬 소스:** 기존 소스를 삭제한 뒤 새 `.mpp`를 다운로드하여 다시 추가합니다.
