# AD guest-first onboarding

The user requested this behavior on 2026-10-28 after testing AD 9.22.0: skip the automatic DPG login and the long topic-notification list; retain city selection and its optional notifications; request OS notification access only after explicit user opt-in.

## Behavior

- Extend the existing default-enabled `Skip consent screens` control. Keep the other four controls independent and retain exact AD package/version/code/minSDK/signers.
- Fresh users proceed through the normal guest path. Preserve genuine saved accounts and explicit manual login; do not create account, purchase or permission state.
- Skip topic onboarding before its fragment is inflated. The original fragment persists preselected categories on lifecycle exit, so displaying it and automatically pressing Continue is insufficient.
- Initialize missing `USER_CHANNELS` to an explicit empty set through the actual encrypted `Ljaf` preferences/editor path. Preserve every existing saved set. Do not invoke the network subscription writer to initialize preferences.
- Retain city selection and the chosen-city follow-up. Both notification and newsletter toggles initially remain off, including when the OS already grants notifications. Resume refreshes the permission explanation without replacing the user's toggle selection.
- Preserve explicit toggles, Continue, permission-result callbacks, region subscription and manual settings flows. Never request/grant notification permission automatically, revoke existing OS permission or clear app data.
- Preserve saved onboarding progress, completion, pending article/deep-link extras and the completed-user MainActivity route. Complete onboarding through the existing city flow, not an early global completion flag.

## Approach

Use targeted changes in the existing onboarding router and native UI-state factory. Retain the original router's completion/resume/deep-link branches and both activities' super/Hilt initialization. Bypassing all onboarding would remove the requested city choice; changing generic login/permission services would affect manual actions. These are excluded by the requested behavior.

The implementation choice is to keep the existing named control rather than add another default checkbox. Default selections therefore deliver the requested behavior without changing the catalog's patch count.

## Evidence and delivery

New regressions must fail on the current startup flow before implementation. Verify actual emitted routing, preference writes, lifecycle exit before topic inflation, region defaults/resume and manual opt-in behavior. Compare independently pinned original methods and control-flow graphs after removing only the targeted changes; parse switch payloads correctly. Retain existing article, ads, tracking and input-guard checks.

No emulator, destructive device changes or automatic permission changes. Build and validate each affected selection and the combined output, obtain independent review, then publish an authorized `dev` fix release. Screenshots establish the existing phone issue; off-device checks do not establish phone acceptance of the fix.
