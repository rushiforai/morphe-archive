# Kizu Twitch Patches

Morphe-compatible patches for the Twitch Android app, maintained for Kizu's Twitch enhancements.

This repository contains **Twitch patches only**. It does not contain the Boost for Reddit / Random NSFW patches or any other Reddit patches.

## Included patches

The current project is being rebuilt incrementally from the known-good `twitch-uyu-settings-shell` implementation. The initial goal is to restore a clean, verifiable Twitch patch bundle before adding or changing features.

Planned Twitch functionality includes:

- Kizu Twitch Enhancement
- Third-party emotes
- Emote picker and autocomplete support
- Privacy controls
- UYU/Kizu settings integration
- Twitch ad and promotion handling
- Login and notification compatibility fixes

Some implementation components are dependencies of the main Twitch patch and are not necessarily separate user-selectable patches.

## Add to Morphe

Add this repository as a remote patch source in Morphe Manager:

`github.com/K8R8TO/kizu-morphe-patches`

Morphe supports GitHub repository patch sources and can keep them updated automatically.

## Building locally

Build the Android patch bundle with:

```bash
./gradlew buildAndroid
```

The generated `.mpp` bundle is written to `patches/build/libs/`.

## License

This project follows the license and additional conditions included in the repository's `LICENSE` and `NOTICE` files.


<!-- Kizu feature-chain build verification -->


<!-- settings package fix -->


<!-- runtime trigger -->
