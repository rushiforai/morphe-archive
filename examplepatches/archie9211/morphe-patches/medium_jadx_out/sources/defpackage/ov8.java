package defpackage;

import com.facebook.FacebookException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ov8 {
    public static final Map b;
    public final LinkedHashMap a = new LinkedHashMap();

    static {
        Map mapSingletonMap = Collections.singletonMap(pv8.IAPParameters, new f09(k80.S0(new String[]{"fb_iap_package_name", "fb_iap_subs_auto_renewing", "fb_free_trial_period", "fb_intro_price_amount_micros", "fb_intro_price_cycles", "fb_iap_base_plan", "is_implicit_purchase_logging_enabled", "fb_iap_sdk_supported_library_versions", "is_autolog_app_events_enabled", "fb_iap_client_library_version", "fb_iap_subs_period", "fb_iap_purchase_token", "fb_iap_non_deduped_event_time", "fb_iap_actual_dedup_result", "fb_iap_actual_dedup_key_used", "fb_iap_test_dedup_result", "fb_iap_test_dedup_key_used"}), k80.S0(new String[]{"fb_iap_product_id", "fb_iap_product_type", "fb_iap_purchase_time"})));
        mapSingletonMap.getClass();
        b = mapSingletonMap;
    }

    public final void a(pv8 pv8Var, String str, Object obj) {
        LinkedHashMap linkedHashMap = this.a;
        pv8Var.getClass();
        str.getClass();
        try {
            HashSet hashSet = i40.f;
            pwd.d0(str);
            if (!(obj instanceof String) && !(obj instanceof Number)) {
                throw new FacebookException(String.format("Parameter value '%s' for key '%s' should be a string or a numeric type.", Arrays.copyOf(new Object[]{obj, str}, 2)));
            }
            if (!linkedHashMap.containsKey(pv8Var)) {
                linkedHashMap.put(pv8Var, new LinkedHashMap());
            }
            Map map = (Map) linkedHashMap.get(pv8Var);
            if (map != null) {
                map.put(str, obj);
            }
        } catch (Exception unused) {
        }
    }
}
