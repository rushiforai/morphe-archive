# Shared navigation broadcast implementation plan

**Goal:** Export Flitsmeister speed, effective road limit and average-zone progress/observed average in the background using the Waze-compatible schema, with one common action supported by both providers.

**Architecture:** Preserve Waze v1 actions and fields. Add `nl.johninnl.navigation.NAVIGATION_STATE` and request counterpart to both apps, with source_package. Share the Java state/publisher source between the extensions, using small per-provider adapters. Flitsmeister hooks capture original fresh GPS fixes, final effective limits and active inside-zone/segment state without using the overlay. Calculate distance/time average from observed fixes, mark partial coverage and estimated progress. Do not rely on paid sample-average UI gates. Keep new numeric data optional with validity/TTL/clear state.

**Approved direction:** The user requested implementation of the researched patch using the same method as Waze. The research report and existing schema define scope; routine internal design choices are resolved here.

- [x] Inspect Waze contract, Flitsmeister actual DEX signatures and module conventions. Create isolated branch from dev; preserve other work.
- [x] Write failing behavioral tests for shared action/schema, current GPS speed freshness and stationary zero, zone segment resets, unit normalization, expiry and clearing.
- [x] Implement shared protocol/state/publisher source and provider adapters. Retain all Waze legacy fields/actions; include current speed in Waze too.
- [x] Add default-on Flitsmeister Broadcast navigation data patch with optional receiverPackage, exact guarded producer hooks and active service lifecycle clear. No overlay dependency.
- [x] Run extension and patch build tests, full Python checks and both supplied APK application validations. Repair failures, retain bounded evidence.
- [x] Validate actual hooked callbacks and cross-UID broadcasts on owned emulator with both Activities backgrounded and overlays disabled. One receiver handles both providers through common action/keys. Check metrics, timestamps, expiry, resets, stopping and original Waze compatibility.
- [x] Document common contract, receiver sample and app-specific limits in English/Dutch. Review changes.

Delivery: commit with required identity, publish the development prerelease and verify its signed bundle through the same receiver probes. The final Actions run and published artifact provide delivery evidence.

Promote the completed patches to main under the user’s existing instruction. Preserve main-only controls, validate the isolated candidate and verify the signed stable release after promotion.
