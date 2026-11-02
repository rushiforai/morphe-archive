# Waze privacy follow-up

User requirements: audit missed cookies/consent, advertising and tracking in 5.26.90.901; answer ad-personalization and privacy-consent prompts without displaying them. Publish on dev as a prerelease, preserving navigation and authentication.

- [x] Add version-specific Skip consent screens. Reuse Waze acceptance/completion handlers for GDPR/terms states and native privacy bumps; choose the non-personalized response for advertising. Answer current-policy-ID requirements at their shared decision point before either phone or car UI is requested.
- [x] Close Hide ads gaps: sponsored search, trustless ad tokens/cookies, promotional menu chip, and native ad rendering ingress.
- [x] Close Remove telemetry gaps: advertising identifier fetch/attribution opt-in fallback and persisted stats transport. Do not disable authentication/AppCheck, push tokens, routing or live traffic.
- [x] Regression-test acceptance callbacks and transport completion, rebuild and apply the full catalog and isolated controls, validate on the dedicated emulator.
- [x] Record static evidence and runtime limits, review, merge on dev and verify the new signed prerelease artifact.
