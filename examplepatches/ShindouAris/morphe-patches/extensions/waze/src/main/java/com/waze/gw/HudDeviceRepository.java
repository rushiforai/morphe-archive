package com.waze.gw;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Persistent explicit device selection with one-time migration from hud_link_dev. */
final class HudDeviceRepository {
    static final int TRANSPORT_AUTO = 0;
    static final int TRANSPORT_SPP = 1;
    static final int TRANSPORT_BLE = 2;
    static final int TRANSPORT_WS = 3;
    static final int TRANSPORT_USB = 4;
    static final String WS_HOST_KEY = "hud_link_ws_host";
    static final String WS_PORT_KEY = "hud_link_ws_port";
    static final String WS_PATH_KEY = "hud_link_ws_path";
    static final int WS_DEFAULT_PORT = 8765;
    static final String USB_BAUD_KEY = "hud_link_usb_baud";
    static final String USB_DEVICE_NAME_KEY = "hud_link_usb_device_name";
    static final String USB_DEVICE_ID_KEY = "hud_link_usb_device_id";
    static final String USB_DEVICE_VID_KEY = "hud_link_usb_vid";
    static final String USB_DEVICE_PID_KEY = "hud_link_usb_pid";
    static final int USB_DEFAULT_BAUD = 115200;
    private static final String PREFS = "waze_hud_gw";
    // These keys are deliberately separate from the legacy HLP device keys below.  A VietMap
    // selection must never overwrite the ESP/HLP device that an existing installation uses.
    static final String VIETMAP_ADDRESS_KEY = "hud_link_vietmap_device_address";
    static final String VIETMAP_NAME_KEY = "hud_link_vietmap_device_name";
    static final String VIETMAP_TRANSPORT_KEY = "hud_link_vietmap_transport";
    static final String VIETMAP_FAMILY_KEY = "hud_link_protocol_family";
    static final String VIETMAP_DETECTED_SERVICE_KEY = "hud_link_vietmap_detected_service";
    static final String VIETMAP_PROTOCOL_KEY = "hud_link_vietmap_protocol";
    static final String ACTIVE_FAMILY_KEY = "hud_link_active_family";
    static final String VIETMAP_ENABLED_KEY = "hud_link_vietmap_enabled";
    private final SharedPreferences prefs;

    HudDeviceRepository(Context context) {
        prefs = context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    String address() { return prefs.getString("hud_link_device_address", ""); }
    String name() { return prefs.getString("hud_link_device_name", ""); }
    int transport() { return prefs.getInt("hud_link_transport", TRANSPORT_AUTO); }
    String webSocketHost() { return prefs.getString(WS_HOST_KEY, "").trim(); }
    int webSocketPort() {
        int value = prefs.getInt(WS_PORT_KEY, WS_DEFAULT_PORT);
        return value >= 1 && value <= 65535 ? value : WS_DEFAULT_PORT;
    }
    String webSocketPath() {
        String value = prefs.getString(WS_PATH_KEY, "/hlp").trim();
        if (value.length() == 0) return "/hlp";
        return value.charAt(0) == '/' ? value : "/" + value;
    }

    String address(HudProtocolFamily family) {
        return isVietMap(family) ? vietMapAddress() : address();
    }

    String name(HudProtocolFamily family) {
        return isVietMap(family) ? vietMapName() : name();
    }

    int transport(HudProtocolFamily family) {
        return isVietMap(family) ? vietMapTransport() : transport();
    }

    int effectiveTransport(HudProtocolFamily family) {
        int configured = transport(family);
        if (configured != TRANSPORT_AUTO || isVietMap(family)) return configured;
        return prefs.getInt("hud_link_device_transport", TRANSPORT_SPP);
    }

    String vietMapAddress() { return prefs.getString(VIETMAP_ADDRESS_KEY, ""); }
    String vietMapName() { return prefs.getString(VIETMAP_NAME_KEY, ""); }
    int vietMapTransport() { return prefs.getInt(VIETMAP_TRANSPORT_KEY, TRANSPORT_AUTO); }
    String vietMapDetectedService() {
        return prefs.getString(VIETMAP_DETECTED_SERVICE_KEY, "");
    }
    String vietMapProtocol() { return prefs.getString(VIETMAP_PROTOCOL_KEY, ""); }

    HudProtocolFamily vietMapExplicitFamily() {
        return HudProtocolFamily.fromPreference(prefs.getString(VIETMAP_FAMILY_KEY, "auto"));
    }

    /** Resolve the stored VietMap choice without probing or trying another protocol. */
    HudProtocolFamily vietMapFamily() {
        return HudProtocolSelector.select(vietMapExplicitFamily(),
                Collections.singletonList(vietMapDetectedService()), vietMapTransport());
    }

    /**
     * Resolve only the VietMap device slot. This is a selection, not permission to start it.
     * Keeping that distinction avoids a user merely browsing/selecting a VietMap HUD taking over
     * the active legacy HLP connection.
     */
    HudProtocolFamily protocolFamily() {
        if (hasVietMapSelection()) return vietMapFamily();
        return address().length() == 0 ? HudProtocolFamily.AUTO : HudProtocolFamily.HLP1;
    }

    /** Active family defaults to HLP/1 on every pre-VietMap installation. */
    HudProtocolFamily activeFamily() {
        HudProtocolFamily value = HudProtocolFamily.fromPreference(
                prefs.getString(ACTIVE_FAMILY_KEY, HudProtocolFamily.HLP1.preferenceValue()));
        return value == HudProtocolFamily.AUTO ? HudProtocolFamily.HLP1 : value;
    }

    void setActiveFamily(HudProtocolFamily family) {
        HudProtocolFamily value = family == null || family == HudProtocolFamily.AUTO
                ? HudProtocolFamily.HLP1 : family;
        prefs.edit().putString(ACTIVE_FAMILY_KEY, value.preferenceValue()).apply();
    }

    boolean isFamilyEnabled(HudProtocolFamily family) {
        if (family == HudProtocolFamily.VIETMAP_H50 || family == HudProtocolFamily.VIETMAP_H1) {
            return prefs.getBoolean(VIETMAP_ENABLED_KEY, false)
                    && HudFeatureFlags.isRuntimeEnabled(family);
        }
        return prefs.getBoolean("hud_link", false);
    }

    boolean isActiveEnabled() { return isFamilyEnabled(activeFamily()); }

    void setVietMapEnabled(boolean enabled) {
        prefs.edit().putBoolean(VIETMAP_ENABLED_KEY, enabled).apply();
    }

    boolean isVietMapEnabled() { return prefs.getBoolean(VIETMAP_ENABLED_KEY, false); }

    /** The selected-family API avoids a VietMap slot ever overwriting the legacy HLP device. */
    boolean hasSelection(HudProtocolFamily family) {
        if (family == HudProtocolFamily.HLP1
                && effectiveTransport(family) == TRANSPORT_WS) {
            return webSocketHost().length() > 0;
        }
        if (family == HudProtocolFamily.HLP1
                && effectiveTransport(family) == TRANSPORT_USB) {
            return hasUsbSelection();
        }
        return address(family).length() > 0;
    }
    String detectedService() { return vietMapDetectedService(); }

    private boolean hasVietMapSelection() {
        return vietMapAddress().length() > 0 || prefs.contains(VIETMAP_FAMILY_KEY)
                || vietMapDetectedService().length() > 0;
    }

    /**
     * Persist a VietMap selection in its own namespace. AUTO stores the advertised service so a
     * later reconnect can use the same deterministic result; it never touches legacy HLP keys.
     */
    void selectVietMap(String address, String name, int transport,
                       HudProtocolFamily explicitFamily,
                       Iterable<String> advertisedServiceUuids) {
        HudProtocolFamily explicit = explicitFamily == null
                ? HudProtocolFamily.AUTO : explicitFamily;
        String detected = HudProtocolSelector.detectedService(advertisedServiceUuids, transport);
        prefs.edit()
                .putString(VIETMAP_ADDRESS_KEY, address == null ? "" : address)
                .putString(VIETMAP_NAME_KEY, name == null ? "" : name)
                .putInt(VIETMAP_TRANSPORT_KEY, transport)
                .putString(VIETMAP_FAMILY_KEY, explicit.preferenceValue())
                .putString(VIETMAP_DETECTED_SERVICE_KEY, detected)
                .apply();
    }

    void selectVietMap(String address, String name, int transport,
                       String explicitFamily, Iterable<String> advertisedServiceUuids) {
        selectVietMap(address, name, transport,
                HudProtocolFamily.fromPreference(explicitFamily), advertisedServiceUuids);
    }

    void setVietMapProtocol(String protocol) {
        prefs.edit().putString(VIETMAP_PROTOCOL_KEY, protocol == null ? "" : protocol).apply();
    }

    void forgetVietMap() {
        prefs.edit().remove(VIETMAP_ADDRESS_KEY).remove(VIETMAP_NAME_KEY)
                .remove(VIETMAP_TRANSPORT_KEY).remove(VIETMAP_FAMILY_KEY)
                .remove(VIETMAP_DETECTED_SERVICE_KEY).remove(VIETMAP_PROTOCOL_KEY).apply();
    }

    void select(String address, String name, int transport) {
        prefs.edit()
                .putString("hud_link_device_address", address == null ? "" : address)
                .putString("hud_link_device_name", name == null ? "" : name)
                .putInt("hud_link_device_transport", transport)
                .putInt("hud_link_transport", transport)
                .putBoolean("hud_link_migrated", true)
                .apply();
    }

    void forget() {
        prefs.edit().remove("hud_link_device_address")
                .remove("hud_link_device_name")
                .remove("hud_link_device_transport")
                .apply();
    }

    /**
     * Legacy installs stored a name or MAC in hud_link_dev. Migrate only when it identifies one
     * bonded device; never pick an arbitrary member of a duplicate-name set.
     */
    boolean migrateLegacyIfUnambiguous(BluetoothAdapter adapter) {
        if (address().length() > 0 || prefs.getBoolean("hud_link_migrated", false)) return false;
        String legacy = prefs.getString("hud_link_dev", "");
        if (legacy == null || legacy.trim().length() == 0) return false;
        List<BluetoothDevice> matches = new ArrayList<BluetoothDevice>();
        for (BluetoothDevice device : adapter.getBondedDevices()) {
            String addr = safeAddress(device);
            String n = safeName(device);
            boolean prefix = "WazeHUD".equalsIgnoreCase(legacy)
                    || legacy.endsWith("*");
            String prefixValue = legacy.endsWith("*")
                    ? legacy.substring(0, legacy.length() - 1) : legacy;
            if (legacy.equalsIgnoreCase(addr) || legacy.equals(n)
                    || (prefix && n.startsWith(prefixValue))) matches.add(device);
        }
        if (matches.size() != 1) return false;
        BluetoothDevice device = matches.get(0);
        select(safeAddress(device), safeName(device), TRANSPORT_SPP);
        return true;
    }

    BluetoothDevice selectedClassic(BluetoothAdapter adapter) {
        return selectedClassic(adapter, HudProtocolFamily.HLP1);
    }

    BluetoothDevice selectedClassic(BluetoothAdapter adapter, HudProtocolFamily family) {
        if (adapter == null) return null;
        String selected = address(family);
        if (selected.length() == 0) return null;
        for (BluetoothDevice device : adapter.getBondedDevices()) {
            if (selected.equalsIgnoreCase(safeAddress(device))) return device;
        }
        return null;
    }

    private static boolean isVietMap(HudProtocolFamily family) {
        return family == HudProtocolFamily.VIETMAP_H50 || family == HudProtocolFamily.VIETMAP_H1;
    }

    static String safeAddress(BluetoothDevice device) {
        try { return device == null ? "" : String.valueOf(device.getAddress()); }
        catch (SecurityException e) { return ""; }
    }

    static String safeName(BluetoothDevice device) {
        try { return device == null ? "" : String.valueOf(device.getName()); }
        catch (SecurityException e) { return ""; }
    }

    // ---- USB Serial device selection ----

    int usbBaudRate() {
        int value = prefs.getInt(USB_BAUD_KEY, USB_DEFAULT_BAUD);
        return value > 0 ? value : USB_DEFAULT_BAUD;
    }

    String usbDeviceName() { return prefs.getString(USB_DEVICE_NAME_KEY, ""); }

    int usbVid() { return prefs.getInt(USB_DEVICE_VID_KEY, 0); }

    int usbPid() { return prefs.getInt(USB_DEVICE_PID_KEY, 0); }

    String usbDeviceId() { return prefs.getString(USB_DEVICE_ID_KEY, ""); }

    boolean hasUsbSelection() { return UsbDeviceSelection.hasValidIds(usbVid(), usbPid()); }

    void setUsbDevice(int vid, int pid, String name, String deviceId) {
        prefs.edit()
                .putInt(USB_DEVICE_VID_KEY, vid)
                .putInt(USB_DEVICE_PID_KEY, pid)
                .putString(USB_DEVICE_NAME_KEY, name == null ? "" : name)
                .putString(USB_DEVICE_ID_KEY, deviceId == null ? "" : deviceId)
                .apply();
    }

    void setUsbBaudRate(int baudRate) {
        prefs.edit().putInt(USB_BAUD_KEY, baudRate > 0 ? baudRate : USB_DEFAULT_BAUD).apply();
    }

    void forgetUsb() {
        prefs.edit().remove(USB_DEVICE_VID_KEY).remove(USB_DEVICE_PID_KEY)
                .remove(USB_DEVICE_NAME_KEY).remove(USB_DEVICE_ID_KEY).apply();
    }
}
