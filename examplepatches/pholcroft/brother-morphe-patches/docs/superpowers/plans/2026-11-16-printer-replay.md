# Printer request replay

- Capture bounded ordered single-object GET specifications per printer and completed activity burst, in memory only. Retain credentials only in memory and never export them. Preserve request version, community, ID, timeout and retry settings; use a finite safety timeout for requests that had none. Fail explicitly if the sequence is incomplete or unavailable.
- Run a background identity probe through Brother SNMP code, bypassing all cache, learning, timing and diagnostics hooks. Abort on failure or changed known identity, without modifying cached data or timing.
- Replay captured requests in hook-entry order (which can differ from wire order when requests overlap), measure the replay separately from the probe, stop on transport failure, compare successful results with an immutable snapshot of cached entries. Mark unsupported and uncached comparisons separately.
- Show progress and result automatically; allow opening a readable value comparison screen, clearly separating dynamic state from other changes. Count unsupported values separately and avoid claiming every difference is material.
- Add regression tests for sequence bounds/order, probe failure, identity mismatch, bypass/no mutation, replay order, changed/no-change/unsupported cases, and UI/patch integration. Build and validate APK. Publish only to dev with matching metadata, then verify channels.

