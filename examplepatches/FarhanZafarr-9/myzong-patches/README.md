# MyZong

Customization patches for **My Zong 5.19.19.112** (`com.zong.customercare`), compatible with Morphe.

**Latest release:** [v1.3.3](https://github.com/FarhanZafarr-9/myzong-patches/releases/tag/v1.3.3) · stock **5.19.19.112**.

[**Add MyZong to Morphe**](https://morphe.software/add-source?github=FarhanZafarr-9%2Fmyzong-patches&name=MyZong)

Add the source in Morphe, then refresh it to download the latest bundle. Release assets include the MPP and SHA256 checksums; source archives are available from the release tag.

## Changes in 1.3.3

- Organized settings into 15 patches and six categories.
- Added Material You colors with charcoal fallback.
- Added rounded Light/Dark icons and matching static splash.
- Refined onboarding and Rewards styling.
- Fixed OTP paste across digit boxes.
- Added optional personal-details skip after OTP.
- Fixed neutral Usage values and navigation feedback.
- Reduced bundle blinking and Home button flashes.
- Made the loading rings loop smoothly.

Related controls are grouped into 15 patches across six categories. Visibility switches use positive **Show…** labels. Material You uses dark wallpaper-based system colors on Android 12+, with a charcoal fallback on older or unsupported devices.

## Install or update

1. Add or refresh the MyZong source in Morphe, or manually import `MyZong-1.3.3.mpp` from the release.
2. Choose a **stock 5.19.19.112 APK**. Use fresh stock input whenever repatching.
3. Review the categorized patch list and open each selected group's options.
4. Patch, sign and install using Morphe. Keep the same signing key for future updates.

### Migrating from 1.2.x

Review your settings once when updating: old individual patch selections cannot automatically describe the new grouped options. The default *effective behavior* is preserved, but previous custom selections need to be entered in their new groups.

Most options now use positive **Show…** labels. On means visible; Off means hidden. The patch's own checkbox enables/disables the whole group. Saved options have no effect if their group is deselected. Some internal option keys retain their old hook names; use the displayed title to interpret their value.

The Bundles controls button remains an in-app toggle. Other changes are applied at patch time and require repatching to change later. This bundle does not add a general in-app settings screen.

## Category overview

| Category | Top-level patches |
| --- | --- |
| **Appearance** | Material You theme; Material shapes; Material allowance icons; Material usage favorite star; Launcher icon |
| **Home** | Home sections; Home account cards; Home shortcuts |
| **Header & navigation** | Header; Bottom navigation |
| **Bundles & Usage** | Bundles and Usage |
| **Recharge & dialogs** | Recharge; Dialogs and drawer |
| **Startup & rewards** | Startup; Skip daily reward ad |

All top-level patches are selected by default **except Launcher icon and Skip daily reward ad**. Manager may retain a different saved selection, so check yours.

## Appearance

### Material You theme

This is a dark theme. With **Use wallpaper colors** On (default), Android 12+ supplies the system palette for:

- Dark background, surface and raised-card roles.
- Primary and secondary text.
- Progress tracks and selected-control surfaces.
- Accents and text/icons displayed on accent-filled controls.

The palette is read when the app starts. Reopen the app after changing your wallpaper/system palette. Below Android 12, or if required system colors are missing, the entire palette falls back to the established charcoal implementation. Turn **Use wallpaper colors** Off to force charcoal on a supported device too.

This adapts the app's existing views; it does not replace the app with a new Material 3 component library or enable a light app theme. Launcher icon Light/Dark selection is independent of the app theme.

### Material shapes

Preset geometry for recognized components:

| Component | Treatment |
| --- | --- |
| Supported main cards | Approximately 20dp corners. |
| Primary buttons | 24dp corners and minimum 48dp height, respecting larger font settings. |
| Secondary unsubscribe buttons | Softer 12dp corners and a quieter surface. |
| Bundle allowance cells | 8dp corners and gaps between cells. |
| Validity chips | Pill-shaped inactive; 6dp corners and inverted selected colors when active. |
| New badge | Fully rounded. |
| Favorite button | Compact corners, fixed-size star and no outline. |

There are no per-component radius sliders or arbitrary color pickers. Deselect Material shapes to retain native geometry while keeping the selected theme and visibility groups.

### Icons and favorites

**Material allowance icons** gives data, minutes and SMS icons distinct theme colors rather than using green for all three.

**Material usage favorite star** styles Usage/Bundles favorites. Together with Material shapes, selected stars use a dark glyph on the themed button surface; icon size remains fixed.

### Launcher icon

This patch is **unselected by default**. When selected, choose **Icon variant**:

| Variant | Background | Ring |
| --- | --- | --- |
| **Light** (default option) | Off-white `#EEECE6` | Charcoal `#242424` |
| **Dark** | Charcoal `#242424` | Off-white `#EEECE6` |

Both use vector artwork with the recognizable bottom opening in the ring. Regular and round launcher references are updated together. The static startup logo and startup cover follow the chosen preset; notification icons remain unchanged. No custom-image upload or custom-color options are included.

Launchers can cache icons; if the icon appears stale after updating, reopen the launcher or remove/re-add its shortcut.

## Home

### Home sections

| Option | Default |
| --- | --- |
| Show match information | Off |
| Show prayer times | Off |
| Show family sharing | Off |
| Show streak cards | Off |
| Show banners and entertainment row | Off |
| Show 5G shortcuts | Off |
| Show Z Wallet | Off |
| Show step counter | Off |
| Show location and weather | Off |
| Show regional and city offers | Off |
| Increase section spacing | On |

Each section remains independently selectable. Family sharing covers its complete button group/MY5 banner. Banners also cover flash sales, hot offers, inline ads and the entertainment row beneath them. Increased spacing keeps at least 24dp above the options tray and regional/city offers.

### Home account cards

| Option | Default | Effect |
| --- | --- | --- |
| Show active-offer counts | Off | Controls “X offers active” labels without removing values/progress. |
| Show SMS allowance card | Off | When hidden, data/minutes share the row. Usage SMS remains available. |
| Show package name below expiry | On | Controls the tariff/package line such as Economy Package. |
| Show recharge button | Off | Controls only the Home account-header button. |
| Show loan button | On | Can be turned off when using the header loan shortcut. |

### Home shortcuts

| Option | Default |
| --- | --- |
| Show shortcuts tray | On |
| Show Make Your Own Bundle | Off |
| Show Bachat Bazaar | Off |
| Show Zong4U | Off |

The three large shortcuts remain independent. Remaining buttons reflow, and their shared section collapses when all three are hidden.

**Home shortcuts to keep** remains an editable allowlist for the separate options tray. Defaults:

```text
Rewards
Rs 100 Shop
```

Examples: Rewards, Free MBs, Daraz Hot Deals, Brief History, Rs 100 Shop, 20% Off, IR, Tax Certificate, Balance Save, Yaari Load, Call Blocks, Book Your Number, Value Added Services, Business Sales Leads.

**Free MBs and Rewards are aliases.** Matching normalizes case, spaces and punctuation. Other server-provided displayed names can also be entered. Unlisted/future shortcuts stay hidden; an empty list hides all entries. Manager may render this as an editable list rather than checkboxes: enter one name per list entry.

Turning **Show shortcuts tray** Off hides the whole tray regardless of the allowlist. To retain daily-rewards access, optionally enable **Header → Show Home Free MBs shortcut**.

## Header & navigation

### Header

| Option | Default | Notes |
| --- | --- | --- |
| Show notification bell | Off | |
| Show side-menu button | Off | Controls the drawer launcher. |
| Show refresh button | Off | |
| Show search outside Bundles | Off | Bundles retains search regardless. |
| Show greeting | Off | |
| Left-align titles | Off | |
| Show Home title when greeting is hidden | On | Does not replace a greeting you kept. |
| Show Home Bundles shortcut | On | Appears on Home only when the Bundles tab or whole bottom bar is hidden. |
| Show Home Free MBs shortcut | Off | Opens daily rewards from a small gift icon. |
| Show Home take/pay loan shortcut | On | Invokes the existing available loan action. |

Header shortcuts are separate choices from section hiding. Hiding the tray does not automatically enable the Free MBs shortcut.

### Bottom navigation

| Option | Default |
| --- | --- |
| Show bottom navigation | On |
| Show tab labels | Off |
| Show More tab | Off |
| Show Z Play tab | Off |
| Show Usage tab | On |
| Show Bundles tab | On |

Turning the whole bar Off overrides the visibility of its items while retaining their option values. Hidden items keep their underlying destinations, but not every tab has an alternative header shortcut. Plan the access you want before hiding the whole bar.

## Bundles & Usage

The **Bundles and Usage** patch contains:

| Option | Default |
| --- | --- |
| Show Bundles controls button | On |
| Show bundle browsing promotions | Off |
| Show Usage top banner | Off |
| Show Usage promotions | Off |

On Bundles, tap the controls icon beside Search to hide/restore categories, validity chips and Filter by controls together. Controls start visible on a fresh installation, and the choice is remembered locally. Hiding them preserves current filters and keeps Search/offers accessible. Scrolling no longer changes control visibility.

Search surfaces/results icons, category indicators, validity chips, allowance-cell spacing and favorite styling are provided by the theme/shape patches rather than separate per-element color switches.

## Recharge & dialogs

### Recharge

**Show Online Recharge**, **Show Scratch Card**, and **Show Online Recharge promotions** are all Off by default. Promotional visibility matters when Online Recharge is kept visible. The Home recharge button is configured separately under Home account cards.

### Dialogs and drawer

| Option | Default | Effect |
| --- | --- | --- |
| Show chatbot launcher and dialog | Off | Controls the launcher/overlay and opening method. |
| Show WhatsApp channel notice | Off | Controls the Zong 5G notice with “AISA HAI FUTURE” / “Follow!”. |
| Show support and promotional drawer links | Off | Controls Press Release, Find Us, Contact Us, Video Tutorials, FAQs and Feedback together. |

Drawer links are one group, not six independent switches. The drawer's launcher is separately controlled by Header. Supported success dialogs and Rewards notices receive their surface/text styling from Material You theme.

## Startup & rewards

### Startup

| Option | Default |
| --- | --- |
| Use static logo instead of animated intro | On |
| Hold cover until Home settles | On |
| Start on Usage | Off |
| Split pasted PIN/OTP digits across boxes | On |
| Skip personal details after OTP | Off |

The static logo uses the app's existing completion route and retains startup/session checks. The cover lasts at least about 450ms and at most 1.8 seconds, ending once loading and three clean frames settle. It reduces initial flashes, not indefinite network waits. Android can still show its system launch splash.

OTP paste distributes full codes across the current row; partial pastes start at the focused box and clear stale trailing digits. Old/new/confirmation PIN rows stay separate. Overlong codes are rejected.

Skip personal details applies only after OTP sign-in. Profile remains accessible from navigation; wallet identity forms are unaffected.

Start on Usage applies to fresh launches after sign-in. Restored state and deep links are respected, and Home remains in the navigation history.

### Skip daily reward ad

This separate patch remains **unselected by default**. It routes the reward bubble through My Zong's existing direct-claim branch. Hiding banners/promotional UI does not enable it. It targets that specific client-side branch; reward availability and entitlement remain service-controlled.

## Example configurations

| Goal | Configure |
| --- | --- |
| Minimal Home | Leave optional Home sections Off; turn the shortcuts tray/loan button Off if using their header replacements. |
| Keep useful tray entries | Leave the tray On and enter exactly the names you want in its allowlist. |
| Keep normal navigation | Leave the bar, Usage and Bundles On. Choose whether labels/More/Z Play are useful. |
| Maximum bundle-list space | Keep the controls button On and hide controls using that in-app button. |
| Open to Usage | Enable Startup → Start on Usage. |
| Charcoal on a newer phone | Turn Material You theme → Use wallpaper colors Off. |
| Off-white launcher icon | Select Launcher icon and choose Light. |

## Troubleshooting and compatibility

- **Input version:** use stock `.112`, not `.117`. This is a patch source, not a standalone replacement app or an XAPK installer.
- **Missing shortcut:** check the tray is On and its keep list contains the displayed name. Free MBs/Rewards are aliases.
- **Missing Home title:** it appears when Home is active and the greeting is Off.
- **Missing Bundles header icon:** it appears on Home only when selected and the Bundles tab or whole bar is hidden.
- **Missing bundle filters:** tap the controls button; its hidden state persists between launches.
- **Different theme on older Android:** charcoal is the intentional pre-Android-12 fallback. Required OEM system colors must be available for Material You.
- **Signature mismatch:** `INSTALL_FAILED_UPDATE_INCOMPATIBLE` means the installed/new APK keys differ. Keep the same key, or uninstall before switching; uninstalling removes local data. Check other Android users/profiles if the package remains installed there.
- **Mixed patch sources:** raw-resource aliases are supported, including decoded manifest handling for the launcher. Compatibility with another source still depends on its patches. Capture the full exception, source versions and Manager/Patcher versions when reporting failures.

## Build and source layout

Use Windows PowerShell, JDK 23, Android SDK platform/build-tools 36, and GitHub CLI. Configure `patches/local.properties` and adapt machine paths in the build scripts.

```powershell
.\scripts\Build-Bundle.ps1
```

The build compiles the two vector launcher assets using `scripts/Build-LauncherIcons.ps1` and saves the ready-to-import bundle as `outputs/MyZong-1.3.3.mpp` with `outputs/SHA256SUMS.txt`.

The script uses your `gh` login for GitHub Packages and cached Gradle dependencies. For initial downloads, configure `GITHUB_ACTOR`/`GITHUB_TOKEN` and run Gradle without `--offline`.

| Path | Purpose |
| --- | --- |
| `patches/patches/src/main/kotlin/app/zonghome/patches/` | Categories, options, fingerprints, resource edits and hooks. |
| `patches/extensions/extension/src/main/java/app/zonghome/extension/` | Runtime visibility, palettes, shapes and navigation. |
| `patches/patches/src/main/resources/branding/` | Compiled launcher assets and readable vector sources. |
| `tests/resource-checks/` | Catalog, APK visibility, icon/manifest and bytecode regression checks. |
| `tests/app/zonghome/extension/MaterialPaletteTest.java` | Dynamic dark roles, contrast, alpha and fallback checks. |
| `scripts/` | Build, packaging and validation helpers. |
| `CHANGELOG.md` | Release history. |

Local `inputs/`, `private/`, `tools/`, `work/`, `builds/`, `outputs/` and `docs/` are ignored. Signing keys and proprietary input APKs are excluded. Older local builds are retained under `builds/archive/`.

### Validation

The MPP catalog is checked for 15 public patches, six categories, friendly option labels, 51 reversible switches, preserved effective defaults and exactly two icon variants. Stock `.112` validation covers default settings with Light icon, restored-visible settings with Dark icon/charcoal, hidden settings with Material You enabled, and an icon-only build.

Regression checks inspect compiled Home visibility and runtime flags, conditional chatbot handling, launcher/manifest isolation, fixed startup-logo binding, safe adapter/startup hooks and binary-XML edits. Palette tests cover dark roles, text contrast, transparency and Android/OEM fallback behavior. The Material You appearance still needs a phone check on the target device.

### Remote source metadata

Morphe reads the root `patches-bundle.json` on `main`. Update its version, UTC release time and download URL when publishing; uploading an MPP alone does not update the remote source.

License and upstream attribution: [LICENSE](patches/LICENSE), [NOTICE](patches/NOTICE).
