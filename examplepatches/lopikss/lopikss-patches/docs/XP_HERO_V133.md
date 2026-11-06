# XP Hero 26.2.0 — S-Ticket cost (v1.3.3)

User confirmed v1.3.2 free rune upgrades and zero-coin trait rerolls work.

## Changes

- **Free S-Ticket Rolls** is a separate opt-in module. Changes the exact `TRAIT_SUPERROLL_COST_AMOUNT` config value from `1` to `0` in the verified original 26.2.0 Unity asset. This updates the local S-Ticket price used by the special trait roll screen; in-game behavior is experimental until tested.
- **Remove broken 5,000 PvP Video Tickets module** from patch selection.
- **Remove broken Free Hero Upgrade (zero shards)** from patch selection. Keep **Hero Upgrade (1-piece test)**, which the project owner confirmed upgrades successfully while spending one shard.

The new module checks the SHA-256 of the original config and refuses altered assets. It makes no changes to the already working shop, rune, hero Level Up / Evolve, or trait coin patches.

## Testing

Check that an S-Ticket button displays FREE / 0, that tapping it actually rerolls the trait, and that the visible S-Ticket count remains unchanged. If zero is rejected by the game's transaction logic, a separate logic patch will be necessary. Keep your synced save protected.
