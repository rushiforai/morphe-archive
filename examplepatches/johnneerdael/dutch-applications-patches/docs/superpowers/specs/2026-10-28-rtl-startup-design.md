# RTL Nieuws startup follow-up

RTL Nieuws 12.7.1 (1558) still shows PrivacyGate and notification onboarding on first start. The user approved the remaining behavior. Extend the existing default-on Skip consent screens control to suppress both automatic routes before their UI opens. Preserve manual privacy and notification settings, real stored choices, functional readiness, errors and unrelated coroutine cases. Fresh installs must not subscribe to notification channels or request notification permission. Existing manual opt-ins survive upgrades.

Use source-backed startup boundaries, with original APK/signer/version protections. Do not manufacture accepted consent, opt-in preferences, permissions or successful network responses. Keep the other two controls and every previously approved app unchanged. Publish an authorized dev follow-up for phone testing; stable promotion is outside this change. Local fixtures establish bytecode behavior, not device/network acceptance.
