# Weight change summaries

Supported app: **Pillo 0.6.20** (`xyz.rtrvr.pillo`). Select
**Pillo - Weight change summaries** when patching the original app.
It can be combined with the notification, weight-import and local-backup patches.

- **All** is the initial weight-chart filter. The existing record-count choices
  remain available in the native filter sheet.
- **Total**, next to **Latest**, is the newest selected weight minus the oldest
  selected weight. Negative means weight lost; positive means weight gained.
  The five readings in the example (110.7 kg to 105 kg) show **-5.7 kg**.
- **Last since** replaces **Avg**. Tap it to choose a date in the date picker.
  It compares the first weight recorded on or after that date with the latest
  weight, using full profile history. The selected date is displayed and saved
  locally, so reopening the screen retains it. Before choosing a date, or when
  fewer than two records match, it shows **—**. Future dates cannot be selected.
- A row between **Last since / Min / Max** and the graph shows **Last 30 days**,
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
