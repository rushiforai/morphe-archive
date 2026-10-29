# Buienalarm runtime compatibility and consent prompts

The Play Store 4.32.0 (3723) baseline works on the USB phone. Its three DEX files and weather defaults are identical to the original supplied APK, but its signer is different. The patched phone logged Firebase HTTP403 `API_KEY_ANDROID_APP_BLOCKED` and DNS failure for the retired CDN present in bundled defaults. Treat app signing and configuration as the primary failure; do not replace weather endpoints or weaken TLS as a speculative fix.

- [x] Extract Play Store base plus ARM64 and density splits, verify signatures and compare bytecode/resources. Preserve files locally outside Git.
- [x] Stop the HTTP Toolkit VPN at the user's request. No usable decrypted capture exists; system-only trust explains user-CA rejection and does not establish pinning.
- [x] Trace bundled Firebase certificate reads and onboarding/consent callers using smali. REA's Android provider is unavailable because its required caller-supplied JADX MCP JAR is not configured; label CLI evidence accurately.
- [x] Add the verified Play Store certificate to compatibility and test the unmerged extracted APK set.
- [x] Add a Google-service signature compatibility patch based on the existing GPLv3 Morphe wrapper. Preserve other packages' metadata and the source certificate; do not alter server validation or TLS policy. Make it a dependency of the feature patches.
- [ ] Add separate tracking suppression and consent-screen patches. Route the cookie step to Ready only with tracking disabled; preserve manual Privacy settings and stored consent. Do not auto accept or reject consent.
- [ ] Verify source-certificate metadata, wrapper call coverage, unchanged weather/TLS resources, selection independence and runtime onboarding behavior.
- [ ] Validate Graph/Radar on the physical phone before calling the runtime regression fixed. Dynamic Maps code is outside static call rewriting and remains an explicit test requirement.
- [ ] Review changes, update README/About/findings and publish through the existing workflow only after verification. Preserve the working Play Store installation until a concrete test build is ready.
