# Changelog

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
