# Phone testing before stable releases

The combined collection has **not** passed a full physical-device test yet.
Compilation and static inspection do not establish phone behavior.

Record the app version, phone/Android version, options, launch/login result,
patched feature checks, and update-over-existing-install result for each app.
Test Music League intro and Spotify connection, Zoom Earth popups, PushPress
workout selection, Wongnai photos and ads, Walmart shopping-list features,
and XAPK merge/install.

1. Test the dev release on the phone and record results here.
2. Merge the tested dev branch into main without squashing release history.
3. Run `python3 scripts/check_phone_testing.py --digest`.
4. Create `docs/phone-test-approval.json` containing that `source_sha256`,
   `result: "passed"`, `tester`, and an ISO `tested_at` timestamp. Commit on main.
5. Run **Actions → Release → Run workflow**, select main, and tick phone_tested.

Stable publication is blocked if approval is missing, failed, or does not match
current patch/extension sources. Never record a passing phone test from compilation.
