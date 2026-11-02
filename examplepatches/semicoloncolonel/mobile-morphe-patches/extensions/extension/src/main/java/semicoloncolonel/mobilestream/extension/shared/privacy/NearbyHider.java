package semicoloncolonel.mobilestream.extension.shared.privacy;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanSettings;
import android.app.PendingIntent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.telephony.CellLocation;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Executor;

/**
 * "Hide Wi-Fi networks", "Block Bluetooth scanning" and "Hide cell tower info"
 * (all opt-in, every app).
 *
 * Each patch rewrites the app's calls to its framework methods into the static
 * methods below, with the receiver as the first parameter. Retail apps use
 * these signals to tell that you are inside a store: Walmart matches its
 * "walmartwifi" network in Wi-Fi scans, Target's store map ranges the
 * Bluetooth beacons in the store lights, Home Depot's store map and CVS's
 * pharmacy kiosk listen for beacons, and fraud SDKs collect nearby networks
 * and cell towers as a device fingerprint.
 *
 * Each answer is what Android gives an app that has no location or nearby-
 * devices permission: no scan results, a hidden network name, scans that find
 * nothing. Apps already handle that case, so nothing here throws.
 *
 * Everything is decided on-device; nothing is sent anywhere by this class.
 */
@SuppressWarnings({"unused", "deprecation", "MissingPermission"})
public final class NearbyHider {
    private static final String TAG = "MSP-NEARBY";

    /** What Android reports for the network name and access point without permission. */
    private static final String UNKNOWN_SSID = "<unknown ssid>";
    private static final String HIDDEN_MAC = "02:00:00:00:00:00";

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private NearbyHider() {
    }

    private static void logOnce(String what) {
        if (logged.add(what)) {
            Log.i(TAG, "hid " + what);
        }
    }

    // ── Hide Wi-Fi networks ────────────────────────────────────────────────

    public static List<?> getScanResults(WifiManager manager) {
        logOnce("WifiManager.getScanResults");
        return new ArrayList<>();
    }

    /** Reports the scan as not started, the same as when Android throttles scans. */
    public static boolean startScan(WifiManager manager) {
        logOnce("WifiManager.startScan");
        return false;
    }

    public static List<?> getConfiguredNetworks(WifiManager manager) {
        logOnce("WifiManager.getConfiguredNetworks");
        return new ArrayList<>();
    }

    public static String getSSID(WifiInfo info) {
        logOnce("WifiInfo.getSSID");
        return UNKNOWN_SSID;
    }

    public static String getBSSID(WifiInfo info) {
        logOnce("WifiInfo.getBSSID");
        return HIDDEN_MAC;
    }

    public static String getMacAddress(WifiInfo info) {
        logOnce("WifiInfo.getMacAddress");
        return HIDDEN_MAC;
    }

    public static int getNetworkId(WifiInfo info) {
        logOnce("WifiInfo.getNetworkId");
        return -1;
    }

    /**
     * NetworkInfo.getExtraInfo() carries the Wi-Fi network name. "Report Wi-Fi connection" also
     * rewrites this call, so both the original call and NetworkStateSpoofer's land here, and
     * anything that is not Wi-Fi goes on to NetworkStateSpoofer. Either patch order works.
     */
    public static String getExtraInfo(NetworkInfo info) {
        if (info.getType() == ConnectivityManager.TYPE_WIFI) {
            logOnce("NetworkInfo.getExtraInfo");
            return null;
        }
        return NetworkStateSpoofer.getExtraInfo(info);
    }

    // ── Block Bluetooth scanning ───────────────────────────────────────────

    /** The callback never gets a result, the same as a scan in a room with no devices. */
    public static void startScan(BluetoothLeScanner scanner, ScanCallback callback) {
        logOnce("BluetoothLeScanner.startScan");
    }

    public static void startScan(BluetoothLeScanner scanner, List<?> filters, ScanSettings settings,
                                 ScanCallback callback) {
        logOnce("BluetoothLeScanner.startScan");
    }

    /** 0 is the documented success code; no results are ever delivered to the PendingIntent. */
    public static int startScan(BluetoothLeScanner scanner, List<?> filters, ScanSettings settings,
                                PendingIntent callbackIntent) {
        logOnce("BluetoothLeScanner.startScan(PendingIntent)");
        return 0;
    }

    public static boolean startLeScan(BluetoothAdapter adapter, BluetoothAdapter.LeScanCallback callback) {
        logOnce("BluetoothAdapter.startLeScan");
        return false;
    }

    public static boolean startLeScan(BluetoothAdapter adapter, UUID[] serviceUuids,
                                      BluetoothAdapter.LeScanCallback callback) {
        logOnce("BluetoothAdapter.startLeScan");
        return false;
    }

    public static boolean startDiscovery(BluetoothAdapter adapter) {
        logOnce("BluetoothAdapter.startDiscovery");
        return false;
    }

    public static Set<?> getBondedDevices(BluetoothAdapter adapter) {
        logOnce("BluetoothAdapter.getBondedDevices");
        return new HashSet<>();
    }

    // ── Hide cell tower info ───────────────────────────────────────────────

    public static List<?> getAllCellInfo(TelephonyManager manager) {
        logOnce("TelephonyManager.getAllCellInfo");
        return new ArrayList<>();
    }

    public static CellLocation getCellLocation(TelephonyManager manager) {
        logOnce("TelephonyManager.getCellLocation");
        return null;
    }

    public static List<?> getNeighboringCellInfo(TelephonyManager manager) {
        logOnce("TelephonyManager.getNeighboringCellInfo");
        return new ArrayList<>();
    }

    /** Answers at once with no cells, so an app waiting on the callback is not left hanging. */
    public static void requestCellInfoUpdate(TelephonyManager manager, Executor executor,
                                             TelephonyManager.CellInfoCallback callback) {
        logOnce("TelephonyManager.requestCellInfoUpdate");
        executor.execute(() -> callback.onCellInfo(new ArrayList<>()));
    }

    /** Drops the cell-location and cell-info events from a PhoneStateListener registration. */
    public static void listen(TelephonyManager manager, PhoneStateListener listener, int events) {
        int cellEvents = PhoneStateListener.LISTEN_CELL_LOCATION | PhoneStateListener.LISTEN_CELL_INFO;
        if ((events & cellEvents) != 0) {
            logOnce("TelephonyManager.listen(cell events)");
        }
        manager.listen(listener, events & ~cellEvents);
    }
}
