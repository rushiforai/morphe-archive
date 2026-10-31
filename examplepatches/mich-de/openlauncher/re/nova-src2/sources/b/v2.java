package b;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes2.dex */
public final /* synthetic */ class v2 implements cl.d0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16006a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ads_mobile_sdk.f7 f16007b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Context f16008c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f16009d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ View f16010e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Activity f16011f;

    public /* synthetic */ v2(ads_mobile_sdk.f7 f7Var, Context context, String str, View view, Activity activity, int i5) {
        this.f16006a = i5;
        this.f16007b = f7Var;
        this.f16008c = context;
        this.f16009d = str;
        this.f16010e = view;
        this.f16011f = activity;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) {
        switch (this.f16006a) {
            case 0:
                return ((n) this.f16007b.f3211b.f3752f.get()).a(this.f16008c, this.f16009d, this.f16010e, this.f16011f);
            default:
                return ((n) this.f16007b.f3211b.f3752f.get()).b(this.f16008c, this.f16009d, this.f16010e, this.f16011f);
        }
    }
}
