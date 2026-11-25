# Monet 1.1.2

## Target and scope

Original: `../OriginalApps/monet-1.1.2.apk`; manifest package `com.klevico.monet`,
version 1.1.2, code 136, minimum SDK 26, one `classes.dex`.
SHA-256: `bce58185ad51864a92c356650c35453fd12b506b18b45427eba2f5ea32686ffc`
(`classes.dex` `52a570a7fdd009edffbd95852a607004cc4b29caf6fa5e654847b848968eb2a5`).

- **Monet - Unlock premium** now accepts 1.1.2, retaining 1.1.1 / 1.1.0 / 1.0.97.
- **Monet - Unlock premium (Experimental, any version)** keeps every layout it
  accepted before and is now verified on 1.1.2. Its matcher was also widened to
  tolerate more of the drift kinds R8 can introduce (see below).
- **Unlimited displayed cards** and **Individual Nuvio catalog rows** now also accept
  1.1.2 through separate reviewed `MonetDisplayedCards112` / `MonetCatalogChannels112`
  contracts (see below), retaining 1.1.1 / 1.1.0 / 1.0.97. Select only one premium alternative.

## Native contract (unchanged semantics)

Evidence: `../Skills/inspection-evidence/.inspect-monet-1.1.2/{manifest,billing}.txt`.

- Evaluator: unique public instance `La/dz5;->a()Z`, four registers, no try blocks.
  It has the same 13 instructions and offsets as 1.1.1 (`La/ov5;`). Fields are loaded as `b,a,c,d`, and
  the formula is `b || (a && (c || !d))`. Index 11 (code address 19) is
  `const/4 v3, 0`. Only that literal becomes `1`.
- Billing owner: `La/n70;-><init>(Landroid/content/Context;La/zu0;)V` holds
  `billing_prefs` and `license_blob_v1`. It is the only site that invokes
  `La/dz5;-><init>(ZZ)V`. That constructor stores `a`/`b` and seeds `La/jl7;`
  through the evaluator. The license refresh is `La/dz5;->c(Z)V`: it stores its
  parameter in `b`, then re-evaluates. It is called from `La/n70;->h(String)Z`
  and `La/w60;`.
- R8 merged unrelated code into `La/dz5;` (a `(String,String,Z)` constructor,
  `b()Z`, and outside reads/writes of `c`/`d`). Do not fingerprint its full field
  or method list.

## Future-compatibility hardening

Across 1.0.97 → 1.1.2, the evaluator semantics, billing keys and holder lifecycle
stayed stable. What changed were names, the `final` flag and the descriptor. The
shared matcher (`MonetPremiumPatch.findUnique` / `semantics`) now proves identity
by behavior and ownership only. It accepts everything it accepted before, plus:

- any visibility (public, private, protected or package) with optional `final`.
  Static, synchronized, native and abstract methods are still rejected. Callers may use `invoke-virtual` or
  `invoke-direct` (including range forms).
- the four owned boolean fields loaded in any order, or lazily between branches.
  The truth table is checked against `L || (A && (X || !Y))` with roles bound to fields
  in any order, rather than by load position.
- several or shared return blocks. Every returned value must come from a `const/4 0|1`;
  every such false literal is patched (same width and register). Branching on a
  constant, returning a field, loops, dead code and other opcodes are rejected.
- the storage keys anywhere in the billing owner class, not only in its constructor,
  and holder constructors with one to four boolean parameters.

It also adds one semantic tie-in. The holder's `(Z)V` license refresh must store its
parameter in the field that alone grants premium (`L`). If a refresh stores another
evaluator field, the candidate is rejected.

The regular patch keeps exact compatibility. `MonetPremiumPatch.REVIEWED` maps each
version to its reviewed descriptor, and the targets, the version gate and the bundle verifier
all derive from it. A future release therefore needs one map entry and `LATEST`, after
`verifyMonet` passes on the new original. The experimental alternative needs no code change
while the native contract keeps this shape. It still fails closed if Monet changes its
entitlement logic, inlines the evaluator, or moves the billing keys or refresh.

## Displayed cards 1.1.2

1.1.2 is not a rename-only build. Of the 44 cards/catalog contracts, the clamp, text,
reader, programs, sources, native filter and a few ABI methods are identical apart from
renames. The rest changed literals, registers or structure. Every hook was re-derived from
the original 1.1.2 DEX with conservative liveness and reaching-definition analysis
(`../Skills/inspection-evidence/.inspect-monet-1.1.2/`, `notes.md`).

- Clamp `m73.j` (2), schema `r77.w` (2, v13/v1), Apply renderer `w33.E0` (52, v5/v14),
  text `gx8.a` (77) keep their indexes and registers; button `w33.F0` is a contract.
- Picker `w33.v0` has 72 registers (params v62..v71): min/max are **v64/v65**. Sites are
  button 368 (state v38), number 375 (v1), button 490 and footer `E0` 587 (state v12, copied
  from v38 at 451 on both paths). The state chain was traced to the `cm5` cast at 106.
  **v42/v43/v44 are live in 1.1.2**, so the 1.1.1 v42-v55 scratch block is invalid; the
  adapters now use v44-v57, dead at all four sites.
- Visible-cards summaries are `hx3.f` 256, `xx3.f` 248 and `w33.x0` 543. These are the only
  `media_action_visible_cards` + `String.valueOf(int)` sites; the verifier enforces that set.
- Card callers: `su2.f` (second call) and both merged `mg.f` calls pass 4..20 with the
  decorative preview disabled; `bb`/`pa1` pickers have dynamic bounds and stay native.
- Runtime selects `NativeLayout.v112`; classes map to `ty1, qf8, bs0, as1, fx1, w33, gs1,
  hx1, cm5, ek5`, method names match 1.1.1.

## Catalog rows 1.1.2

- State reducer `gf4.g` (now with a trailing `Map` parameter): selection 539 (row v0),
  row items 694 (v1/v7), owner match 706/707 and channel match 710 (item v13, selection v7,
  filter v11 = `sx0.E`), hidden 721 (v1/row v0), sources 1049/1059.
- **Device crash fixed (row items):** at 694 `v1` may also be Kotlin's shared empty list
  (`rg1.k`, from 574), not an `ArrayList`. The reused 1.1.1 `rowItems(ArrayList, Object)`
  callback made ART reject `gf4` (`VerifyError ... register v1 has type a.rg1 but expected
  java.util.ArrayList`) and Monet crashed at startup. 1.1.2 uses `rowItems112(List, Object)`.
  `MonetHookTypes` now checks every injected extension call's class-typed arguments against
  their reaching definitions in the native, bundle and APK verifiers (with a regression case).
- Row model `sx0`: the custom hidden list moved from `A` to **`D`** (`A` is now a boolean),
  filter `E`; item key moved from `n` to **`iv0.o`** (`n` is a new `ry4`).
- Native 1.1.2 returns no selection for the new **Seerr** media rows; the runtime keeps that.
- Filter `gf4.Q` 113 (`disabled(v2, item v11)`), owner `sx0.h` return at 10, view-model
  `bf4.<init>` array store 247 (Recommendations copy from 103, wrapped into dead v15).
- Shared header `xx3.f`: 1.1.2 added native custom row labels. `contentLabel` is inserted at
  152, after the default section label (`ea4.y4` + `i43.s0` -> v14), so custom names win.
- Content picker `ea4.Y` 427 calls generic `ea4.H1`, which **dropped the predicate argument**
  (17 arguments). The new `contentPicker112` adapter shares the 1.1.0/1.1.1 body.
- Actions: `onSetCustomRowMediaChannel` is `l53.H` and `onSetCustomRowPackages` is
  `l53.P` (now `sr4`), proven from the data-class `toString()` labels.
- Runtime names: reader `n86.m`, converter `n86.n`, sources `gf4.z`, flow `td5.a`,
  `s39.z`, revision `jl7.j`, native filter `ke3.D`; `NativeLayout.v112` selects them.

## Verification

Run with `build-local.ps1 ... --offline`:

- `:patches:verifyMonet` (1.1.2; args: hook `La/dz5;->a()Z`, owner `La/n70;`,
  license field `b`). It also checks the new drift variants (private/final, reordered loads,
  lazy loads, shared return), as well as field-return and conflicting-refresh rejection.
- `:patches:verifyMonet111`: the same verifier on the retained 1.1.1 contract.
- `:patches:verifyMonetBundle` (1.1.2, both alternatives from the built MPP).
- The 1.1.1 combined checks `verifyMonetDisplayedCards111(Bundle)` and
  `verifyMonetCatalog111(Bundle)` exercise the widened matcher with cards/catalog.
- `:patches:verifyMonetDisplayedCards112` (+`Runtime`/`Bundle`/`Apk`) and
  `:patches:verifyMonetCatalog112` (+`Runtime`/`Bundle`/`Apk`); the unversioned
  `verifyMonetDisplayedCards*` / `verifyMonetCatalog*` tasks now run these. The 1.1.1
  native/bundle tasks remain and still pass.
- `:patches:buildAndroid`, `:patches:generatePatchesList`,
  `:patches:verifyMorpheDesktopImport`, `:patches:verifyAndroidBundle`.
- `:patches:verifyMonetCatalog112Apk -PmonetCatalog112Apk=<apk> -PmonetCatalog112Cards=true
  -PmonetCatalog112Premium=true` audits an actual combined rebuild.

Earlier unsigned combined verification build (**crashes on device; superseded**) (catalog rows + displayed cards + regular premium,
Desktop 2.3.0 `patch --unsigned`, bundle 0.21.1):
`../Apps/Monet/Monet-1.1.2-patches-0.21.1-unsigned.apk`
(SHA-256 `bf3f9107ba849a95c98271178375d3b90d44008515172eac6a79c67454f1e70e`). It passed the
combined APK audit (ten catalog hooks, eight card hooks, premium, 9,734 native classes, 32
extension classes, 675 unchanged non-DEX entries including the manifest). It is not signed,
installed or device-tested.
The fixed rebuild is `../Apps/Monet/Monet-1.1.2-patches-0.21.1-rowitems-fix-unsigned.apk`; it
passed the same combined audit including argument type checks. Device confirmation is pending.
