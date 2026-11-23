# MyZong

Morphe patches for customizing My Zong **5.19.19.112** (`com.zong.customercare`). Choose which sections remain visible, simplify navigation, apply a charcoal theme, and restyle cards, buttons, icons, and bundle controls.

**Current release:** [MyZong v1.2.23](https://github.com/FarhanZafarr-9/myzong-patches/releases/tag/v1.2.23) · **Download:** `MyZong-1.2.23.mpp`

[**Add to Morphe**](https://morphe.software/add-source?github=FarhanZafarr-9%2Fmyzong-patches&name=MyZong)

Open this link on your Android phone to add the patch source directly. You can also import the MPP manually using the steps below.

## Contents

- [Installation](#installation)
- [How customization works](#how-customization-works)
- [Theme, colors, and shapes](#theme-colors-and-shapes)
- [Home screen](#home-screen)
- [Header and navigation](#header-and-navigation)
- [Bundles and Usage](#bundles-and-usage)
- [Recharge, dialogs, and startup](#recharge-dialogs-and-startup)
- [Daily reward ad option](#daily-reward-ad-option)
- [Example configurations](#example-configurations)
- [Compatibility and troubleshooting](#compatibility-and-troubleshooting)
- [Build and source layout](#build-and-source-layout)

## Installation

1. Download `MyZong-1.2.23.mpp` from the release above. `SHA256SUMS.txt` provides its SHA-256 checksum.
2. Import the MPP as a patch source in Morphe Manager.
3. Choose a **stock My Zong 5.19.19.112 APK** as input.
4. Review the selected patches. Open **Customize home shortcuts**, **Customize header**, and **Charcoal dark mode** to adjust their options.
5. Patch, sign, and install through Morphe Manager.

Keep the same Morphe signing key for future updates. This release contains the MPP and checksum; GitHub provides source archives for its tag. No newly signed installable APK is included.

## How customization works

There are **51 selectable patches**. The tables use their names as shown in the patch selector.

| Control | How to change it |
| --- | --- |
| Separate patch | Select/deselect before patching. Most section-hiding controls are independent. |
| Patch option | Edit the value or list inside a selected patch before patching. |
| In-app button | The Bundles controls button immediately hides/restores its controls and remembers your choice. |

**On/Off below means selected/unselected in a fresh patch selection.** A default-On *Hide* patch hides that item. Deselect it when creating a fresh patched APK to retain the item. Manager may remember a different selection from a previous session.

Most choices are applied when generating the APK. To change them later, repatch the stock APK with your revised selection. There is no general in-app customization settings screen.

## Theme, colors, and shapes

| Patch | Default | What changes |
| --- | --- | --- |
| **Charcoal dark mode** | On | Dark grey backgrounds, lighter charcoal surfaces, pale text, subdued progress tracks, and recolored headers, search surfaces, drawer, dialogs, and supported screens. |
| **Material shapes** | On | Rounded supported Home/Usage cards, pill primary buttons, softer secondary buttons, allowance-cell spacing, revised favorite-button geometry, and rounded New badges. |
| **Material allowance icons** | On | Gives data, minutes, and SMS icons distinct theme colors instead of using green for all three. |
| **Material usage favorite star** | On | Restyles selected favorite stars in Usage and Bundles. With Material shapes, the star has a fixed icon size, a borderless button surface, and a dark selected star. |

### System Material accent

The **Use system Material accent** option (`systemMaterialAccent`) inside Charcoal dark mode is **On** by default. On Android 12+, supported highlights use the system wallpaper accent. The fallback is muted green; turning this option off uses that fallback.

The underlying surfaces remain charcoal. This is not a full dynamic-color replacement of every background. Colors and shapes are separate patches, so dark mode can be used without changing card geometry.

### Shape presets

Material shapes uses fixed presets:

| Component | Treatment |
| --- | --- |
| Supported main cards | Approximately 20dp corners. |
| Supported primary buttons | 24dp corners and a minimum 48dp height that respects larger font settings. |
| Secondary unsubscribe buttons | 12dp corners and a quieter surface. |
| Bundle allowance boxes | 8dp corners with gaps between cells. |
| Validity chips | Fully rounded when inactive; 6dp corners and inverted colors when selected. |
| New badge | Fully rounded pill. |
| Favorite button | Compact corners, no outline, and a fixed-size star. |

These changes target recognized components. There are no arbitrary radius sliders, per-card color pickers, font selectors, or complete replacement layouts.

## Home screen

### Promotional and auxiliary sections

Each row is a separate patch and is **On by default**.

| Patch | Hidden content |
| --- | --- |
| **Hide home match card** | Sports/match information card. |
| **Hide home prayer card** | Prayer/Ramadan timing card. |
| **Hide home family sharing** | Complete family-sharing group and MY5 banner. |
| **Hide home streak cards** | Start-your-streak and seven-day streak sections. |
| **Hide home promotions** | Promotional banners, flash sales, hot offers, inline ads, and the horizontal entertainment/options row below the banners. |
| **Hide home 5G shortcuts** | 5G map/settings/bundles shortcut group. |
| **Hide home Z Wallet** | Z Wallet section. |
| **Hide home step counter** | Step shortcut and step-counter panel. |
| **Hide home weather strip** | Location/weather strip and expand arrow. |
| **Hide home regional and city offers** | Regional/city offer search section. |

### Account and allowance cards

| Patch | Default | Behavior |
| --- | --- | --- |
| **Hide home active-offer counts** | On | Removes “X offers active” labels below Home allowances, retaining values and progress displays. |
| **Hide Home SMS card** | On | Removes the Home SMS card; data/minutes share the remaining space. Usage SMS remains available. |
| **Hide Home tariff line** | Off | Removes the package name, such as Economy Package, below the balance expiry line. |
| **Hide Home recharge button** | On | Hides the recharge button in the Home account header. Recharge sections have separate controls. |
| **Hide Home loan button** | Off | Hides the Home loan button; can be paired with the header loan shortcut. |
| **Space home sections** | On | Ensures at least 24dp above the options tray and regional/city offers section. |

### Make Your Own Bundle / Bachat Bazaar / Zong4U row

| Patch | Default | Behavior |
| --- | --- | --- |
| **Hide Make Your Own Bundle shortcut** | On | Hides only Make Your Own Bundle. |
| **Hide Bachat Bazaar shortcut** | On | Hides only Bachat Bazaar. |
| **Hide Zong4U shortcut** | On | Hides only Zong4U. |

Remaining buttons reflow when some are hidden. If all three are hidden, their shared section collapses. This row is separate from the configurable shortcuts tray below it.

### Choose which shortcuts to keep

**Customize home shortcuts** is **On** by default. Its **Home shortcuts to keep** option (`shortcutsToKeep`) is an allowlist: only listed entries remain visible.

Default list:

```text
Rewards
Rs 100 Shop
```

Example names you can enter:

| | |
| --- | --- |
| Rewards / Free MBs | Daraz Hot Deals |
| Brief History | Rs 100 Shop |
| 20% Off | IR |
| Tax Certificate | Balance Save |
| Yaari Load | Call Blocks |
| Book Your Number | Value Added Services |
| Business Sales Leads | |

**Free MBs is an alias for Rewards.** Matching normalizes case, spaces, and punctuation. Other displayed server-provided names can also be entered. Unlisted or future shortcuts stay hidden. An empty list hides every shortcut.

Manager may render this option as an editable list rather than checkboxes. Enter one shortcut name per list entry.

**Hide home shortcuts card** is a separate patch, **Off** by default. It hides the entire tray, including entries kept in the allowlist. The Free MBs header shortcut can remain as an alternative route to daily rewards.

## Header and navigation

### Choose header items to hide

**Customize header** is **On** by default. Its **Header items to hide** option (`headerItemsToHide`) accepts:

| Entry | Effect |
| --- | --- |
| `Notifications` | Hides the notification bell. |
| `Menu` | Hides the side-menu launcher. |
| `Refresh` | Hides the header refresh button. |
| `Search` | Hides header search outside Bundles; Bundles keeps its search access. |
| `Greeting` | Hides the greeting. |

All five are in the default hide list. Remove an entry to keep that item. An empty list keeps all five.

### Titles and replacement shortcuts

| Patch | Default | Behavior |
| --- | --- | --- |
| **Left align header titles** | Off | Aligns supported titles to the start edge. |
| **Show Home header title** | On | Shows “Home” when the Home greeting is hidden. It does not replace a greeting you kept. |
| **Home header Bundles shortcut** | On | Appears on Home when the Bundles tab or entire bottom bar is hidden. |
| **Home header Free MBs shortcut** | Off | Adds a small gift icon opening daily rewards. |
| **Home header loan shortcut** | On | Invokes the existing take/pay loan action from the header. |

Section hiding does not automatically enable replacement shortcuts. For example, select the Free MBs header shortcut explicitly if you want it after hiding the shortcuts card.

### Bottom navigation and initial screen

| Patch | Default | Behavior |
| --- | --- | --- |
| **Hide bottom navigation labels** | On | Shows tab icons without labels. |
| **Hide More bottom tab** | On | Hides More. |
| **Hide Z Play bottom tab** | On | Hides Z Play. |
| **Hide Usage bottom tab** | Off | Hides Usage. |
| **Hide Bundles bottom tab** | Off | Hides Bundles. |
| **Hide bottom navigation** | Off | Hides the entire bar, overriding individual item visibility. |
| **Start on Usage** | Off | Opens Usage on a fresh launch after sign-in. Home remains in the navigation history; restored state and deep links are respected. |

Hiding an item changes its visibility rather than deleting its destination. The Bundles header icon provides an alternative route to Bundles, but not every hidden tab has a corresponding header shortcut. Choose the access you want before hiding the whole bar.

## Bundles and Usage

| Patch | Default | Behavior |
| --- | --- | --- |
| **Bundle controls toggle** | On | Adds an icon beside Search to hide/restore categories, validity chips, and filter controls together. |
| **Hide bundle browsing promotions** | On | Hides the advertising banner in supported bundle browsing/details areas. |
| **Hide usage top banner** | On | Hides the large banner above the Usage summary. |
| **Hide usage promotions** | On | Hides the external-promotion label and ad container on Usage. |

### Manual Bundles controls

Open Bundles and tap the controls icon beside Search. The category/options row, validity chips, and Filter by controls disappear; tap again to restore them.

Controls begin visible on a fresh installation, and the show/hide choice is remembered locally. Hiding preserves the current category and filters. Search and the offers list remain available. Scrolling no longer changes control visibility, avoiding the previous automatic-collapse interaction.

Related appearance changes come from the theme and shape patches: recolored search surfaces/results icons, accent-colored category indicators, stateful validity chips, allowance-cell spacing, and favorite-star styling. These are bundled treatments rather than separate color switches for each element.

## Recharge, dialogs, and startup

### Recharge sections

| Patch | Default | Behavior |
| --- | --- | --- |
| **Hide Online Recharge section** | On | Hides Online Recharge. |
| **Hide Scratch Card section** | On | Hides Scratch Card. |
| **Hide online recharge promotions** | On | Hides supported banners and inline promotions if Online Recharge remains visible. |

The Home recharge button has its own patch. Keeping that button and keeping either recharge section are separate decisions.

### Dialogs and side menu

| Patch | Default | Behavior |
| --- | --- | --- |
| **Hide floating chatbot and dialog** | On | Hides the launcher/overlay and blocks its supported opening method. |
| **Hide WhatsApp channel dialog** | On | Hides the Zong 5G WhatsApp promotion, including the “AISA HAI FUTURE” / “Follow!” notice. |
| **Hide drawer support and promotional links** | On | Hides Press Release, Find Us, Contact Us, Video Tutorials, FAQs, and Feedback as a group. |

Drawer links use one grouped patch, not six separate toggles. **Customize header → Menu** independently hides the drawer launcher. Success dialogs and supported Rewards notices receive dark styling through **Charcoal dark mode**.

### Startup

| Patch | Default | Behavior |
| --- | --- | --- |
| **Skip animated startup intro** | On | Uses a static logo and the existing intro-completion route; startup/session checks remain. |
| **Hold startup until Home settles** | On | Briefly keeps a matching dark brand cover while loading/initial visibility changes settle, reducing flashes of hidden Home sections. |

The hold lasts at least about 450ms and at most 1.8 seconds, finishing once loading and three clean frames settle. It does not wait indefinitely for network requests. Android can still provide its system launch splash.

## Daily reward ad option

**Skip daily reward ad** is **Off** by default. Selecting it routes the daily reward bubble through My Zong's existing direct-claim branch.

This is independent of promotional UI hiding: removing Home/Usage banners does not change the reward claim flow. It targets one client-side branch, not every ad in the app. Reward availability and entitlement still depend on the service.

## Example configurations

These are combinations of existing options, not named presets in Manager.

| Goal | Selection |
| --- | --- |
| Clean Home with normal navigation | Keep Home cleanup patches; leave **Hide bottom navigation**, **Hide Usage bottom tab**, and **Hide Bundles bottom tab** off. |
| Minimal Home with header shortcuts | Enable **Hide home shortcuts card**, **Home header Free MBs shortcut**, and **Home header loan shortcut**. Optionally enable **Hide Home loan button**. |
| More space for bundle browsing | Keep **Bundle controls toggle** on and collapse controls using its in-app button. |
| Data/minutes-focused Home | Keep **Hide Home SMS card** and **Hide home active-offer counts** on; optionally enable **Hide Home tariff line**. |
| Open directly to Usage | Enable **Start on Usage**. Keep the Usage tab visible unless intentionally hiding it. |
| Selected utility shortcuts | Edit the shortcut keep list and leave **Hide home shortcuts card** off. |
| Dark colors with native card geometry | Enable **Charcoal dark mode** and deselect **Material shapes**. Other icon/visibility patches remain independent. |

## Compatibility and troubleshooting

### Supported input and patch sources

The target is **5.19.19.112**, not `.117`. Use a fresh stock APK when changing the selection. This is a patch source, not an XAPK installer or a standalone replacement for My Zong's service. Morphe manages shared internal patch dependencies automatically.

v1.2.23 resolves mapped raw-resource filenames when another source triggers resource decoding, retains bulk extraction, and still fails if a required file is actually missing. All 51 selected patches applied locally to stock `.112`, and the user confirmed v1.2.22 works on their phone. v1.2.23 changes bundle branding and metadata only. The exact combination with Morphe's **Disable Play Store** patch has not been independently reproduced locally.

For combined-source failures, capture the failing patch, full exception, source versions, Manager/Patcher versions, and input version. Another source may require a separate fix.

### Common questions

| Symptom | Check |
| --- | --- |
| Selected shortcut is absent | Leave **Hide home shortcuts card** off and use the displayed name in the keep list. Free MBs and Rewards are aliases. |
| No Home title | The patch must be selected, Home active, and Greeting included in the header hide list. |
| No Bundles header shortcut | It appears on Home only when selected and the Bundles tab or entire bar is hidden. |
| Bundle categories/filters disappeared | Tap the controls icon beside Search; hidden state persists between launches. |
| Daily reward still shows an ad | **Skip daily reward ad** is separate from banner hiding and starts unselected. |
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | Existing/new APK signatures differ. Keep the same signing key, or uninstall before switching; uninstalling removes local app data. Check other Android users/profiles if the package remains installed. |
| Need different radius/colors | Shapes and colors are presets. Per-component sliders/pickers are not available. |

## Build and source layout

### Build requirements

Use Windows PowerShell, JDK 23, Android SDK build-tools 36.0.0, and GitHub CLI. Configure `patches/local.properties` and adapt machine paths in `scripts/Build-Bundle.ps1`.

```powershell
.\scripts\Build-Bundle.ps1
```

Output: `patches/patches/build/libs/patches-1.2.23.mpp`.

The script uses your `gh` login for GitHub Packages and cached Gradle dependencies. For initial dependency downloads, configure `GITHUB_ACTOR` and `GITHUB_TOKEN` and run the Gradle wrapper without `--offline`.

### Repository layout

| Path | Purpose |
| --- | --- |
| `patches/patches/src/main/kotlin/app/zonghome/patches/` | Patch definitions, options, fingerprints, resource edits, and bytecode hooks. |
| `patches/extensions/extension/src/main/java/app/zonghome/extension/` | Runtime visibility, theme, shape, navigation, and control helpers. |
| `tests/` | Test stubs and regression fixtures. |
| `tests/resource-checks/` | Binary-XML, initial Home layout, and adapter/startup hook checks. |
| `scripts/` | Build, packaging, and validation helpers; local paths may need adapting. |
| `CHANGELOG.md` | Version changes. |

Local `inputs/`, `private/`, `tools/`, `work/`, `builds/`, and `docs/` are ignored by Git. Signing keys and proprietary input APKs are excluded. Older local builds are preserved under `builds/archive/`.

### Remote source metadata

Morphe resolves the Add to Morphe link through the root "patches-bundle.json" on "main". This manifest points to the published MPP and records its version and UTC release time. Update it whenever a new release is published; uploading an MPP to GitHub Releases alone does not update the remote source.

### Validation

v1.2.23 is a branding/metadata update. Its MPP built successfully, and every payload entry is byte-identical to v1.2.22; only the bundle manifest changed. Refresh the remote source in Morphe to receive the corrected MyZong identity.


v1.2.22 passed its MPP build and a stock `.112` run with all 51 selectable patches enabled. Checks covered 362 binary-XML assertions, 13 adapter entry hooks, startup/indicator hook placement, absence of automatic scrolling hooks, first-frame Home hiding, and remaining allowance-card widths. A user phone test also passed; this does not cover every server-delivered screen or every optional configuration.

License and upstream attribution: [LICENSE](patches/LICENSE), [NOTICE](patches/NOTICE).
