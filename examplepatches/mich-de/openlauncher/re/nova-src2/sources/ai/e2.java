package ai;

import android.content.Context;
import android.os.Bundle;
import com.google.android.gms.internal.measurement.zzdb;

/* loaded from: classes3.dex */
public final class e2 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f12902a;

    /* renamed from: b, reason: collision with root package name */
    public final Boolean f12903b;

    /* renamed from: c, reason: collision with root package name */
    public final long f12904c;

    /* renamed from: d, reason: collision with root package name */
    public final zzdb f12905d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f12906e;

    /* renamed from: f, reason: collision with root package name */
    public final Long f12907f;

    /* renamed from: g, reason: collision with root package name */
    public final Long f12908g;

    /* renamed from: h, reason: collision with root package name */
    public final String f12909h;

    public e2(Context context, zzdb zzdbVar, Long l9, Long l11) {
        this.f12906e = true;
        sg.w.h(context);
        Context applicationContext = context.getApplicationContext();
        sg.w.h(applicationContext);
        this.f12902a = applicationContext;
        this.f12907f = l9;
        this.f12908g = l11;
        if (zzdbVar != null) {
            this.f12905d = zzdbVar;
            this.f12906e = zzdbVar.f33305h;
            this.f12904c = zzdbVar.f33304g;
            this.f12909h = zzdbVar.f33307j;
            Bundle bundle = zzdbVar.f33306i;
            if (bundle != null) {
                this.f12903b = Boolean.valueOf(bundle.getBoolean("dataCollectionDefaultEnabled", true));
            }
        }
    }
}
