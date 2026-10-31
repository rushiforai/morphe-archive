package io.branch.search.internal;

import com.amplitude.android.TrackingOptions;

/* renamed from: io.branch.search.internal.a2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final /* synthetic */ class C3056a2 {
    public static final String a(int i5) {
        return b(i5);
    }

    public static /* synthetic */ String b(int i5) {
        switch (i5) {
            case 1:
                return "brand";
            case 2:
                return "model";
            case 3:
                return "os";
            case 4:
                return TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION;
            case 5:
                return TrackingOptions.AMP_TRACKING_OPTION_CARRIER;
            case 6:
                return "carrier_sim";
            case 7:
                return "locale";
            case 8:
                return "initial_locale";
            case 9:
                return "current_locale";
            case 10:
                return "sdk";
            case 11:
                return "sdk_version";
            case 12:
                return "app_usage_allowed";
            case 13:
                return "app_usage_allowed_status";
            case 14:
                return "app_package";
            case 15:
                return "app_version";
            case 16:
                return "default_launcher";
            case 17:
                return "is_on_vpn";
            case 18:
                return "user_agent";
            case 19:
                return "pending_jobs_count";
            case 20:
                return "pending_ping_jobs_count";
            case 21:
                return "is_low_ram_device";
            case 22:
                return "user_latitude";
            case 23:
                return "user_longitude";
            case 24:
                return "screen_dpi";
            case 25:
                return "screen_width";
            case 26:
                return "screen_height";
            default:
                throw null;
        }
    }
}
