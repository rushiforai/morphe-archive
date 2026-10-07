# Recovered helper sources

These smali sources are the reviewed class overrides from the device-tested 1.7.0-dev.11 payload. The release build compiles the existing Java sources, assembles these overrides with smali 2.5.2, and gives the overrides precedence in NicoidDexMerger. This prevents older Java sources from silently reverting the validated behavior. Support classes and all other generated Java classes retain the existing merge behavior.

Edit the corresponding smali for a class listed here. To migrate a class back to Java, update the Java implementation, remove its corresponding smali (including obsolete nested classes), and validate the resulting DEX. `@NICOID_PATCH_VERSION@` is replaced with the Gradle release version before assembly.

Native-app method replacements remain in `patches/src/main/resources/nicoid/method-delta.dex`, as in the existing payload workflow. The bundled resource archive and method delta were copied without changes from the validated dev.11 bundle. Series-display/extra-fetch entry points are disabled in VideoExtras.
