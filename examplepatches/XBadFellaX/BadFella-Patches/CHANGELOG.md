## 1.1.0 (2026-11-06)

### ✨ New Features

* support reviewed patch targets without version pins 05fa478
* **wanderlog:** make dark mode follow the device theme aa6b1a8
* **wanderlog:** make the theme follow the device dark-mode setting 4cc8368

# BadFella Patches

## 1.2.0-dev.2

### ✨ New Features

* **Wanderlog:** make the theme follow the device dark-mode setting 4cc8368

Wanderlog 2.227. The dark-mode provider's value is gated on a Pro check that
stays false for non-subscribers, so the previous preview never rendered the
dark theme. The patch now runs the preference evaluation regardless of that
gate and treats the light preference as the system setting: the app is dark
when the phone is dark and light when it is light. Export to Google Maps runs
on Wanderlog's servers and is not granted by the patch. Installation: enable
pre-releases for BadFella Patches in Morphe Manager, refresh the source, and
re-patch the original stock APKM.

## 1.2.0-dev.1

### ✨ New Features

* **Wanderlog:** make dark mode follow the device theme aa6b1a8

Wanderlog 2.227. The app's dark mode entry is Pro-only and the theme
preference is set by Wanderlog's servers on subscription; the patch now makes
the app theme follow the device dark-mode setting. Export to Google Maps runs
on Wanderlog's servers and is not granted by the patch. Installation: enable
pre-releases for BadFella Patches in Morphe Manager, refresh the source, and
re-patch the original stock APKM.

## 1.0.0

TickTick, Emby, Remote for Android TV, Pep Talk and Wanderlog patches.
