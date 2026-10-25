# Optional Codecs Support telemetry

This component is installed only when the user turns on **Enable telemetry**
inside **Codecs Support**. The option defaults to **false** on the admitted
targets Steam Link **2.0.20/5001712**, **2.0.20/5001812**, **2.0.21/5001968**,
**2.0.22/5002244** and **2.0.23/5002363**. Steam Link **2.0.24/5002395** is not
admitted yet: selecting telemetry on it fails closed instead of installing an
empty ownership receipt. Codec patch
recommendations and compatibility scopes are unchanged. There is no separate
telemetry patch/category and no dependency that selects telemetry automatically.

With the option off, a stock APK receives only the original telemetry-free
codec helper and its manifest. With it on, the same guarded installation
transaction adds `libgxr_telemetry.so`, pinned ShadowHook 2.0.1 libraries,
`XR_APILAYER_local_GalaxyXR_telemetry.json` and its MIT notice. An ownership
receipt records newly created diagnostic files, allowing an off transition to
remove those matching files while retaining preexisting shared libraries and
unknown data. Modified owned files cause the transition to fail before deletion.

The optional helper checks the exact scene ELF load layout and eight independently
audited decoder call-site SHA-256 anchors before hooking the actual MediaCodec
APIs. Source/stock hashes and per-build relocations were derived separately from
each retained decoded base. `profiles.tsv` is the canonical two-build admission
record; its generated C++ header stays in the external build directory. Extra
five-build investigation evidence is retained externally but is not compatibility.

The codec helper is version 8, SHA-256
`c5cac4cae84d76fa35200efc70fc91e5d456d24a0a05e5b88b21177d4c8f24a0`.
Telemetry has private state and hooks actual `libmediandk.so` function entries,
so it observes successful decoder calls even when the codec helper replaces a
decoder internally. It never selects codecs, rewrites video, retries queues or
changes decoder results. ShadowHook UNIQUE mode refuses competing hooks on the
same entry; incomplete hook batches disable observation and roll back.

Collection additionally needs a PC-generated random token in
`/sdcard/Android/data/com.valvesoftware.steamlinkvr/files/colourlab-probe.request`.
Its 30-second lease stops collection after a lost PC connection. Stats contain
cumulative accepted input bytes/frames, output buffers and queue-to-output
residence using device monotonic time. PTS correlates identity, never a clock.
Ambiguous PTS is excluded from timing. These values are separate from network
overhead, radio loss, hardware-only execution time and physically displayed frames.

Verify supplies a new nonce in `colourlab-verify.request`. A bounded complete
input sample is copied at the actual NDK queue entry, after any helper edits,
and exported only after that queue succeeds. SHA-256 and file writes run on a
worker. The capture event includes token, nonce, stream, monotonic timestamp,
length, SHA and `stage=decoder_api_input`. The PC validates all of these and
parses codec structure. Missing/ambiguous/truncated evidence stays inconclusive.
Captures are capped at 16 MiB and saved atomically as `colourlab-capture.bin`.

Build with `Build-Native.ps1 -OutputDirectory <external-directory>`; generated
headers, dependencies and logs remain external. The script verifies the pinned
official Maven AAR SHA-256
`2cad01ff4d59542958775e19f281981a7e84b39670b5fae75905b8511e10c7cd`.
Dependency source/license: https://github.com/bytedance/android-inline-hook/tree/v2.0.1 .
`tests/Run-Tests.ps1` runs the portable observation tests. APK installation,
Android storage permissions, hook acceptance and live headset behavior remain
separate runtime checks; none is established by compilation or host tests.
