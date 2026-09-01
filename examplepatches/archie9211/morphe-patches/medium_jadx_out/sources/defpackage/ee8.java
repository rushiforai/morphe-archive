package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.google.gson.JsonParseException;
import java.util.NoSuchElementException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum ee8 {
    NETWORK_NOT_CONNECTED("network_not_connected"),
    NETWORK_ETHERNET("network_ethernet"),
    NETWORK_WIFI("network_wifi"),
    NETWORK_WIMAX("network_wimax"),
    NETWORK_BLUETOOTH("network_bluetooth"),
    NETWORK_2G("network_2G"),
    NETWORK_3G("network_3G"),
    NETWORK_4G(PdtluglzAX.JSNtZEdJq),
    NETWORK_5G("network_5G"),
    NETWORK_MOBILE_OTHER("network_mobile_other"),
    NETWORK_CELLULAR("network_cellular"),
    NETWORK_OTHER("network_other");

    public static final de8 Companion = new de8();
    public final String a;

    ee8(String str) {
        this.a = str;
    }

    public static final ee8 fromJson(String str) {
        Companion.getClass();
        str.getClass();
        try {
            for (ee8 ee8Var : values()) {
                if (g76.L(ee8Var.a, str)) {
                    return ee8Var;
                }
            }
            throw new NoSuchElementException("Array contains no element matching the predicate.");
        } catch (NoSuchElementException e) {
            throw new JsonParseException("Unable to parse json into type NetworkInfo.Connectivity", e);
        }
    }

    public final dc6 toJson$dd_sdk_android_core_release() {
        return new zc6(this.a);
    }
}
