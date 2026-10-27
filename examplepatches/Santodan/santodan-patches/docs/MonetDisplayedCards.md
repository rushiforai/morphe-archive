# Monet unlimited displayed cards

Select **Monet - Unlimited displayed cards** for original Monet
`com.klevico.monet` **1.0.97** (version code 131, Android 8.0+).
It works independently or with **Monet - Individual Nuvio catalog rows** and either
premium alternative. Select only one premium alternative.

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

## Original input and DEX contracts

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

## Verification

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
