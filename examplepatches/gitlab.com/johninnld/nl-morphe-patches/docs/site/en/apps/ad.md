# AD

**App version:** 9.22.0 · **Build:** 9220000 · **Original file:** APKS

[Download original app](https://buzzheavier.com/mqhxrgsf0wdu){ .md-button .md-button--primary }

Select the exact original file in Morphe Manager. Use the complete archive for a split app.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Android Auto nieuws** | On | Makes Nieuws the primary Android Auto tab and lists the headlines with publisher-supplied spoken audio that the app itself renders. |
| **Disable tracking** | On | Stops the supported optional usage statistics, advertising identifiers and diagnostics. |
| **Hide Premium banner** | On | Hides automatic subscription offers and Premium promotions. |
| **Hide ads** | On | Removes supported ads in feeds, articles, videos and games. |
| **Read full articles** | On | Displays complete article text when the publisher supplies it. Does not create a subscription. |
| **Skip consent screens** | On | Skips automatic consent, login and notification setup. Starts with guest reading and notifications off; manual settings remain. |

## Android Auto nieuws

The car interface's first browse tab is now **Nieuws**: a running list of the latest headlines that the publisher supplies spoken audio for — the audio bundles the phone app itself renders on its front page. Rows use the app's own car styling and play through the app's existing article audio player. The former Start tab's server content is replaced entirely by this feed; if no audio bundles have been seen yet, the tab stays empty and fills in as the app refreshes its front page.

Every row keeps the whole feed available inside the app: selecting a headline restores the complete ordered queue before playback, so Next, Previous and Up next follow the entire feed through the app's own player. Articles behind the paywall keep the app's normal entitlement and playback policy: they play for subscribers and stay gated for everyone else. Refreshing the front page does not reorder the queue that is playing; choosing an article from a refreshed feed starts that new sequence.

## Advertising and tracking services

The ad and tracking controls cover the supported optional activity from: Snowplow, Comscore, Firebase, Piano/Cxense, Usabilla; publisher measurement.

Blocking measurement does not block every function from the same provider. Essential app services can still connect.

## Before using

Article availability depends on what the publisher supplies. No account, purchase or subscription is created. Accounts, push and media services remain online.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
