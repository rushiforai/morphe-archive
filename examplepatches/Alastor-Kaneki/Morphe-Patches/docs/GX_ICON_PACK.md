# Opera GX — GX icon pack

`GX icon pack` is a standalone Morphe patch for Opera GX Android (`com.opera.gx`). It is not merged with and does not depend on `Download GX mods as files`.

## Included launcher icons

The patch includes all 56 launcher icons declared by Opera Software's public GX Icon Pack v1.7:

- Basic: 17
- Holo: 13
- Holo GX: 13
- Neon: 13

The build fetches the official pack from GX Store, verifies its name, author, pinned version, CRX container, manifest, icon count, groups, and PNG payload, then packages only the launcher icons into the `.mpp` bundle.

## How it works

The patch preserves Opera GX's original launcher component and moves its launcher intent to Android activity aliases:

- one alias retains the original Opera GX icon;
- 56 aliases expose the selectable GX icon artwork;
- only one alias is enabled at a time;
- switching icons uses Android's `PackageManager` and does not create fake pinned shortcuts.

A native **GX Icon Pack** selector is injected into the patched app. Android 7.1 and newer also receive a dynamic long-press shortcut so the selector can be reopened from the Opera GX launcher icon.

Some launchers cache icons. After choosing an icon, the home screen may take several seconds to refresh.

## Patch separation

The automated test fails if either patch acquires a dependency on the other:

- `GX icon pack`
- `Download GX mods as files`

Users may select either patch alone, both patches, or neither patch in Morphe.

## Scope

This Android patch applies the pack's `app_icon` payload to Opera GX Mobile. The desktop GX sidebar/top-bar Lottie `image_overrides` are not applied because Opera GX Android does not expose the desktop image-override runtime or matching UI components.
