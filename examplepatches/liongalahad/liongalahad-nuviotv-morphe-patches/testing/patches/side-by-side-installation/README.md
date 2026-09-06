# Side-by-side installation

Patch ID: `side-by-side-installation`. Target: official NuvioTV `0.9.0-beta` universal and ABI-specific builds.

This patch is selected by default in Morphe Manager. It changes the patched app's Android package from `com.nuvio.tv` to `com.nuvio.morphe` and its launcher label to `Nuvio Morphe`, allowing it to install beside the official NuvioTV app. Deselecting the patch retains the existing replacement-install behavior.

The transformation runs after all other selected resource patches. It renames Nuvio's app-defined permission and every provider authority, including authorities registered by other Morphe patches, so Android does not reject the second installation for a shared authority. Application, activity, service, receiver, and provider implementation class names remain under `com.nuvio.tv`; changing those names would break class loading.

Android treats `com.nuvio.morphe` as a separate app. It therefore has separate preferences, account state, app data, and permission grants. No preference or storage permission is copied from the official installation. Shared external files remain visible only when both apps independently have the required access.

The patch owns no runtime setting or extension code. Its entire behavior is contained in its final manifest transformation, structural tests, manifest inspection, and this documentation compartment.
