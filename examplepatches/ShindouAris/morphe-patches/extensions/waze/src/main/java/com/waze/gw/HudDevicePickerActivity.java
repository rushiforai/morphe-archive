package com.waze.gw;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanFilter;
import android.bluetooth.le.ScanResult;
import android.bluetooth.le.ScanSettings;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.ParcelUuid;
import android.provider.Settings;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Explicit Classic/BLE device selection. Pairing itself remains in Android system settings. */
public final class HudDevicePickerActivity extends Activity {
    public static final String EXTRA_HUD_PROFILE = "hud_profile";
    static final String PROFILE_HLP1 = "hlp1";
    static final String PROFILE_VIETMAP = "vietmap";
    private static final int COLOR_BG = 0xFF0B0D12;
    private static final int COLOR_PANEL = 0xFF13161E;
    private static final int COLOR_CONTROL = 0xFF1B1F29;
    private static final int COLOR_TEXT = 0xFFF3F4F6;
    private static final int COLOR_MUTED = 0xFF9AA3B2;
    private static final int COLOR_BORDER = 0xFF2A2F3B;
    private static int COLOR_ACCENT = AmbientTheme.WAZE_BLUE;
    private static final int COLOR_BLUE = 0xFF55C7FF;
    private static final int COLOR_OK = 0xFF65D7A2;

    private final Handler handler = new Handler();
    private final Map<String, BluetoothDevice> bleDevices =
            new LinkedHashMap<String, BluetoothDevice>();
    private final Map<String, List<String>> bleAdvertisedServices =
            new LinkedHashMap<String, List<String>>();
    private LinearLayout bondedList;
    private LinearLayout bleList;
    private TextView bondedEmpty;
    private TextView bleEmpty;
    private TextView scanStatus;
    private TextView scanAction;
    private TextView adapterStatus;
    private BluetoothLeScanner scanner;
    private boolean scanning;
    private boolean started;
    private boolean softwareFilteredScan;
    private boolean enableAfterSelect;
    private boolean vietMapMode;

    private final Runnable stopScanRunnable = new Runnable() {
        @Override public void run() { stopBleScan(); }
    };

    private final Runnable scanFallbackRunnable = new Runnable() {
        @Override public void run() {
            if (!scanning || scanner == null || !bleDevices.isEmpty()) return;
            try {
                scanner.stopScan(callback);
                softwareFilteredScan = true;
                scanner.startScan(null,
                        new ScanSettings.Builder()
                                .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY).build(),
                        callback);
                setScanStatus(vietMapMode
                        ? I18n.tr("hud_link.running_a_general_scan_and_filtering")
                        : I18n.tr("hud_link.running_a_general_scan_and_filtering_2"), true);
            } catch (Throwable ignored) { }
        }
    };

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        COLOR_ACCENT = AmbientTheme.color(this);
        enableAfterSelect = getIntent().getBooleanExtra("enable_after_select", false);
        vietMapMode = PROFILE_VIETMAP.equalsIgnoreCase(
                getIntent().getStringExtra(EXTRA_HUD_PROFILE));
        getWindow().setStatusBarColor(COLOR_BG);
        getWindow().setNavigationBarColor(COLOR_BG);
        getWindow().getDecorView().setSystemUiVisibility(0);

        FrameLayout page = new FrameLayout(this);
        page.setBackgroundColor(COLOR_BG);
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int horizontal = isWide() ? dp(32) : dp(18);
        content.setPadding(horizontal, dp(12), horizontal, dp(36));
        int contentWidth = Math.min(getResources().getDisplayMetrics().widthPixels, dp(900));
        ScrollView.LayoutParams contentLp = new ScrollView.LayoutParams(
                contentWidth, ViewGroup.LayoutParams.WRAP_CONTENT);
        contentLp.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        scroll.addView(content, contentLp);
        page.addView(scroll, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        setContentView(page);

        addHeader(content);
        addConnectionCard(content);
        addQuickActions(content);

        addSectionHeader(content, I18n.tr("hud_link.paired"), null, null);
        bondedList = new LinearLayout(this);
        bondedList.setOrientation(LinearLayout.VERTICAL);
        content.addView(bondedList, matchWrap());
        bondedEmpty = addEmptyState(bondedList,
                vietMapMode
                        ? I18n.tr("hud_link.no_paired_vietmap_bluetooth_classic_devices")
                        : I18n.tr("hud_link.no_paired_bluetooth_classic_devices"));

        addSectionHeader(content, vietMapMode
                        ? I18n.tr("hud_link.nearby_vietmap_ble_devices") : I18n.tr("hud_link.nearby_ble_devices"), I18n.tr("hud_link.scan_for_10_seconds"),
                new View.OnClickListener() {
                    @Override public void onClick(View view) {
                        if (scanning) stopBleScan(); else startBleScan();
                    }
                });
        scanStatus = new TextView(this);
        scanStatus.setText(I18n.tr("hud_link.tap_scan_to_find_hud_devices"));
        scanStatus.setTextSize(13);
        scanStatus.setTextColor(COLOR_MUTED);
        LinearLayout.LayoutParams statusLp = matchWrap();
        statusLp.bottomMargin = dp(8);
        content.addView(scanStatus, statusLp);

        bleList = new LinearLayout(this);
        bleList.setOrientation(LinearLayout.VERTICAL);
        content.addView(bleList, matchWrap());
        bleEmpty = addEmptyState(bleList, vietMapMode
                ? I18n.tr("hud_link.no_vietmap_h50_h1_ble_devices")
                : I18n.tr("hud_link.no_hlp_ble_devices_found_yet"));
        showBonded();
        updateAdapterStatus();
    }

    private void addHeader(LinearLayout root) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        TextView back = new TextView(this);
        back.setText("‹");
        back.setTextSize(40);
        back.setTextColor(COLOR_TEXT);
        back.setGravity(Gravity.CENTER);
        back.setContentDescription(I18n.tr("hud_link.back"));
        back.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { finish(); }
        });
        row.addView(back, new LinearLayout.LayoutParams(dp(44), dp(52)));

        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        TextView title = text(vietMapMode ? I18n.tr("hud_link.choose_a_vietmap_device") : I18n.tr("hud_link.choose_a_hud_device"),
                23, COLOR_TEXT, true);
        TextView subtitle = text(vietMapMode
                        ? "VietMap H50 / H1 qua Bluetooth"
                        : I18n.tr("hud_link.bluetooth_classic_and_bluetooth_low_energy"), 13,
                COLOR_MUTED, false);
        copy.addView(title);
        copy.addView(subtitle);
        LinearLayout.LayoutParams copyLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        copyLp.leftMargin = dp(6);
        row.addView(copy, copyLp);
        root.addView(row, matchWrap());
    }

    private void addConnectionCard(LinearLayout root) {
        LinearLayout card = surface(COLOR_PANEL, 20, COLOR_BORDER, 1);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(18), dp(18), dp(18), dp(18));

        TextView glyph = text("⌁", 32, COLOR_ACCENT, true);
        glyph.setGravity(Gravity.CENTER);
        glyph.setBackground(circle(0xFF2A1722));
        card.addView(glyph, new LinearLayout.LayoutParams(dp(54), dp(54)));

        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.setPadding(dp(14), 0, 0, 0);
        copy.addView(text(vietMapMode ? "HUD VietMap" : "HUD Link", 18, COLOR_TEXT, true));
        HudDeviceRepository repository = new HudDeviceRepository(this);
        String name = cleanName(vietMapMode ? repository.vietMapName() : repository.name());
        String address = vietMapMode ? repository.vietMapAddress() : repository.address();
        String selected = address.length() == 0 ? I18n.tr("hud_link.no_device_selected")
                : (name.length() == 0 ? address : name + "  •  " + address);
        copy.addView(text(selected, 14, address.length() == 0 ? COLOR_MUTED : COLOR_OK, false));
        adapterStatus = text(I18n.tr("hud_link.checking_bluetooth"), 12, COLOR_MUTED, false);
        adapterStatus.setPadding(0, dp(5), 0, 0);
        copy.addView(adapterStatus);
        card.addView(copy, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        boolean enabled = !vietMapMode && getSharedPreferences("waze_hud_gw", MODE_PRIVATE)
                .getBoolean("hud_link", false);
        TextView badge = text(vietMapMode ? I18n.tr("hud_link.runtime_off") : (enabled ? I18n.tr("hud_link.turned_on") : I18n.tr("hud_link.turned_off")),
                11, vietMapMode ? COLOR_MUTED : (enabled ? COLOR_OK : COLOR_MUTED), true);
        badge.setGravity(Gravity.CENTER);
        badge.setPadding(dp(11), dp(7), dp(11), dp(7));
        badge.setBackground(pill(0xFF20242D, COLOR_BORDER));
        card.addView(badge);

        LinearLayout.LayoutParams cardLp = matchWrap();
        cardLp.topMargin = dp(16);
        cardLp.bottomMargin = dp(18);
        root.addView(card, cardLp);
    }

    private void addQuickActions(LinearLayout root) {
        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(isWide() ? LinearLayout.HORIZONTAL : LinearLayout.VERTICAL);

        LinearLayout settings = actionCard(I18n.tr("hud_link.bluetooth_settings"),
                vietMapMode ? I18n.tr("hud_link.pair_a_vietmap_classic_hud")
                        : I18n.tr("hud_link.pair_an_hc_05_hc_06"), I18n.tr("hud_link.open_settings"));
        settings.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                try { startActivity(new Intent(Settings.ACTION_BLUETOOTH_SETTINGS)); }
                catch (Throwable ignored) { setScanStatus(I18n.tr("hud_link.couldnt_open_bluetooth_settings"), false); }
            }
        });
        LinearLayout enable = actionCard(I18n.tr("hud_link.turn_on_bluetooth"),
                vietMapMode ? I18n.tr("hud_link.allow_finding_nearby_vietmap_huds")
                        : I18n.tr("hud_link.allow_waze_mod_to_find_and"), I18n.tr("hud_link.turn_on_now"));
        enable.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                try { startActivity(new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)); }
                catch (Throwable ignored) { setScanStatus(I18n.tr("hud_link.couldnt_send_the_request_to_turn"), false); }
            }
        });

        if (isWide()) {
            LinearLayout.LayoutParams first = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            first.rightMargin = dp(6);
            actions.addView(settings, first);
            LinearLayout.LayoutParams second = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            second.leftMargin = dp(6);
            actions.addView(enable, second);
        } else {
            actions.addView(settings, matchWrap());
            LinearLayout.LayoutParams second = matchWrap();
            second.topMargin = dp(10);
            actions.addView(enable, second);
        }
        LinearLayout.LayoutParams lp = matchWrap();
        lp.bottomMargin = dp(22);
        root.addView(actions, lp);
    }

    private LinearLayout actionCard(String title, String subtitle, String action) {
        LinearLayout card = surface(COLOR_CONTROL, 16, COLOR_BORDER, 1);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(14));
        card.setClickable(true);
        enableHoverLift(card);
        card.addView(text(title, 16, COLOR_TEXT, true));
        TextView sub = text(subtitle, 12, COLOR_MUTED, false);
        sub.setPadding(0, dp(3), 0, dp(11));
        card.addView(sub);
        card.addView(text(action + "  ›", 12, COLOR_ACCENT, true));
        return card;
    }

    private void addSectionHeader(LinearLayout root, String label, String action,
                                  View.OnClickListener listener) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = text(label, 12, COLOR_MUTED, true);
        row.addView(title, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        if (action != null) {
            scanAction = text(action, 12, COLOR_ACCENT, true);
            scanAction.setGravity(Gravity.CENTER);
            scanAction.setPadding(dp(13), dp(8), dp(13), dp(8));
            scanAction.setBackground(pill(0xFF2A1722, 0xFF533044));
            scanAction.setOnClickListener(listener);
            row.addView(scanAction);
        }
        LinearLayout.LayoutParams lp = matchWrap();
        lp.topMargin = dp(4);
        lp.bottomMargin = dp(9);
        root.addView(row, lp);
    }

    private void showBonded() {
        if (bondedList == null) return;
        bondedList.removeAllViews();
        int count = 0;
        try {
            BluetoothAdapter adapter = adapter();
            if (adapter != null) {
                for (BluetoothDevice device : adapter.getBondedDevices()) {
                    if (device.getType() == BluetoothDevice.DEVICE_TYPE_LE) continue;
                    final String address = HudDeviceRepository.safeAddress(device);
                    final String name = cleanName(HudDeviceRepository.safeName(device));
                    if (address.length() == 0) continue;
                    bondedList.addView(deviceCard(address, name,
                            HudDeviceRepository.TRANSPORT_SPP, Collections.<String>emptyList()),
                            deviceCardParams());
                    count++;
                }
            }
        } catch (SecurityException e) {
            setScanStatus(I18n.tr("hud_link.the_nearby_devices_permission_is_needed"), false);
        }
        if (count == 0) bondedEmpty = addEmptyState(bondedList, vietMapMode
                ? I18n.tr("hud_link.no_paired_vietmap_bluetooth_classic_devices")
                : I18n.tr("hud_link.no_paired_bluetooth_classic_devices"));
    }

    private View deviceCard(final String address, final String name, final int transport) {
        return deviceCard(address, name, transport, Collections.<String>emptyList());
    }

    private View deviceCard(final String address, final String name, final int transport,
                            final List<String> advertisedServices) {
        HudDeviceRepository repository = new HudDeviceRepository(this);
        boolean selected = address.equalsIgnoreCase(vietMapMode
                ? repository.vietMapAddress() : repository.address());
        final HudProtocolFamily vietMapFamily = vietMapMode
                ? classifyVietMap(advertisedServices, transport) : HudProtocolFamily.HLP1;
        LinearLayout card = surface(selected ? 0xFF251925 : COLOR_CONTROL, 16,
                selected ? COLOR_ACCENT : COLOR_BORDER, selected ? 2 : 1);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(13), dp(12), dp(13), dp(12));
        card.setClickable(true);
        enableHoverLift(card);

        TextView glyph = text(transport == HudDeviceRepository.TRANSPORT_SPP ? "C" : "B",
                16, transport == HudDeviceRepository.TRANSPORT_SPP ? COLOR_ACCENT : COLOR_BLUE, true);
        glyph.setGravity(Gravity.CENTER);
        glyph.setBackground(circle(transport == HudDeviceRepository.TRANSPORT_SPP
                ? 0xFF34202B : 0xFF172D37));
        card.addView(glyph, new LinearLayout.LayoutParams(dp(44), dp(44)));

        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.setPadding(dp(13), 0, dp(8), 0);
        copy.addView(text(name.length() == 0 ? I18n.tr("hud_link.unnamed_device") : name,
                16, COLOR_TEXT, true));
        copy.addView(text(address, 12, COLOR_MUTED, false));
        card.addView(copy, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        String trailing;
        if (selected) trailing = I18n.tr("hud_link.in_use");
        else if (vietMapMode && transport == HudDeviceRepository.TRANSPORT_SPP)
            trailing = I18n.tr("hud_link.choose_profile");
        else if (vietMapMode && vietMapFamily == HudProtocolFamily.VIETMAP_H50)
            trailing = "H50  ›";
        else if (vietMapMode && vietMapFamily == HudProtocolFamily.VIETMAP_H1)
            trailing = "H1  ›";
        else trailing = transport == HudDeviceRepository.TRANSPORT_SPP
                ? "CLASSIC  ›" : "BLE  ›";
        TextView badge = text(trailing, 11, selected ? COLOR_OK : COLOR_MUTED, true);
        badge.setGravity(Gravity.CENTER);
        card.addView(badge);
        card.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                if (!vietMapMode) {
                    select(address, name, transport);
                } else if (transport == HudDeviceRepository.TRANSPORT_SPP) {
                    chooseVietMapClassicProfile(address, name);
                } else if (vietMapFamily == HudProtocolFamily.VIETMAP_H50
                        || vietMapFamily == HudProtocolFamily.VIETMAP_H1) {
                    selectVietMap(address, name, transport, HudProtocolFamily.AUTO,
                            advertisedServices);
                }
            }
        });
        return card;
    }

    private LinearLayout.LayoutParams deviceCardParams() {
        LinearLayout.LayoutParams lp = matchWrap();
        lp.bottomMargin = dp(8);
        return lp;
    }

    private TextView addEmptyState(LinearLayout host, String message) {
        TextView empty = text(message, 13, COLOR_MUTED, false);
        empty.setGravity(Gravity.CENTER);
        empty.setPadding(dp(18), dp(20), dp(18), dp(20));
        empty.setBackground(surfaceDrawable(COLOR_PANEL, 14, COLOR_BORDER, 1));
        host.addView(empty, matchWrap());
        return empty;
    }

    private void startBleScan() {
        if (!started) return;
        if (android.os.Build.VERSION.SDK_INT >= 31
                && checkSelfPermission(android.Manifest.permission.BLUETOOTH_SCAN)
                != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{android.Manifest.permission.BLUETOOTH_SCAN}, 4102);
            return;
        }
        if (android.os.Build.VERSION.SDK_INT < 31
                && checkSelfPermission(android.Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{android.Manifest.permission.ACCESS_FINE_LOCATION}, 4102);
            return;
        }
        try {
            BluetoothAdapter adapter = adapter();
            if (adapter == null || !adapter.isEnabled()) {
                setScanStatus(I18n.tr("hud_link.bluetooth_is_off_turn_it_on"), false);
                return;
            }
            scanner = adapter.getBluetoothLeScanner();
            if (scanner == null) {
                setScanStatus(I18n.tr("hud_link.this_device_has_no_ble_scanner"), false);
                return;
            }
            bleDevices.clear();
            bleAdvertisedServices.clear();
            bleList.removeAllViews();
            bleEmpty = addEmptyState(bleList, vietMapMode
                    ? I18n.tr("hud_link.looking_for_nearby_vietmap_h50_h1")
                    : I18n.tr("hud_link.looking_for_nearby_hlp_ble_devices"));
            scanning = true;
            softwareFilteredScan = false;
            if (scanAction != null) scanAction.setText(I18n.tr("hud_link.stop_scan"));
            List<ScanFilter> filters = vietMapMode ? vietMapScanFilters()
                    : java.util.Collections.singletonList(new ScanFilter.Builder()
                            .setServiceUuid(new ParcelUuid(HlpUuids.SERVICE)).build());
            scanner.startScan(filters,
                    new ScanSettings.Builder().setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY).build(),
                    callback);
            handler.removeCallbacks(stopScanRunnable);
            handler.removeCallbacks(scanFallbackRunnable);
            handler.postDelayed(scanFallbackRunnable, 3_500L);
            handler.postDelayed(stopScanRunnable, 10_000L);
            setScanStatus(vietMapMode
                    ? I18n.tr("hud_link.scanning_for_10_seconds_put_the")
                    : I18n.tr("hud_link.scanning_for_10_seconds_put_the_2"), true);
        } catch (SecurityException e) {
            setScanStatus(I18n.tr("hud_link.the_nearby_devices_permission_is_needed_2"), false);
        } catch (Throwable e) {
            setScanStatus(I18n.tr("hud_link.couldnt_start_the_ble_scan"), false);
        }
    }

    private final ScanCallback callback = new ScanCallback() {
        @Override public void onScanResult(int callbackType, ScanResult result) {
            if (vietMapMode) {
                if (!isVietMapResult(result)) return;
            } else if (softwareFilteredScan && !isHlpResult(result)) return;
            final BluetoothDevice device = result == null ? null : result.getDevice();
            if (device == null) return;
            final String address = HudDeviceRepository.safeAddress(device);
            if (address.length() == 0 || bleDevices.containsKey(address)) return;
            final List<String> advertisedServices = serviceUuidStrings(result);
            bleDevices.put(address, device);
            bleAdvertisedServices.put(address, advertisedServices);
            runOnUiThread(new Runnable() {
                @Override public void run() {
                    if (bleList == null) return;
                    if (bleEmpty != null) {
                        bleList.removeView(bleEmpty);
                        bleEmpty = null;
                    }
                    String name = cleanName(HudDeviceRepository.safeName(device));
                    bleList.addView(deviceCard(address, name,
                            HudDeviceRepository.TRANSPORT_BLE, advertisedServices),
                            deviceCardParams());
                    setScanStatus(vietMapMode
                            ? I18n.f("hud_link.found_0_vietmap_ble_device_s", bleDevices.size())
                            : I18n.f("hud_link.found_0_hlp_ble_device_s", bleDevices.size()), true);
                }
            });
        }
    };

    private boolean isHlpResult(ScanResult result) {
        if (result == null || result.getScanRecord() == null) return false;
        java.util.List<ParcelUuid> uuids = result.getScanRecord().getServiceUuids();
        if (uuids == null) return false;
        ParcelUuid expected = new ParcelUuid(HlpUuids.SERVICE);
        for (ParcelUuid uuid : uuids) if (expected.equals(uuid)) return true;
        return false;
    }

    private boolean isVietMapResult(ScanResult result) {
        return HudDevicePickerLogic.acceptsVietMapBle(serviceUuidStrings(result));
    }

    private List<String> serviceUuidStrings(ScanResult result) {
        ArrayList<String> services = new ArrayList<String>();
        if (result == null || result.getScanRecord() == null) return services;
        List<ParcelUuid> uuids = result.getScanRecord().getServiceUuids();
        if (uuids == null) return services;
        for (ParcelUuid uuid : uuids) if (uuid != null)
            services.add(HudProtocolSelector.normalizeUuid(uuid.toString()));
        return services;
    }

    private List<ScanFilter> vietMapScanFilters() {
        ArrayList<ScanFilter> filters = new ArrayList<ScanFilter>(2);
        filters.add(new ScanFilter.Builder().setServiceUuid(new ParcelUuid(
                java.util.UUID.fromString(HudProtocolSelector.VIETMAP_H50_SERVICE_UUID))).build());
        filters.add(new ScanFilter.Builder().setServiceUuid(new ParcelUuid(
                java.util.UUID.fromString(HudProtocolSelector.VIETMAP_H1_SERVICE_UUID))).build());
        return filters;
    }

    private HudProtocolFamily classifyVietMap(Iterable<String> services, int transport) {
        return HudDevicePickerLogic.classifyVietMap(services, transport);
    }

    private void stopBleScan() {
        handler.removeCallbacks(stopScanRunnable);
        handler.removeCallbacks(scanFallbackRunnable);
        if (!scanning) return;
        scanning = false;
        softwareFilteredScan = false;
        try { if (scanner != null) scanner.stopScan(callback); } catch (Throwable ignored) { }
        if (scanAction != null) scanAction.setText(I18n.tr("hud_link.scan_again"));
        if (bleDevices.isEmpty()) {
            setScanStatus(vietMapMode
                    ? I18n.tr("hud_link.no_vietmap_h50_h1_ble_hud")
                    : I18n.tr("hud_link.no_hlp_ble_hud_found_check"), false);
            if (bleList != null && bleList.getChildCount() == 0)
                bleEmpty = addEmptyState(bleList, vietMapMode
                        ? I18n.tr("hud_link.no_vietmap_ble_devices_in_this")
                        : I18n.tr("hud_link.no_hlp_ble_devices_in_this"));
        } else {
            setScanStatus(I18n.f("hud_link.done_0_device_s_found", bleDevices.size()), true);
        }
    }

    private void setScanStatus(String message, boolean positive) {
        if (scanStatus == null) return;
        scanStatus.setText(message);
        scanStatus.setTextColor(positive ? COLOR_OK : COLOR_MUTED);
    }

    private void updateAdapterStatus() {
        if (adapterStatus == null) return;
        BluetoothAdapter adapter = adapter();
        boolean enabled = false;
        try { enabled = adapter != null && adapter.isEnabled(); }
        catch (SecurityException ignored) { }
        adapterStatus.setText(adapter == null ? I18n.tr("hud_link.bluetooth_unavailable")
                : (enabled ? I18n.tr("hud_link.bluetooth_is_on") : I18n.tr("hud_link.bluetooth_is_off")));
        adapterStatus.setTextColor(enabled ? COLOR_OK : COLOR_MUTED);
    }

    private BluetoothAdapter adapter() {
        BluetoothManager manager = (BluetoothManager) getSystemService(BLUETOOTH_SERVICE);
        return manager == null ? null : manager.getAdapter();
    }

    private void select(String address, String name, int transport) {
        new HudDeviceRepository(this).select(address, name, transport);
        if (enableAfterSelect) {
            getSharedPreferences("waze_hud_gw", MODE_PRIVATE).edit()
                    .putBoolean("hud_link", true).apply();
            HudLinkService.reconfigure(this);
        } else if (getSharedPreferences("waze_hud_gw", MODE_PRIVATE)
                .getBoolean("hud_link", false)) {
            HudLinkService.reconfigure(this);
        }
        setResult(RESULT_OK);
        finish();
    }

    private void selectVietMap(String address, String name, int transport,
                               HudProtocolFamily explicitFamily,
                               Iterable<String> advertisedServices) {
        // VietMap runtime is deliberately gated off.  Selection is persisted for the future
        // adapter, but this picker must never mutate the legacy hud_link flag or start HLP service.
        new HudDeviceRepository(this).selectVietMap(address, name, transport,
                explicitFamily, advertisedServices);
        setResult(RESULT_OK);
        finish();
    }

    private void chooseVietMapClassicProfile(final String address, final String name) {
        final String[] labels = new String[]{"VietMap H50", "VietMap H1 / DJBT"};
        final HudProtocolFamily[] families = new HudProtocolFamily[]{
                HudProtocolFamily.VIETMAP_H50, HudProtocolFamily.VIETMAP_H1};
        final android.app.AlertDialog dialog = new android.app.AlertDialog.Builder(this)
                .setTitle(I18n.tr("hud_link.choose_a_vietmap_profile"))
                .setMessage(I18n.tr("hud_link.bluetooth_classic_does_not_advertise_a"))
                .setSingleChoiceItems(labels, -1, null)
                .setNegativeButton(I18n.tr("hud_link.cancel"), null)
                .create();
        dialog.setOnShowListener(new android.content.DialogInterface.OnShowListener() {
            @Override public void onShow(android.content.DialogInterface ignored) {
                dialog.getListView().setOnItemClickListener(
                        new android.widget.AdapterView.OnItemClickListener() {
                            @Override public void onItemClick(android.widget.AdapterView<?> parent,
                                                              View view, int position, long id) {
                                HudProtocolFamily family = families[position];
                                selectVietMap(address, name, HudDeviceRepository.TRANSPORT_SPP,
                                        family, serviceForFamily(family));
                                dialog.dismiss();
                            }
                        });
            }
        });
        dialog.show();
    }

    private List<String> serviceForFamily(HudProtocolFamily family) {
        return HudDevicePickerLogic.manualServices(family);
    }

    @Override protected void onStart() {
        super.onStart();
        started = true;
    }

    @Override protected void onResume() {
        super.onResume();
        updateAdapterStatus();
        if (bondedList != null) showBonded();
    }

    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions,
                                                     int[] results) {
        super.onRequestPermissionsResult(requestCode, permissions, results);
        if (requestCode == 4102 && results.length > 0
                && results[0] == PackageManager.PERMISSION_GRANTED) startBleScan();
        else if (requestCode == 4102) setScanStatus(
                I18n.tr("hud_link.without_the_nearby_devices_permission_ble"), false);
    }

    @Override protected void onStop() {
        started = false;
        stopBleScan();
        super.onStop();
    }

    @Override protected void onDestroy() {
        stopBleScan();
        handler.removeCallbacksAndMessages(null);
        super.onDestroy();
    }

    private TextView text(String value, float size, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    private void enableHoverLift(final View view) {
        view.setOnHoverListener(new View.OnHoverListener() {
            @Override public boolean onHover(View hoveredView, android.view.MotionEvent event) {
                boolean hovered = event.getActionMasked()
                        != android.view.MotionEvent.ACTION_HOVER_EXIT;
                hoveredView.animate()
                        .scaleX(hovered ? 1.008f : 1f)
                        .scaleY(hovered ? 1.008f : 1f)
                        .translationZ(hovered ? dp(3) : 0)
                        .setDuration(100L).start();
                return false;
            }
        });
    }

    private LinearLayout surface(int color, int radiusDp, int strokeColor, int strokeDp) {
        LinearLayout view = new LinearLayout(this);
        view.setBackground(surfaceDrawable(color, radiusDp, strokeColor, strokeDp));
        return view;
    }

    private GradientDrawable surfaceDrawable(int color, int radiusDp, int strokeColor, int strokeDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radiusDp));
        if (strokeDp > 0) drawable.setStroke(dp(strokeDp), strokeColor);
        return drawable;
    }

    private GradientDrawable circle(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(color);
        return drawable;
    }

    private GradientDrawable pill(int color, int strokeColor) {
        return surfaceDrawable(color, 99, strokeColor, 1);
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private String cleanName(String value) {
        return value == null || "null".equalsIgnoreCase(value.trim()) ? "" : value.trim();
    }

    private boolean isWide() {
        return getResources().getConfiguration().screenWidthDp >= 600;
    }

    private int dp(float value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }
}
