# Patch — Login with token

> Part of the [Monument Morphe patches](../../../../../../../../../README.md) bundle.

Adds a third row, **Login with token**, to the setup bottom sheet
("More Options / Monument 1", alongside *Factory Reset* and *Use with Monument 1*).
Tapping it shows a dialog with four fields and OK / Cancel:

- **Device serial** — the device serial
- **Client ID** (clid) — defaults to `1`
- **Access token** — the raw `Client.secretkey` **hex** from the device DB (auto-lowercased)
- **Device IP address** — *optional*; leave blank to auto-discover on the LAN

On **OK** it writes the preferences that mark setup/login as completed, then relaunches the app.
It never contacts the cloud API. Every client API call is then authenticated with
`clid` + `Authorization = SHA-256(secretKey)` and the `X-Monument-Serial` header.

Source: [`Fingerprints.kt`](Fingerprints.kt), [`LoginWithTokenPatch.kt`](LoginWithTokenPatch.kt),
extension [`LoginWithTokenPatch.java`](../../../../../../../../../extensions/monument-login/src/main/java/app/morphe/extension/monument/LoginWithTokenPatch.java).

## How it works

- **Fingerprint** — `CloudConnectOptionsDialog.onViewCreated(View, Bundle)`. In 4.3.5 the class
  name is kept but method names are obfuscated by R8 (`onViewCreated` → `q8`), so the fingerprint
  matches by defining class + `(View, Bundle): void` signature, **not** by name.
- **Injection** — one `invoke-static { p1 }` at the top of that method hands the bottom sheet's
  root `LinearLayout` to the extension, which appends the row and shows the dialog.
- **Storage** — the app's `SharedPrefsHelper` is obfuscated (`l5.e`) with mangled method names, so
  the extension does **not** use it. Instead it writes through stable contracts only:
  - Multi-process prefs via the app's exported `MultiProvider` ContentProvider
    (authority `com.getmonument.android.utils.multi_preferences.MultiProvider`,
    `content://<authority>/<type>/monument.multiprocess_preferences/<key>`).
  - The single normal-pref key `service.type` via `getSharedPreferences("monument.preferences")`.
- **Restart** — relaunches the launcher (Splash) with `NEW_TASK | CLEAR_TASK`, keeping the process
  alive so the pref writes flush. The app's config manager reads these values live (it does not
  cache them before setup completes), Splash routes to the main screen, and the device is reached.

## Preferences written

| Key | Store | Value | Why |
|-----|-------|-------|-----|
| `monument.key.setup_completed` | multi | `true` | Splash routes straight to MainActivity |
| `monument.key.serial_number` | multi | serial | `X-Monument-Serial` header + LAN discovery |
| `monument.key.client_id` | multi | clid | `clid` header |
| `monument.key.secret_key` | multi | token (hex) | Hashed to the `Authorization` header |
| `device.version` | multi | `2` | M2 → API v2, no `mduid:1`, M2 discovery prefix |
| `monument.key.firmware_version` | multi | `999999` | > M2 min build (6065): skips the firmware-update screen, enables the secure connection path (overwritten by the app on connect) |
| `monument.key.monument_api_spec_version` | multi | `12` | Enables spec-gated features (refreshed from device) |
| `service.type` | normal | `device` | Local device (not cloud) |
| `monument.key.local_address` | multi | IP | *Only if the IP field is filled* — direct connect address |
| `monument.key.current_client_address_type` | multi | `monument.key.local_address` | *Only if the IP field is filled* — points the app at the local address |

The multi-process store is cleared first so no stale login/cloud state remains.

## The optional Device IP field

- **Blank** → the device is discovered on the LAN by its serial (mDNS). This is the normal path
  when the phone and device are on the same network.
- **Filled** (e.g. `192.168.0.126`) → the app connects directly to that IP first
  (`MonumentConnectionManager` tries `getMonumentLocalAddress()`), falling back to LAN scan if it
  doesn't answer. Enter just the host — the app adds the scheme/port itself (secure `:8201`).

  Use this when discovery is flaky or the device is on a different subnet reachable by IP.

## Getting the login values (from the device database)

The login values live in the device's SQLite database. Root access is **not** required: remove
the device's SSD, connect it to a computer, mount it, and open the SQLite database file directly.
From there you can read an existing client's credentials, or create a new user + auth token to use
with the patched app.

Query for a client whose **user is active** and use the token from the **same row** (lower-case
hex):

```bash
sqlite3 /path/to/mounted/ssd/.../m.sqlite3 \
  "SELECT C.id AS clid, lower(hex(C.secretkey)) AS token, U.status, U.name, U.email
   FROM Client C JOIN User U ON U.id = C.user_id
   WHERE U.status = 'active'
   ORDER BY C.id;"
```

- `clid` — the client id of the account owner you want to log in as.
- `token` — that row's `lower(hex(secretkey))` (40 hex chars). The app hashes it into the
  `Authorization` header, so paste the raw key, **not** the 64-char final hash.
- If no suitable active user exists, create one (a `User` row with `status = 'active'` and a
  matching `Client` row with a `secretkey`); its `clid` + `lower(hex(secretkey))` then work as the
  login values above.

> Picking clids by "first/last id" fails: many clients belong to deleted/invited users, which the
> device rejects with `INVALID_CLIENT` ("This user account is no longer available"). The
> `WHERE U.status = 'active'` filter avoids that. SQLite's `hex()` is upper-case while the device
> expects lower-case — the query lower-cases it, and the patch also lower-cases the field, so
> either way it matches.

## Logging in

1. Open the app → on the email screen tap **More Options / Monument 1** → **Login with token**.
2. Enter **Device serial**, **Client ID**, **Access token** (from the query above), and optionally
   the **Device IP address**.
3. Tap **Ok**. The app relaunches to the main screen and connects to the device.

If you see *"This user account is no longer available"* → the clid's user isn't active, or the
token/serial is wrong. Re-check with the query above (active user, matching row, correct serial).
