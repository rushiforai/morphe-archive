Wongnai ad fix v1.0.0

Target: com.wongnai.android 12.11.0 only.
Morphe patch: Disable Wongnai Google ads.

Import this MPP as a local patch bundle, select the original Wongnai 12.11.0
XAPK and enable this patch. It can be used by itself; it already includes the
identified banner, native and interstitial request loaders. The existing
Adobo hosts patch is not required for these six code changes.

This patch checks all five exact Google ad-loader signatures and both photo
entry/fallback signatures before editing. It stops the five request methods
and redirects the photo-ad entry to Wongnai's existing fallback with false.
It refuses other package names/versions or an unexpected method layout.

The original generic Adobo 1.7.0 run reported Google AdMob partially disabled;
its banner/native fingerprints missed the app's obfuscated SDK methods.

Validation: compiled Java + Android DEX. The build and resulting APK are
checked separately for all six changed method bodies. No on-device test has
been performed. Other ad slots may leave empty space; first-party sponsored
restaurant content is outside this patch's scope.

Source is included under source/local/wongnai/patches/WongnaiAdPatch.java.
Build with JDK21 javac --release 8 against the Morphe Desktop 1.19.1 jar, then
D8 --release --min-api 26 with the same jar as classpath. Package classfiles
and classes.dex together with this manifest into an MPP ZIP.
