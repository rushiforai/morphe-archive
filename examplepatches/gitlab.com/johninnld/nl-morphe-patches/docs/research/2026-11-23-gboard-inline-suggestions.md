# Gboard 18.8 inline autofill and Smart Compose

The clean upstream checkout at `../gboardwu`, commit `0e76cab3bb37b7034bab6ef7a08aef399f346287`, publishes two independent flag-family patches. This port exposes their existing implementations through the public registry; it does not change the shared flag hook or force other feature flags.

| Public patch here | Upstream public patch | Selected flag | Manifest marker suffix |
| --- | --- | --- | --- |
| Enable Inline Autofill Suggestions | Enable Inline Autofill Suggestions | `enable_device_intelligence` | `device_intelligence` |
| Smart Compose | Inline Suggestions | `enable_inline_suggestions_on_client_side` | `inline_suggestions` |

Both depend on the extension carrier and their own flag-family contribution and marker. Both default on, with independent Morphe selections, for the existing 18.8 arm64-v8a and armeabi-v7a targets. The runtime only promotes canonical Boolean.FALSE for its selected flag when that patch's marker is present. Other flags and non-Boolean values retain their original results.

## Exact target evidence

Input: `com.google.android.inputmethod.latin_18.8.0.1022711984-beta-arm64-v8a-176124766_7dpi_4feat_2a6c09e2a5a34372241f9aa5ceee9a12_apkmirror.com.apkm`.

The APKM's `base.apk` SHA-256 is `83c520047b18678310af822edb7010cc1974b1e21611fc138d3f01d06209ee27`. Its four DEX entries are byte-identical to the previously decompiled standalone 18.8 arm64 input (standalone APK SHA-256 `d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b`). This permits reuse of the existing decompiled source, while patch acceptance must use the supplied APKM's base itself.

- `mmc` declares `enable_device_intelligence=false`. Its module definition registers `mmb` and adds this flag as a module prerequisite (`agvv.k(a)`).
- `mmb.e(Context)` creates an Android `InlineSuggestionsRequest` and preserves Google's initialization, Google Play services and keyboard-mode prerequisites.
- `ihw.onCreateInlineSuggestionsRequest(Bundle)` delegates to the registered extension and retains the stock `disable_inline_suggestions` guard.
- `aemz.b` declares `enable_inline_suggestions_on_client_side=false`.
- `setting_correction.xml` hides the Smart Compose preference when that flag is false.
- `aemy.x()` consumes the flag in `InlineSuggestionCandidateViewController`; `aemy.g(EditorInfo)` also reads the stock Smart Compose preference and the app's `disableSmartCompose` request. These checks remain intact.

## User setup and limits

Inline autofill requires Android 11+, an enabled Android autofill provider and its inline display setting. A Vaultwarden user configures the Bitwarden client normally; this patch adds no server URL, credential handling or vault protocol. See [Bitwarden's Android autofill instructions](https://bitwarden.com/help/auto-fill-android/).

Smart Compose is predictive text, independent of password autofill. The client gate exposes the normal Text correction switch; it does not install a model or bypass Google's remaining eligibility. [Google's current instructions](https://support.google.com/gboard/answer/7068415?co=GENIE.Platform%3DAndroid&hl=en) describe English/US availability. Do not claim Dutch completions or password-manager runtime acceptance from a successful desktop patch/build.
