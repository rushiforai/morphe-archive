# Trouw and Volkskrant onboarding implementation

Design: [2026-10-28-trouw-volkskrant-onboarding-design.md](../specs/2026-10-28-trouw-volkskrant-onboarding-design.md).

1. Independently inspect both original decoded artifacts. Confirm the startup assignment, native completion method, persisted key, brand-dependent graph, notification preselection and storage defaults. Record only ABI, hashes and summaries in Git.
2. Execute original resolver/validation methods with a missing completion value. Require the fresh-Home assertion to fail because the real method emits Onboarding. Preserve baseline characterization for already completed launches and Google Play errors.
3. Extend each existing Skip consent screens execute block. In `MainViewModel$validateState$1.invokeSuspend(Object)Object`, replace its one `sget-object v4, MainViewState$Onboarding.INSTANCE` with `iget-object v4, p0, this$0`; `invoke-virtual {v4}, MainViewModel.onOnboardingComplete()Job`; `sget-object v4, MainViewState$Home.INSTANCE`. Require exact owner, signature, field, opcode, destination and cardinality; assert native completion is a public instance method. The original v4 assignment kills its old value, so no other live register is borrowed.
4. Verify emitted startup and native completion for missing/false/true completion, existing accounts, Android permission granted/denied, immediate/deferred job scheduling, unchanged preference/Room data, real persistence and native Unit/job contracts. Preserve native manual settings/category/permission functionality with positive execution and original method hashes. Audit call access/kinds and unchanged minSDK.
5. Run APK-free CI tests and the entire Python suite. Hand frozen Kotlin to the root agent for serialized build and the affected Skip/all selection matrices; retain the previous four unchanged controls' validation and inspect independently redecoded outputs and update the per-app audits. Do not install on devices, stage, commit or publish from this task.

Observed RED: both independently decoded originals pass baseline characterization, then fail with `MainViewState$Onboarding` for missing completion when Home is required. No production changes preceded this observation.


Completion evidence: both original behavior baselines and both original-RED
fresh-Home checks were observed. The original-node branch regression failed
before its anchor correction and passes with the production injection strings.
The 40-test suite and corrected capped Kotlin build pass. Root Desktop FULL,
signing and independent decoded verification pass for original/Skip/all in
both apps, including deferred native jobs and the real label 3 resume path.
The remaining four controls' product implementations are unchanged. New phone
acceptance remains pending; publication belongs to the root agent.

User acceptance: all changes from v1.7.0-dev.1 were approved for stable publication on 2026-10-28. Earlier pending-runtime notes describe pre-acceptance test evidence, without claiming exhaustive independent device/network coverage.
