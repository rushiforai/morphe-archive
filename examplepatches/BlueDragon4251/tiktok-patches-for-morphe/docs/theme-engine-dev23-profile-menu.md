# TikTok 46.7.3: dev.23 profile menu follow-up

Baseline: feature `a47b9d0040ce96d8e8ba745fa44d142193382fa6`, released as
`1.2.0-dev.23`. The user confirms the restored centered profile and FYP navigation.
The profile still slides left and its three-dot menu remains opaque. This report
contains no new device diagnostic file, so the active menu route is not yet logged.

## Cover the other native profile menu route

In the exact acceptance APK, `HomePageUIFrameServiceImpl.getFragmentClass` resolves
`page_setting` to `ProfilePageMenuFragment` when the newer sidebar route is disabled
or supplies no class. Only `ProfileSidebarPageFragment` and `SidebarPageFragment`
were registered previously. The return-label correction in dev.23 protects those
hooks, but cannot register this third route.

Register `ProfilePageMenuFragment.onCreateView` through the same checked return
hooks. Its two returns use v2; its root inflates `0x7f0d1ba3` (`res/b/e__.xml`) and
receives the native TUX background attribute `0x7f0603a3`. The existing sidebar
styler now applies the theme's translucent surface to this root and clears nested
flat page fills. Registration also makes this route visible to profile compensation.

## Correct after native scrolling and before drawing

`HomepageViewPagerAssem.onViewCreated(View)` casts its argument to `X.05nk`, whose
ancestry reaches `X.05nh`. This base pager advances its Scroller and calls
`View.scrollTo` in `computeScroll`. A pre-draw observer can therefore have seen the
previous offset when Android draws the pager.

Discover that ancestry from the argument cast during patching and verify the
framework draw/Scroller contracts. Inject correction at native `dispatchDraw`
entry, before its `ViewGroup.dispatchDraw` call. The extension only applies the
existing correction to registered profile roots belonging to that pager. It does
not alter pager scrolling or infer targets from UI labels, sizes or class names.
The new runtime regression covers scrolling after pre-draw, repeated calls, closing,
an unrelated pager and restoration of native movement/clipping under TikTok Default.

The lifecycle and draw fingerprints enter the shared update inventory; no obfuscated
pager names are pinned in the patch. Discovery also collects the missing named menu
and home-pager anchors. The centered-layout flag, FYP bar and TUX/Compose mapping stay
as confirmed by the user. CI checks patchability and runtime regressions; the visible
glass effect and animation still require confirmation on the affected device.

APK SHA-256: `b9e96e64e94ac0f9ea229dd0ba743f1930121a8b6941cf9fd87191604da0129e`.
