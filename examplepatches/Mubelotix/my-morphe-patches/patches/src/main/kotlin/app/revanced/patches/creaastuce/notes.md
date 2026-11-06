# MyAstuce (fr.cityway.android.creaastuce) — Reverse Engineering Notes

Version: `5.8.74.1938-release-prod` (versionCode `500080074`)
Target SDK: 35, Min SDK: 28

## Architecture Overview

MyAstuce is a French public transit ticketing app built with Clean Architecture / MVVM.
The codebase is aggressively obfuscated (ProGuard/R8).

### Key Classes

| Smali Class | Purpose |
|---|---|
| `Luw2;` | `TicketValidationController` — holds offline validation constraints: `hasAlreadyOfflineValidation()`, `isTickerNumberValid(I)`, `isUserSolvent()` |
| `LLw2;` | `ValidateTicketUseCase` — main validation logic. Methods: `d()` (entry), `g()` (builds validation), `h()` (post-validation storage) |
| `LWA0;` | `GetAccountMobilityUsageServicesUseCase` — loads "Ongoing" and "Portfolio" tabs. Methods: `d()` (main, calls API or fallback), `f()` (offline fallback for Ongoing tab) |
| `LN4;` | `AccountMobilityServiceRepository` — local DB persistence for `AccountMobilityServiceDataBaseObject`. `a()` returns all catalog services. |
| `LEw2;` | `TicketingRepository` — validation storage. `i()` returns current offline validation, `n()` stores validation, `b()` clears. Field `i:I` = default validation duration (5 min). |
| `LGw2;` | `TicketingProvider` interface — API calls for ticketing |
| `LIw2;` | Builds `TicketValidation` domain objects |
| `LiK1;` | Generates offline QR code signatures |

### Database Tables

| Table | Populated by | Read by |
|-------|-------------|---------|
| `OngoingServiceDataBaseObject` | `WA0.d()` when API succeeds (online) | `WA0.f()` (offline fallback) |
| `PortfolioServiceDataBaseObject` | `WA0.d()` when API succeeds | `WA0.d()` offline fallback for portfolio tab |
| `AccountMobilityServiceDataBaseObject` | `WA0.d()` stores catalog, `LLw2.h()` updates balances after offline validation | `LN4.a()`, `WA0.f()` |
| `ValidationDataBaseObject` | `LEw2.n()` | `LEw2.i()`, `LEw2.d()`, `LEw2.j()` |
| `OngoingUsageProductDataBaseObject` | `WA0.d()` during isOngoing store | `WA0.f()` |
| `TicketNetworkDataBaseObject` | `WA0.d()` (cached networks) | `WA0.f()` for building display data |

### TicketValidationStatusType Enum

| Constant | `isOffline` |
|----------|-------------|
| `ONLINE` | false |
| `OFFLINE` | true |
| `OFFLINE_INTERCHANGE` | true |

---

## Ticket Validation Flow (offline)

```
User taps "Validate"
  → ValidationFragmentPresenter.launchValidation()
    → LLw2.d()  (main entry)
      → LLw2.g()  (builds the validation)
        ├─ isUserSolvent()? → patched to always true
        ├─ isTickerNumberValid(ticketCount)? → patched to always true
        ├─ hasAlreadyOfflineValidation()? → patched to always false
        ├─ LiK1.a() → generates offline QR signature
        ├─ calculateEndDate(now, durationSecs) → end date
        ├─ min(offerEndAcceptationDate, calculatedEndDate) → shrunk by stale date
        ├─ PASS check: if offerEndAcceptationDate.after(now) == false → EXPIRED
        └─ LIw2.a() → creates TicketValidation with OFFLINE status
      → LLw2.h()  (stores the result)
        ├─ For UNIT offers: updates UsageProduct balance in AccountMobilityServiceDataBaseObject
        ├─ For non-UNIT: decrements available tickets
        ├─ LEw2.n() → stores validation in ValidationDataBaseObject
        └─ *** NEVER writes to OngoingServiceDataBaseObject *** ← ROOT CAUSE OF ONGOING TAB BUG
```

---

## Ongoing Tab Flow (the bug)

```
User opens "Ongoing" tab
  → MainPresenter.launchOnGoingUsagesUseCase()
    → WA0.d(isOngoing=true)
      ├─ API call: getAccountMobilityUsageServices(true)
      ├─ Network available → API returns services → stores to OngoingServiceDataBaseObject → displays
      └─ Network unavailable (NETWORK_ISSUE):
          → WA0.f()  (offline fallback)
            ├─ LEw2.i() → gets current offline validation
            ├─ Checks getDifferenceInSecond(validityEnd) > 0 → still valid?
            ├─ Reads OngoingServiceDataBaseObject → ALWAYS EMPTY (never written offline)
            ├─ Converts to arrayList6 (filtered services)
            ├─ IF arrayList6.isEmpty(): cond_42 → NETWORK_ISSUE → UI shows empty
            └─ IF arrayList6 non-empty: builds display data, merges with N4 catalog, returns success
```

The validation-aware block that attaches the active validation product to services
(lines 4633–5624 in `WA0.f()`) only runs when `arrayList6` is non-empty and validation is active.
Without it, services lack the validation-specific product entry, so the mTicket tab filters them out.

---

## Patch Summary

### 1. Bypass constraints (`Luw2;`)

| Method | Patch | Why |
|--------|-------|-----|
| `hasAlreadyOfflineValidation()` | return false | Allow multiple offline validations |
| `isTickerNumberValid(I)` | return true | Bypass ticket count check |
| `isUserSolvent()` | return true | Bypass payment method check |

### 2. Fix Ongoing tab (`LWA0;.f()`)

| Location | Change |
|----------|--------|
| Before FIRST `ArrayList.isEmpty()` (line 4627) | Inject `N4.a()` into `arrayList6` → isEmpty returns false → validation-aware block runs → attaches active validation product to TC/PT service |
| At `cond_42` (SECOND isEmpty, line 5638) | Remove isEmpty + if-nez, inject `N4.a()` into `arrayList6` as fallback for validation==DEFAULT path |

Uses `indexOfFirstInstructionReversedOrThrow` for the second isEmpty — there are two
`ArrayList.isEmpty()` calls in `f()`, must target the correct one.

### 3. Fix validation expiry (`LLw2;.g()`)

| Line | Change | Why |
|------|--------|-----|
| Before `calculateEndDate` (line 1163) | `const v6, 0x15180` | Override duration: 86400s = 24h (default is 5min from `Ew2.i`) |
| Before `if-eqz v10, :cond_c` (line 1167) | `const/4 v10, 0x0` | Null `offerEndAcceptationDate` → skips both `getMinimum()` and PASS expiry check |

The `getMinimum(offerEndAcceptationDate, calculatedEndDate)` shrinks the end date if the
stored offer acceptance date is stale/in the past. The PASS check at line 1194 uses
`offerEndAcceptationDate.after(now)` — returns false for past dates, triggering
`DENIED_TICKET_HAS_BEEN_EXPIRED`. Setting v10 to null short-circuits both.

---

## Build & Apply with Morphe

```bash
# Build the Morphe patch bundle
./gradlew buildAndroid

# Apply patches/build/libs/patches-*.mpp to full.apk with Morphe Desktop.
# Select "Offline Validation Fix", then install the resulting APK:
adb install -r patched.apk
```

### Android SDK setup (if needed)
```bash
cp -r /usr/lib/android-sdk /tmp/android-sdk
mkdir -p /tmp/android-sdk/licenses
echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > /tmp/android-sdk/licenses/android-sdk-license
export ANDROID_HOME=/tmp/android-sdk
```

---

## Known Gotchas

1. **`indexOfFirstInstruction` vs `indexOfFirstInstructionReversed`**: `WA0.f()` has TWO
   `ArrayList.isEmpty()` calls — the first at line 4627 (validation guard), the second at
   line 5638 (`cond_42`). Use reversed search for the second one.

2. **Label references in inline smali**: The inline smali compiler cannot resolve labels
   from the outer method (e.g., `goto :cond_e`). Use `const/4` tricks instead of direct
   branch replacements.

3. **Register reuse**: `WA0.f()` has 95 locals. Registers like `v5` and `v6` are reused
   throughout the method. Verify register liveness before injecting code.

4. **`addInstructions` shifts indices**: Each insertion shifts subsequent instructions.
   When making multiple changes to a method, apply from highest index to lowest, or
   search for targets fresh before each modification.

5. **`OngoingServiceDataBaseObject` is NEVER written offline**: The only code path that
   writes to this table is `WA0.d()` when the API succeeds. The offline fallback `WA0.f()`
   only reads it. By design, offline validations never populate the ongoing tab DB.

6. **Validation-aware block skips cond_42 paths**: The block at lines 4633–5624 builds
   `AccountMobilityGenericProduct` from the active validation and attaches it to the
   TC/PT service. Without this block, the mTicket tab doesn't recognize the ticket.

7. **`offerEndAcceptationDate` can be stale**: Stored from a previous API response,
   this date can be in the past. The `min()` and PASS `after()` checks use it and
   will incorrectly mark valid tickets as expired.

8. **Default offline duration is 5 minutes**: Field `Ew2.i` holds the default duration
   (5 minutes = 300 seconds). The `calculateEndDate` uses `minutes * 60`. Override with
   a hardcoded 86400 (24h) for practical offline use.
