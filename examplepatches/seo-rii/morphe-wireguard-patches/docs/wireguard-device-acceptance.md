# WireGuard proxy: YouTube / YouTube Music device acceptance checklist

**Status: NOT YET RUN. Every item below is a test to perform, not a result.**
Host builds, JVM/JNI tests and userspace WireGuard loopback tests do not establish
that YouTube/Music playback, Android Keystore or the patched Cronet callbacks work on a
real device. Leave items unchecked until evidence is recorded.

Use a test account and a controlled WireGuard peer when possible. Keep private
keys, imported profiles and proxy authorization headers out of screenshots,
packet-capture annotations, logs and issue reports. Prefer capture at a controlled
access point/router; an Android capture app using `VpnService` changes the network
setup being tested.

## 1. Record the exact installation

- [ ] **NOT YET RUN:** Record device model, Android/API level, security patch,
  YouTube or YouTube Music version/package, patch commit/bundle hash and native library hashes.
  Test the oldest supported target/device combination and a current Android
  version. The extension minimum is API 26; the selected APK may require
  a newer version.
- [ ] **NOT YET RUN:** Patch a complete, declared-compatible YouTube or YouTube Music APK with
  `WireGuard proxy (experimental)` and its app-specific `Network proxy` dependency.
  YouTube retains its 20.47.62 gate. Music declares 9.15.51, 9.20.53, 9.30.53 and
  experimental 9.42.52, 9.43.51, 9.44.52; these are metadata targets, not verified
  APK results. Test both sides of Music's 9.20 proxy API branch.
  Both apps require `arm64-v8a` or `x86_64` only.
  Use a normal APK installation, not root mounting. Confirm the installed process
  ABI matches the packaged `libmorphewireguard.so` and there is no JNI/load error.
- [ ] **NOT YET RUN:** Verify the settings Activity is not exported, no
  `VpnService` was added, no VPN approval dialog appears, and enabling the feature
  does not add a VPN entry/key icon. With routing disabled, confirm no native
  listener, WireGuard UDP traffic or background engine is started.

## 2. Import and secret storage

- [ ] **NOT YET RUN:** Import a supported UTF-8 `.conf` through the system document
  picker without broad storage permission. Test optional BOM/non-ASCII comments,
  cancellation, inaccessible files, malformed UTF-8 and the 64 KiB limit.
- [ ] **NOT YET RUN:** Confirm unsupported inputs are rejected without executing
  anything: shell hooks, multiple peers, hostname `Endpoint`, missing/out-of-route
  DNS and unsupported fields. The prototype deliberately requires a numeric
  endpoint and explicit numeric DNS; it must not silently substitute system DNS.
- [ ] **NOT YET RUN:** In a controlled debug build, verify that the saved file is
  encrypted in `noBackupFilesDir`, its key is in AndroidKeyStore, and profile
  contents never appear in preferences, Morphe export, backups or logs. Check
  atomic-write interruption, damaged ciphertext, unavailable key and reinstall/
  restore. None may cause plaintext storage or direct-network fallback.
- [ ] **NOT YET RUN:** Remove the profile and restart. Verify the encrypted copy
  and Keystore entry are removed, routing is disabled, and the source document
  selected in the picker is left untouched.

- [ ] **NOT YET RUN:** Compare the settings theme, toolbar, Back button and preference
  rows with the app's existing Morphe pages. Rotate during picker and background
  operations; cancel enable/remove confirmations and confirm the saved mode is unchanged.
- [ ] **NOT YET RUN:** Import profiles using `PersistentKeepalive = off` and bare
  numeric IPv4/IPv6 `Address`/`AllowedIPs`. Confirm bare routes remain single-host
  routes. Check distinct file-access, encoding/size, validation, native-loading,
  secure-save and stored-load diagnostics without profile values or URI/key leaks.
  Expected result: a rejected import leaves the previous encrypted profile intact
  and does not enable routing or start a tunnel.

## 3. Cronet proxy authentication and playback

- [ ] **NOT YET RUN:** Use test-only instrumentation that records callback counts
  and redacted header presence, never credentials. Verify Cronet's CONNECT
  callback supplies the per-process proxy credentials. An unauthenticated/wrong-
  credential client must receive HTTP **407** without upstream traffic; valid
  app requests must authenticate. Verify `Proxy-Authorization` is not forwarded
  to the origin server.
- [ ] **NOT YET RUN:** Exercise home/search, thumbnails, normal/long videos,
  Shorts, live playback, seeking, comments and extension requests. Confirm
  CONNECT/HTTPS and plain HTTP paths use the local proxy without TLS certificate
  bypass. Record startup delay, sustained playback and buffering separately.
- [ ] **NOT YET RUN:** For Music, exercise songs, albums/playlists, radio, seeking,
  background/screen-off playback, audio/video switching, lyrics providers,
  metadata lookup, pronunciation dictionary downloads and optional AI lyrics
  requests. Do not contact paid providers or send real API credentials merely
  for testing. The migrated extension connections must retain their HTTP method,
  headers, payload, timeout, redirect and error behavior through Requester.
- [ ] **NOT YET RUN:** Verify QUIC suppression with packet capture, not merely a
  setting or log: no direct app UDP/443 traffic should escape the intercepted
  paths. Outer WireGuard UDP to the configured peer is expected and is not QUIC.
  Check TCP-based media traffic at the controlled peer where possible.

## 4. Coverage, DNS and IPv6

- [ ] **NOT YET RUN:** Check IPv4-only, IPv6-only where supported, and dual-stack
  networks/profiles. Confirm `AllowedIPs` is enforced after DNS resolution and
  an out-of-route destination fails rather than connecting directly.
- [ ] **NOT YET RUN:** Capture target DNS resolution and verify the configured
  DNS server is reached through WireGuard. Distinguish unrelated device traffic
  from this process. Test DNS failure and IPv4/IPv6 fallback explicitly.
- [ ] **NOT YET RUN:** Inventory native/unhooked requests, WebViews, DNS prefetch,
  Cast/local-network traffic and requests performed by GmsCore or other packages.
  Record uncovered paths rather than treating one successful IP check as proof
  of full-app coverage. This patch is **not a system-wide VPN or kill switch**.

## 5. Failure and process lifecycle

- [ ] **NOT YET RUN:** Try a wrong peer key, unreachable endpoint, dropped tunnel
  packets and failed DNS. Intercepted requests must fail without direct fallback.
  The UI may say *local proxy ready* but must not claim a verified remote handshake.
- [ ] **NOT YET RUN:** Inject a native/profile startup error in a test build.
  Confirm the local rejection-only endpoint blocks requests while offline
  settings remain reachable. Verify proxy-option application failure does not
  silently create an unproxied Cronet engine.
- [ ] **NOT YET RUN:** Test profile replacement, enable/disable, restart, process
  death and launch from an external video link. Existing engines retain the old
  mode until restart; after restart all newly intercepted engines must use the
  saved mode and fresh proxy credentials. Remove the patch while retaining app
  data and verify its saved enable flag is inert.
- [ ] **NOT YET RUN:** Test Wi-Fi/cellular transitions, airplane mode, screen-off
  background playback, battery restrictions and process recreation. Record any
  required manual restart; do not infer always-on/background reliability from
  foreground playback alone.

## 6. Existing VPN interaction

- [ ] **NOT YET RUN:** Repeat representative tests with another system VPN off
  and on. This app-local feature should not take over the VPN slot, but its outer
  WireGuard UDP sockets may themselves travel through the existing VPN. Test
  blocked UDP, MTU issues, the existing VPN's lockdown mode and its reconnection;
  do not assume independent routing or protection if the outer VPN fails.

## 7. Running both apps

- [ ] **NOT YET RUN:** Import and enable separate provider-issued profiles in
  YouTube and Music, with distinct client private keys registered by the server.
  Their settings/profile files are app-local; importing in one app must not
  enable the other. Changing or removing one profile must not modify the other.
- [ ] **NOT YET RUN:** Run both apps concurrently with distinct profiles and check
  both paths. Do not reuse one client key at the same server concurrently: the
  server tracks a peer's latest authenticated UDP endpoint, so two independent
  app engines can compete for that peer endpoint. This is a protocol-derived
  risk, not an observed device-test result. See WireGuard's official
  [Built-in Roaming explanation](https://www.wireguard.com/#built-in-roaming).

For every executed item, retain the configuration category (no secrets), observed
behavior, pass/fail, device/build identifiers and redacted evidence. Unexecuted
items remain **NOT YET RUN**, including after a successful patch bundle build.
