# Inline API profile management — scheme B

Originally completed locally on v1.3.2 and retained in commit `f7dc223`. This slice is included
with the 1.3.3 caption-recovery release. The UI code itself does not change the caption engine
or API request policy. The verification below describes its earlier isolated local check;
see CAPTION-RECOVERY-1.3.3.md and the release verification for the combined build.

## Interaction and visual treatment

The selector retains its Morphe dialog and list. Every profile has an independent 48dp more
button with a vector three-dot icon; the expanded state uses a chevron. Long press remains
an optional equivalent shortcut. Only one profile can be expanded. The active checkmark
continues to mean the applied API profile, never the profile being managed.

An expanded row has a subtle theme-derived rounded surface. Its action strip contains
matching edit/trash line icons and labelled buttons, using ordinary foreground for rename
and the theme error color for delete. Buttons share width and have at least 48dp touch height.
They stack vertically when the available width cannot accommodate both labels. They do not
truncate long localized labels merely to preserve a horizontal layout. Start-relative spacing
and drawable placement support RTL. No central management dialog is opened.

Rename replaces the action strip with the existing inline editor plus Cancel/Save. The
original name is prefilled. Saving collapses the row but keeps the same selector dialog and
list instances; it does not activate the edited profile or restart translation. Cancel returns
to its actions without saving. A dirty name blocks collapse, switching another profile,
opening another row or adding a profile, with a localized inline explanation. Outside-tap
closure is disabled while editing; the explicit footer Cancel discards the draft and exits.
Back first exits a clean editing/actions state; it does not silently discard dirty text.

Delete replaces the strip with a compact irreversible-action explanation and Keep/Confirm
buttons. The profile name stays in the same row. Active-profile deletion displays the exact
name of the profile that would become active. If the deletion context changes while the
confirmation is open, the updated consequence must be confirmed again. Deletion removes
only that row and its profile data and leaves the list open. One profile must remain.

New-profile naming and the API-section clear-key action are preserved. They are not merged
into the inline rename/delete strip. All management targets are stable IDs. Disposed dialog
callbacks cannot save into a later session.

## Verification

- 289 JVM/Robolectric tests passed with zero failures, errors or skips.
- 14 locales each contain 122 matching keys.
- Android MPP build and bundle integrity check passed.
- Additional tests cover same-dialog identity, only-one-expanded behavior, row preservation,
  rename/save/cancel/IME Done, dirty-input navigation guards, stale callbacks, active/inactive
  deletion, exact replacement notices, changed-context reconfirmation, final-profile protection,
  equal-width actions, narrow stacking, large text/RTL bounds and independent more touch targets.
- Composition validation applies official Morphe 1.43.0 compatible defaults and all three
  addon roots to YouTube 21.07.247 with compile=false; see the local log for completion.

This slice has not been visually accepted on a physical device. Widget measurement tests
are not real phone screenshots.
