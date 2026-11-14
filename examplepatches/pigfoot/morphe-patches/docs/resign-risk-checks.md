# Re-signing risk checks for a new app

A patched APK is signed with the user's key, so anything bound to the original
signing certificate can change behavior. Before delivering a candidate for an app
that uses these features, list the dependencies below and tell the user what can
and cannot be known offline. Do not claim they work from a build or APK diff.

| Dependency | How it can break after re-signing | What can be checked |
| --- | --- | --- |
| Firebase / FCM push | The Firebase API key may be restricted to the original package + certificate, so token registration is refused | Offline probe below for the Installations step; the Play-services token step and the app backend registration need the phone |
| Google sign-in | OAuth client is bound to the original SHA-1 | Phone only |
| Facebook login | Key hash of the original certificate | Phone only |
| Maps / other API keys | Key restricted to package + SHA-1 | Phone; key value can be supplied as an option when the app supports it |
| Payment / DRM / integrity SDKs | Signature or attestation checks | Phone only |

## Firebase API key signer probe (ask the user first)

Purpose: find out whether the app's Firebase key rejects a non-original certificate.
This is an **external request** (it creates test installations at Google), so ask
the user and proceed only after a clear yes.

1. Read `google_api_key`, `google_app_id` and `project_id` from the original APK
   resources. Never write the key into chat, memory, commits or logs.
2. Run [`scripts/firebase-signer-probe.py`](../scripts/firebase-signer-probe.py) with the
   original APK, package name and original signer SHA-1. It sends one Firebase
   Installations create request each with the original certificate (control), a random
   non-original certificate, and no Android headers.
3. Interpret: control must succeed. If the non-original case succeeds too, the key does
   not enforce a signer restriction for Installations. If it returns 403 "blocked",
   a re-signed build cannot register for push; evaluate a client-identity fix first.
4. Report the limits: this does not exercise Play-services token registration or the app
   backend registration. Ask the user to run the app's own notification check, or receive
   a real notification, on the patched build.
5. Disclose side effects: unbound installations remain if cleanup fails; they expire
   when unused. The cleanup call uses the refresh token per the REST reference and has not
   been verified against a live response yet.

First use: 智生活 (Kingnet) 4.20.8 — all three requests succeeded (HTTP 200), so the key did not
enforce a signer restriction for Installations.
