# Location: a forecast request and a movement record

Checking tomorrow's weather for Groningen tells a server which place you selected. It does not prove that you are there. Repeatedly uploading your phone's current GPS coordinates gives different information. With times, speed and direction of travel, those coordinates can describe your movement much more closely.

## Ask these questions about a location field

- Did you select a place, or did the app read your phone's position?
- Is the value a town, rounded position or precise coordinates?
- Does the app send it once when you request a service, or repeatedly in the background?
- Is it attached to a persistent installation, session or account identifier?
- Is the purpose a forecast, navigation, warning, analytics or marketing?

## What we found

The inspected code in [Buienradar](../apps/buienradar.md) includes a background upload with latitude, longitude and the Swrve user ID. The default tracking patch keeps this working. A separate option stops the upload and also disables weather alerts.

In the inspected [Flitsmeister](../apps/flitsmeister.md) code, the FCD component collects GPS data in batches with timing, speed, direction of travel and session identifiers. The tracking patch prevents this component from starting and stops its timer and upload. Live location exchange for CITS traffic warnings keeps working. The app page describes these different functions separately.

These findings apply to the parts inspected in the app audits. Location permission alone does not tell you which of these fields an app sends.

## What can remain after patching?

Maps and routing may still need requests containing location data. Weather alerts may require the app to register for notifications and send the places you selected. A server normally also sees the IP address of the connection reaching it. Services that keep running can therefore still receive data after you disable optional analytics.

The app pages say which exchanges remain and which requests still have an uncertain purpose. Do not assume from a patch name that location data never leaves your phone. [Evidence and limits](../reference/methodology.md).
