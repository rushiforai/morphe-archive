package ig;

import com.amplitude.android.TrackingOptions;
import com.google.android.gms.common.Feature;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Feature f61590a;

    /* renamed from: b, reason: collision with root package name */
    public static final Feature[] f61591b;

    static {
        Feature feature = new Feature(TrackingOptions.AMP_TRACKING_OPTION_APP_SET_ID, 1L);
        f61590a = feature;
        f61591b = new Feature[]{feature};
    }
}
