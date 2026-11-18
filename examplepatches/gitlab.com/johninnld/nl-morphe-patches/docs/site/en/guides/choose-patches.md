# Choose patches

Patch names match the options in Morphe Manager. Start with the defaults on your [app page](../apps/index.md), then change the options you need.

| Option | What to expect |
| --- | --- |
| Hide ads | Removes the supported advertisements for that app. |
| Disable tracking | Stops the supported optional measurements and identifiers. Necessary online services remain. |
| Skip consent screens | Skips supported automatic prompts. Some apps reject optional consent; others leave choices unchanged. Read the app page. |
| Hide Premium banner / Hide Pro notices | Hides the listed offers and labels. |
| Fix Google services / Fix Google Maps / Fix PairIP startup | Keeps supported features working after patching. Leave these enabled when selected by Manager. |
| Read full articles / Unlock Plus / Unlock Pro / Unlock Premium playback | Changes the reading, playback or local features described on the app page. It does not create a purchase or subscription. |

## Choices that affect features {#two-choices-that-deserve-attention}

- **Buienradar:** the optional Swrve/location patch also disables all weather push alerts.
- **RTL Nieuws:** the Swrve expert patch disables push. Standard tracking protection keeps push available.
- **Flitsmeister:** Disable partner services removes Parking, Toll and Carwash. Navigation still uses live location services.
- **Marktplaats:** disabling ThreatMetrix may affect protected login or checkout.
- **De Tijd:** Hide Mijn Tijd is optional. Hiding the service banner also hides notices displayed there.
- **De Morgen and Humo:** tracking protection stops cross-device queue/playback-state sharing.
- **Podimo:** use both playback patches together. The service still decides availability.

Manager may select required patches together. To remove one, also deselect any option that requires it. Skipping notification setup can leave alerts off until you enable them manually.

Tracking protection does not guarantee anonymity or an app with no network traffic. See the app page for its scope.
