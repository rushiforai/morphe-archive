# Choose what changes in your app

Each option changes a different behaviour. Hiding an element on screen and stopping its network request require different changes.

| Patch name | What to expect |
| --- | --- |
| Hide ads | Stops the advertising code paths identified for that app and removes the associated ads from the screen. Other analytics services may still run. |
| Disable tracking | Suppresses the identified data collection, use of identifiers and uploads. Read the app's exceptions, especially for location, push notifications and coordinating playback. |
| Skip consent screens | Skips supported automatic privacy prompts, with the required privacy controls included. The patch does not automatically record acceptance or rejection. You can still change privacy settings yourself. |
| Hide Premium banner / Hide Pro notices | Removes the specified promotions or labels from the screen. |
| Fix Google services / Fix Google Maps / Fix PairIP startup | Helps specific supported apps work after they have been modified and signed again. |
| Read full articles / Unlock Plus / Unlock Pro | See the app page for the specific changes. These patches do not create a purchase and cannot provide data the server does not send. |

## Choices that affect features {#two-choices-that-deserve-attention}

In Buienradar, the ordinary tracking patch keeps Swrve running because weather alerts use it. The separate Disable Swrve and location upload patch also stops those alerts. [Read the tradeoff](../apps/buienradar.md).

In Flitsmeister, Disable partner services removes the Parking, Toll and Carwash entries, including their settings. Live CITS location exchange remains enabled. All six options are enabled by default in the reviewed stable release. [Read what remains](../apps/flitsmeister.md).

In RTL Nieuws, the standard controls stop native ads, promotional campaigns and the inspected measurements while keeping push and manual settings available. Leave Disable Swrve (expert) off if you want to keep push. This extra control is disabled by default and stops the remaining Swrve activity, but also disables push notifications and Swrve channel synchronisation. [Compare the controls](../apps/rtl-nieuws.md).

In [Omroep Brabant](../apps/omroep-brabant.md), Skip consent screens also removes **Cookie instellingen** from the menu and prevents the cookie dialog. It leaves saved choices unchanged and keeps manual Android notification settings available. Enable notifications there yourself if needed.

Read the exceptions on the app page to understand the protection you get. "Disable tracking" applies to the parts of the app described there. It does not guarantee that you can use the app anonymously. [Why retained traffic matters](../learn/location.md).
