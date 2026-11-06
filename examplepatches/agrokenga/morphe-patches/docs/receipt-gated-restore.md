# Receipt-Gated Restore — Design Notes

Status: design only. Nothing in this document has been implemented.

Goal: let an owner of KoPP2 content re-enable **only the content they can show they
purchased**, after the PlayFab backend and store listing went offline. This is deliberately
not a blanket unlock and not a general IAP bypass.

## 1. Why the naive patches fail

The purchase path is server-authoritative:

1. Unity Purchasing delivers a `Product` to `GooglePlayIAP.ProcessPurchase`.
2. `GooglePlayIAP` sends `ReceiptJson` + `Signature` to PlayFab
   (`ValidateGooglePlayReceipt`-style request).
3. PlayFab returns `Fulfillments`.
4. `IAPService.GrantPurchase` / `GrantPurchasedItems` grants the returned items, currencies,
   furniture, and races.

With the backend gone, step 2 cannot succeed. A static patch that forces step 4 to run
without step 2 is the blanket unlock we are avoiding. A static patch that forces step 2 to
"succeed" still has no fulfillment data, because that data lived on the server.

Separately, the local unlocks path is `UnlocksService`:

```text
CloudScriptFunction<GetUnlocksRequest, GetUnlocksResponse> GetCall
GrantUnlocks(GetUnlocksResponse response)
```

`GetUnlocksResponse` carries `HashSet<string> Unlocks`, `Dictionary<string,int> FurnitureLevels`,
and `HashSet<string> PlayerRaces`. `ReportLocalUnlocksRequest` carries the same shapes for
upload. That is the natural client-side place to re-inject a local record.

## 2. Trust model

A local record is **user-controlled by construction**. It cannot be DRM-grade, and pretending
otherwise would be dishonest. The realistic goal is:

- The patch grants a SKU only if the record contains that SKU.
- The record is produced by the owner from their own order history.
- The patch ships with no baked-in "everything" list and no default-on unlock.
- The record is per-install/per-user, not a universal key that can be redistributed.

This stops casual blanket unlocking. It does not stop a determined user from editing a local
JSON file. If that is unacceptable, the only alternative is a server the owner controls, which
is outside this project.

## 3. Entitlement record

Proposed file: `files/entitlements.json` in the app's private storage (or an asset baked at
build time for the per-user variant).

```json
{
  "schema": 1,
  "package": "com.paradoxplaza.kopp2",
  "generatedAt": "2026-11-02T00:00:00Z",
  "source": "google-play-order-history",
  "entries": [
    {
      "type": "platform_sku",
      "id": "starter_kit",
      "orderId": "GPA.1234-...",
      "purchasedAt": "2019-04-01T12:00:00Z",
      "receiptSha256": "…"
    },
    {
      "type": "bundle",
      "id": "starter_kit_02",
      "orderId": "GPA.1234-...",
      "purchasedAt": "2020-01-01T00:00:00Z",
      "receiptSha256": "…"
    },
    {
      "type": "dlc",
      "id": "here_be_dragons"
    }
  ],
  "signature": "base64(ed25519(signature over canonicalized entries))"
}
```

Rules:

- `type` is one of `platform_sku`, `bundle`, `dlc`, `unlock`.
- `id` must match the shipped IDs in [catalog-inventory.md](catalog-inventory.md).
- Unknown types/IDs are ignored and logged, never granted.
- Duplicate IDs are idempotent.
- `signature` is optional at first. If used, the public key is compiled into the patch, the
  private key never ships, and the signer is a small offline tool the owner runs. A missing or
  invalid signature means "grant nothing", not "grant everything".
- The record must never contain wildcard entries.

### Where the record comes from

The 17 platform products are Unity `Consumable` (`type: 0`). Google Play does **not** return
consumed purchases from `queryPurchasesAsync`, so a live on-device query cannot rebuild the
list. Sources that do survive:

- The owner's Google Play order history / purchase emails (order ID, product ID, date).
- A receipt export made while the purchase was still active.
- For non-consumable DLC, an on-device `queryPurchasesAsync` if it is still attached to the
  account.

The record builder is therefore an offline, owner-run helper: it takes order-history rows and
emits the JSON. It does not need the game's backend.

## 4. Mapping the record into the game

Preferred mapping, in order of fidelity:

1. **Unlocks path** — build a `GetUnlocksResponse`-equivalent and call
   `UnlocksService.GrantUnlocks`. This is how the game already applies server-side unlocks
   (items, furniture levels, races). It is the least invasive semantically.
2. **DLC path** — set the relevant `DLC.Unlocked` state for `DLC.UnlockType` entries.
   The `DLC` object exposes `Unlocked` as a getter, so this likely needs the underlying
   save/unlock store rather than the property.
3. **Platform IAP path** — call `IAPService.GrantPurchasedItems(Product, CatalogItem,
   PlayFabBundle)` for a SKU. Problem: the `PlayFabBundle` contents came from the dead
   server, so for `*_02` bundles there is nothing local to grant. This path is only viable
   for SKUs whose contents are reconstructible from local data.

This is why the record schema distinguishes `platform_sku` from `bundle`. A `bundle` entry
can be recognized but may not be grantable without local content data.

## 5. Implementation options

### Option A — build-time per-user bake (no runtime component)

The Morphe patch takes an `ownedSkus` option. The resource patch writes the list into a small
asset, and the native patch grants exactly those entries.

- Pros: stays inside the existing `resourcePatch` + static-patch architecture; no new `.so`.
- Cons: the APK is per-user; the list is visible in the APK; native code still needs
  per-entry logic or a data-driven lookup routine in a code cave. Only practical for a short,
  fixed list of simple unlock flags, not for arbitrary bundle contents.
- Honest assessment: a hand-written ARM64/ARMv7 lookup + grant routine is a large, fragile
  amount of assembly. This is not a small patch.

### Option B — injected runtime shim (recommended for fidelity)

Add a small native library (e.g. `libagrokenga_entitlements.so`) loaded at startup. On load it:

1. Reads `files/entitlements.json`.
2. Verifies the signature (if present).
3. Resolves the il2cpp exports (`il2cpp_domain_get`, `il2cpp_class_from_name`,
   `il2cpp_method_get_from_name`, etc.).
4. Calls `UnlocksService.GrantUnlocks` with the record's unlocks/races/furniture, or the
   appropriate `IAPService` grant for platform SKUs.
5. Logs every decision and refuses anything not in the record.

- Pros: genuinely data-driven, per-user, auditable, and can be updated without re-deriving
  native offsets for every SKU.
- Cons: Morphe alone does not do runtime hooking. This needs a native component plus a way to
  load it (patch `libunity.so`/`libil2cpp.so` or add a `System.loadLibrary` call in DEX).
  It is a different architecture from the current static-only patches.
- This is the only option that can faithfully handle a record with many entries.

### Option C — companion seeding (testing only)

A small adb/root script or debug-build companion writes the game's local save/cache before
launch. No patch.

- Pros: fastest to validate which local keys actually matter.
- Cons: not distributable, fragile across app updates, and requires debuggable/root access.
- Use it to answer the open questions, not as the shipped design.

## 6. Recommended sequence

1. **Confirm the record source.** Can the owner produce order-history rows for the SKUs they
   actually bought? Without that, there is nothing to gate on.
2. **Answer the mapping questions** in [catalog-inventory.md](catalog-inventory.md) §6,
   especially whether the `*_02` bundles were ever sold on Android.
3. **Prototype Option C** on one test device to see whether `UnlocksService.GrantUnlocks`
   with a synthetic response produces the expected in-game unlocks. This is the cheapest
   experiment and does not ship.
4. If the prototype works, implement **Option B** for the unlock/race/furniture path and keep
   platform-SKU grants limited to content that can be reconstructed locally.
5. If a runtime component is off the table, implement **Option A** only for a narrow, explicit
   list (for example, DLC flags), and document that arbitrary bundle contents are out of scope.

## 7. Explicit non-goals

- No universal unlock list.
- No default-on purchase bypass.
- No forged PlayFab validation responses.
- No redistribution of a patched APK containing someone else's entitlements.
- No attempt to make Google Play or PlayFab authorize a new purchase.

## 8. Open questions for the owner

1. Which SKUs were actually purchased, and from which account/store?
2. Is a signed local record acceptable, or is a plain JSON record enough for this use?
3. Is adding a small native runtime component acceptable, or must this stay a static
   `resourcePatch`?
4. Should the record cover only platform SKUs, or also the PlayFab bundles and DLC?
