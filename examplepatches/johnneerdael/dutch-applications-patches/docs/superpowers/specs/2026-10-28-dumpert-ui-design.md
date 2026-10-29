# Dumpert ad-free account presentation

The user tested Dumpert 5.8.0 and reports that the patches work except for
subscription promotions and the Free/ads labels in settings and the profile.
Extend the existing Hide ads control, inherited by the two privacy controls.

Remove the shared `premium.ui.settings.PurchaseAdFreeBanner` before it opens a
Compose group. Its callers cover signed-out More, signed-in More and the
subscription pane. Keep genuine login/register/settings navigation.

Use the existing themed account card: replace only the free card's title with
the app's localized `purchase_screen_title` (Dumpert Deluxe), omit its Free
price label, and use the app's localized `premium_account` ad-free description.
Use that same description in the signed-in header. Keep the actual paid card,
its product title/description and real subscription management unchanged.
No global premium flag, product, account, JWT, purchase or consent is invented.

## Approaches

Changing the global premium state would affect account and purchase behavior.
Forcing the paid UI branch would assume real billing product metadata exists
and expose a management action without a product. The selected implementation
changes only display resources in the existing free card, retaining its native
layout and omitting a billing action. This is an implementation choice within
the user's requested local presentation change.

## Delivery and evidence

Only Dumpert's existing Hide ads implementation changes. Pin original UI and
genuine account/product/purchase consumers independently; verify original and
all selected outputs, build and sign the complete split input, and publish a
dev follow-up through the existing workflow. Do not install or reset the phone.
The user's report is partial device acceptance; the UI follow-up still needs
their phone test. Preserve the stashed RTL work and resume it after publication.
