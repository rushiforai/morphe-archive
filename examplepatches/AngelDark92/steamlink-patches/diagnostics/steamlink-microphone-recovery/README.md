# Microphone input recovery

Optional, default off. Exact Steam Link VR 2.0.20/5001712 only.
Not part of the recommended set. Ported onto hub v2.9.0 without extending
Steam Link base compatibility.

## Mechanism

On Galaxy XR firmware I610UEU2AZF3, starting Gemini closed the shared input.
The framework restored AudioRecord, but legacy AAudio then disconnected the
Steam Link input and stopped invoking its data callback:

```text
restoreRecord_l: dead IAudioRecord, creating a new one
onNewIAudioTrack stream disconnected
setDisconnected
onMoreData() data, stream disconnected
EVENT_MORE_DATA requested 1920 bytes but callback returned -1 bytes
```

The application registers an error callback for its output builder only.
The patch registers that same callback for the input builder too. It only
sets the existing atomic recovery flag; the normal Tick path performs
Init(reinit), rebuilding both streams outside the audio callback.

A failed Init clears the flag rather than repeating every Tick. There is no
timed retry if the first attempt fails, and no cross-disconnect rate limit.
Rebuilding both streams can briefly interrupt playback.

## Exact artifact and edits

Scene library: 2,221,072 bytes. Clean library SHA-256:

```text
80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495
```

Offsets equal virtual addresses in these RX regions:

| Offset | Edit |
|---|---|
| 0xf459c | Redirect the input openStream call to the wrapper at 0xf4808 |
| 0xf4808 | 64-byte wrapper/failure-clear tail in an unreferenced member callback |
| 0xf4898 | Redirect the Tick Init call through the failure-clear tail |

66 bytes differ. File length, ELF headers, existing preset instruction,
permissions, and audio transport are unchanged. The existing callback is
at 0xf472c; PLT setErrorCallback/openStream are 0x208f80/0x208f90; callback
GOT slot is 0x219fa0. Production guards pin their instructions, relocation
records, symbol entries/names, neighbors, and original-or-patched regions.
Partial edits and unknown layouts fail before any write.

The replaced member function has no statically identified caller or data
reference in the analyzed APK; the actual registered callback is a separate
Proc function. External dynamic symbol lookup cannot be excluded absolutely.

## Validation and limits

- Host: actual clean and retained patched libraries applied by the production
  helper; hashes, exact 66-byte difference, preset preservation, immutable
  input, and idempotence checked.
- Portable: synthetic apply/reapply, wrong build/size/preset, corrupted
  instruction/linkage, malformed ELF, and partial-edit rejection.
- Metadata: exact 5001712 compatibility, default off, category and generated
  description contract checked.
- v2.9.0 local full suite: 313 total, 261 passed, 52 skipped, no failures.
  Skips are fixture-dependent audits, not compatibility evidence.
- Android bundle packaging and all catalog generation passed.
- Owner reported that the test1 bundle worked in solo testing. No new
  instrumented runtime capture was made for this result.

The patch does not change Android microphone arbitration. People on the PC
can still hear silence while Gemini captures unless the platform separately
allows concurrent capture. Recovery and concurrent-capture policy are
independent problems. This is not a hiss fix.

## Manual acceptance

Using the same known-good signing identity, apply to clean 2.0.20/5001712
alongside the normal patches and the chosen microphone preset. Verify
normal PC mic delivery, open Gemini, then close it. Mic delivery should
return without minimize/reopen. Check playback interruption, repeated
disconnect/re-init, and normal stop/restart. Any device run needs owner
approval. No APK installation or headset capture is part of local tests.
