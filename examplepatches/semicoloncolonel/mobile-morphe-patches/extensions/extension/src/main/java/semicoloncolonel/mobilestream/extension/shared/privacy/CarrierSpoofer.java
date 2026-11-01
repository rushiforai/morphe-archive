package semicoloncolonel.mobilestream.extension.shared.privacy;

import android.telephony.SubscriptionInfo;
import android.telephony.TelephonyManager;

/**
 * Answers the app's carrier lookups for the "Spoof carrier" patch.
 *
 * The patch points every app call to these TelephonyManager and
 * SubscriptionInfo methods here, with the receiver as the first argument.
 * carrierName() is overwritten by the patch with the name the user chose.
 * An empty name hides the carrier. The numeric operator code (MCC+MNC) is
 * always blank, so it cannot contradict the name, and the carrier ID is
 * reported as unknown.
 */
@SuppressWarnings("unused")
public final class CarrierSpoofer {
    private CarrierSpoofer() {
    }

    /** Replaced by the patch. */
    public static String carrierName() {
        return "";
    }

    private static String name() {
        String name = carrierName();
        return name == null ? "" : name;
    }

    public static String getNetworkOperatorName(TelephonyManager manager) {
        return name();
    }

    public static String getSimOperatorName(TelephonyManager manager) {
        return name();
    }

    public static CharSequence getSimCarrierIdName(TelephonyManager manager) {
        return name();
    }

    public static String getNetworkOperator(TelephonyManager manager) {
        return "";
    }

    public static String getSimOperator(TelephonyManager manager) {
        return "";
    }

    public static int getSimCarrierId(TelephonyManager manager) {
        return TelephonyManager.UNKNOWN_CARRIER_ID;
    }

    public static CharSequence getCarrierName(SubscriptionInfo info) {
        return name();
    }
}
