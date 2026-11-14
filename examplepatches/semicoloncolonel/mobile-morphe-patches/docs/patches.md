# What the patches do

Everything runs on the device, inside the patched app. The patches do not send data anywhere. [Supported apps](apps.md) lists which patches each app has, and [Known issues](known-issues.md) lists what does not work yet.

**Contents:** [Ads](#ads) · [Pop-ups and prompts](#pop-ups-and-prompts) · [AI features](#ai-features) · [Privacy](#privacy) · [Playback](#playback) · [Sign-in and startup](#sign-in-and-startup) · [Needed for the app to run](#needed-for-the-app-to-run) · [Extra features](#extra-features)

## Ads

**Skip ads** removes the ads in videos and in the app. Ads that are part of a live broadcast still play, except on NBA.

<details>
<summary>What Skip ads removes in each app</summary>

- ABC News: ads in on-demand videos and the feeds, and the Taboola banner in articles.
- AMC+: stitched-in breaks, including the interactive true[X] and Brightline ads.
- AP News: ad and sponsored rows in the feed and articles, the sticky banner, "Sponsored by" rows, and ads before videos.
- Apple TV: ad interstitials in on-demand videos, and promos delivered the same way.
- CBS News: banner ads, ads in videos and recordings, and Taboola recommendations under articles.
- CNBC: banner and in-feed ads, the ad slots in articles, and the ad breaks in on-demand videos, which are skipped as each one starts. Ads in the live TV stream are part of the broadcast and still play.
- CNN: banner and sponsored-content ads, and ads in videos and clips. All Access streaming is not changed.
- C-SPAN Now: the pre-roll before archive and on-demand videos. Ads in the live channels are stitched into the stream and still play.
- ESPN: scheduled breaks and on-demand mid-rolls.
- Fox Local: ads in on-demand videos, articles, and live blogs, the splash ad, and Taboola recommendations.
- Fox News: banner, feed, sponsored, and full-screen ads, and ad breaks in videos.
- Fox One: ads in on-demand videos. On live TV, the ad tracking and the limits on skipping ahead during breaks.
- Hulu: ads in on-demand videos. Live TV is not changed.
- MLB: ads before on-demand videos (highlights and classic games). Live-game ads are covered by Mask live ad breaks.
- NBA: ads in videos, games, NBA TV, and article videos.
- NBC News: ads in videos, and display ads on the home and section pages.
- NewsBreak: ads in the feed, the app-open and full-screen ads, and the ads in articles and local-alert pages.
- NewsNation: the banner, native, and full-screen ads, Teads video ads in articles, Taboola recommendations, Nativo sponsored cards, and the pre-roll before videos. Ads in the live channels are not affected.
- NewsNation (Android TV): the video ads before clips. Ads in the live channels are not affected.
- NFL: ads in clips and highlights, including the clips on article pages. The banner ads on article pages are not affected.
- NPR: sponsor banners in the feed, the ad spaces in stories that open as web pages, and ads before videos. Sponsor credits read in podcasts and the live stream are part of the audio and still play.
- Paramount+: ads in videos. Live sports breaks show Paramount's "Commercial in Progress" card.
- PBS: sponsor messages before and during videos.
- Plex: ads in on-demand titles, and pause ads. Live TV is not changed.
- Pluto TV: on-demand ads. Live breaks are covered by Mask live ad breaks.
- Prime Video: every ad break. Titles play in the older player, so features of the newer one, such as X-Ray, are not available.
- The Daily Wire: the banner ads and their "Advertisement" slots, including the one pinned to the top of articles, and the pre-roll before videos. Members-only content stays locked.
- Truth Social: sponsored Truths, boosted posts (paid promotions marked "Boosted"), the other ads placed in the feeds, Google ads, the top banner ad, and the ad on a post's detail page.
- USA TODAY: the ads in the section fronts, articles, galleries, and videos, Taboola recommendations, and the ad-free upsells. It turns on the app's own ad-free mode, so premium articles stay locked and Settings may show you as ad-free.
- Xumo Play: pre-roll and mid-roll ads in on-demand videos. Live breaks are covered by Mask live ad breaks.
- YouTube TV: ads inserted into on-demand videos and DVR recordings, and overlay and pause ads. With Mask live ad breaks, the ads YouTube TV inserts into live breaks are covered instead.

- Yahoo News: the Taboola ad rows in the feeds, the ad slots in articles, and the ads before videos. The video player is also told that you opt out of ads, so it stops sending your device ID.
- Yahoo Finance: the ads on Home, Markets, quote pages, and in news, including the Taboola stream ads, and the ads in videos. Each ad slot is told its ad failed, so it shows nothing. The video player is also told that you opt out of ads, so it stops sending your device ID. Ads inside article web pages are hidden, and the space they held closes up.
</details>

**Block ads** (Checkout 51, DealNews, Flipp, JustWatch, Moviebase, Slickdeals, T-Mobile Play, and Visible) removes the ads and stops the ad networks from starting. On Checkout 51, it removes the full-screen ad shown on launch and the Google ads in the offer list, search, and highlights. On DealNews, it removes the ad banner from deal pages. On Slickdeals, it removes the ads in every feed and on deal pages, sponsored carousels, and deals marked Promoted. On Flipp, it removes the ad slots from the home feed, the ad among search results, and the ads at the top, middle, and bottom of a flyer. The flyers themselves are not affected. On the JustWatch phone app, the banner spaces and their "Remove Ads" links are removed too. The JustWatch Android TV app shows only video ads, before and during free streams, and those are removed. On Visible, it also stops Madme, which shows ads over other apps, after calls, when you unlock the phone, and as notifications.

**Mask live ad breaks** (ABC News, Pluto TV, Xumo Play, and YouTube TV) and **Mask ads** (Fandango at Home) cover ads that cannot be removed with a "We'll be right back!" screen and mute them until the break ends. Live ads are part of the broadcast, and Fandango streams a free title only after its ads play. On ABC News, the cover counts down the break. On YouTube TV, it covers only the ads YouTube TV inserts into a live break. The commercials built into the channel's own broadcast are not covered and still play.

On SiriusXM, Mask live ad breaks mutes the live talk, news, and sports channels during each commercial that SiriusXM labels as an ad, and the player shows "Ad - 🔇 Commercial break" in place of the advertiser's name. The sound comes back when the show returns. Its **Also mute promos and PSAs** option, off by default, also mutes SiriusXM's own channel promos and public service announcements, which SiriusXM does not label as ads. They show as "🔇 Announcement". Ads in podcasts are part of each episode's audio file, so they still play.

> [!TIP]
> To turn off Mask live ad breaks on Pluto TV without patching again, create a file named `slate_off` in `Android/data/tv.pluto.android/files`. A file named `pluto_slate_mode` that contains `black` or `mute` keeps only the cover or only the muting.

### Sponsored content

| Patch | App | What it does |
|-------|-----|--------------|
| Hide sponsored content | Plex | Removes sponsored titles from the rows on Home and Discover, the large sponsored card at the top of each screen, and promoted "Watch Now on" cards. The items are removed from the feed, so no empty space is left behind. |
| Hide sponsored listings | Amazon Shopping, Best Buy, CVS, Lowe's, Target, The Home Depot, Walmart | Removes sponsored products from search results, and on Amazon, CVS, and Lowe's, from product pages. On Walmart, it also turns off sponsored carousels, banners, and video. Best Buy's "Featured products" row and The Home Depot's home page still show sponsored products. |
| Hide sponsored products | Costco | Removes the sponsored products and ad placements from the home page, search results, and category pages. The app no longer asks Costco's server for them, so no empty space is left behind. |
| Hide sponsored products | Walgreens | Turns off the sponsored product carousels, the ad banners, and the partner offers after checkout. |
| Hide sponsored titles | JustWatch | Removes sponsored title cards and the sponsored trailers before videos. |
| Hide card offers | Walmart | Removes the banners and prompts for the OnePay debit card, the OnePay and Capital One credit cards, and OnePay Later: on item pages, in the cart and checkout, on the thank-you page, in the wallet, and in the department chips. Paying with OnePay or a linked card is unchanged. |
| Strip affiliate links | Checkout 51 (off by default), DealNews, DealSeek, Flipp, RetailMeNot (off by default), Slickdeals | Opens each deal at the store's own page, without affiliate tags or click tracking. Links you share or copy from the app are cleaned the same way. When a deal site hides the store behind its own click tracker, as DealNews does, the app reads that one redirect without cookies, so the site still counts the click but the affiliate network is skipped. On Checkout 51 and RetailMeNot, cash back depends on the affiliate link, so this patch stops cash back. |

## Pop-ups and prompts

| Patch | App | What it hides |
|-------|-----|---------------|
| Hide rating prompt | Every app except Apple TV, CNBC, Kanopy, NewsBreak, Recreation.gov, and USA TODAY, whose own Hide rating prompt includes it | Google Play's rate-this-app sheet. The app carries on as it does when Play decides not to show the sheet. Apps that rename Google's review code, such as Tubi and myAT&T, still show it. |
| Hide donate button | AP News | The Donate link on Top Stories and the "Donate now" card on the account screen. Your account is not changed. |
| Hide rating prompt | Apple TV | The "Enjoying Apple TV?" prompt that asks for a review. |
| Hide rating prompt (Android TV) | Apple TV (Android TV) | The Google Play review prompt. |
| Hide surveys | CBS News | Qualtrics surveys and the rate-the-app prompt they can lead to. |
| Hide surveys | RetailMeNot | The in-app survey card. |
| Hide newsletter pop-ups | CNBC | The newsletter sign-up bars that slide in over articles and ask for your email address. |
| Hide premium promotions | CNBC | The "Premium Content" subscription card and its "Latest Episodes" heading on show pages, so a show's page starts with its free clips. The card to sign in with a TV provider stays. |
| Hide rating prompt | CNBC | The Play Store rating request. |
| Hide rating prompt | Kanopy | The "Enjoying Kanopy?" dialog and the Play Store rating request, which appear after three plays and again every 120 days. |
| Hide survey | Kanopy | The "Take Our Survey" row on the More tab. |
| Hide promo banners | C-SPAN Now | C-SPAN's own program promos, such as the "America's Book Club" banner, above the video player and on the Watch tab. |
| Hide editor articles | DealSeek | The "From our editors" card on deal pages, which links to DealSeek's own articles about the product. |
| Hide pop-ups | Checkout 51 | The "Want to see more offers?" sign-up sheet shown to guests, the welcome walkthrough after sign-up, the notification and Instant Offers prompts, the "turn on notifications" banner, the notice about location data shown before it asks for location again, Braze marketing messages, and the card in the offer list that asks you to rate the app. The country picker and the offline banner still show. |
| Show gas offers on OpenStreetMap | Checkout 51 | Google Maps rejects the map key in any patched copy of the app, so the gas maps are blank. This draws OpenStreetMap maps in their place. The gas tab shows a pin for each offer with its cash back, above a list of the offers, nearest first, with the price and cash back per gallon. Tap a pin or an offer to see its details and add it. The details screen shows the station on the map, with a Directions button that opens it in the maps app you choose. Map tiles come from OpenStreetMap's servers, which see your IP address and the area on screen, and are kept on the phone for seven days. |
| Hide pop-ups | DealNews | The rating card and the walkthrough on first launch. The welcome screen that offers sign-in still appears once. |
| Hide pop-ups | DealSeek | The Trustpilot and Play Store review requests, the daily spin-the-wheel pop-up, and the survey that appears when you return from a deal. The app also stops downloading updates to its screens, so it stays on the version you patched. |
| Hide prediction markets | Fox News | Kalshi and Polymarket market widgets in articles and live blogs. |
| Hide prediction markets | The Wall Street Journal | Polymarket odds in story cards. |
| Hide pop-ups and rating prompts | Fox Local | The rate-the-app prompt, the rating card in the feeds, and marketing pop-ups. |
| Hide betting | ESPN | Betting odds, My Bets, the ESPN BET section of the More tab, sportsbook promotions, and DraftKings account linking. |
| Hide betting odds | MLB | The betting-odds section on the scores sheet, its toggle, and its legal disclaimer. |
| Hide surveys and rating prompt | MLB | The Qualtrics surveys and the Play Store rating pop-up they lead to. |
| Hide Premium upsell | Moviebase | The Premium screen that opens on its own at launch and after sign-in. Premium still opens from Settings and the app's buttons. |
| Hide surveys and rating prompt | NBC News | Iterate surveys and the rate-the-app prompt. |
| Hide surveys and rating prompt | Walgreens | Medallia surveys and the rate-the-app dialog on the home screen. |
| Hide creator videos | Walmart | The "Featured in videos" sections from content creators on item pages and the video carousels on the home and membership pages. |
| Hide pop-ups | Walmart | Surveys and review requests after checkout, the "Give feedback" row, tooltips and coach marks, update nudges, sign-in and survey nudges, and the full-screen event splash. |
| Hide pop-ups | Yahoo Finance | The "Enjoying Yahoo Finance?" drawer and the review request after it, the feedback prompts on new screens, announcement sheets, tours and coach marks, tooltips, the widget prompt, and the beta program invitation. Privacy and consent screens still show. |
| Hide pop-ups | Yahoo News | The "rate the app" screen, the banners and cards that ask you to turn on notifications, and the Ask Scout and You tab tooltips. |
| Hide Plus upsells | Yahoo Finance | The Yahoo Finance Plus banners, sheets, and cards, the "Upgrade to Yahoo Finance Premium" card and the "Premium perks" row on Account, the Coinbase "Trade Now" referral button, and the Coinbase referral links in articles. Features that need Plus stay locked and still show the paywall when tapped. |
| Hide reading streaks | Yahoo News | The reading level and day streak on Home and Profile, and the pop-ups that celebrate a new level or a longer streak. Yahoo still counts your reads on its server. |
| Customize bottom bar | Yahoo News (off by default) | Hides the bottom tabs you choose in its options: Trending, Games, Notifications, or Search. Home always stays. |
| Show unreleased features | Yahoo News (off by default) | Turns on the features you choose in its options, which Yahoo has not released to everyone: Follow buttons with a Following feed, the Local news tab (it shows only after you allow the app to use your location), a Video tab, picture-in-picture that keeps playing while you move around the app, and Listen on articles. Listen reads articles with Yahoo Scout's AI voice, so it cannot be used with Disable AI; patching stops with a message if both are on. |
| Hide Walmart+ promotions | Walmart | Walmart+ sign-up banners and their slides in the home carousel, the early-access countdown, free-trial offers, splashes, and the auto-playing membership video. Member benefits and account pages are unchanged. |
| Skip tutorials | Flipp | The sheet after setup, the spotlights on the search bar, the save button, and the Lists tab, and the tutorials in flyers, coupons, and the shopping list. |
| Hide sign-up prompts | Slickdeals | The sign-up flow on first launch, the notification prompt screen, the image tooltip, the "Log in / Sign up" nudges after a number of sessions, deal views, and searches, and the rating prompt. Prompts that answer something you tapped, such as voting on a deal, still appear. |
| Hide My Town intro | NewsBreak | The "Meet My Town" pop-up, the My Town tooltip, and the "new" badge on the tab. |
| Hide Premium upsells | NewsBreak | The "Ad-free Reading" banner and Upgrade button on the Me tab, the Premium button on profiles, the promo on Home, the bottom-bar badge, and the Premium offers in pop-ups and ad dialogs. If you pay for NewsBreak Premium, leave it off: the app stops refreshing your subscription status. |
| Hide rating prompt | NewsBreak | The "How are we doing?" pop-up on the home screen and the Play Store rating request. |
| Hide rating prompt (Android TV) | NewsNation (Android TV) | The "rate this app" dialog. Rating from Settings still works. |
| Hide donate buttons | NPR | The Donate buttons in the top bar, on the live-station module on Home, on station pages, and on a live stream's detail sheet. |
| Hide Waze bar | NPR | Turns off the "Drive with Waze" bar by default. You can turn it back on in the app's settings. |
| Hide rating prompt | Recreation.gov | The rate-the-app prompt after checkout. |
| Hide follow upsell | Substack | The "Follow" upsell card shown under notes in the Notes feed. |
| Hide upsell pop-ups | The New York Times | The full-screen subscription takeover and the promo banner at the top. |
| Hide marketing pop-ups | The Washington Post, The Wall Street Journal | In-app marketing messages, such as subscription offers, and the subscribe banner on The Washington Post's home page. |
| Hide stories | T-Mobile Play | The Storyteller stories and video clips in the feeds. |
| Disable update and review prompts | Truth Social | The Play Store update prompt and the rate-the-app prompt. A patched app cannot update from the Play Store. |
| Hide crypto and prediction markets | Truth Social | Truth Predict, the prediction market run with Crypto.com's US derivatives exchange, and Gems, the rewards that convert to Crypto.com's CRO token. |
| Hide Truth+ | Truth Social | The Truth+ button at the top of the home feeds, the Watch tab, the strip of live Truth+ streams, the live shows row, and the Truth+ banners in the feeds and the side menu. The "+" badges on subscribers' names stay. |
| Hide sign-in prompts | Tubi | The request to sign in when you pause or leave a title. |
| Hide update prompts | Tubi | The request to update the app, which Tubi shows from its own server settings or when Google Play has a newer version. A patched app cannot be updated through Google Play, and the Android TV build asks even when it is current. |
| Hide rating prompt | USA TODAY | The Play Store rating request. |
| Hide subscription prompts | USA TODAY | The "Sale" bar pinned to the bottom of articles, the Subscribe links above Top Stories and in the article toolbar, and the subscription offers that pop up on launch, such as the $1 trial. Sign In stays. |
| Hide promotions | White House | The buttons you choose: "Text President Trump" and "Get in Touch". |
| Hide social feeds | White House | The feeds you choose: Truth Social, X, Instagram, Facebook, LinkedIn, TikTok, YouTube, or the Wire. A hidden feed's tab shows that it could not load. Hiding YouTube also empties the Live tab. |
| Hide membership upsell | YouTube TV | The "Add to membership" shelf on the home screen and in search results, which promotes paid add-on networks. The shelf is removed from the feed, so no empty space is left behind. |
| Hide prompts and promos | YouTube TV | The rate-the-app dialog, promo banners, the app tour, the highlights autoplay prompt, and the "Watch on YouTube" dialog. The last three are hidden only on a fresh install or after you clear the app's data. |

> [!NOTE]
> Push notifications and breaking-news alerts still arrive.
>
> The White House patches let you remove only the parts of the app you do not want. With every option turned on, almost nothing of the app is left.

## AI features

**Disable AI** turns off the app's AI assistant and AI features.

<details>
<summary>What Disable AI turns off in each app</summary>

- Amazon Shopping: the shopping assistant (Rufus, now "Alexa for shopping") in the tabs, search, and camera lens, and the assistant in Amazon Pay. Prompts on Amazon's web pages inside the app can still appear.
- Best Buy: the AI-written review summaries. Ask Blue, Best Buy's assistant, is not covered.
- CVS: AI search in the help center, which also stops the download of Google's on-device AI model, AI insights, AI summaries of visits, lab results, and claims, and proactive AI on pharmacy orders.
- Lowe's: Mylow, the assistant, with its button in the top bar, its store mode, and its dictation, the AI overview above search results, and the AI summary of reviews. Customer service chat is not affected.
- MGM+ (Disable MGM+ AI): the "MGM+ AI" assistant, its "Get Personalized Pick" and "Not sure what to watch?" prompts, and the AI-picks rows on Home.
- myAT&T: Andi, the assistant, and its Fusion AI features: chat history, voice to text, AI search suggestions, citations, and AI cards. The round Andi button and the "Ask Andi" card on Home are removed, and in-app chat with an agent stops too. Phone support is not affected.
- My Verizon: the assistant, its voice mode, and its floating button.
- NBA (Disable Ask NBA AI): the Ask NBA button on every screen and its tile on the Discover tab.
- NewsBreak (Disable NewsBreak AI): Nia, the AI chat in the toolbar, home channel, profile, and search, and Scout, the reading assistant in articles. Hide AI summaries, which is off by default, also hides the AI-written summary card on crime and local-alert pages. That card is the incident description, so the page keeps only its title and transcript.
- Prime Video: Alexa+, its chat button, and its companion mode.
- Target: Ask Target, AI mode in search, the AI gift finder, the AI shopping list scanner, and AI replies in support chat. AI review summaries still show.
- The Home Depot: the Magic Apron assistant and its chat button on the store's web pages.
- The Washington Post: Ask The Post AI, its Ask tab, AI article summaries, and the questions under articles.
- T-Life: the T-Life AI assistant.
- Truth Social: the Ask Perplexity AI button on Discover.
- Walmart: the Sparky assistant and the AI features on item and search pages. Customer care chat falls back to the regular help pages.
- Xfinity: the Xfinity Assistant. Support steps that open it can stop working.

- Yahoo News: Ask Scout, Yahoo's AI answer engine, with its tab, button, prompts, and announcement, the AI "Key takeaways" on stories, and the AI comment summaries.
- Yahoo Finance: Yahoo Scout, with its chat, tab, search entry, and onboarding, Ask AI on selected text, Article Dig Deeper chat, the AI Analyst on quote pages, and the AI insight cards.
</details>

## Privacy

**Block analytics & tracking** stops each app's analytics, ad measurement, and marketing services. Sign-in and playback are left alone, and so is crash reporting, except on Kanopy, Recreation.gov, and T-Life. In every app except Apple TV, it also stops Firebase and Google Analytics, Meta app events and the Meta Pixel, Google Ads conversion tracking, Optimizely events, Bitmovin player analytics, and Mixpanel. Facebook sign-in and sharing keep working.

<details>
<summary>What else it stops in each app</summary>

- ABC News: mParticle, comScore, Braze, and Datadog.
- AMC+: AppsFlyer, Braze, mParticle, Nielsen, New Relic, and NPAW/Youbora.
- AP News: Adjust, Branch, Amplitude, Segment, comScore, Parse.ly, LiveRamp, Iterable, Permutive, Quantcast, and AP's BlueConic customer-data platform.
- Apple TV: Apple's usage metrics, such as the pages you view and what you tap, play, and search for. On Android TV, this is a separate, experimental patch, Block analytics & tracking (Android TV). It turns off Apple's usage metrics in the app and stops the player's playback reports. [Known issues](known-issues.md) lists what it does not cover yet. The Android TV app then stops downloading updates to its screens between app updates, because those updates would bring the metrics back.
- CBS News: Adobe Analytics, comScore, Nielsen, Mux, New Relic, Flurry, Kochava, and Moat.
- CNBC: Adobe, Amplitude, AppsFlyer, CleverTap, comScore, Kochava, Nielsen, and Airship analytics.
- CNN: Adobe, AppsFlyer, Chartbeat, comScore, and CNN's own data collection.
- Costco: Adobe Analytics, comScore, and Kochava.
- C-SPAN Now: the Facebook SDK, Firebase/Google Analytics, and the Privacy Sandbox on-device ad-retargeting call. OneSignal push is left alone.
- DealNews: Firebase Analytics and Google ad measurement.
- DealSeek: AppsFlyer, TikTok, and PostHog. The PostHog feature flags the app reads are left alone.
- Disney+: Braze, Conviva, and Nielsen. Disney's own analytics share servers with sign-in and playback, so they are not blocked.
- ESPN: Braze, New Relic, Conviva, Nielsen, comScore, Kochava, and Adobe Analytics.
- Fandango at Home: comScore, Kochava, Mux, and Adobe Analytics.
- Fox Local: AppsFlyer, comScore, Conviva, Mux, Nielsen, Datadog, LiveRamp, and Fox's own ad and app analytics. Braze, which sends the breaking-news alerts, is left alone.
- Fox News: Adobe, AppsFlyer, Chartbeat, comScore, Nielsen, and Fox's own ad telemetry and ad-ID graph.
- Fox One: AppsFlyer, Braze, Conviva, comScore, Adobe Analytics, Nielsen, Mux, Datadog, Segment, and Contentsquare session replay.
- HBO Max: Branch, Braze, comScore, AppsFlyer, and MediaMelon.
- Hulu: AppsFlyer, Adobe Analytics, Conviva, and Nielsen.
- JustWatch: JustWatch's own event tracking, AppsFlyer, Adjust, and Singular.
- Kanopy: Mux, Mapbox map usage events, and Kanopy's Sentry crash reports, which include screenshots. Crashlytics is left alone.
- MGM+: Braze, Kochava, Segment, and Nielsen.
- Mint Mobile: Amplitude, Braze, Branch, and Optimizely, along with marketing notifications, in-app promotions, and referral links.
- MLB: comScore, Conviva, Adobe Analytics, and Branch.
- Moviebase: RevenueCat diagnostics. Purchases and list sync are left alone.
- MS NOW: Adobe, Kochava, Nielsen, comScore, Amplitude, Parse.ly, and Iterate.
- myAT&T: Dynatrace, Adobe and its in-app marketing messages, and Medallia surveys.
- My Verizon: Adobe and its in-app marketing messages, New Relic, and Qualtrics surveys.
- NBA: Braze, New Relic, Amplitude, Datadog, comScore, and Kochava.
- NBC News: Adobe, mParticle, Nielsen, comScore, Conviva, Moat, and Iterate.
- NewsBreak: AppsFlyer, Adjust, Branch, Amplitude, mParticle, Segment, Singular, Iterable, LiveRamp, and Amazon ad analytics. NewsBreak's own event log shares servers with its stories, so it is not blocked.
- NewsNation: on phones, comScore, Nielsen, Segment, and Adjust. On Android TV, Kochava, including its rotating failover domains, and Intercom's event endpoint. Intercom chat and push are left working.
- NFL: Kochava, Adobe Analytics, Nielsen, Partnerize, and Amplitude. Analytics sent from the app's JavaScript are not covered.
- NPR: AppsFlyer, Adjust, Branch, mParticle, Segment, comScore, Iterable, Permutive, Quantcast, and Amazon ad analytics.
- NPS: Mapbox map usage reports.
- Paramount+: Braze, Conviva, Nielsen, comScore, Kochava, Adobe Analytics, New Relic, Tealium, and Branch.
- PBS: AppsFlyer and Mux.
- Peacock: Braze, Conviva, Nielsen, comScore, Adobe Analytics, New Relic, mParticle, and Branch.
- Plex: Kochava, Plex's own analytics, Plex's ad measurement, and Statsig event logging.
- Pluto TV: Kochava, comScore, Nielsen, Adobe Analytics, Conviva, New Relic, and Salesforce Marketing Cloud. The Blocking level option chooses what happens to Pluto's own playback tracking, which also saves your place. Relaxed, the default, leaves it on, so Continue Watching keeps working. Aggressive blocks it too, so Pluto TV does not remember where you stopped.
- Prime Video: Amazon's Minerva metrics.
- Recreation.gov: the Firebase events that carry your reservation numbers and payment type, Crashlytics and Firebase Sessions, and Mapbox usage reports. It also keeps your account ID from LaunchDarkly, the app's feature-flag service.
- RetailMeNot: AppsFlyer, Snowplow, Datadog, and Firebase Analytics.
- Shudder: mParticle, Braze, AppsFlyer, Amplitude, Conviva, and Google and Firebase Analytics.
- SiriusXM: Datadog, Mux, Branch, Salesforce Marketing Cloud and Personalization, and AdsWizz listening measurement.
- Slickdeals: AppsFlyer, Blueshift, Google Tag Manager, Amazon ad metrics, and Slickdeals' own event collectors.
- Starz: AppsFlyer, CleverTap, Leanplum, Braze, and Ethnio surveys.
- Substack: Sentry, the Facebook SDK, and AppsFlyer. It also removes the Facebook Privacy Sandbox "Fledge" module that enrolls the device in on-device ad-retargeting audiences. Substack's own product analytics share servers with its content, so they are not blocked.
- Sundance Now: AppsFlyer, Braze, New Relic, and Firebase Analytics.
- The Daily Wire: Segment, comScore, Adjust, the Facebook SDK, and Firebase/Google Analytics. The app's ad-blocker report to Segment has nowhere to go.
- The New York Times: AppsFlyer, Chartbeat, comScore, Datadog, and Iterate surveys.
- theScore: theScore's own event tracking, Amplitude, AppsFlyer, Branch, comScore, Datadog, Segment, Airship analytics, and LiveRamp. Airship push notifications are left alone.
- The Wall Street Journal: Adobe Analytics, AppsFlyer, Braze, comScore, LiveRamp, Parse.ly, Permutive, and Snowplow.
- The Washington Post: AppsFlyer, Chartbeat, comScore, Permutive, Iterable, and Airship analytics.
- T-Life: Adobe, MoEngage and its marketing messages, Amplitude, Splunk, Luciq, and Branch.
- T-Mobile Play: the app's usage events and Apptentive surveys.
- Truth Social: Mixpanel, Adjust, and Firebase/Google Analytics. Truth Social's own requests are left alone.
- Tubi: Adjust, Branch, Braze, Nielsen, Conviva, NPAW/Youbora, Mux, and Tubi's own analytics. Recommendations may be less personalized.
- USA TODAY: mParticle, Adjust, comScore, Parse.ly, and LiveRamp. Airship, which delivers breaking-news alerts, is left alone.
- Visible: Tealium and Swrve, with its marketing notifications and in-app promotions.
- White House: the Firebase events that record what you read, watch, and search for, and the app's access to your advertising ID.
- Xfinity: Comcast's own event tracking, Datadog, Medallia surveys, and Branch.
- Xumo Play: Xumo's own viewing and impression beacons, Adobe Analytics, Braze, and Kochava.

- Yahoo News: Firebase/Google Analytics, AppsFlyer, Datadog, comScore, Yahoo's own analytics and ID sync, and Taboola and ad-verification beacons.
- Yahoo Finance: AppsFlyer, comScore, Chartbeat, Embrace, Google Analytics and Yahoo's server-side forwarding, and Yahoo's own beacons.
</details>

### App-specific privacy patches

| Patch | App | What it does |
|-------|-----|--------------|
| Block Advanced Security telemetry | Xfinity | Stops the uploads of the websites Advanced Security checked and your network changes. Threat filtering keeps working. |
| Block background network reports | myAT&T | Stops Ookla's background reports of your signal and location. The speed test you start still works. |
| Block installed-app scan | NewsBreak | Stops the app from checking which of about 500 other apps you have, including sportsbooks, prediction markets, period trackers, and payment apps, and sending that list to NewsBreak. |
| Block location tracking | T-Life | Stops Radar, which sends your location every 30 seconds while the app runs. Store check-in and location-based offers can be affected. |
| Block location tracking | Checkout 51 | Stops Foursquare's Movement SDK, which records the places you visit in the background and reports them with your user ID, gender, and birthday. Its background services and boot receivers are removed too. Checkout 51's own server still receives your location when you open the gas map, to find nearby stations. |
| Block session recording | myAT&T, My Verizon, T-Life, Visible | Stops Quantum Metric, which records what you do in the app with details such as your phone number, email, or login ID. |
| Block telemetry | YouTube TV | Stops quality reports, interaction logging, view tracking, and ad measurement. Watch history, resume points, location checks, and DRM licenses are left alone. |
| Block TV discovery | T-Mobile Play | Stops Vizbee, which scans your home network for TVs. Sending video to a TV from the app stops working. |
| Opt out of data sale & sharing | CBS News, CNN, Fox Local, Fox News, MS NOW, NBC News, NPR | Sets the privacy choice to "do not sell or share" and sends ad partners the US Privacy opt-out signal. On Fox News, it also opts out of Nielsen measurement. On NPR, it chooses Reject All on the cookie banner of the npr.org pages inside the app and hides the banner. You can change it in the app's privacy settings, except on CBS News and CNN. |
| Remove location access | RetailMeNot | Keeps the app from reading your location, even when location access is allowed. The app runs as it does when you deny location, and it does not show the permission request. |
| Remove microphone access | White House | Removes the microphone permission, which no feature uses. |
| Route traffic through a proxy | AP News, NewsBreak, NPR, Truth Social, White House | Sends the app's traffic through the proxy you set, such as Orbot for Tor or a SOCKS5 server from a VPN service. A SOCKS5 proxy that needs a login is entered as `socks5://user:password@host:port`, and the login is stored in the patched app. The app cannot connect while the proxy is off, and web pages inside the app do not use it. |
| Skip location on open | Recreation.gov | Stops the precise location check at every launch. Nearby search and permit check-in still use location. |

### Shared privacy patches

These patches are off by default.

| Patch | Works on | What it does |
|-------|----------|--------------|
| Hide device identifiers | Every app except CNBC, Costco, Kanopy, MyTSA, National Forests & Grasslands, Plex, SiriusXM, and YouTube TV | Gives the app a random Android ID and a zeroed advertising ID. The DRM ID is left alone, so playback works. On Truth Social, the Adjust ID the app sends to Truth Social's own server is also replaced with a random one. |
| Spoof carrier | Every app except the carrier apps, C-SPAN Now, CNBC, Costco, FEMA, Kanopy, MyTSA, NewsNation, Plex, SiriusXM, Substack, The Daily Wire, theScore, Truth Social, USA TODAY, and YouTube TV | Hides your carrier, or shows a name you type. Carrier deals, such as League Pass with a phone plan, stop working. |
| Report Wi-Fi connection | Streaming and news apps, except Apple TV, C-SPAN Now, CNBC, JustWatch, Kanopy, Moviebase, NewsNation, Plex, SiriusXM, Substack, The Daily Wire, theScore, USA TODAY, and YouTube TV | Shows mobile data as Wi-Fi, so Wi-Fi-only downloads and mobile quality limits do not apply. This can use a lot of data. |
| Hide VPN connection | RetailMeNot, and streaming and news apps except Apple TV, C-SPAN Now, CNBC, JustWatch, Kanopy, Moviebase, NewsNation, Plex, SiriusXM, Substack, The Daily Wire, theScore, USA TODAY, and YouTube TV | Hides an active VPN from the app's checks on the phone. The app's servers can still detect a VPN from your IP address. |
| Hide Wi-Fi networks | Shopping apps except Costco, and T-Life | Hides nearby Wi-Fi networks and the name of yours. Store detection, smart-home setup, and checkout fraud checks can be affected. On T-Life, leave it off if you use Secure Wi-Fi or T-Mobile Home Internet. |
| Block Bluetooth scanning | Shopping apps except Costco, T-Life, and NPS | Stops scans for devices and beacons. In-store maps, CVS kiosk check-in, Amazon smart-home setup, park beacon content, and accessory pairing stop working. |
| Hide cell tower info | Shopping apps except Costco | Hides the cell towers your phone sees, which can place you within a few blocks. |
| Block background location | Shopping apps except Costco, and T-Life | Removes background location access. Store-arrival features and pickup check-in can stop working. |
| Disable auto-updates | Every app except CNBC, Costco, Kanopy, Mint Mobile, Plex, SiriusXM, T-Mobile Play, The Washington Post, Truth Social, White House, and YouTube TV | Stops the Play Store from replacing the patched app with the official one. To update, patch the newer version. It is always on with Tubi's Skip ads. |

## Playback

| Patch | App | What it does |
|-------|-----|--------------|
| Disable video autoplay | Yahoo News | Videos play only when you tap them. The video rails stop moving to the next video, and image carousels stop turning on their own. |
| Auto-skip | Apple TV, Apple TV (Android TV) | Skips the parts you choose in its options: Apple's promos for other titles, which are on by default, and recaps and intros, which are off by default. Other buttons, such as Add, are left alone. Recaps and intros are recognized by their English button labels, "Skip Recap" and "Skip Intro". Each recap and intro is skipped once per title, so rewinding into one plays it. On a phone, the app's button then shows "Watch Recap" or "Watch Intro" for a few seconds where the skipped part ends, and goes back to its start. |
| Disable up next | Apple TV | Lets the credits play full screen, instead of shrinking the video into a corner to show the next episode or a recommendation. |
| Fix picture-in-picture | YouTube TV | Keeps the picture-in-picture window at the video's shape. Without it, the window can flicker between two sizes for several seconds after it shrinks. Needs Android 13 or later. |
| Hide player overlays | Apple TV | Hides the overlays you choose in its options: the rating card when a title starts, product placement notices, and photosensitivity and high-motion warnings. The warnings are shown by default. |
| Highest quality | Tubi | Plays the highest-resolution version of each title and live channel, and keeps it at the highest bitrate Tubi sends. Most titles stop at 720p, and a few have 1080p. Tubi sends the app fewer renditions than its website, so some titles play below the resolution the website offers. Turn it off if videos buffer. |
| Skip launch video | AMC+, Disney+, Paramount+, Pluto TV, Starz, White House | Opens the app without the intro video. |
| Skip lion intro | MGM+ | Opens the app without the lion video. |
| Skip pre-roll promo | MGM+, Starz | Skips the app's own promo before a title. |
| Start at high quality | YouTube TV | Starts recordings and on-demand videos at high quality, without the flicker of stepping up from a low one. They start at 1080p, or at the resolution you choose in the patch options. Live channels still start low, because the player picks their quality itself. A slow connection can take longer to start. The patch cannot go above what your plan includes. Choose 2160p only if you have the 4K Plus add-on: without it, videos start low and step up as if the patch were off. |
| Video quality | HBO Max | Plays the resolution you choose in its options: 480p, 720p, 1080p, or 2160p. When a title does not have it, the closest lower one plays, or the lowest one when every rendition is higher. HBO decides which resolutions it sends: in testing on a 4K plan, it sent at most 1080p to an NVIDIA Shield, even for titles marked 4K. Videos can buffer if your connection is too slow for the choice. |

## Sign-in and startup

| Patch | App | What it does |
|-------|-----|--------------|
| Change app name | YouTube TV | Names the app "YT TV+" by default, so it is easy to tell apart from the official app. |
| Disable forced updates | Truth Social | Keeps the app open when Truth Social's server asks for a newer version. A patched app cannot update from the Play Store. |
| Disable Xfinity auto sign-in | Peacock | Stops automatic sign-in on an Xfinity home network. |
| Faster launch | CNN | Opens the app without waiting to download its feature settings from Optimizely. When a DNS blocker blocks that download, the app otherwise waits about 14 seconds on its splash screen. The app starts with the settings it saved last time, and updates them in the background. |
| Fix launch with DNS blockers | CNBC | Opens the app when a DNS blocker blocks OneTrust, the app's privacy consent service. Without it, the app stays on its splash screen. |
| GmsCore support | AP News, Checkout 51, JustWatch, MLB, Moviebase, NewsBreak, The Daily Wire, Yahoo Finance, Yahoo News, YouTube TV | Signs in with Google through MicroG RE instead of Google Play services. On AP News, Checkout 51, JustWatch, MLB, NewsBreak, The Daily Wire, and Yahoo Finance it is off by default, because those apps also offer other sign-ins; with it on, push notifications come through MicroG RE too. On Yahoo News it is off by default and moves only push notifications and Firebase, because Yahoo sign-in does not use Google. |
| Remove social sign-in | CNN, HBO Max (phone), MGM+, Starz, The New York Times, Tubi | Removes Google, Facebook, and Apple sign-in. Email, TV-provider, and subscriber sign-in keep working. An account created with Google or Facebook needs a password reset to sign in by email. |

## Needed for the app to run

| Patch | App | Why |
|-----|-----|-----|
| Disable Pairip license check | DealNews, DealSeek, Fox One, Moviebase, National Forests & Grasslands, RetailMeNot, White House | Google's Pairip check blocks any copy not installed from the Play Store, which includes every patched app. |
| Disable signature check | CBS News | CBS News erases its data and closes when it is not signed by CBS. This also skips its block on rooted phones. |
| Fix media connection crash | NPR | NPR closes when Android Auto, the Google app, or another approved player connects with a signature the app does not expect. The connection is refused or allowed instead. |
| Rename shared permissions | Prime Video | Lets Amazon Shopping and other Amazon apps install beside the patched Prime Video. |

## Extra features

**Show release times** (Apple TV, on phones and Android TV) shows when an upcoming episode or title is released, in your time zone. The app shows only a day, such as "Coming This Wednesday", which can be the day after the release in your time zone. Episode tiles show the day and time, such as "Tue 4:00 PM PST", the badge on an episode's page says "Coming Tuesday at 4:00 PM PST", and the "Coming Soon" row under Information shows the full date and time. Its options choose 12-hour or 24-hour time, or, on a phone, the device's setting. On Android TV, the app shows labels such as "Coming Tuesday at 4:00 PM PST", and it stops downloading updates to its screens between app updates, as with Block analytics & tracking (Android TV). Labels are in English.

**Dark mode** (Checkout 51, CNBC, DealSeek, RetailMeNot) lets Android darken the app while the phone is in dark mode. These apps have only a light theme, so Android picks the dark colors itself, and photos and videos keep their own colors.

**Save content for offline use** (FEMA) keeps the Prepare guides, disaster declarations, FAQ, and the images you have viewed readable without a connection. Long-press the app icon for **Save all**, which downloads every guide in English and Spanish (about 150 MB), or **Refresh**, which updates the saved pages. Saved content is replaced only after the new copy downloads completely.

**Enable developer menu** (Fox News) opens the hidden developer menu with a long-press on the Fox logo at the bottom of Settings. Reopen the app after you change a feature flag. Some of its settings point the app at test servers.

**Streaming titles only**, **Hide unavailable titles**, and **Hide watched titles** (JustWatch) change what the Watchlist shows, on phones and Android TV, using JustWatch's own data for each title. Streaming titles only shows titles you can stream on a subscription or for free, and hides titles you can only rent or buy. Picking a Types filter in the app overrides it. Hide unavailable titles hides titles that are not on the services you picked in the service bar. With All picked, it hides titles that no service offers, except titles that are not released yet. Hide watched titles hides movies you marked as seen and shows you are caught up on. The Seen, Likes, and Dislikes tabs and your other lists are not changed, and the title count at the top of the Watchlist still includes hidden titles.

**Show hidden details** (Recreation.gov) shows details the app receives but does not display: the ticket-lottery application and award counts and the per-account limit (in a dialog you dismiss, since that screen has no text to add them to), when each ticket time slot stops selling, booking window rules, the deadline to confirm a lottery win, and when venue booking opens or closes. The lottery's results date is left out because the app already shows it.

**Hide content** (SiriusXM) hides the people, shows, podcasts, and channels you list. A person's own channels, shows, and page are hidden, along with every episode of a hidden show and the episodes that name them as a host or guest, such as "with Name", "featuring Name", or "Name joins". Episodes that only talk about someone stay. Its **Also hide mentions** option hides everything that mentions a name. Long-press the app icon and choose **Hidden names** to edit the list in the app. Saving restarts SiriusXM. The patch options set the list it starts with. A guest that SiriusXM does not name in the text is not hidden.

**Hide Howard tab** (SiriusXM) removes the Howard tab from the top of Discover.

**Disable screenshot detection** (Substack) stops the app from reacting when you take a screenshot. Substack registers Android's screenshot callback on its reader and other screens and then runs its own handler; with this on, a screenshot does nothing.

**Save videos** (Truth Social) adds a "Save video" row to the full-screen player's Playback Controls, and names the Save button "Save video" for a video in the media viewer. The video is saved at its original quality to Movies/Truth Social.

**Fix pictures shown as videos** (Truth Social) shows a post's picture as a picture. The app sometimes draws a picture in its video player, with a play button that does nothing, when a related post has a video. With this on, the picture opens in the image viewer.

**Show poll results** (Truth Social) adds each option's share of the votes to its label before you vote, such as "Yes · 62%". The server sends the counts, but the app shows them only after you vote. You can still vote.

**Show sensitive media** (Truth Social) shows the media in posts marked sensitive without blurring it first. Content warnings written by the author still show.
