package com.waze.gw;

import java.util.Map;

/** Optional session capability for HLP devices that advertise dynamic configuration. */
interface HudConfigurableSession extends HudProtocolSession {
    boolean applyDeviceConfig(long revision, Map<String, Object> candidate);
}
