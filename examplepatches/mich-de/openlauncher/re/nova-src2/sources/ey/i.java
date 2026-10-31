package ey;

import android.content.Intent;
import android.net.Uri;

/* loaded from: classes4.dex */
public final class i extends n {

    /* renamed from: a, reason: collision with root package name */
    public final String f53158a;

    /* renamed from: b, reason: collision with root package name */
    public final b20.e f53159b;

    public i(String str, b20.e eVar) {
        this.f53158a = str;
        this.f53159b = eVar;
    }

    @Override // ey.n
    public final boolean a() {
        this.f53159b.i(new Intent("android.intent.action.VIEW", Uri.parse("content://com.android.calendar/time")).setPackage(this.f53158a), pp.r.f82773j, null);
        return true;
    }
}
