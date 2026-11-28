package com.waze.gw;

import java.util.UUID;

/**
 * Immutable BLE GATT identifiers and negotiation settings for one HUD wire protocol.
 *
 * <p>The transport deliberately knows only this profile. It does not infer a protocol from a
 * Bluetooth name and it never probes a second profile after connecting.</p>
 */
final class HudGattProfile {
    final UUID service;
    final UUID write;
    final UUID notify;
    final UUID cccd;
    final int requestedMtu;
    final String protocolFamily;

    /** Existing HLP/1 profile. Keep these identifiers aligned with HlpUuids bit-for-bit. */
    static final HudGattProfile HLP1 = new HudGattProfile(
            HlpUuids.SERVICE,
            HlpUuids.TX,
            HlpUuids.RX,
            HlpUuids.CCCD,
            247,
            "hlp1");

    /** VietMap H50 BLE profile recovered from the interoperability capture. */
    static final HudGattProfile VIETMAP_H50 = new HudGattProfile(
            uuid16(0xFFFF),
            uuid16(0x9ABC),
            uuid16(0x1234),
            HlpUuids.CCCD,
            517,
            "vietmap_h50");

    /** VietMap H1/DJBT BLE profile recovered from the interoperability report. */
    static final HudGattProfile VIETMAP_H1 = new HudGattProfile(
            uuid16(0xFFF0),
            uuid16(0xFFF2),
            uuid16(0xFFF1),
            HlpUuids.CCCD,
            247,
            "vietmap_h1");

    HudGattProfile(UUID service, UUID write, UUID notify, UUID cccd,
                   int requestedMtu, String protocolFamily) {
        if (service == null || write == null || notify == null || cccd == null) {
            throw new NullPointerException("GATT UUIDs must not be null");
        }
        if (requestedMtu < 23) throw new IllegalArgumentException("MTU must be at least 23");
        if (protocolFamily == null || protocolFamily.length() == 0) {
            throw new IllegalArgumentException("protocol family must not be empty");
        }
        this.service = service;
        this.write = write;
        this.notify = notify;
        this.cccd = cccd;
        this.requestedMtu = requestedMtu;
        this.protocolFamily = protocolFamily;
    }

    private static UUID uuid16(int value) {
        return UUID.fromString(String.format(java.util.Locale.US,
                "0000%04X-0000-1000-8000-00805F9B34FB", value & 0xFFFF));
    }
}
