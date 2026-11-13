# v2.0.1-dev.6 — restore tab opening with safe expanded caching

Fix regression introduced in dev.5. In MultiTabs227.Host.activate the v12 register is reused for two purposes: constructor reflection arrays of length 3, and later the number of retained tab fragments. Replacing the initial value with 8 changed the reflection arrays' length, producing the user-visible "Unable to open tab" failure.

This revision retains the original 3-argument reflection calls and sets the LRU limit to 8 only after those calls have completed, directly inside the eviction loop. The immediately visible list and single-jump restoration from dev.5 are preserved; there is no full-screen masking. It also preserves the prior NicoLive and notification fixes.

Regression tests assert both reflection array allocations remain based on 3, the cache size is assigned in the later loop, and versioned verification/source artifacts are produced.

Android device and actual tab switching require user-side validation; do not publish a stable release without approval.
