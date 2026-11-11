#!/usr/bin/env python3
"""dev.15: compact single-tap-area editor and anchored selector UI regressions.

TapRegions141 and TapControls141 are tested separately for behavior.
Here we guard presentation layout, popup positioning, and stable mode IDs.
"""
from pathlib import Path

root = Path(__file__).resolve().parents[2]
revision = root / "porting/revisions/v1.11.0/java/e/e/a"
source = (revision / "TapRegionSettings141.java").read_text(encoding="utf-8")
regions = (revision / "TapRegions141.java").read_text(encoding="utf-8")
touch = (revision / "TapControls141.java").read_text(encoding="utf-8")
checks = 0

def require(condition, description):
    global checks
    checks += 1
    if not condition:
        raise AssertionError(description)

for token in (
    "int[] order = {TapRegions141.ALL, TapRegions141.CUSTOM,",
    "TapRegions141.VERTICAL_EDGES, TapRegions141.CENTER, TapRegions141.EDGES};",
    "int from = line == 0 ? 0 : 2;",
    "int until = line == 0 ? 2 : order.length;",
    "presets[option] = preset;",
    "rowSize.topMargin = dp(line == 0 ? 0 : 2);",
    "buttonSize.leftMargin = buttonSize.rightMargin = dp(3);",
):
    require(token in source, "Preset positions and compact spacing: " + token)

for token in (
    "body.setPadding(dp(18), dp(2), dp(18), dp(8));",
    "openOnly.setMinHeight(dp(36));",
    "pair.setPadding(0, dp(i == 0 ? 1 : 2), 0, 0);",
    "selectorSize.setMargins(dp(2), dp(2), dp(2), dp(3));",
    "actions.setPadding(0, 0, 0, dp(2));",
    "resetRow.setPadding(0, dp(2), 0, dp(1));",
    "divider(parent, 6, 5);",
    "size.setMargins(dp(3), dp(1), dp(3), dp(1));",
    "new LinearLayout.LayoutParams(-1, dp(184))",
    "GradientDrawable.OVAL",
    "new LinearLayout.LayoutParams(dp(38), dp(38))",
    "background.setCornerRadius(dp(12));",
    "selection.setCornerRadius(dp(10));",
):
    require(token in source, "Missing compact layout or preserved shapes: " + token)

for token in (
    "new PopupWindow(context)",
    "surface.setCornerRadius(dp(10));",
    "popup.showAsDropDown(areaSelector, dp(4), -dp(4), Gravity.START);",
    "popup.setFocusable(true);",
    "popup.setOutsideTouchable(true);",
    "popup.setContentView(list);",
    "indicator.setChecked(i == selected);",
    "select(index);",
    "popup.dismiss();",
    "roundDialog(dialog, 28);",
):
    require(token in source, "Rounded anchored selector or main dialog missing: " + token)

require("setSingleChoiceItems(items, selected" not in source,
        "Area picker must not open a modal alert dialog")
require("new PopupMenu(" not in source,
        "Area picker must be an anchored rounded popup, not stock square menu")
require("if (i > 0) divider(body, 1, 1);" not in source,
        "Quick adjustment must have no unnecessary separator")
for token in (
    "static final int ALL = 0, EDGES = 1, VERTICAL_EDGES = 2, CENTER = 3, CUSTOM = 4;",
    "static TapRegions141 custom(int[][] ranges)",
    "static TapRegions141 parse(String value)",
):
    require(token in regions, "Region storage compatibility must remain: " + token)
for token in ("nicoid_single_tap_control_region", "activityTouch(Activity", "nativeDown("):
    require(token in touch, "Existing native input routing must remain: " + token)

print(f"PASS: {checks} compact UI and stored-region compatibility assertions")
