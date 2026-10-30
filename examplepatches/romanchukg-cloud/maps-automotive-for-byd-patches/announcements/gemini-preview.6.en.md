✨ Gemini in Maps Automotive for BYD — Morphe preview 6 (TEST)

Talk to Gemini over the map: choose Conversation or Microphone and start it with one tap. On the tested Tang, holding the steering-wheel microphone does the same. Ask for a destination and open the route in Maps Automotive.

One Morphe bundle now includes our Maps patch and the optional Google app patch. Sign both outputs with the same key. Maps still works without Gemini.

Gemini setup: Android API 32+, the supported Google 17.62.11 original, MicroG-RE 7.2.2+ and a separate Google sign-in. Give MicroG-RE Contacts/Location and Google Microphone access.

BYD: General → Apps → Disable Self-Start → Google = OFF.
Maps: Compact assistant + Automatic compact recovery = ON. Approve local ADB once with Always allow; no computer is needed afterwards.

Tested on one Tang/DiLink 5.0. DiLink 3/API 29 is not supported by this Google build. Morphe Manager 2.0.0 on Android API 32 passed build/install, sign-in and a Gemini chat request. Compact/route on its merged Google output and the final car reboot remain untested. Same-key Maps updates keep data; replacing a differently signed Google app resets its local settings.

Patch download:
https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/download/morphe-preview.6/maps-automotive-for-byd-morphe-preview.6.mpp
Release notes:
https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/tag/morphe-preview.6
Quick setup:
https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/blob/main/GEMINI-SETUP.en.md
MicroG-RE:
https://github.com/MorpheApp/MicroG-RE/releases
