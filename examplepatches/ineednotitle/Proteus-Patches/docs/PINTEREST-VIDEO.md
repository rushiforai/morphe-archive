# Pinterest video download (experimental)

`Enable media downloads` alone changes an **image** eligibility flag. Enable the
separate **Enable video download** patch to add the video path; it depends on the
image eligibility patch. The video patch is default off while its compatibility
with Pinterest 14.41.0 is unverified on a device.

The patch locates video model getters and menu handlers by their structure and
serialized field names. If the expected structures are missing or inaccessible,
it fails rather than guessing at an obfuscated method. For a recognized video Pin,
the hook tries a direct HTTPS MP4 on Pinterest's `pinimg.com` CDN and uses Android's
Download Manager to save it under Movies/Pinterest. For an HLS-only URL it checks
a possible 720p MP4 first. If no suitable MP4 is available, it reports that instead
of quietly downloading the cover image. HLS playlists, DASH, DRM, private media,
and multi-page video export are not guaranteed; a multi-page Pin currently saves
only the first supported video. Ordinary image Pins continue through Pinterest's
own image downloader.

Video detection and download-hook design are adapted from the GPL-3.0-licensed
[archivesteak/Quest Pinterest patches](https://github.com/archivesteak/Quest),
revision `64a9275fb2f27062d7fc2a170200cd73f6afc888` (targeted at Pinterest
14.39.0). No claim of 14.41.0 compatibility or Android runtime success is made
until the actual APK is patched and tested. URL-selection unit tests can be run
with `bash .github/scripts/test_pinterest_video_urls.sh` (JDK required).
