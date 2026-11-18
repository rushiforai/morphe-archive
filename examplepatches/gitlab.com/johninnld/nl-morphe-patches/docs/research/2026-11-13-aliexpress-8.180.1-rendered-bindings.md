# AliExpress 8.180.1 rendered-item and promotion bindings

## Input

The user-supplied archive first verified in this session:

- `AliExpress-Shopping-App_8.180.1_apkcube.apks` — package `com.alibaba.aliexpresshd`, version
  8.180.1 (80005998), ARM64 split set.

The rendered-item and promotion hooks were prepared for 8.180.1 behind a version gate
(`installRenderedItemFiltering` returns for any other build), but the 8.180.1 obfuscation
renamed the pinned classes after that preparation. Applying the v1.78.0 bundle to the stock
archive failed on `LegacyBeanGetter` ("Remove promotions and games", which depends on the
rendered-item hooks), with "Remove sponsored items" and "Skip splash promotions" never
reached.

## 8.180.1 renames (jadx + apktool of base.apk, all verified against the stock DEX)

| Role | 8.180.0 pin | 8.180.1 target |
| --- | --- | --- |
| Legacy search view model (`getBean()BaseSearchBean`, abstract) | `Ll9/a;` | `Lw9/a;` |
| Modern raw floor (`C(JSONObject)` stores the raw object, abstract `getViewTypeId()`) | `Lsu/a;->D` | `Lwx/a;->C` |
| Modern product parser (`p4p` marker) | `...floor/product/e;->H0` | `...floor/product/d;->P0` |
| App bar submission third parameter / injected check-cast | `...anc/core/container/adapter/base/a;` / `...anc/adapter/base/a;` | `Ldt/a;` |
| ANC component holder (`getData()IDMComponent`, `getFloorName()`) | `Lcr/c;` | `Llt/d;` |
| Parsed ANC floor container (`<init>` 4 lists, headerList/bodyList/footerList) | unpinned (unique) | pinned to `Llt/c;` (the shape now also appears in `jt/a` and an order view model) |
| Account header model (`<init>(IDMComponent)`) | `...myae/anc/b;` | `...myae/anc/a;` |
| Account header contrast setter | `...myae/anc/g0;->d(Z)V` | `...myae/anc/e0;->s(Z)V` |
| Waterfall recommendation factory | `(String,JSONObject,Lyu/a;)Lsu/a;` | `WaterfallFloorFactory.a(JSONObject,String)Lwx/a;` (third parameter removed) |
| Price banner object storage | `Li20/a;` constructor IPUT of its own `JSONObject` field | no constructor field store; the banner object now flows through `com.aliexpress.android.moduleaidetail.ui.c0.setDataRoot(JSONObject)` |

Structural changes beyond renames:

- The price banner hook moved from the removed price-model constructor to the shared
  `c0.setDataRoot(JSONObject)` entry, which every initial/cached/SKU path uses; the
  render-side hook stays on `AIPriceProvider$AIPriceHolder` (now `Y(JSONObject)`).
- `DefaultBottomBarDecorator.P` still writes its visibility field directly, while the
  country decorator `f.P` override now stores through the inherited `c0(Boolean)` setter.
  The field discovery therefore only requires the directly-writing methods to agree;
  both config methods still receive the `applyCampaignTabPolicy` call and the shared
  inherited field receives the hidden marker.

Verified unchanged for 8.180.1: `AHEListBean.getModel/getP4pObj`, `IAncItemModel`,
`BaseSearchBean.getTypeName`, `ANCContainerView.setBody/setBottomSticky/setTopSticky`,
`SkyShellActivity.onBackPressed` retention dialog string, `CoinAccountServiceImpl.createCoinEntry`,
`myae/anc/a.getFloorType/getFloorName`, `home.base.vm.b` campaign config shape,
`AIPriceProvider$AIPriceHolder` render, `CoinEntryView/PigEntryView.render`, and the
splash/popups string anchors.

## Verification

Rebuilt bundle applied to the exact stock archive with the full ten-patch selection:
`success: true`, 10/10 patches applied, none failed. The patched APK's
`AncAppBarLayout.setData(List,List,Ldt/a;)` smali carries the injected
`RenderedItems.filterIfEnabled`/`filterOneIfEnabled` calls with the corrected `Ldt/a;`
check-cast. Gradle patch tests (including `PromotionCompatibilityTest` pinning 8.180.1)
pass.

Note: the first lift attempts ran against a stale patch bundle — long-lived Gradle
daemons kept serving the pre-edit sources (VFS staleness). The lift builds were only
trusted after `--stop`ping the daemon and confirming the new fingerprint constants in
the bundle's fingerprint classes.
