# Reolink notification registration implementation plan

**Goal:** Restore push notification registration in the re-signed Reolink 4.64.3.20261023 build 796, including the renamed copy.

**Design:** A notification-only bytecode patch restores the original package and signing-certificate SHA-1 in Firebase Installations' two HTTP headers. Android and Play services continue to see the real installed identity. Reolink's existing token callback, device registration, notification permissions, account checks and message handling remain authoritative.

**Approaches:** Prefer the two-header correction: a bounded standalone test obtained FCM tokens for both original identity and renamed/differently signed identity with corrected FIS headers. MicroG routing adds a dependency without resolving the in-app FIS restriction by itself. A stock-notification relay requires the stock app and cannot recover its camera-opening intent through public Notification access APIs. The owner delegated route selection; no physical device or publication is authorized by this plan.

**Files:** `patches/reolink/PushNotificationsPatch.kt` implements a guarded replacement; `PushNotificationsTest.kt` checks the real original DEX. The bilingual Reolink app pages describe the additional patch and current acceptance boundary.

- [x] Complete the patch and original-input regression together. Reject unexpected method/header/call shapes and double application.
- [ ] Run the canonical complete release verification on the latest GitLab main plus the accepted fix. The earlier review baseline passed history/node, Python, Android, Medium, generated catalogue, strict rendered documentation and link checks, but its app-page gate failed on unchanged HLN pages. Preserve that historical failure; use current authoritative source for publication.
- [x] Apply the built bundle to the exact supplied archive, verify the resulting DEX and retain immutable artifact hashes.
- [x] One bounded owned-emulator session proved native Firebase token acquisition with Frida coverage before stimuli and no forced callbacks. The renamed app used the corrected HTTP headers, called native `onNewToken` and stored its token. Owned emulator and tracing processes stopped before the deadline; no physical phone was used.
- [x] Owner confirmed push can be enabled on the phone and answered Yes to receiving a real camera notification. The owner explicitly accepted this evidence as sufficient and authorized commit/push/publication. Opening the correct camera was not separately measured; do not claim that observation.
- [x] Review build outputs, owned emulator, scratch and worktree removed after compact evidence/source archival. Preserve the primary checkout and other jobs; the subsequent release job retains its own mandatory cleanup gate.

The initial standalone registration probe deleted its Firebase installation (HTTP 200), but used `delete=true` rather than microG's actual `delete=1` serialization for unregister. Its registration cleanup is unverified; retain that limitation. No physical phone was used.
