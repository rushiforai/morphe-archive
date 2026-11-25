# DecontaPatches - Morphe Patch Repository

## Overview
- **Project**: DecontaPatches (Independent Morphe patch bundle)
- **Author**: Deconta (GitHub: `Deconta`)
- **Remote**: `https://github.com/Deconta/deconta-patches.git`
- **Location**: `E:\AI\Coding\deconta-patches`
- **Target App**: Dirk Rossmann GmbH Android App (`de.rossmann.app.android`, v5.11.1)
- **Morphe Source URL**: `https://morphe.software/add-source?github=deconta/deconta-patches`

## Architecture & How It Works

### 1. Bytecode Patching (`patches/`)
- Tool: `app.morphe.patcher`
- File: `patches/src/main/kotlin/de/deconta/patches/rossmann/coupons/AutoClaimCouponsPatch.kt`
- Hook: Targets `de.rossmann.app.android.ui.coupon.CouponsFragment->L(Ljava/lang/Object;)V` (called whenever coupons UI data loads or refreshes).
- Injection: Injects `invoke-static {p0, p1}, Lde/deconta/extension/rossmann/AutoClaimCoupons;->onCouponsLoaded(Ljava/lang/Object;Ljava/lang/Object;)V` at index 0.

### 2. Runtime Extension (`extensions/`)
- File: `extensions/extension/src/main/java/de/deconta/extension/rossmann/AutoClaimCoupons.java`
- Package: `de.deconta.extension.rossmann`
- Core Responsibilities:
  1. **UI Injection**: Intercepts `LegacyCouponsAdapter.p` (`SearchCouponsViewHolder`) and replaces `tvCount` (`d`, "X Coupons") with a horizontal row holding `tvCount` and a custom styled `[ ⚙️ Deconta ]` pill button.
  2. **Settings Dialog**: Clicking `[ ⚙️ Deconta ]` opens an `AlertDialog` with:
     - `Coupons automatisch aktivieren` (Default: ON, SharedPreferences `auto_claim_enabled`)
     - `10%-Coupons schonen` (Default: OFF, SharedPreferences `skip_ten_percent`)
     - `⚡ Alle Coupons jetzt aktivieren` (Instant bulk claim)
     - `🗑️ Alle Coupons deaktivieren` (With confirmation prompt, bulk unclaims wallet)
  3. **10% Singleton Conflict Resolution**: Rossmann Room DB has `is_only_one_per_wallet=1`. Only 1 singleton coupon can be active in the wallet. The code checks `singletonAlreadyInWallet` and limits queueing to at most ONE 10% coupon, preventing `ONLY_ONE_PER_WALLET_ERROR`.
  4. **Presenter & Display Mocking**: Uses reflection to obtain `CouponPresenter` via `CouponPresenterFactory.a()`. Sets field `a` on `Presenter` to a dynamic Proxy implementing `CouponDisplay` where `m()` returns `false` (not busy).
  5. **Activation & Deactivation**: Calls `CouponPresenter.j(couponDisplayModel, context)`. In Rossmann, this method acts as a toggle: activates if not in wallet, deactivates if already in wallet.
  6. **Speed & Feedback**: Runs on main thread with a 120ms staggered delay. Shows start toast (`Aktiviere X Coupons...`), completion toast (`X Coupons erfolgreich aktiviert!`), and calls `adapter.notifyDataSetChanged()`.

## Build & Release Pipeline
- **Branch**: `main`
- **Release Automation**: GitHub Actions workflow `.github/workflows/release.yml`.
- **Versioning**: Managed by `@semantic-release`. Commit prefixes dictate release type:
  - `feat:` -> Minor release (e.g., `v1.2.0` -> `v1.3.0`)
  - `fix:` -> Patch release (e.g., `v1.3.0` -> `v1.3.1`)
  - `chore:`, `docs:`, `refactor:` -> No release or chore
- **Releases**: Publishes `.mpp` (Morphe Patch Package) and assets to GitHub Releases.
