# Random Episode

Patch ID: `random-episode`.

Adds `Morphe > Detail Page > Show Random Episode Button`, defaulting to OFF in private `morphe_patches` storage. When enabled, a shuffle action appears on series detail pages that contain at least one aired episode outside season zero.

The selected episode uses Nuvio's existing autoplay, source-selection and long-press manual-selection flows. During the random session, saved progress is neither loaded nor written, tracking providers are not scrobbled, and Next Episode selects another eligible random episode. Movies, specials, invalid episode coordinates, future releases and normal playback are unchanged.

## Credit

The original Random Episode settings and feature implementation were created by [**DeclanSC**](https://github.com/DeclanSC). This Morphe patch ports that work to NuvioTV 0.8.2-beta's current binary structure.
