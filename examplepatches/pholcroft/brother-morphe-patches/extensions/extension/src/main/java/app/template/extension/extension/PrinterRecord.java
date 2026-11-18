package app.template.extension.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Identity and observed addresses; an unchanged address is not proof of a fixed IP. */
public final class PrinterRecord {
    public final String id, name, lastAddress, macAddress;
    public final boolean addressChanged;
    private final List<String> addressHistory;

    public PrinterRecord(String id, String name, String lastAddress, String macAddress,
                         List<String> addressHistory, boolean addressChanged) {
        if (id == null || id.isEmpty() || addressHistory == null) throw new IllegalArgumentException();
        this.id = id; this.name = name; this.lastAddress = lastAddress; this.macAddress = macAddress;
        this.addressChanged = addressChanged;
        this.addressHistory = Collections.unmodifiableList(new ArrayList<>(addressHistory));
    }

    public List<String> addressHistory() { return addressHistory; }
}
