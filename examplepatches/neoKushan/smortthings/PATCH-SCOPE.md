# Morphe patch — "LocalThings key in the Information screen"

Target: `com.samsung.android.oneconnect` (SmartThings / OneConnect) **1.8.54.23** (latest) /
**1.8.52.23**; other builds patchable as experimental.
Goal: during normal device pairing/registration, capture the device's **OwnerPSK** (the
LocalThings credential) and **surface it as a row in that device's Information screen**, only
when available. No root; the patch runs inside the app, re-signed, installed on a stock phone.

## Why this is viable (established by prior recon)
- No commercial RASP (Promon/DexGuard) — earlier "SHIELD/tamper" hits were false positives
  (Apache `CloseShield`, the plugin platform verifying *downloaded* plugins).
- No app-self anti-repackaging kill-switch found. The onboarding `getAppSignatureSHA256` /
  `ReturnTargetValidator` validates a **third-party return-target app** (`com.jd.iots` against a
  hardcoded partner hash), not OneConnect's own signature.
- Root detection is irrelevant (fires only on rooted devices; we run on stock).
- Cloud does not gate onboarding on app attestation — proven by DumbThings (an unsigned custom
  app) completing account auth + device registration (`nexo/auth/jwt`, ES_COMPLETE).

## Architecture (three parts)
1. **Store** — our own `SharedPreferences` (e.g. `dt_keys`), mapping `di -> {identity, pskHex}`.
2. **Capture** — decrypt the OCF credential store in-app, parse the `credtype:1` records, save
   each `{subjectuuid(di) -> rowneruuid(identity) + privatedata(16B key, hex)}`. Triggered at
   pairing/registration completion (and opportunistically when the Information screen opens).
3. **Display** — in the device Information screen, if we hold a key for that device's `di`, append
   "LocalThings Owner PSK" (+ "Identity") rows; otherwise show nothing. **Tapping a value copies
   just that value to the clipboard and shows a confirmation toast** (e.g. "Owner PSK copied").

## Confirmed anchors (1.8.52.23)
- **Decrypt primitive — LOCATED.** `com.samsung.android.oneconnect.base.security.CryptoManager`
  - `String a(String)` = `decryptString`: strips a 4-char version prefix, base64-decodes, then
    `AES/GCM/NoPadding` (12-byte nonce) or legacy `AES/CBC/PKCS7Padding` (16-byte IV), using the
    keystore-backed `SecretKey b`/`c`. We instantiate/obtain a `CryptoManager` and call `a(...)`.
- **Credential store — RECIPE FULLY SPECIFIED; Java chain verified on 1.8.52.23.** (via KRZ303's
  public scripts, cross-checked against our decompile.)
  1. **Unwrap key (in-app, confirmed on .23):** `comp = sk.b.a(ctx)` → it's the Dagger component
     `f4`; `cm = f4.X()` returns `base.security.CryptoManager` (field `b` = the loaded keystore
     key `com.samsung.android.oneconnect_new_key`). `wrapped = prefs("iotivityKey").getString("iotivityKey")`
     (starts `:v1:`). `key = Base64.decode( cm.a(wrapped) )` → **32-byte AES-256 storage key**.
     (`cm.a` `:v1:` branch = AES/GCM/NoPadding, 12-byte IV, keystore key `b` — unchanged in .23.)
     In an in-app extension we can skip the cast and just borrow `CryptoManager` from the graph.
  2. **Store file = `files/<ACCOUNT_STORE_UUID>.datenc`** (account-specific), NOT
     `oic_svr_db_client.dat` (that Core store holds **certs only**). Enumerate `files/*.datenc`.
  3. **Decrypt (native layout, reimplement in Java):**
     `file = IV(16) | AES-256-CBC ciphertext | HMAC-SHA256(32)`. **One 32-byte key for BOTH**
     the AES key and the HMAC key. Verify `HMAC-SHA256(key, ciphertext) == mac` (ct only). Then
     `plain = AES-256-CBC(key, iv, ct)` with **no PKCS7**; real length =
     `len(file) − 64 + (IV[15] & 0x0F)` (low nibble of last IV byte = tail trim).
  4. **CBOR:** `store = cbor(plain)`; `sec = store["cred"]` (may itself be a CBOR **bytestring** →
     decode again); `creds = sec["creds"]` (array). Pick `c` with `c["credtype"]==1` and
     `c["subjectuuid"]==device di`. `psk = base64(c["privatedata"]["data"])` → 16 (live) or 32
     bytes → hex. **identity = `sec["rowneruuid"]`** (the cred *resource* owner UUID — NOT the
     per-cred field, NOT `doxm.devowneruuid`, which was zero here).
  - **Only unverified piece:** the native `.datenc` cipher layout (step 3) was RE'd from
     `liboctbstack.so` arm64 on 1.8.51.30; re-confirm it's unchanged in 1.8.52.23's native lib.
     Everything in steps 1/2/4 is confirmed for .23.
- **Information screen — IS A WEBVIEW PLUGIN, not native.** Important correction: the real
  "Settings → device → Information" page (MAC/IP/Serial/Firmware/Model) is rendered by a
  **downloaded WebView device plugin** (`webplugin.WebPluginActivity`, launched via
  `CloudDeviceCardPluginHelper.launchCloudDevicePlugin`), **not** by the base APK. The
  `device_information`/`mac_address`/`serial_number` hits were red herrings (an `@id`, JSON keys,
  Room columns, and a hidden debug screen). So there is **no native row list to append to**.
  - Native screens that DO exist: `editdevice.view.EditDeviceActivity` (name/room/ownership; holds
    the **cloud** deviceId, not the OCF `di`), and a hidden debug `DeviceInformationView`.
  - **Identity gap:** base UI keys devices by **cloud deviceId** (`ID.CloudDevice`); the OwnerPSK
    store is keyed by **OCF `di`** (`cred.subjectuuid`). A `cloudDeviceId → di` mapping is needed
    (the OCF `di` lives in the scclient/OCF layer + the companion provisioning `.db`).

## Open RE items (next deep-dives, in priority order)
1. **Confirm the native `.datenc` cipher on 1.8.52.23.** Steps 1/2/4 above are verified; only the
   AES-256-CBC+HMAC layout + `IV[15]&0x0F` length trailer (step 3) needs re-checking against this
   build's `liboctbstack.so` (arm64). Cheapest check: decrypt a real `.datenc` with the recipe and
   confirm valid CBOR + a `credtype:1` record. *(Fallback if it diverges: call the native
   `psiDecrypt` via JNI instead of reimplementing.)*
2. **Display surface — DECIDED: (B) native `EditDeviceActivity`.** Add a "LocalThings Owner PSK"
   section (Owner PSK + Identity rows, tap-to-copy + toast) to
   `com.samsung.android.oneconnect.editdevice.view.EditDeviceActivity`. Fingerprint `onCreate`
   anchored on `R.id.ownership_transfer` + `EditDeviceViewModel`. (A WebView / C dedicated-surface
   rejected: the Information screen is an un-modifiable plugin; the native Edit screen is reliable
   and reached the same way.)
3. **`cloudDeviceId → OCF di` mapping.** `EditDeviceActivity` holds the **cloud** deviceId
   (`EditDeviceViewModel.D0().a.getDeviceId()` → `ID.CloudDevice`); the PSK store is keyed by OCF
   `di`. Capture the `{cloudDeviceId → di}` pair at pairing (both are in hand then) and store it;
   the Edit screen then resolves `di` from its cloud id. *(Fallback: match on device name/label.)*
4. **Capture trigger.** A pairing/registration-complete callback in the `scclient`/onboarding
   layer — captures both the credential (`DtHarvest`) and the `{cloudDeviceId → di}` map. Fallback:
   harvest opportunistically when `EditDeviceActivity` opens.

## Patch shape (Morphe / ReVanced-style)
- **Fingerprints** (Kotlin, in `patches/`):
  - `EditDeviceFingerprint` — `EditDeviceActivity.onCreate`, anchored on `R.id.ownership_transfer`
    + `EditDeviceViewModel`; injection point to add our section and read the cloud deviceId.
  - `PairingCompleteFingerprint` — the `scclient`/onboarding completion callback; injection point
    to run capture + record `{cloudDeviceId → di}`.
- **Extension** (compiled dex injected into the app):
  - `DtStore` — SharedPreferences: `di → {identity, pskHex}` and `cloudDeviceId → di`.
  - `DtHarvest.run(Context)` — unwrap key via `CryptoManager`, read `files/*.datenc`,
    AES-256-CBC+HMAC decrypt, CBOR-parse, store all `credtype:1` creds by `di`.
  - `DtEditRow.add(activity, cloudDeviceId)` — resolve `di` from `cloudDeviceId`; if a key exists,
    add "Owner PSK" + "Identity" rows into the EditDevice layout; each row's click copies only its
    value via `ClipboardManager` + `Toast` ("<label> copied"); else add nothing.
- **Patch logic:** at `EditDeviceFingerprint`, call `DtHarvest.run` then `DtEditRow.add(this, cloudId)`;
  at `PairingCompleteFingerprint`, call `DtHarvest.run` and record the id map.

## Delivery model — Morphe patch, NOT a modified APK
We publish a **Morphe patch bundle (`.mpp`)**, never a patched APK. Users apply it themselves, to
their own legally-obtained OneConnect, via Morphe Manager (same posture as ReVanced). This keeps
us clear of redistributing Samsung's app.
- **Repo:** a new GitHub repo from `MorpheApp/morphe-patches-template` (Kotlin, GPL-3.0).
  `patches/src/main/kotlin/...` (fingerprints + patch), `extensions/extension/src/main/java/...`
  (the injected `Dt*` code). Named so it does not imply authorship by the Morphe project.
- **Build:** `./gradlew buildAndroid` → `patches/build/libs/patches-*.mpp`.
- **Our own testing:** apply the `.mpp` to a OneConnect APK with **Morphe Desktop**, install the
  result on a phone, test. (We still do the end-to-end run; we just never *distribute* the APK.)
- **Release:** semantic-commit → `release.yml` builds + publishes the signed `.mpp`; sign releases
  (`generateSigningKey` → `MORPHE_SIGNING_KEY` secret) so Morphe Manager trusts updates. Users add
  the repo URL as a Morphe source.
- **Version targeting:** confirmed builds (**1.8.54.23**, **1.8.52.23**) are advertised as
  recommended targets; an experimental `version = null` catch-all also allows patching any other
  build so new releases can be tested. Fingerprints fail cleanly (patch not applied) on versions
  where they don't match, rather than mis-patch.

## Defensive requirements (we can ONLY test on the HW-Q950A soundbar)
Everything else is untested hardware, so the extension MUST degrade safely, never crash the host
app, and only ever *show* a key it has validated. Guards:
- **Never throw into the host.** Wrap all `Dt*` logic in try/catch; any failure → log + no row
  (the Edit screen must look exactly like stock on failure).
- **Harvest guards:** CryptoManager/`b` key not loaded; `iotivityKey` pref missing or not `:v1:`;
  no `*.datenc` file; HMAC mismatch; AES/length math off; CBOR not a map / `cred` nested-bytestring
  vs inline / `creds` missing or empty; no `credtype==1`; **multiple** `credtype==1` creds;
  `privatedata.encoding` != base64; PSK length not in {16,32}; `rowneruuid` absent or all-zero.
  Each → skip that record, keep going.
- **Identity guards:** `cloudDeviceId → di` map missing (device paired before patch, or mapping
  not captured) → fall back to: single-credential case shows it; otherwise show nothing rather
  than guess. Never show a key for the wrong device.
- **Validation before display:** only add the row if we have exactly one confident `di` match with
  a well-formed key. Prefer showing nothing over showing a wrong/garbage value.
- **UI guards:** `EditDeviceActivity` layout may differ by device/firmware — locate the insert
  anchor defensively (null-check the view/viewgroup; if absent, skip). No fixed row indices.
- **Idempotency:** adding the section twice (re-entry/rotation) must not duplicate rows.
- **Soundbar is a valid test:** pairing the Q950A via the patched app creates its `credtype:1`
  OwnerPSK in the store, which the patch extracts — so the full flow is testable on it. What we
  can't test (hence the guards): other classes' store shapes, multi-cred stores, Edit-screen
  variants.

## Build plan (order of work)
1. **Verify native `.datenc` cipher on 1.8.52.23 — DONE (static).** `liboctbstack.so` confirms
   `psiDecrypt` uses `mbedtls_aes_setkey_dec` (AES) + `mbedtls_md_hmac` (HMAC-SHA256) with error
   `"HMAC check failed: wrong key, or file corrupted."` (MAC-verify-then-decrypt), and **no
   `mbedtls_gcm`** → CBC. Matches KRZ303's `IV(16)|AES-256-CBC|HMAC-SHA256(32)`. Remaining: confirm
   256-bit keysize + `IV[15]&0x0F` length end-to-end by decrypting a real `.datenc` at test time.
2. **Write the extension** (`DtStore`/`DtHarvest`/`DtEditRow`) with all guards above; unit-test
   `DtHarvest` off-device against a captured `.datenc` + `iotivityKey`.
3. **Scaffold the Morphe repo** from the template; write the two fingerprints + patch.
4. **`buildAndroid` → `.mpp`; apply via Morphe Desktop; install on a stock non-rooted phone.**
5. **Runtime go/no-go:** log in + pair the soundbar against the live cloud; confirm the Edit
   screen shows a correct, LocalThings-valid Owner PSK (cross-check against DumbThings' value).

## Risks / unknowns
- Native `.datenc` cipher re-confirm on .23 (build-step 1) is the main remaining RE; rest is
  standard patching.
- Re-signed-app login uses the native Samsung-account SDK (DumbThings used web login). Expected to
  work (cloud is lenient — DumbThings registered a device as an unsigned app), but it's the one
  runtime confirmation.
- **Only one test device (soundbar).** Other device classes are unvalidated — mitigated by the
  defensive requirements above; mark the patch clearly as tested on HW-Q950A only.
- Legal/ToS: we distribute a **patch**, not an APK — keep this a **separate repo** from Dumbthings.
