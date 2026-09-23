# USB link selection audit — 2026-09-16

Exact input: Steam Link **2.0.23/5002363**, preserved `decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363/lib/arm64-v8a/libvrlink_scene.so`, 2,292,008 bytes, SHA-256 `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0`. Hash independently rechecked. Addresses below are ELF VAs and identical file offsets for this scene's executable segment. Static read-only disassembly; no device commands, native changes or generated binary artifacts.

## Decision

Implement and validate Samsung automatic tethering first. **The inspected scene code does not justify a USB classification or preference patch.** It already accepts `usb0` IPv4. The previously observed `Found primary link` message does not establish a quality/preference decision, and changing the link's category would not itself tell the PC to prefer it. A Wi-Fi-on capture is needed to distinguish duplication from exclusive routing after automatic setup.

## “Primary” means the first accepted receive

`SVLDataLinkUber::AcceptFromTransferer` (`0x170ce8`, size 1,188) decrypts the packet at `0x170d4c`. At `0x170dd0–0x170de4`, it tests `Uber+0x80472`; when zero, it sets that byte and `transfer+0x4c` to 1. It then logs `SVLDataLinkUber: Found primary link %s` at `0x170e14–0x170e1c`. This block has no link-type, latency or throughput comparison.

`HandleInterfaceListChange` deletes a vanished transfer and clears `Uber+0x80472` if `transfer+0x4c` was set (`0x1733c8–0x1733d4`). The next decrypted receive can consequently generate another “primary” log. This explains the Wi-Fi-first, USB-after-Wi-Fi-removal sequence without proving a USB preference failure.

The same flag has significance when multiple links are disabled: `HandleInterfaceListChange` preserves the marked transfer and removes other transfers (`0x173450–0x173490`). With multiple links enabled, it retains the normal accepted interface set. `SetAllowMultipleLinks` (`0x16f188`, size 60) writes `Uber+0x80471`; no USB-specific priority is introduced there.

## Existing transmit and receive behavior

- `InternalTX` (`0x17076c`, size 564), loop `0x1708e0–0x170938`, visits all 16 transfer slots. It skips null transfers, transfer fault byte `+0x40`, and failed `BIsSendValid`; otherwise it invokes `Transmit` with the same encoded buffer. It does not read category `transfer+8` or the primary marker `+0x4c`.
- The fault byte is set by `DataLinkTransferFault` (`0x17223c`) and a failed send in `ProcessTransmitQueue` (`0x176084–0x176090`); it is not a USB/Wi-Fi preference byte.
- `AcceptFromTransferer` accepts decrypted packets across links and uses the sequence/reconstruction window to handle them. It does not gate receive processing on the first-receive marker or link category.

This establishes the inspected Android client's behavior. It does not reverse engineer the PC's independent video transmitter policy, prove every packet is duplicated at runtime, or establish cold USB discovery.

## Categories do not provide an evidenced preference fix

`ScanForLinkChanges` (`0x173788`, size 2,220) assigns `InterfaceAddress+0xc0`:

| Match | Value | Decisive sites |
|---|---:|---|
| Address begins `10.35.78.` or `10.86.199.` | 2 | `0x173a24–0x173aec` |
| Interface begins `usb` and address begins `10.86.2` | 1 | `0x173b24–0x173b58`, `0x173c28–0x173c80`, `0x173d48–0x173d60` |
| Interface begins `usb` or `enx`, address begins `fe80:` | 1 | `0x173b90–0x173ca8`, `0x173ca8–0x173d60` |
| Interface begins `wlx` | 4 | `0x173d68–0x173ebc` |
| Other accepted address | 3 | `0x173e60–0x173e68` |

The stock `wlan` test constructs a 3-character substring and compares its length to 4 (`0x173dc8`, `0x173de8`); it cannot match ordinary `wlan0` through that branch. Do not rely on inferred enum names beyond their numeric values. Samsung `usb0` with `192.168.231.22` reaches 3; its `fe80:` address reaches 1.

`HandleInterfaceListChange` passes the category in `w6` at `0x17318c–0x1731a4`; `AddAndInitLinkTransfer` stores it at `transfer+8` (`0x17231c`). The inspected `InternalTX`/receive/acceptance routines do not use it to choose USB. `SendCurrentAddressList` (`0x16fdb8`, size 464) serializes packet type `0x1803`, family, port, prefix and address; it does **not** serialize the category. Consequently, a client category-only mutation has no demonstrated mechanism to change the host's video route.

## Verification required for the automatic setup patch

After app-context tethering succeeds, connect with Wi-Fi enabled and inspect both Windows and Android interface counters plus per-link traffic. Verify cable reconnect and continued discovery. Treat the USB badge as interface readiness only. Treat a primary log as first accepted receive only. If exclusive USB streaming is a requirement, establish the PC's actual stream policy before adding a native mutation; do not force Wi-Fi off or discard fallback interfaces based solely on interface existence.

Reproduce the hash and Capstone disassembly using the read-only Python recipe in [NATIVE-5002363.md](NATIVE-5002363.md), substituting the symbol ranges recorded above. This report is the only artifact created by this subtask; 0 disposable binary bytes generated or removed.
