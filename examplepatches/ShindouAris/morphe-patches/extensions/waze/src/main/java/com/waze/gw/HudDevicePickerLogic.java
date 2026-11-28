package com.waze.gw;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Pure VietMap picker decisions kept independent from Android UI and Bluetooth framework types. */
final class HudDevicePickerLogic {
    private HudDevicePickerLogic() { }

    static HudProtocolFamily classifyVietMap(Iterable<String> services, int transport) {
        ArrayList<String> vietMapServices = new ArrayList<String>();
        if (services != null) {
            for (String value : services) {
                String uuid = HudProtocolSelector.normalizeUuid(value);
                if (HudProtocolSelector.VIETMAP_H50_SERVICE_UUID.equals(uuid)
                        || HudProtocolSelector.VIETMAP_H1_SERVICE_UUID.equals(uuid))
                    vietMapServices.add(uuid);
            }
        }
        return HudProtocolSelector.select(HudProtocolFamily.AUTO, vietMapServices, transport);
    }

    static boolean acceptsVietMapBle(Iterable<String> services) {
        HudProtocolFamily family = classifyVietMap(services, HudDeviceRepository.TRANSPORT_BLE);
        return family == HudProtocolFamily.VIETMAP_H50
                || family == HudProtocolFamily.VIETMAP_H1;
    }

    static List<String> manualServices(HudProtocolFamily family) {
        if (family == HudProtocolFamily.VIETMAP_H50)
            return Collections.singletonList(HudProtocolSelector.VIETMAP_H50_SERVICE_UUID);
        if (family == HudProtocolFamily.VIETMAP_H1)
            return Collections.singletonList(HudProtocolSelector.VIETMAP_H1_SERVICE_UUID);
        return Collections.emptyList();
    }
}
