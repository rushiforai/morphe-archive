# Monet unlimited displayed cards

Select **Monet - Unlimited displayed cards** for original Monet
`com.klevico.monet` **1.1.0** (version code 134, Android 8.0+), retaining existing
**1.0.97** support. It works independently or with either premium alternative.
Select only one premium alternative. **Individual Nuvio catalog rows** also
supports 1.1.0; combined catalog/cards/premium checks cover the shared menu method.

## Use

Open a media row's **Displayed Cards** setting. Monet's original dialog, title,
number display, fonts, theme colors, focus appearance and confirmation controls
are retained. The count row gains **-10** and **+10**, rendered with the original
minus/plus controls. **Max** sits on the lower row immediately left of **Apply**,
using the same native pill renderer and spacing as Apply. The controls appear as:

```text
[-10] [-]  count  [+] [+10]
          [Max] [Apply]
```

Use the original confirmation button to save. Monet's original dismissal/Back
behavior is retained; the added controls only change its existing draft state.
The minimum remains four cards. Max displays all entries currently available in
the row and is shown as **Max** in the picker and row menu. Values above 20 and
Max survive native preference reads and theme preset validation. From Max,
minus steps return to the last finite number in the current dialog; when opening
a dialog already set to Max, that finite starting value is 20.

This removes the display-count cap. It does not fetch more titles or change
Monet's native preview scans, cache limits or provider contents. Original number
pickers such as cards per row and grid columns remain unchanged.

## 1.1.0 native contracts and verification

Input: `../OriginalApps/monet-1.1.0.apk`, manifest package `com.klevico.monet`,
version **1.1.0**, code **134**, minimum SDK 26. SHA-256:
`3fdd45e7ed85f4a26ab6a56924e8a9c298c42c3cb036cb121d15ed6504b9a69c`.
All 9,041 original classes are scanned. The separate `MonetDisplayedCards110`
implementation checks 22 full native method fingerprints, access flags and
extension-facing symbols before mutation. The historical native contracts below
are unchanged. Eight native methods change:

- `b13.k(I):I`: index 2's 4..20 clamp becomes `Math.max(value,4)`.
- `ux2.s0(String,int,int,int,boolean,y95,wu1,uu1,jw1,int):void`: original native
  picker (70 registers, 560 instructions). A five-instruction prefix updates the
  4..20 maximum. Adapt native button calls at 316/441, number text at 323 and
  footer at 539. Copy arguments into dead v42-v55; native text-style construction
  fully redefines this range before using it between button calls. State is v37
  / v21, bounds v62/v63. Footer inputs are flags/focus/up/apply/composer at
  v0/v7/v6/v1/v8, followed by state/bounds. No live saved register is clobbered.
  The picker gains 44 instructions, without changing register count or try regions.
- `th6.w(String,int,int,int,int,wu1):uh6`: adapt only the three card-limit schema
  keys after the original min/max copies.
- `ux2.B0(int,wp1,wp1,uu1,jw1):void`: adapt the native focus lambda at index 52
  only for the registered Max/Apply requesters.
- `u42.a(long,jw1,int):void`: adapt resolved Apply text at index 77, retaining
  native typography, colors, icon and layout.
- `g30.f(Object,Object):Object`, `jz3.f(Object,Object):Object`, `ux2.u0(...)`:
  replace only displayed-card integer summaries at indexes 92/187/456. 1.1.0 no
  longer uses `media_action_visible_cards_value`, so no stale summary resource ID
  is used. `aapt2 dump resources` identifies the title at `0x7f11032d`.

Runtime bindings: draft `xb5.g()/i(int)`, focus `wp1()`, buttons `ux2.C0`, Apply
`ux2.B0`, composer `jw1.h0/T/r0/r`, callbacks `uu1.b()/wu1.a(Object)`, focus
setters `qp1.e/k/j(wp1)`, empty slot `pp0.a`, Unit `lo7.a`. The patch explicitly
sets the injected `NativeLayout.modern` DEX field initializer after checking its
false default and empty class initializer. No speculative runtime fallback is used.

Apply's label is specialized in 1.1.0. Max and Apply both use that native renderer,
including its icon. Max's scoped label is remembered inside the native text
composition: independent restarts retain Max without leaking it into another
Apply instance or replacing localized Apply text. Scope and groups are restored
on exceptions. No Android widgets, windows, services or preferences are added.

The generic picker has an O(count) decorative preview loop. Its three card entry
points (`fp3`, `fy3`, `zo2`) are fingerprinted too: all supply min=4/max=20 and
disable that preview, so Max cannot cause a huge decorative render loop.

Raw original DEX/resource evidence is under `../.inspect-monet-1.1.0/`, notably
`cards-contracts.log`, `cards-picker.txt`, `cards-button.txt`, `cards-footer.txt`,
`cards-apply-text.txt`, `cards-schema.txt`, `cards-directions-addresses.txt`,
`cards-open*.txt` and `resources.txt`.
`cards-schema-entries.txt`, `cards-preference-keys.txt` and
`cards-clamp-callers.txt` trace the existing keys, schema constructor calls and
shared clamp consumers in the new original.

Run with Java 21 from the repository:

Unversioned `verifyMonetDisplayedCards*` task names now delegate to these latest
1.1.0 tasks; historical verifier source and fixture files are retained unchanged.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ./build-local.ps1 :patches:buildAndroid :patches:verifyMonetDisplayedCards110 :patches:verifyMonetDisplayedCards110Runtime :patches:verifyMonetDisplayedCards110Bundle :patches:generatePatchesList :patches:verifyMorpheDesktopImport :patches:verifyAndroidBundle -PmorpheDesktopJar=E:/Morphe/morphe-desktop-1.19.1-all.jar --offline
```

Native tests check missing/duplicate/changed/already-patched rejection, all argument
types/registers, full original-body restoration, safe preview inputs, arithmetic
and DEX write/reload. Host-runtime tests execute production code with the 1.1.0
API shapes: all steps/Max, finite restoration, focus at minimum/finite/Max, unchanged
Apply persistence, theme changes, draft isolation/replacement, overflow, unrelated
pickers, text restarts/localized fallback and failure/group/scope cleanup.

Packaged tests apply cards alone, with regular premium and with experimental
premium. They require eight hooks, modern bindings, all 9,041 original classes,
only nine card-extension classes, no duplicates and no unrelated method changes.
Catalog rows are not selected. Bundle: `patches/build/libs/patches-0.15.0.mpp`.
No release version was changed.

Desktop 1.19.1 rebuild outputs:

- `../Apps/Monet/monet-1.1.0-displayed-cards-unsigned.apk`
- `../Apps/Monet/monet-1.1.0-displayed-cards-premium-unsigned.apk`

`verifyMonetDisplayedCards110Apk` audits the standalone rebuild by default. For
the combined output, pass `-PmonetCards110Premium=true` and
`-PmonetCards110Apk=E:/Morphe/Apps/Monet/monet-1.1.0-displayed-cards-premium-unsigned.apk`.
It audits native methods/classes/bindings and all 674 unchanged non-DEX/non-signature
entries, including the manifest. Outputs are deliberately unsigned validation
fixtures, not installable as-is. No signing, installation or device testing was
performed. Device checks remain: actual TV focus/styling, Save/Back, restart,
30/372/Max and large-row scrolling. Host checks do not replace those checks.

Local verification on 2026-10-29 passed the native/runtime/bundle tasks, both
rebuilt-APK audits, Desktop import (33 patches/eight apps), Android bundle DEX
check and ZIP alignment. Each APK retains all 9,041 original classes and all
674 non-DEX/non-signature contents. `apksigner verify` reports the expected
missing signature manifest for these unsigned fixtures. Logs include
`cards-final.log`, `cards-combined-apk.log` and `cards*-desktop.{json,log}` in
the inspection directory. No user-reported device result for this port yet.

## Historical 1.0.97 original input and DEX contracts

Input: `../OriginalApps/monet-1.0.97.apk`. Manifest: `com.klevico.monet`, version
`1.0.97`, code `131`, minimum SDK 26. SHA-256:
`58bcdaeb7de6109434e013e796e367df6bdfcea3b9b17a01c15431c51d5556cf`.
Inspection artifacts are under `../.inspect-monet-1.0.97/`: `cards-scan.txt`,
`native-picker-literals.txt`, `native-button-literals.txt`, `cards-schema.txt`,
`cards-focus.txt`, `cards-state.txt` and `native-focus-directions.txt`.
Full original instruction/register/reference/literal/branch fingerprints and
access flags are validated before mutation.

Five original methods change:

- `La/pt2;->k(I)I`: public static final, three registers, no try blocks. Index 2's
  shared `jb2.o(value,4,20)` becomes `Math.max(value,4)`, preserving instruction
  width and result placement. This covers global/custom preference reads/writes
  and derived row state without changing unrelated clamps.
- `La/mq2;->C0(Ljava/lang/String;IIIZLa/zz4;La/kq1;La/iq1;La/yr1;I)V`:
  public static final, 87 registers, 555 original instructions, no try blocks.
  A five-instruction prefix adjusts only the 4..20 card-count maximum parameter
  v80 to Integer.MAX_VALUE. All native dialog and Compose code executes.
  The native M0 button calls at original indexes 321 and 429 are adapted, passing
  their eleven original arguments plus q15 state, min and max. The adapters invoke
  the original renderer for the existing minus/plus controls and the ten-card steps.
  Original index 533's Apply call gains a footer adapter that renders Max followed
  by the unchanged native Apply callback in the existing centered Row. Nine extra
  argument moves use dead v57-v65, including the native q15 state and min/max.
  Original index 331's integer-to-string call gains a scoped Max formatter while
  keeping the original text renderer and style. Register count stays unchanged:
  v57-v70 are dead at the two button sites; the intervening native eq6 text-style
  construction redefines its full argument range before reading it. Live saved
  registers v72-v76 remain untouched. The five-instruction prefix plus 40 argument
  preparation instructions produce 600 total instructions.
- `La/mq2;->L0(Ljava/lang/String;La/iq1;La/cm1;La/cm1;La/yr1;I)V`:
  public static final, 37 registers, 196 original instructions, no try blocks.
  Replace index 63's focus-lambda cast with a native properties adapter, then
  restore the move-result/cast. Branches targeting the original location also
  enter the adapter. Only the registered Max/Apply focus requesters gain a
  horizontal neighbor and an enabled Up target; native pill rendering, typography
  and click behavior are preserved. Unrelated native pill buttons are untouched.
- `La/d46;->u(Ljava/lang/String;IIIILa/kq1;)La/e46;`: public static, 19 registers,
  no try blocks. A two-instruction adapter after min/max copies changes only the
  continue-watching/recommendations/live-channel card-limit schema maxima.
- `La/yq2;->I0(I[Ljava/lang/Object;La/yr1;)Ljava/lang/String;`: public static final,
  four registers, no try blocks. A four-instruction prefix returns Max only for
  resource `0x7f110354` (`media_action_visible_cards_value`) with its one argument
  equal to Integer.MAX_VALUE; other resource formatting remains native.

The runtime bridge also proves the original themed renderer
`La/mq2;->M0(Ljava/lang/String;ZLa/cm1;La/zz4;La/iq1;La/cm1;La/cm1;La/cm1;La/yr1;II)V`,
`La/q15;->g()I` / `i(I)V`, public `cm1()` focus constructor,
`La/iq1;->b()Ljava/lang/Object;`, native Unit and empty-slot fields, and composer
`g0(I)V`, `S()Ljava/lang/Object;`, `q0(Ljava/lang/Object;)V`, `q(Z)V` methods.
Native style objects and composition locals pass through unchanged. The lower
row uses the original L0 pill renderer for both Max and Apply, so their colors,
shape and typography match. Each additional button has a remembered native focus
requester. Left/Right stays within each row. Down from every count button
enters Max; Right goes to Apply and Left returns to Max. Up returns to an enabled
count button, including at the minimum and when Max disables the plus buttons.
Max and Apply link horizontally, and Apply retains its original native click
callback. Every extension Compose group closes even if rendering fails. Native
`kq1.a(Object)` and `wl1.e/k/j(cm1)` focus-setter contracts are verified as well.

Actions write the same native q15 draft as the original controls. No native
confirmation/dismissal callback is replaced. Finite steps use long intermediates
to avoid overflow. Per-picker control state is remembered in Compose; its lookup
map uses weak keys and weak values, retaining no closed picker. The Java-only
extension has no Android window/widget, lifecycle, network or preference code,
and excludes Kotlin runtime dependencies.

## Historical 1.0.97 verification

Run with Java 21 through `build-local.ps1`:

```powershell
$env:ORG_GRADLE_PROJECT_morpheDesktopJar = 'E:/Morphe/morphe-desktop-1.19.1-all.jar'
.\build-local.ps1 :patches:buildAndroid :patches:verifyMonetDisplayedCards :patches:verifyMonetDisplayedCardsRuntime :patches:verifyMonetDisplayedCardsBundle :patches:generatePatchesList :patches:verifyMorpheDesktopImport --offline
```

The DEX verifier checks missing/duplicate/already-patched rejection, native argument
registers, unlimited arithmetic, scoped schema/summary changes and DEX write/reload.
It reverses the intended hooks and verifies the original C0/L0 fingerprints,
checking that unrelated rendering and confirmation code is preserved. The runtime verifier runs production code against native
renderer/state/composer fixtures and checks four count-row buttons plus Max/Apply
in the footer, matching native pill styling, unchanged style identity, original
focus requesters, horizontal/vertical navigation, Apply callback preservation, theme
changes, remembered focus/actions, shared draft state, overflow/minimum, unrelated
pickers and group balance on success/failure. These are host checks, not TV tests.

Navigation regression checks follow the actual key path to a rendered, enabled
button. They cover Down from every enabled count control to Max, Right to Apply,
Left back to Max, and Up from both footer buttons at 4, a normal value and Max.

The packaged verifier applies the actual bundle alone, with catalog rows and with
catalog rows plus each premium alternative. It checks serialized hooks, native
method preservation, callback packaging and cross-DEX class uniqueness. Desktop
import covers 33 patches across eight apps.

Bundle: `patches/build/libs/patches-0.14.0.mpp`. Verified with Desktop **1.19.1**,
using the explicit JAR override shown above. Standalone rebuild output:
`../Apps/Monet/monet-1.0.97-displayed-cards-unsigned.apk`. After rebuilding, run
`verifyMonetDisplayedCardsApk` to verify native classes/methods and unrelated
non-DEX files. The validation APK is unsigned and is not installed automatically. Final APK
verification checks all five hooks, original native classes and unchanged non-DEX
files; alignment is checked with `zipalign -c 4`.

Device checks remain: original theme appearance, all remote directions, button
spacing, native Save/Back behavior, process restart, 30/372/Max on builtin/catalog
rows and scrolling larger rows.
