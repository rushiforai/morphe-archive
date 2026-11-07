# Boost 1.14.x checks

The isolated identity supports 1.14.2 and 1.14.3. Build with
`CATPPUCCIN_BOOST_TEST=1` and apply **Boost isolated test identity** alongside
**Catppuccin theme**. Use original APKs; 1.14.3 was checked with Patcheddit
2.1.0-dev.5. The test app has separate storage and account registration.

`LinkProbe` is included only in test builds. Launch it through ADB:

```sh
adb shell am start -n com.rubenmayayo.reddit.catppuccin.test/app.morphe.extension.boost.LinkProbe
adb shell am force-stop com.rubenmayayo.reddit.catppuccin.test
adb shell am start -n com.rubenmayayo.reddit.catppuccin.test/app.morphe.extension.boost.LinkProbe --ez check-persistence true
adb logcat -d -s CatppuccinLinkProbe:I
```

The probe selects Macchiato in the test app and checks blue unvisited links,
grey visited links, rebinding, spoiler preservation, and persistence across
process restarts. Pass `--ei theme 17` to repeat in Latte. Also open the actual
feed, a comment thread, and the image viewer: successful patching and DEX
compilation alone do not prove every hooked class can load.

For 1.14.3, ThemeUtils moved from `k83` to `n83`, the drawer from `xj0` to
`uj0`, DownloadMediaActivity from `di0` to `ai0`, and Utils from `jk3` to
`kk3`. The text-panel helper moved from `M(Context, View)` to `O(Context,
View)`; verify its full signature before injecting. Account-pattern loading
uses `ha1` instead of `ia1`. Upstream canonical bindings are bundled in the
Patcheddit MPP at `boost/bindings.json`.
