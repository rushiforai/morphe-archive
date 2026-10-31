# Weight change summaries

**Pillo 0.6.27 (code 472) is supported.** See [the 0.6.27 port notes](Pillo627.md)
for current contracts, verification, and version-specific backup restrictions.
Existing 0.6.20 support is retained; contracts below describe that historical implementation.

Supported app: **Pillo 0.6.20** (`xyz.rtrvr.pillo`). Select
**Pillo - Weight change summaries** when patching the original app.
It can be combined with the notification, weight-import and local-backup patches.
**[Weight in Progress](PilloProgressWeight.md)** includes this patch automatically
and adds the same graph, summaries and record list below the Progress calendar/cards.

- **All** is the initial weight-chart filter. The existing record-count choices
  remain available in the native filter sheet.
- **Total**, next to **Latest**, is the newest selected weight minus the oldest
  selected weight. Negative means weight lost; positive means weight gained.
  The five readings in the example (110.7 kg to 105 kg) show **-5.7 kg**.
- **Since** replaces **Avg**. Tap the cell to choose a date in the date picker.
  It compares the first weight recorded on or after that date with the latest
  weight, using full profile history. The selected date is displayed and saved
  locally, so reopening the screen retains it. Before choosing a date, or when
  fewer than two records match, it shows **—**. Future dates cannot be selected.
- On 0.6.27 the comparison, **Min** and **Max** cells reserve a second line
  (the **Since** label carries its date or **all time** there, and **Min**/**Max**
  keep an empty one) so the row grows in height and all three figures share a
  baseline. The native label text does not wrap, so the line break is explicit;
  without it the single-line label is drawn at its intrinsic width and runs into
  the next cell. The date cell keeps the layout modifier that `ValueDisplay`
  fills its parent with and applies the native `clickableNoRipple` to that same
  modifier, so the whole cell responds and still receives its one-third share of
  the row.
- A row between that comparison row and the graph shows **Last 30 days**,
  **Last 15 days**, and **Change**. The periods compare the earliest and latest
  recorded weights within the rolling past 30/15 days, ending at the current
  local time. Change compares the latest two records in the profile.
  These three figures use full profile history regardless of the chart filter.
- For these changes, negative means weight lost and positive means weight gained.
  Missing comparisons display **—**. At least two records are required in each
  period; values are rounded to one decimal place in the selected weight unit.

The patch retains the native chart, premium visibility rules, record controls,
and profile selection. It saves only the comparison date, not weight records.

Run `:patches:verifyPilloWeightSummaryBundle` to check calculations, history
retention, application of all four Pillo patches, and hook signatures in the
assembled DEX. The local emulator test APK reuses resources and native libraries
from the existing merged Pillo APK; its DEX is freshly patched from the original.

On 0.6.27 the packaged patch also requires
`ModifierExtensionKt.clickableNoRipple(Modifier, Function0)` and the obfuscated
`Modifier.Companion` singleton field `s3.p.a`, so a future app build fails at
patch time instead of throwing `NoClassDefFoundError` at runtime. The 0.6.27
contract list rejects the removed
`ui/report/tracker/components/box/ClickableNoRippleKt` wrapper. The rebuilt
bundle passed `:patches:verifyPillo627Bundle`; its packaged DEX contains
`clickableNoRipple` and no reference to the wrapper.
