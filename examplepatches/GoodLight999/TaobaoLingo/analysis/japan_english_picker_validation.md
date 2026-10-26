# Taobao 10.66.30: Japan/English official selector experiments

## Source discovery

The APK embeds `assets/boarding/data.json` (8,526 bytes) which lists **23 sites** and their allowable languages.

- `JP`: `zh_CN` only (default).
- `SG`: `en_US` (default) and `zh_CN`.
- `HK`: `en_US` and `zh_CN`.

Relevant original DEX models: `LocaleModel`, `LocaleModel.SiteLangModel`, `LocaleModel.LangModel`, `SelectLocaleActivity`.

The initial fallback locale selection is loaded by `LocaleModel.getDefault()` from `assets/boarding/data.json`. **A separate server path exists**: `EditionApi$1.onSuccess` parses `MtopResponse.getDataJsonObject()` into a new `LocaleModel`, stores it in `LocaleModel.reqData`, and passes it to onboarding. Thus editing the APK asset alone may not affect server-controlled menus.

## Two optional Morphe patches

1. **Show English in Japan locale picker (fallback)** (`RawResourcePatch`). It changes only the `JP` entry of bundled `assets/boarding/data.json` to include a non-default `en_US` / `English` item, leaving `zh_CN` as default.
2. **Enable English for Japan picker (experimental)** (`BytecodePatch`). This depends on #1 automatically, and additionally adds a non-default `en_US` `LangModel` to `LocaleModel.reqData.currentCountryInfo.langs` after the server response is parsed, **only when site equals JP**, and **only when no English item already exists**. Other sites remain untouched.

Neither patch automatically selects English, changes the shopping region, fakes the protocol locale or translates product data. The server's acceptance of `JP + en_US` remains unknown.

## Independent offline verification

### Fallback-only APK

Morphe Desktop 1.18.1 `RawResourcePatch` built, rebuilt and signed an APK.

- All **13 original DEX files byte-for-byte unchanged**.
- Only content change outside APK signatures: `assets/boarding/data.json`.
- `JP` languages: `zh_CN` default = true, `en_US` default = false.
- Other 22 sites, `currentCountryInfo` and `promoteText` unchanged.
- ZIP integrity and APK signature schemes v1/v2/v3 verified.

Candidate SHA-256: `94ebaba084d1d8dd9e1aeaf1e0b7e59513814858b7082ade9e9125a116d299e9`.

### Fallback + server-model APK

Morphe Desktop 1.18.1 with `STRIP_SAFE`, combined dependency executed, reassembled and signed.

- Exactly **1 method of 595,518** has an altered instruction sequence: `EditionApi$1.onSuccess(int,MtopResponse,BaseOutDo,Object)`.
- 32 instructions inserted **after** the assignment to `LocaleModel.reqData` and before the original current-country check.
- Original prefix and suffix instructions, register count and try-block count retained.
- All other 595,517 method instruction sequences unchanged.
- Only one non-DEX content change outside APK signatures: `assets/boarding/data.json`, same `JP` delta as above.
- ZIP integrity and APK signature v2/v3 verified.

Candidate SHA-256: `00c7b59c38ba8583bb49924bf31d362578d7f51805f5099caaec03b549867be9`.

## Limitations

These are **offline implementation checks**, not confirmed live behavior. They cannot prove that the picker will appear in Japan, Taobao accepts English with the Japanese site, or a re-signed app can log in. A root-mount install may preserve original signing identity but requires root.

The English string-resource patch can be selected independently; it changes two resource lookups and does not depend on these JP locale-picker experiments.

The Taobao APK, modified APK binaries, and proprietary assets are **not committed to GitHub**.
