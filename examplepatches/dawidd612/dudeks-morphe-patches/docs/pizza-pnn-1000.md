# Pizza 5.59.0: 1000 PNN sponsor rewards

**Withdrawn on 2026-10-29 at the user's request.** Current bundles no longer
include this patch or its native payloads. This document is historical evidence
for older releases. Repatch the clean input with the current bundle and the same
signing key to restore the game's original sponsor limits and gem quantities.

The optional, default-selected **1000 PNN sponsor rewards** patch supports Good
Pizza, Great Pizza 5.59.0 (2322), ARM64. Each completed PNN/PNN2 sponsor reward
grants **10 gems**, with the reward animation using the same quantity.

The sequence allows 999 completed PNN rewards followed by the original final
PNN2 offer: 1000 rewards in total. This is a counter on the current NewsLayer,
not a persistent daily quota. Opening a new NewsLayer starts a new sequence.
The game's existing saved daily statistics, reset logic, skipping and final
close path remain in place. An attempt without a success callback does not
consume an offer. Other rewarded placements retain their original payouts.

## Use

Patch a clean, complete 5.59.0 ARM64 APKM/XAPK in Morphe with the current patch
bundle. Keep **1000 PNN sponsor rewards** selected. **Skip rewarded ads** may
also be selected to complete the local reward flow without video playback.
**Hide paid offers** is independently optional. Install using your existing
signing key to preserve update compatibility and saved data.

To remove this behavior, repatch the clean input with the sponsor patch
disabled and use the same signing key. Do not patch an already modified APK.
The patch does not fabricate ad-network impressions, paid purchases or billing
success. The existing signed-app paid-checkout cancellation remains unchanged.

## Maintenance and verification

`native/pizzabusiness/pnn-5590.json` contains the reviewed layout, input hashes,
offer count and gem quantity; `pnn-5590.s` contains the small ARM64 hooks.
The builder uses the existing PZB2 delta format and rejects unknown inputs.
Both restored-native and Hide-paid-offers-native variants are bundled. Morphe
chooses by the exact native input hash after initialization and optional store
changes, then validates the complete delta with the existing reader.

Local reproduction, with Python dependencies installed outside the repository:

```powershell
python scripts/build_pizza_pnn_payload.py restored.so pnn.so --delta-dir output
python scripts/test_pizza_pnn_arm64.py --library pnn.so
```

Build dependencies: keystone-engine 0.9.2. Instruction-test dependencies:
unicorn 2.1.4 and pyelftools. These development tools are not needed in Morphe.
The test executes hooks from the actual generated ELF: the 999-to-PNN2
boundary, 10-gem payout instruction and animation, no counter consumption
without success, and preservation of existing members and saved registers.
Both native variants pass; the original ELF fails the success-counter check.
This is instruction-level evidence, not 1000 ads played on Android, a real
ad-network test, or proof of a fresh Android lifecycle/save round trip.

Source build and clean-XAPK patching are checked separately. Runtime acceptance
uses the existing text-only startup/day/TapBlaze smoke; APKs, keys, raw logs,
game libraries and account data stay outside Git. This restoration and the
10-gem change were implemented with OpenAI Codex; no generated art/audio is used.
