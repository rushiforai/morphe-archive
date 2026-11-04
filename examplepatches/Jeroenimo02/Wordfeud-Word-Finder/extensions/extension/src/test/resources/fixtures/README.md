# Test fixtures

Real Wordfeud 5.7.1 API responses, captured with a probe build on 2026-11-01 and reassembled from logcat chunks
(the probe logged each response in 3000-character pieces at offsets @0, @3000, @6000). Every reassembled
response parsed as valid JSON; nothing was truncated, completed or invented.

| File | Source | Content |
|---|---|---|
| `detail_neigen.json` | first `user/games/detail` in `logcat-output.txt` | game 4391319402 after NEIGEN (local) and TON (opponent), plus one other game |
| `move_hoort.json` | `game/4391319402/move` response in `logcat-output.txt` | same game after HOORT over the existing O at (10,5) |
| `detail_mandje.json` | last `user/games/detail` in `probe4.txt` (after the MANDJE move) | 7 games, incl. 4391372380 (MANDJE, local position 1), real `swap` and `resign` events, and an ended game (`end_game: 2`) |

Anonymisation (the only changes to the server bytes, apart from re-serialisation by Python's `json.dumps`):
- `players[].username` -> `PlayerA` for the local player, `PlayerB` for every opponent;
- `players[].avatar_updated` -> `0`;
- `players[].id` (user ids) -> `0`.
No other personal fields occur in these responses. Game ids, timestamps and racks are unchanged.
