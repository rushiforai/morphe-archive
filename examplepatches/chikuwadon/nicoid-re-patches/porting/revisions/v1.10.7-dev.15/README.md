# nicoid Re v1.10.7-dev.15 — compact single-tap region editor

Development-only successor to the dev.14 UI preview, using the fully
validated dev.13 native tap routing and later revisions without altering
region values, player playback logic, touch event classification or settings.

## UI changes

- Preserve the chosen preset order: Entire / Custom on the first row,
  Top-bottom / Center / Side edges on the second row.
- Reduce the **excessive vertical spacing** added by dev.14: body padding,
  row gaps, the opening-only checkbox, section separators, quick adjustments,
  area selector, add/remove actions and reset. The 184dp interactive preview
  retains its existing size, functionality and touch handles.
- Preserve the circular 38dp +/- buttons and mild 12dp chip corners.
- Restore the dev.13 style **anchored area picker**. Instead of a separate
  dimming AlertDialog, show a small PopupWindow positioned below the
  selector, with two or three native-looking radio options, a subtle 10dp
  corner radius, and selection/dismissal on tap.
- Preserve the main editor's 28dp rounded dialog.

## Verification

Existing 55 tap-region behavior assertions and notification/return tests
remain active; UI-specific checks confirm compact margins, the anchored
non-modal picker, unchanged stored mode IDs and native touch callbacks.
Actual fit on different phones/font sizes still requires on-device checks.

The commit is on audit/v1.10.7-dev.15-ui-compact for review.
Do not merge main, publish a release, tag or close Issue #114 without
explicit authorization. Local MPP must be distributed inside a ZIP.
