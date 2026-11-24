# NuvioTV date-label appearance

Target: `com.nuvio.tv` **1.1.1 / 1081** only.

Open **Settings > Layout > Santodan-Patches > Label customization** and select
**Date label** in the dropdown. The separate Date label appearance row is removed.
See [the shared editor](NuvioLabelCustomization.md) for the current layout,
Text/Label controls, copying, reset and draft behavior.

The airing-series, finale-date and upcoming-movie-date patches require
**NuvioTV - Customize labels**. Selecting one automatically installs the editor.
The same menu also contains **Continue Watching remaining count**, whose patch
has that dependency too. Date calculations, library/collection toggles and
only-airing settings retain their original behavior.

Existing date appearance settings are loaded into the shared Date label draft.
Apply saves edits; Cancel discards them. Reset restores date defaults and removes
only the legacy date appearance keys. Empty text uses the live formatted date;
`{value}` can include that date in a custom caption. Disabling label customization
preserves the original date renderer and its legacy settings.

The legacy date UI helpers remain for compatibility and focused regression checks,
but the shared settings menu does not expose that editor. The normal native theme
editor remains independent. Run `verifyNuvioLabelsRuntime`,
`verifyNuvio111DateStyleRuntime`, `verifyNuvio111SettingsMenuRuntime` and standalone
and combined `verifyNuvio111Bundle` selections. Device layout/focus confirmation
remains pending.
