# Wolt — Cart Architecture & Export-Cart Feasibility

**Target:** Wolt (`com.wolt.android`) **v26.40.1** (versionCode 142026401, targetSdk 36, minSdk 26)
**Distribution:** split install — `base.apk` (~303 MB, 22 dex) + `split_config.arm64_v8a` + `split_config.en` + `split_config.xxhdpi`. **Must antisplit-merge before patching/testing.**
**UI stack:** native Kotlin. Compose present app-wide, but the **cart screen is Controller + Renderer + RecyclerView Adapter (MVI)** — classic view hooks, not Compose. 

## Patch goal
Add "Export cart" (→ txt/csv) on supermarket/grocery cart pages. Likely the same `CartController` serves restaurant + retail venues (one hook covers both) — **confirm via dynamic recon**.

## Feasibility verdict: GREEN (with caveats)
- **No pairip** VM protection (0 hits across 22 dex) — biggest resign-killer absent.
- **Morphe supports extensions** (precompiled Java `.mpe`) — confirmed in template + official `DisablePlayStoreUpdatesPatch`. Feature-add (CSV build + share intent) goes in an extension, not raw smali.
- Cart is RecyclerView/MVI → real hook points (toolbar menu, renderer, viewholders).

### Resign risks (non-root, must resign + reinstall)
- **Play Integrity present** (`play.core.integrity`, `StandardIntegrityManager`) — server-side; won't hard-crash cart viewing. May affect payment/anti-fraud only. Out of scope for export.
- **`librootChecker.so`** in arm64 split + `getPackageInfo`/`signingInfo` reads (no `GET_SIGNATURES` constant found). Low-moderate risk of a signature/root self-check. If post-resign launch crashes → add a bypass patch (check reference repos). Device is non-root so root check "passing" is fine.
- SHA-1-pinned Google services (Maps address picker, Google Sign-In, Google Pay) **will break after resign** — not fixable by our patch; acceptable for an export feature.

## Verified class map (dex class_defs parse — real runtime descriptors)
All cart code in **classes8.dex** (BasketsRepo in classes6.dex):

| Class | Role |
|---|---|
| `Lcom/wolt/android/new_order/controllers/cart/CartController;` | screen controller (MVI; many `$*Command` inner classes) |
| `Lcom/wolt/android/new_order/controllers/cart/CartModel;` | **cart data model — serialize source** |
| `Lcom/wolt/android/new_order/controllers/cart/CartInteractor;` | business logic |
| `Lcom/wolt/android/new_order/controllers/cart/CartRenderer;` (+ `$Anchor`, `$CheckoutButtonState`) | renders cart view |
| `Lcom/wolt/android/new_order/controllers/cart/CartMenuRenderer;` | **toolbar menu — natural "Export" action hook** |
| `Lcom/wolt/android/new_order/controllers/cart/adapter/CartAdapter;` | RecyclerView adapter |
| `.../adapter/CartDishViewHolder`, `GroupOrderCartDishItemModel`, `ParticipantRow*`, `PlusButtonRow*`… | typed rows / item models |
| `Lcom/wolt/android/core/essentials/baskets/BasketsRepo;` (classes6.dex) | basket source of truth |

Note: Wolt names line items "**Dish**" even for grocery (`CartDishViewHolder`, `DishSection`, `ExpandedDish`).

## Proposed design (MVP = share text, no storage perm)
1. **Extension** `app.cavla.extension.wolt.CartExporter` (Java, → `extensions/wolt/wolt.mpe`):
   - `export(android.view.View anchor, Object cartModel)` — build CSV string from model (reflection or typed, TBD after decompile), fire `Intent.ACTION_SEND` text/csv via `anchor.getContext()`. User picks Save-to-Files / share target. No FileProvider, no manifest edit.
2. **Patch** `app.cavla.patches.wolt.export.ExportCartPatch` (bytecode):
   - `extendWith("extensions/wolt/wolt.mpe")`, `compatibleWith(COMPATIBILITY_WOLT)` pinned to 26.40.1.
   - Hook candidate (pick after decompile/recon): add menu item in `CartMenuRenderer`, OR long-press/button via `CartRenderer` where it holds root view + model.
   - `invoke-static {vView, vModel}, Lapp/cavla/extension/wolt/CartExporter;->export(Landroid/view/View;Ljava/lang/Object;)V`
3. File-to-disk (`ACTION_CREATE_DOCUMENT` / MediaStore Downloads) = phase 2.

## Open questions (need decompile + device)
- CartModel exact shape: item name, qty, unit/total price, currency — field names (R8-obfuscated?). Decides typed-access vs reflection in extension.
- Which view/method in CartRenderer/CartMenuRenderer has both a Context/View and the model.
- Confirm supermarket cart uses this same CartController (dynamic: uiautomator dump).

## Toolchain / env
- have: apktool, smali (standalone smali ok; **baksmali wrapper is broken** — points at a missing jar from another project), apksigner, zipalign, aapt2, jadx, java21, gradle, adb, Android SDK, Morphe Manager (on-device apply).
- Target toolchain for cavla = template's: morphe plugin **1.3.4**, morphe-patcher **1.15.1** (fluffy used 1.12.0).
- **BUILD BLOCKER:** gh token (`C4vla`) scopes = gist/read:org/repo/workflow — **no `read:packages`** for Morphe private Maven. Must `gh auth refresh -h github.com -s read:packages` before any `.mpp` build. Untested whether build works on Termux aarch64 — prove with a clean template/fluffy build first.
- Splits: need an antisplit/merge tool (APKEditor) — don't assume Morphe Manager merges.
- Device: non-root, Shizuku + unprivileged ADB. Install path = resign (new key) → uninstall original (loses login/data!) → `pm install` merged APK.
- `grep`/`find` aliased to ugrep/bfs with broken glibc — use python or absolute binaries.
