# Korean native server UI

## Scope

`Korean native server UI` is a default-enabled bytecode patch for VocaColle
7.40.0. Its original validation artifact was produced while the patch was
opt-in; only the bundle selection default has changed.
It translates only stable server-provided metadata at native UI display
boundaries:

- ranking navigation labels;
- push-topic titles identified by stable topic names.

The patch intentionally preserves unknown values. Song titles, creator names,
ordinary tags, URLs, request identifiers, and other content are not translated.
Push descriptions also remain unchanged until a reviewed mapping is available.
WebView content, including the lower part of the premium-membership page, is
outside this patch's scope.

## Implementation

The patch extends the app with `ServerUiKoreanTranslator` and hooks:

- the ranking display-label method;
- the push-topic title getter;
- the push-topic description getter.

Ranking labels use a narrow Japanese-to-Korean whitelist. Push titles use the
stable topic key rather than matching mutable display text. Unknown or null
values return unchanged.

Object returns are replaced rather than preceded by injected instructions. This
ensures existing DEX branch targets cannot jump directly to the original
`return-object` and bypass translation.

## Reviewed mappings

### Ranking

| Source | Display |
|---|---|
| `歌ってみた` | `불러보았다` |
| `音楽` | `음악` |
| `ニコニコインディーズ` | `니코니코 인디즈` |
| `演奏してみた` | `연주해 보았다` |
| `音楽・サウンド` | `음악·사운드` |
| `東方` | `동방` |
| `ラジオ` | `라디오` |

`VOCALOID` and `ASMR` are preserved. `トレンド` is provided by the static
Korean resource overlay as `트렌드`.

### Push topics

| Stable topic | Display |
|---|---|
| `vocacolle_info` | `운영팀 공지` |
| `vocacolle_feature` | `보카코레 기능과 팁` |
| `vocacolle_recommend` | `추천 작품` |

## Validation

The final bundle was checked with:

```shell
./gradlew :extensions:extension:testDebugUnitTest :patches:test buildAndroid
```

The patched base APK was rebuilt and signed successfully, then installed with
its required VocaColle language, density, and ABI splits in one package-manager
transaction. Android returned `Success`.

Runtime checks confirmed:

- the home screen starts normally;
- all ten ranking tabs render without Japanese navigation labels;
- the push settings screen renders the three reviewed Korean topic titles;
- the premium-membership screen opens normally;
- no application crash or Android runtime exception occurs on these paths.
