# SharkLatan AirPlay 0.1.0

Native AirPlay integration for the original YouTube 21.30.216 APK (`com.google.android.youtube`), applied in one run alongside the official Morphe YouTube patches, including Spoof video streams.

Fixes:
- Declares the original input package instead of the post-patch Morphe package.
- Applies playback hooks after all selected patches have executed, preserving shared mutable method objects used by other patch finalizers.
- Uses the timestamp format accepted by Morphe source metadata.
- Provides English package information and documentation.

Includes native playback controls, receiver volume, thumbnail display, autoplay and local playback recovery. Seeking may reopen the receiver session. Tested receiver: Hisense 50A6NU. Additional YouTube versions will be supported after their adaptations are completed and tested.

Keep your signing keystore in Morphe to retain APK update compatibility.
