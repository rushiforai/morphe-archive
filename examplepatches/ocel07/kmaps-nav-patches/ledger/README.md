# 분류 원장 (네이버 지도·카카오맵, GNSS 주기 의존 지점)

앱 업데이트 대응 절차 L3의 원장이다. 탐지기가 뽑은 **후보 전부**와 **우리 패치 지점 전부**를 판정과 함께 적는다.
새 버전에서 다시 돌렸을 때 규칙에 없는 후보(= 새 코드)가 `UNCLASSIFIED`로 드러나게 하는 것이 목적이다.
(아틀란 원장은 2026-11-15 상위 프로젝트 `archive/atlan/ledger/`로 보관.)

| 파일 | 내용 |
|---|---|
| `naver_rules.tsv` | 판정 규칙. 기준 6.10.0.16 |
| `naver_ledger_6.10.0.16.tsv` | 297행: PATCHED 118 · OK 70 · INACTIVE 20 · OUT 89 · 미분류 0 |
| `naver_rules_6.11.2.2.tsv` | 6.11.2.2 규칙(6.10 규칙 − 대상 없어진 정확 규칙 + 6.11 판정). **다음 버전은 이 파일에서 시작** |
| `naver_ledger_6.11.2.2.tsv` | 410행: PATCHED 120 · OK 78 · INACTIVE 28 · OUT 184 · 미분류 0 (패치 행은 Morphe 사이트) |
| `kakao_scope.txt` | 카카오맵 스캔 범위(소스 파일 이름 패턴, `pkg:` 패키지) |
| `kakao_rules_5.17.8.tsv` | 카카오맵 5.17.8 규칙. 키가 **원래 소스 파일 이름**(아래 "카카오맵") |
| `kakao_ledger_5.17.8.tsv` | 389행: PATCHED 6 · OK 87 · INACTIVE 38 · OUT 258 · 미분류 0 |

도구는 `../tools/`, 중간 산출물(후보 목록, smali 트리)은 저장소 밖에 둔다(앱 코드가 들어 있음).

## 카카오맵 (난독화 앱)

KNSDK·KM 위치 SDK는 클래스·패키지 이름이 버전마다 바뀌고(`om/b`, `jo/c`), `.source`(원래 파일 이름)만 남는다. 그래서
- `dexclasses.py --srcmap`이 dex에서 "클래스 → 소스 파일" 표를 만든다.
- `scan_smali.py --srcmap … --scope kakao_scope.txt`: 범위는 소스 이름 패턴이 맞는 클래스가 있는 **패키지 전체**(같은 패키지의 새 파일도 스캔). 키는
  - class = `src:KNGPSData.kt` (라이브러리 내부는 `lib:<artifact>`, 버전 번호 제외)
  - desc 안의 앱 타입 = `<KNGPSData.kt>`, TIMER/LOCREQ detail의 소유자도 같은 방식(`<Delay.kt>->delay`)
  - 난독화 클래스·메서드 이름은 정보 열(`method` = `om/b.a`)에만 남는다.
- 내비 핵심 파일은 정확한 키 규칙(같은 키의 반복 n만 `*`), UI·렌더러·DB·통신 파일과 라이브러리는 파일 단위 와일드카드.
- 패치 행: `export_patches_morphe.py --app kakao`(KakaoPatch.kt의 `src:` 사이트, ID = note 첫 단어 K1·K2·K3).
- 5.17.8 판정 근거는 상위 프로젝트 `docs/kakao/A_location.md`·`B_matching.md`·`C_guidance.md`, 설계는 `docs/kakao-rate-patch.md`.
  INACTIVE 중 다시 볼 것: 레거시 경로(서버 `positioning_opt` 1·2), 실내 판정(`InOutCheckerV2` 등, 서버 indoor), GPS 로그 업로드(서버 `gpslog`).

```bash
# 카카오맵 <ver>: W = 저장소 밖 작업 폴더, smali는 dex 전부를 $W/smali/classesN/ 에 baksmali(--debug-info false)
python tools/dexclasses.py <base.apk> --srcmap $W/srcmap_<ver>.tsv
python tools/scan_smali.py --root $W/smali --srcmap $W/srcmap_<ver>.tsv --scope ledger/kakao_scope.txt --locreq-all --out $W/hits_<ver>.tsv
python tools/export_patches_morphe.py --app kakao --out $W/patches_<ver>.tsv
python tools/ledger.py --hits $W/hits_<ver>.tsv --hits $W/patches_<ver>.tsv --rules ledger/kakao_rules_<ver>.tsv --out ledger/kakao_ledger_<ver>.tsv --strict
```
- 탐지기 시험(11-15): 가짜 새 카운터(KNGuidance.kt) 1건 → `UNCLASSIFIED` + `--strict` 종료 코드 1. 스캐너를 바꾼 뒤 네이버 6.10.0.16 결과(136행)가 그대로인 것도 확인.
- 탐지 패턴 보강(11-15): 난독화된 코루틴 `delay`(`kotlinx/coroutines/a1;->delay`)·Flow `sample/debounce`, 소유자가 난독화된 `->requestLocationUpdates`, `LocationRequest$a`(Builder).
- 기계 탐지가 못 잡는 지점(상수 비교, 레지스터 비교: B 문서 M-01·M-02·M-11·M-17, A6·A12)은 문서 판정과 패치 행으로 관리한다.

## 판정

| 값 | 뜻 |
|---|---|
| `PATCHED` | 우리 패치가 처리한다. `ref` = 패치 ID(R/M/L/T/S/V/F/A/P/G, `guide-*`, `N1`, `M9`) |
| `OK` | 주기와 무관(시간 기준, 공간 기준, 목록 길이, 로그 전용 등). 근거는 `reason` |
| `INACTIVE` | 이 기기·현재 설정에서 안 도는 경로(AVN/CarPlay/듀얼 GPS, 모의주행, 디버그 등). 설정을 바꾸면 재검토 |
| `OUT` | 차량 내비 범위 밖(도보 내비, 위치 공유, 외부 라이브러리·SDK) |

## 키 (버전이 바뀌어도 흔들리지 않게)

- `kind` · 클래스 · **메서드 디스크립터(이름 제외)** · 세부(필드 타입±1, 상수, API) · `n`(같은 키 안의 순번). R8이 메서드·필드 이름을 바꿔도 키는 그대로다. 메서드 이름은 정보 열에만 있다.
- `PATCH` 행: 패치 지점(클래스·메서드 지정·앵커 첫 줄).
- 규칙의 `*`는 아무 값, 클래스 `pkg/**`는 패키지, `pkg/Cls**`는 클래스와 내부 클래스. 가장 구체적인 규칙이 이긴다.
  **차량 내비 코드는 전부 정확한 키 규칙**이고, 와일드카드는 범위 밖(도보, 외부 라이브러리)과 `PATCH` 행에만 쓴다. 그래야 새 코드가 규칙에 묻히지 않는다.

## 다시 만들기

```bash
# 분해 → 후보 → 패치 지점 → 원장  (W = 저장소 밖 작업 폴더)
python tools/dexclasses.py <base.apk> --pkg Lcom/naver/maps/navi/,Lcom/naver/map/core/navigation/ --count   # 내비 클래스가 든 dex
python tools/dexclasses.py <base.apk> "--refs=->requestLocationUpdates,gms/location/LocationRequest;->"     # 위치 요청 API를 참조하는 dex
#   위 dex들을 baksmali(--debug-info false)로 $W/smali/classesN/ 아래에 푼다
python tools/scan_smali.py --root $W/smali --pkg com/naver/maps/navi,com/naver/map/core/navigation --locreq-all --out $W/hits_<ver>.tsv
python tools/export_patches_morphe.py --out $W/patches_<ver>.tsv          # NaverSites.kt + NaverPatch.kt 손작성 지점
python tools/ledger.py --hits $W/hits_<ver>.tsv --hits $W/patches_<ver>.tsv --rules ledger/naver_rules_<ver>.tsv --out ledger/naver_ledger_<ver>.tsv --strict
```

- `UNCLASSIFIED`: 코드를 보고 판정한 뒤 규칙을 추가한다(고쳐야 하면 `NaverSites.kt`/`NaverPatch.kt`에도). 0이 될 때까지 빌드를 내보내지 않는다.
- `STALE rule`: 규칙이 아무것도 못 맞췄다 → 코드가 없어졌거나 키가 바뀌었다. 같은 코드를 찾아 규칙 키를 고친다.
- `export_patches_morphe.py`의 `HAND` 목록은 `NaverPatch.kt` 손작성 지점과 맞춰 둔다(새 손작성 지점을 넣으면 같이 추가). 6.11.2.2 원장을 그대로 재현하는 것을 확인했다(11-15).
- `export_patches_naver.py`는 6.10.0.16 원장용(예전 텍스트 패치 기준). 패치 ID 표(`ID`)는 두 도구가 같이 쓴다.
- 탐지기 시험(10-11): 가짜 새 카운터 1건 → `UNCLASSIFIED` + `--strict` 종료 코드 1, 메서드 이름만 바꾼 행 → 그대로 판정됨.

## 확인해 둔 것

- 네이버 내비 클래스는 맵매칭·안내·NaviStore 외에 설정·로그·인증, 도보 시뮬레이션 dex에도 있다. 6.10·6.11 모두 스캔했다.
- 위치 요청 API를 쓰는 곳 중 내비 입력은 `FusedLocationSource`·`SystemLocationSource`(N1)뿐이다. 나머지는 Android Auto QA 화면, 광고 SDK, androidx, 위치 기록 디버그, 위치 공유, Clova SDK, Play 서비스 내부.
- 탐지기 한계: 패턴 밖의 1초 전제(예: `floor(경과초)`를 표본 수로 쓰는 코드는 `FLOOR`로 일부만 잡힘)는 놓칠 수 있다. 그래서 버전 diff·실행 확인과 함께 쓴다.
