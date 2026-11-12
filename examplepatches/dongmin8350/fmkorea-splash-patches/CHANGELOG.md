# Changelog

## 1.1.0

- Add opt-in **Collapse FMKorea ad spaces** resource patch using the verified v17.4 custom.js hook.
- Collapse explicit ad containers and hidden fixed-height ad placeholders, including dynamically recreated spaces.
- Preserve bridge code and reject unrecognized assets; replace previous injection on repatch.
- Add DOM regression tests and run them before the bundle build in CI.
- Publish a new versioned release so Morphe detects the update.
