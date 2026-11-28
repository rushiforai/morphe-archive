# LocalThings Owner PSK — Morphe patch

Add this repo as a source in **Morphe Manager** — no sideloading:

<a href="https://morphe.software/add-source?github=neoKushan/smortthings">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Or add the URL manually in Morphe Manager: `https://github.com/neoKushan/smortthings`

A **[Morphe](https://morphe.software) patch** for the official Samsung **SmartThings / OneConnect**
Android app. It surfaces a device's **OwnerPSK** (the credential
[Home Assistant LocalThings](https://github.com/mbillow/localthings) needs for local control) on the
device's **Edit** screen, each value tap-to-copy. The key is extracted **on-device, reusing the
app's own key store** — nothing is sent anywhere, and no root is required.

> ⚠️ **This is not automatic for devices you already have.** The patch can only show a key that the
> app has *already stored locally*. SmartThings stores that local key when it onboards a device for
> local control — which most existing devices in your account have **not** done. In practice you
> will usually have to **remove a device and add it again through the patched app** before its key
> appears. A device that shows *"No local key for this device yet."* just means the app holds no
> local key for it — re-add it (see [step 5](#5-no-key-re-add-the-device)).

> **Proof of concept.** Developed and author-tested against **SmartThings 1.8.52.23** on a
> **Samsung HW-Q950A** soundbar. Community members have since reported it working on other classes —
> **HW-Q990C / HW-Q850A soundbars, a Samsung TV (S95B), and a Family Hub fridge (Tizen)** — but
> those are user reports, not author-verified. It may not work on every model, firmware, or app
> version. Provided as-is.

## What this is (and is not)

- It is a **patch**, distributed as a Morphe patch bundle (`.mpp`). You apply it yourself, with
  Morphe Manager, to your own copy of the SmartThings app. **No modified APK is distributed.**
- It is **not** a credential dumper you run with root, and it is **not** a cloud tool. It runs
  inside the app you already use, reads the key the app already holds for *your* device, and shows
  it to you.

## Install & use (step by step)

**You need:** an Android phone, the **Morphe Manager** app, and a **SmartThings** APK. The
**recommended** (confirmed-working) builds are **`1.8.54.23`** (latest) and **`1.8.52.23`** —
Manager suggests and can fetch these. Any other build can still be patched as **experimental**: the
patch fails closed, so it is safe to try a brand-new release and report whether it works.

### 1. Install Morphe Manager

Get the Morphe Manager app from **[morphe.software](https://morphe.software)** and install it
(you may need to allow "install unknown apps" for your browser/file manager).

### 2. Add this repo as a patch source

**Recommended — no sideloading:** tap **[Add to Morphe](https://morphe.software/add-source?github=neoKushan/smortthings)**
above, or in Morphe Manager open **Sources → Add** and paste
`https://github.com/neoKushan/smortthings`. Manager fetches the latest release itself and keeps it
updated. It appears as **"Smortthings Patches"** with one patch,
**"LocalThings Owner PSK in device settings"**.

*Alternative (offline):* download **`patches-*.mpp`** from [Releases](../../releases) and import the
file in Morphe Manager instead.

### 3. Patch SmartThings

1. In Manager, choose to patch an app and select **SmartThings** (`com.samsung.android.oneconnect`).
   Pick a **recommended** version (**`1.8.54.23`** or `1.8.52.23`) — Manager can download it — or, to
   try a newer release, allow the **experimental**/any-version target and patch the SmartThings you
   already have installed. Worst case on an unconfirmed build: the patch applies but shows no key.
2. Make sure the **"LocalThings Owner PSK…"** patch is ticked, then **Patch** and **Install**.
   - If a different-signed SmartThings is already installed, Manager will offer to reinstall it;
     your SmartThings login and paired devices are preserved across a same-source update.

> **On a Samsung phone? Enable _both_ of these** (on top of "LocalThings Owner PSK"). They're off by
> default and do nothing on non-Samsung phones, but a Galaxy needs both to get through install,
> login, and opening a device — because the app is re-signed and Samsung hard-checks the signature
> in several places:
> - **"Allow install on Samsung phones"** — fixes `INSTALL_FAILED_DUPLICATE_PERMISSION` by removing
>   the duplicate permission *declarations* Samsung's own system apps already own (the app still
>   *uses* them).
> - **"Use web login on Samsung phones"** — forces the web (`account.samsung.com`) login the
>   re-signed app can complete (the on-device Samsung Account rejects its signature), **and** skips a
>   Samsung Keyboard provider read that otherwise crashes the app when you open a device.
>
> Confirmed working end to end on a Galaxy **S23** and **S25+** (One UI / Android 17).

### 4. Read a device's Owner PSK

1. Open the **patched SmartThings**, make sure your device is **paired and shown**.
2. Tap the device → its **⋮ / Settings → Edit** screen.
3. Scroll to the **LocalThings** section:
   - **Owner PSK** — tap to copy. This is what LocalThings needs.
   - **Identity** — your account's owner UUID (same for all your devices); tap to copy.
4. In Home Assistant **[LocalThings](https://github.com/mbillow/localthings)**, add the device with
   its **IP address** and paste the **Owner PSK**.

### 5. No key? Re-add the device

If the LocalThings section shows *"No local key for this device yet."*, SmartThings has no local
key stored **on this phone** for that device — usually because the device was added to your account
without local onboarding, or onboarded from a *different* phone. To create one:

1. In SmartThings, **remove / delete the device** from your account
   (Devices → ⋮ → Device management → select → remove).
2. **Add it again from this same phone**, through the (patched) SmartThings app, letting it onboard
   normally. The key is written to the phone that does the onboarding, so it must be the phone you
   read it from.
3. Re-open the device's **Edit** screen — the **Owner PSK** should now be there.

A few things reported by other users:

- A **full factory reset is usually not needed** — removing the device from your account and
  re-adding it is enough (removal releases ownership; re-onboarding rewrites the key). Reset only if
  re-adding still produces no key.
- If re-adding **loops on "something went wrong" / registration errors**, add the device to a
  **new Location** — that has unblocked several people.

> **Why:** the patch only *reads* a key the app already holds; it cannot create one. Only devices
> **locally onboarded** (which stores an OCF `credtype:1` OwnerPSK) have a key to show. Devices that
> only support cloud control will never show one, even after re-adding.

## Patches

<!-- PATCHES_START -->
> **[v1.5.0](https://github.com/neoKushan/smortthings/releases/tag/v1.5.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**4 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**SmartThings**](PATCHES.md#smartthings-comsamsungandroidoneconnect) | 4 | `1.8.54.23`, `1.8.52.23` | [`com.samsung.android.oneconnect`](https://play.google.com/store/apps/details?id=com.samsung.android.oneconnect) |
<!-- PATCHES_END -->

## How it works

1. **Capture** — on the Edit screen, the extension unwraps the IoTivity storage key via the app's
   own `CryptoManager`, decrypts the OCF credential store (`files/*.datenc`:
   `IV(16) | AES-256-CBC | HMAC-SHA256(32)`, one key for both, custom length trailer), and parses
   the **indefinite-length** CBOR for `credtype == 1` OwnerPSK records.
2. **Store** — recovered `{di → identity, pskHex}` is kept in the extension's own private prefs,
   keyed by the OCF `di`.
3. **Display** — a "LocalThings Owner PSK" section (Owner PSK + Identity, tap-to-copy + toast) is
   appended to `EditDeviceActivity`. The device being edited is matched to its credential by
   equality of the SmartThings cloud `deviceId` and the OCF `di`; with no exact match, nothing is
   shown (a device never borrows another device's key).

See [`PATCH-SCOPE.md`](PATCH-SCOPE.md) for the full reverse-engineering notes and the confirmed
extraction chain.

## Layout

```
extensions/extension/src/main/java/biz/kushan/ltkey/   the injected code
  DtCbor.java         minimal CBOR decoder (dependency-free)
  DtStoreCrypto.java  AES-256-CBC + HMAC-SHA256 store decrypt (matches native psiDecrypt)
  DtCredParser.java   CBOR → OwnerPSK records, heavily guarded
  DtCred.java         data holder
  DtHarvest.java      orchestrates unwrap + decrypt + parse + store
  DtDi.java           resolves the app's CryptoManager (version-pinned reflection)
  DtStore.java        our private SharedPreferences
  DtEditRow.java      appends the section to EditDeviceActivity
  DtEntry.java        single entry point the patch calls
  DtLog.java          logging
patches/src/main/kotlin/biz/kushan/ltkey/patches/      the Morphe patch
  Fingerprints.kt     EditDeviceActivity.onCreate
  EditDevicePatch.kt  injects one static call into onCreate
test/DtSelfTest.java  standalone JDK self-test for the extraction core (no device needed)
```

## Extraction core is unit-tested off-device

The crypto + CBOR logic is Android-free and proven with synthetic vectors before it ever runs in
the app:

```bash
JDK=/path/to/jdk17
"$JDK/bin/javac" -d out \
  extensions/extension/src/main/java/biz/kushan/ltkey/DtCbor.java \
  extensions/extension/src/main/java/biz/kushan/ltkey/DtCred.java \
  extensions/extension/src/main/java/biz/kushan/ltkey/DtStoreCrypto.java \
  extensions/extension/src/main/java/biz/kushan/ltkey/DtCredParser.java \
  test/DtSelfTest.java
"$JDK/bin/java" -cp out biz.kushan.ltkey.DtSelfTest
# 16 passed, 0 failed  (round-trip, nested + indefinite-length CBOR, 16/32-byte PSK, multi-cred, and every guard path)
```

## Building the patch bundle

This repo holds the patch + extension **sources**; the Morphe/Gradle wrapper comes from the
[`MorpheApp/morphe-patches-template`](https://github.com/MorpheApp/morphe-patches-template). To
build:

1. Create a repo from that template and drop these `patches/` and `extensions/` sources in
   (adjust the group in `patches/build.gradle.kts`).
2. `./gradlew buildAndroid` → `patches/build/libs/patches-*.mpp`.
3. Apply to a SmartThings 1.8.54.23 (or 1.8.52.23) APK with **Morphe Desktop** / Morphe Manager,
   install, open a paired device's **Edit** screen.

## Safety / design

- **Never throws into the host.** Every extension path is guarded; on any failure the Edit screen
  looks exactly like stock.
- **Only shows a key matched to the exact device** (cloud `deviceId` == OCF `di`) from an
  HMAC-verified store, well-formed CBOR, 16/32-byte PSK, non-zero identity. Prefers showing
  nothing over showing a wrong value.
- **Confirmed on 1.8.54.23 / 1.8.52.23** (recommended); other builds are patchable as experimental
  and fail closed — fingerprints that don't match skip their patch rather than mis-patch.
- Tested on one device only — the guards exist because other device classes are unvalidated.

## Thanks

The Samsung-phone support (install, web login, and the device-open crash fix) was worked out with
the on-device logcats and testing of **[@msburgess3200](https://github.com/msburgess3200)** and
**[@zoubek797](https://github.com/zoubek797)** — none of it would have been possible without them,
as the author has no Samsung hardware to test on. The broader credential-acquisition research lives
in the [mbillow/localthings](https://github.com/mbillow/localthings) community (issue #435).

## License

GPL-3.0 (as required for Morphe patches).
