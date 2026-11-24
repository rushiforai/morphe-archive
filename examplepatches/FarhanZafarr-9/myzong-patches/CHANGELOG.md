# Changelog

## 1.3.3

### Fixes

- `Split pasted PIN/OTP digits across boxes` fills the current row without mixing separate PIN fields.

- `Launcher icon` uses rounded Light/Dark artwork with a matching static startup logo.

- Usage allowance values stay neutral instead of turning green.

- Hidden Home buttons are concealed earlier to reduce startup flashes.

- Bundle cards avoid repeated styling and change-animation blinking.

- Loading rings loop smoothly without restarting their rotation.

### Other changes

- Settings are organized into 15 patches and six categories, with clearer option descriptions.

- `Material You theme` uses wallpaper colors on Android 12+, with a charcoal fallback.

- Onboarding has smaller fields, softer corners, a visible Next arrow and backgrounds that blend into the screen.

- Rewards screens have updated panels, text and button styling.

- `Skip personal details after OTP` can continue straight to Home. Starts off; Profile and wallet verification remain available.

## 1.3.2 (local test build)

- Style onboarding, registration, language and wallet PIN/OTP form controls, including focus, disabled and error states.
- Add independent Startup option for PIN/OTP paste distribution, row isolation, partial replacement and overflow rejection.
- Preserve native validation callbacks and normal single-digit typing.

# Changelog

## 1.3.1 (local test build)

- Replaced generic option descriptions with precise screen-specific titles, effects and dependencies.
- Fixed Light/Dark launcher icons: disable AAPT resource auto-version stripping and validate vector dimensions, path data and colors before packaging.
- Added low-opacity Material bottom-navigation ripple/indicator colors.
- Made adapter rows the sole styling owner for offer lists and disabled their item-change crossfades while preserving movement animations.
- Refined reward intro/results/rules/history typography, stateful game tiles and primary actions; preserved game geometry and handlers. Onboarding art uses fit-center against the dark surface.

Release remains deferred for phone testing.

## 1.3.0

- Organized 15 public patches into Appearance, Home, Header & navigation, Bundles & Usage, Recharge & dialogs, and Startup & rewards.
- Consolidated the former 51-patch list into grouped option screens, retaining 49 individually reversible switches and the existing effective defaults. Visibility options use positive Show labels.
- Replaced Charcoal dark mode with Material You theme: dark system palette roles on Android 12+, automatic whole-palette charcoal fallback on older/unsupported devices, and an option to force charcoal.
- Added optional Light/Dark vector launcher icons, updating regular and round references without changing notification icons or the startup cover.
- Added catalog, grouped-APK visibility, icon/manifest isolation, dynamic-palette and fallback regressions. Icon assets are reproducibly compiled from readable vector sources.

Migration: review your selections once. Old individual patch selections cannot automatically migrate into the new group options. Launcher icon and Skip daily reward ad remain unselected by default.

## 1.2.23

- Renamed the embedded bundle from Zong Home Cleanup to MyZong, matching the source link and repository branding.
- Replaced template/local-workspace metadata with the project URL and author; standardized generated artifact names.
- Updated the Gradle project name and release documentation. Patch behavior is unchanged from 1.2.22.

## 1.2.22

- Added a persistent Bundles controls button beside Search. Removed automatic scroll/touch-driven collapsing.
- Made the New badge fully rounded and active validity chips squarer.
- Resolved Morphe's raw-resource path aliases while retaining bulk extraction and explicit missing-resource failures.

This release also includes the customization work since 1.2.13: header and bottom-navigation options, Material allowance icons and shapes, favorite-star styling, bundle search/filter theme fixes, WhatsApp channel dialog hiding, Home shortcut selection fixes, optional Usage startup, and safer adapter styling hooks.

Validation: successful MPP build; all 51 selected patches applied to stock 5.19.19.112; 362 binary-XML checks; 13 adapter entry-hook checks; startup/indicator and Home layout checks; user-confirmed phone test. Exact mixed-source Disable Play Store compatibility remains unverified locally.
