# v1.10.3-dev.7 — development quality review

This development revision integrates the reviewed fixes from the v1.10.3-dev.6 audit branch.
The previously tested v1.10.3-dev.6 revision remains unchanged, and v1.10.2 stays the published release.

- Restore the existing cache validation path for packed archives when the fast listing index cannot establish completion.
- Release temporary listing state even when the loader exits exceptionally.
- Route new dialogs through the shared theme builder and display routine.
- Use weak references for profile gesture views, retain scroll position for assigned actions and leave unassigned/cancelled gestures undisturbed.
- Defer metadata requests for detached or hidden playlist rows.
- Add cache, gesture, audio, UI, source-to-MPP parity, and stable-resource regression checks.

Validation includes static/CI checks but does not replace Android device testing.
No official release or issue closure is authorized.
