package uh;

import com.google.android.gms.common.Feature;
import sg.w;

/* loaded from: classes3.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final Feature f91268a;

    /* renamed from: b, reason: collision with root package name */
    public static final Feature f91269b;

    /* renamed from: c, reason: collision with root package name */
    public static final Feature[] f91270c;

    static {
        Feature feature = new Feature("name_ulr_private", 1L);
        Feature feature2 = new Feature("name_sleep_segment_request", 1L);
        Feature feature3 = new Feature("get_last_activity_feature_id", 1L);
        Feature feature4 = new Feature("support_context_feature_id", 1L);
        Feature feature5 = new Feature("get_current_location", 2L);
        f91268a = feature5;
        Feature feature6 = new Feature("get_last_location_with_request", 1L);
        Feature feature7 = new Feature("set_mock_mode_with_callback", 1L);
        Feature feature8 = new Feature("set_mock_location_with_callback", 1L);
        Feature feature9 = new Feature("inject_location_with_callback", 1L);
        Feature feature10 = new Feature("location_updates_with_callback", 1L);
        f91269b = feature10;
        f91270c = new Feature[]{feature, feature2, feature3, feature4, feature5, feature6, feature7, feature8, feature9, feature10, new Feature("use_safe_parcelable_in_intents", 1L)};
    }

    public static void a(int i5) {
        boolean z11 = true;
        if (i5 != 100 && i5 != 102 && i5 != 104) {
            if (i5 == 105) {
                i5 = 105;
            } else {
                z11 = false;
            }
        }
        w.b("priority %d must be a Priority.PRIORITY_* constant", new Object[]{Integer.valueOf(i5)}, z11);
    }

    public static String b(int i5) {
        if (i5 == 100) {
            return "HIGH_ACCURACY";
        }
        if (i5 == 102) {
            return "BALANCED_POWER_ACCURACY";
        }
        if (i5 == 104) {
            return "LOW_POWER";
        }
        if (i5 == 105) {
            return "PASSIVE";
        }
        throw new IllegalArgumentException();
    }
}
