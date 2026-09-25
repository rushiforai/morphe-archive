# Settings anchors, TikTok 47.0.3 (DexKit scan)

Target: `com.zhiliaoapp.musically` 47.0.3. Tool: `tools/dexprobe` (desktop DexKit).

```
./tools/dexprobe/run.sh SettingsProbe  "<apk>"
./tools/dexprobe/run.sh SettingsProbe2 "<apk>"
```

## What the scan found

**The settings screen is a list of groups.** Nine `*GroupVM` classes under
`com.ss.android.ugc.aweme.setting.ui.rvmpcompose`: `TopGroupVM`, `AccountGroupVM`, `ContentGroupVM`,
`LoginGroupVM`, `InteractionsGroupVM`, `PrivacyGroupVM`, `VisibilityGroupVM`, `SupportGroupVM`,
`CacheGroupVM`.

The group list is assembled in `BaseGroupSettingsVM#G63(androidx.fragment.app.Fragment) -> List`: it
builds an `ArrayList`, reads `X.1IDU.getItems()`, then for each item calls
`BaseGroupSettingsVM#F63(fragment) -> BaseCellSettingsVM`, copies `key`/`identifier` across and
`add`s it to the list.

**A section's contents are enum members.** The Support row lives in the enum `X.1THF` (extends
`java.lang.Enum`) with the constants `SECTION_HEADER, SUPPORT, FEEDBACK, BASE_SETTINGS,
PRIVACY_CENTER, PRIVACY_CHECKUP, ACCOUNT_DELETION, ABOUT, POLICY_UPDATE, OPEN_DEBUG, WHATS_NEW`.
Its constructor is `(String, String, String, String, String, int, boolean, int)`.

Each group has its own enum, and each of those has its own `SECTION_HEADER`:

| declaring class | fields |
|---|---|
| `X.1IIJ` | `SECTION_HEADER` |
| `X.1THC` | `SECTION_HEADER` |
| `X.1THD` | `SECTION_HEADER` |
| `X.1THE` | `SECTION_HEADER` |
| `X.1THF` | `SECTION_HEADER`, `OPEN_DEBUG` |
| `X.1THG` | `SECTION_HEADER` |

`SupportGroupVM#defaultState() -> X.06iX` builds the rows that are actually shown: it calls
`X.1THF.getEntries() -> X.02mm`, then a long run of `X.05oi.add(...)` — the header is added first
(`X.1THF.SECTION_HEADER`), followed by the group's cells.

## What follows from that

- **A section title cannot be invented.** `SECTION_HEADER` carries a key
  (`support_settings_group`, `sectionSupport`) that is resolved to text through resources or i18n at
  runtime — it is not a literal in the dex. Adding a new group means writing a group VM of your own
  (an app-type stub plus ViewModel construction): expensive, and fragile against version changes.
- **Decision:** the "Tweaks" entry goes into the **existing Support section**, as its first row. The
  anchor is `X.1THF.SECTION_HEADER` (through `SupportGroupVM#defaultState`), not a guessed index or
  ordering.
- **The gear icon is not baked into the patch.** The extension supplies the id at runtime
  (`SettingsEntry.iconResourceId()` resolves a drawable by name, falling back to
  `android.R.drawable.ic_menu_preferences`), so swapping the glyph never touches bytecode and never
  depends on a resource id from a particular TikTok build.
