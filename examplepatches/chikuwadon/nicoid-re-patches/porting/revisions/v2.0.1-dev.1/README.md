# v2.0.1-dev.1 — local playlist gesture fix

Development-only candidate using the approved v2.0.0 source and fixed v1.11.1 reconstruction base. No published release files are modified.

- Recognize gestures in the folder catalog (ScrollView) and video list (ListView)
- Route input through the visible playlist page instead of the first ListView in the entire Activity
- Preserve normal scrolling, long presses, selection and drag reordering
- Respect gesture assignments, axis recognition, sensitivity and optional tracing
- Keep the current scroll offset on unassigned and cancelled gesture input
- Verify source contracts, Java compilation, MPP integrity and existing regression checks in CI
- Original-APK application and Android runtime remain to be tested on a device
