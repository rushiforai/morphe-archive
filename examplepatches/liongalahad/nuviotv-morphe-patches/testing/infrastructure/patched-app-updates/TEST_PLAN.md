# Patched-app update suppression

This mandatory internal dependency is activated by every public patch. It is generic infrastructure and is not selectable or displayed as an additional Morphe patch.

## Required behavior

- [x] Return immediately from NuvioTV's automatic and manual update-check entry point.
- [x] Skip the complete About-page group containing the automatic-update banner and manual update action.
- [x] Remove only `android.permission.REQUEST_INSTALL_PACKAGES` from the patched manifest.
- [x] Keep Privacy Policy and the remaining About-page content visible and focusable.
- [x] Require exact structural matches; fail application when the expected method, Compose group, or single manifest permission is not present.

## Verification

- [x] Unit tests verify that all seven public patches directly depend on the internal suppression layer, including the resource-only side-by-side selection path.
- [x] Each public patch applied alone to the official ARM32 APK with zero failed patches.
- [x] A current-bundle side-by-side-only ARM32 output has no package-install permission, an immediate-return update method, and an About-page branch that bypasses both update controls.
- [x] Final all-patch ARM32, ARM64, x86_64, and universal outputs pass the same three structural checks.
- [x] On the TV AVD, Privacy Policy is the first native About action after the version and neither update control appears in the rendered hierarchy.
