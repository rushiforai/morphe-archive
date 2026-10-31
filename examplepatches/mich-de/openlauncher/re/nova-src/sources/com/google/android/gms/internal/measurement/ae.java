package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final /* synthetic */ class ae implements Runnable {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ ae f32378b = new ae(0);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ ae f32379c = new ae(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32380a;

    public /* synthetic */ ae(int i5) {
        this.f32380a = i5;
    }

    private final /* synthetic */ void a() {
    }

    @Override // java.lang.Runnable
    public final /* synthetic */ void run() {
        switch (this.f32380a) {
            case 0:
                return;
            default:
                throw new IllegalStateException("Span was closed by an invalid call to SpanEndSignal.run()");
        }
    }
}
