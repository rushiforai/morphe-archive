package com.waze.gw;

import java.util.UUID;

/** Frozen BLE identifiers. The same logical HLP/1 messages are used over SPP and BLE. */
final class HlpUuids {
    private HlpUuids() {}

    static final UUID SPP =
            UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
    static final UUID SERVICE =
            UUID.fromString("8a7e0001-4d6e-4c48-9a9d-484c504c0001");
    /** Android -> device writes. */
    static final UUID TX =
            UUID.fromString("8a7e0002-4d6e-4c48-9a9d-484c504c0001");
    /** Device -> Android notifications. */
    static final UUID RX =
            UUID.fromString("8a7e0003-4d6e-4c48-9a9d-484c504c0001");
    static final UUID CAPABILITIES =
            UUID.fromString("8a7e0004-4d6e-4c48-9a9d-484c504c0001");
    static final UUID STATUS =
            UUID.fromString("8a7e0005-4d6e-4c48-9a9d-484c504c0001");
    static final UUID CCCD =
            UUID.fromString("00002902-0000-1000-8000-00805f9b34fb");
}
