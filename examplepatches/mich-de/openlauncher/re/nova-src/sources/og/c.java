package og;

import com.google.android.gms.common.Feature;

/* loaded from: classes3.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final Feature f80388a;

    /* renamed from: b, reason: collision with root package name */
    public static final Feature[] f80389b;

    static {
        Feature feature = new Feature(-1, 1L, "register", true);
        f80388a = feature;
        f80389b = new Feature[]{feature, new Feature(-1, 1L, "unregister", true)};
    }
}
