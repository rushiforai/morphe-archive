package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public abstract class mh {

    /* renamed from: f, reason: collision with root package name */
    public static final lh f32830f;

    /* renamed from: h, reason: collision with root package name */
    public static final lh f32832h;

    /* renamed from: a, reason: collision with root package name */
    public static final th f32825a = new th("cause", Throwable.class, false, false);

    /* renamed from: b, reason: collision with root package name */
    public static final th f32826b = new th("ratelimit_count", Integer.class, false, false);

    /* renamed from: c, reason: collision with root package name */
    public static final th f32827c = new th("sampling_count", Integer.class, false, false);

    /* renamed from: d, reason: collision with root package name */
    public static final th f32828d = new th("ratelimit_period", gh.class, false, false);

    /* renamed from: e, reason: collision with root package name */
    public static final th f32829e = new th("skipped", Integer.class, false, false);

    /* renamed from: g, reason: collision with root package name */
    public static final th f32831g = new th("forced", Boolean.class, false, false);

    /* renamed from: i, reason: collision with root package name */
    public static final th f32833i = new th("stack_size", ai.class, false, false);

    static {
        boolean z11 = true;
        f32830f = new lh("group_by", Object.class, z11, z11, 0);
        f32832h = new lh("tags", x.class, false, z11, 1);
    }
}
