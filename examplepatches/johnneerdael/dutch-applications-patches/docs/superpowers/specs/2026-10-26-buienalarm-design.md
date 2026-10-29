# Buienalarm patches

Build a separate local Morphe bundle for `org.yoki.android.buienalarm` 4.32.0 (3723), Android 8 or newer, using the supplied APK. Provide two independently selectable patches.

1. **Hide ads:** make MPBannerOptions' enabled query return false from first use, take the existing ad-disabled branches in MainActivity and the weather fragment, and hide both banner containers. This prevents the observed PubMatic/Google banner creation and the separate weather ad setup. Change the local ad decisions without changing subscription state.
2. **Hide Premium banner:** set the existing Settings preference's `app:isPreferenceVisible` attribute to false. Keep the preference object because setup code still accesses it.

Use stable class/method names and method references for the ad fingerprints, deriving obfuscated weather-class and register names at patch time. Require exactly two ad decision methods and fail if the expected instruction structure changes. Resource edits must also match exactly once.

Build an MPP containing JVM classes and Android DEX. Use the official template Gradle plugin with the supplied local read:packages PAT. Use a checksum-pinned official Morphe Desktop distribution for validation. Keep credentials and downloaded tooling out of Git.

Validate both patches together and individually against the real APK. Inspect the emitted resources and DEX, check the resulting APK signature, and retain a reproducible verification command. Device UI and network behavior require a suitable Android runtime; static patch success alone does not prove them. Do not install on the connected television.
