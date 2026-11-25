# WuPlay Mobile

**App version:** 0.1.9-alpha · **Build:** 9 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the original WuPlay Mobile APK in Morphe Manager and enable **Add Gearslip car interface**.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Add Gearslip car interface** | Off | Adds Home poster carousels, season/episode shelves and automatic source selection within 10 Mbps, using your selected profile and native playback controls. |

## Advertising and tracking services

WuPlay's own services and your configured add-ons remain in use. This patch does not add advertising or tracking controls.

## Before using

Set up or import your WuPlay profile and configure its add-ons on the phone first. In DriveDeck, open **Wuplay** to start directly with the catalog rows configured on your profile’s Home screen, in their exact order. The screen has no Home/Catalogs tabs, profile heading or permanent refresh button. Catalog changes are picked up automatically. Older Gearslip retains its compatibility navigation wrapper. Open a film for its artwork, summary and **Play · ≤10 Mbps** button. Series open season shelves with episode thumbnails and titles; select an episode to play it. **Sources** offers eligible alternatives. Protected profiles require their normal PIN. Changing profiles or disconnecting the car ends the car playback session.

**Play** chooses a direct stream automatically from your enabled add-ons, preferring your configured autoplay add-on among eligible sources. It tries at most three eligible sources if playback fails while its player page remains open. This does not start videos merely by opening Home or automatically advance to the next episode.

The car interface excludes sources above 10 Mbps and sources whose bitrate cannot be established. File-size/runtime rates are estimates of the average bitrate, rather than a limit on instantaneous network transfer; adaptive selection also caps video/audio tracks. If nothing qualifies, the interface reports **No suitable stream within 10 Mbps**. It does not silently use a higher bitrate. Episode estimates require that episode’s runtime. Missing runtime metadata can therefore reduce the available sources.

Home loads four catalog shelves at a time, with twelve preview posters per shelf. Use **More catalogs**, **More titles** and **More episodes** to reach the rest. Refresh Home to reload catalog contents. Missing artwork gets a placeholder; older hosts retain list browsing.

Video uses a separate car display; the phone does not need to show the video. Root, Shizuku and phone-screen sharing are not required. Gearslip handles the car connection and audio routing. Use Bluetooth audio or Gearslip's ordinary audio-sharing option.

Requires Android 12 or later and Gearslip; validation uses Gearslip **0.3.31-alpha**. This interface does not add video support to Google's Android Auto. Use video while parked. Direct video streams and text captions use WuPlay's existing player and add-ons; external-player entries remain external.

Gearslip is recognized by its installed package name, including Morphe-patched builds with a different signing key.

Keep your profile recovery key before changing installations. Installing with a different signature can require removing the original app; import your profile again if needed. The Android TV APK is a separate target and cannot be used for this patch.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
