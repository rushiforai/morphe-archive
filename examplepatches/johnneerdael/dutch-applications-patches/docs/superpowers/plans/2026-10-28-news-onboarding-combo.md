# Combined news onboarding prerelease

User scope on 2026-10-28: one dev release containing Trouw and Volkskrant guest/notification skips (including the Volkskrant welcome slide), plus NU.nl notification/login-offer skips that retain topic selection. Preserve saved accounts/choices and manual settings; fresh notification choices remain off. AD/NRC's separately approved stable v1.6.0 publication is complete.

- [x] Observe original behavior and native completion/dismissal contracts before production changes.
- [x] Verify Trouw and Volkskrant consent-only and combined APKs, persistence, fresh defaults, resumed startup and manual positive paths.
- [x] Verify NU.nl automatic dismissal after required acknowledgements, queue persistence, resume/stale/duplicate completion, topic retention and manual positive paths.
- [x] Complete independent review, full Python suite and actual-SDK original-input guards, then commit all three changes together on dev.
- [x] Verify the single automatic prerelease and its published metadata/bundle; the user approved this behavior for stable promotion on 2026-10-28.

Published one combined [v1.7.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.7.0-dev.1) from source commit 618fd6b; release commit 6a45632 was synced. Release workflow 40631006054 succeeded. Actual asset SHA256: 0195858e4ac500c9fa26217b450fc983d661e2b9da934c0ffb5cca51fb4ba171. The downloaded bundle contains Android DEX for all three patches and the source-bound NU policy. Its 52-control catalog exactly matches reviewed source defaults/compatibility; all 351 published-bundle guard assertions pass. All three original/consent/all APK matrices and independent review passed, with 40 Python tests. No additional prerelease was created for this documentation; the user approved the new onboarding behavior for stable publication on 2026-10-28.
