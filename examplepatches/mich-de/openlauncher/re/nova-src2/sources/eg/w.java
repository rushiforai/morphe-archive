package eg;

import android.content.Context;
import android.os.Bundle;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class w extends e {

    /* renamed from: b, reason: collision with root package name */
    public final Context f52741b;

    /* renamed from: c, reason: collision with root package name */
    public final String f52742c;

    /* renamed from: d, reason: collision with root package name */
    public final Bundle f52743d;

    /* renamed from: e, reason: collision with root package name */
    public final Bundle f52744e;

    /* renamed from: f, reason: collision with root package name */
    public final int f52745f;

    /* renamed from: g, reason: collision with root package name */
    public final int f52746g;

    /* renamed from: h, reason: collision with root package name */
    public final String f52747h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(Context context, String str, Bundle bundle, Bundle bundle2, int i5, int i11) {
        super(context, str, bundle, bundle2);
        Intrinsics.g(context, "context");
        this.f52741b = context;
        this.f52742c = str;
        this.f52743d = bundle;
        this.f52744e = bundle2;
        this.f52745f = i5;
        this.f52746g = i11;
        this.f52747h = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // eg.e
    public final int a() {
        return this.f52745f;
    }

    @Override // eg.e
    public final int b() {
        return this.f52746g;
    }

    @Override // eg.e
    public final String c() {
        return this.f52747h;
    }

    public final Context f() {
        return this.f52741b;
    }

    public final Bundle g() {
        return this.f52744e;
    }

    public final Bundle h() {
        return this.f52743d;
    }
}
