# Animated 7TV emote implementation — LOCKED

Status: VERIFIED WORKING in v1.1.17.

The animated 7TV rendering path in `EmoteImageLoader.java` is frozen. Do not modify, refactor, replace, or optimize the following behavior without explicit approval:

- `shouldDecodeAsDrawable(Emote emote)` must continue forcing WebP through drawable decoding.
- Animated WebP data must continue to be retained as raw bytes in `ImageData.animatedBytes`.
- `createDrawable()` must continue using `ImageDecoder.decodeDrawable()` for those bytes.
- `AnimatedImageDrawable` must continue using infinite repeat and `start()`.
- The decoder must continue configuring target dimensions without flattening animated WebP.
- The `ConstantState` requirement must NOT be reintroduced.

Any future emote work must leave this path untouched unless the user explicitly authorizes changes to the animated 7TV implementation.

Verified release: v1.1.17 (`6f1bc4c34eaefc81dca7a1deb372d7767bbbc72` plus release packaging).
