# v1.10.2-dev.3 development sources

This directory applies new source changes on a disposable copy of the published v1.10.1 smali payload. The v1.10.1 source and official release assets remain unchanged.

Changes: tab scroll restoration, app return policy, vertical gesture threshold, local playlist actions, back navigation and confirmation, settings order, live summaries and version synchronization.

In development builds only, Settings > Debug includes a read-only storage inventory with a TXT export containing directory totals and file extensions/sizes, never file contents or filenames. Data deletion is not offered until the source of storage growth has been verified.

Build requires JDK 21, Android SDK and configured Morphe dependencies. Run the normal Gradle task `:patches:buildAndroid`; the overlay assembles a copy of the canonical baseline and verifies required hooks.

Aggressive whole-program shrinking is intentionally postponed because many methods/classes are invoked through reflection. The overlay removes known redundant instructions, with package sizes measured by the build report.
