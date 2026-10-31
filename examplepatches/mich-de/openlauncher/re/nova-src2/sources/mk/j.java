package mk;

import ai.s1;
import ai.u1;
import android.app.Activity;
import android.os.Bundle;
import java.util.Map;

/* loaded from: classes3.dex */
public final class j extends u1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Activity f76442b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f76443c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f76444d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f76445e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ k f76446f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(k kVar, x7.c cVar, Activity activity, String str, String str2, Map map) {
        super(cVar);
        this.f76442b = activity;
        this.f76443c = str;
        this.f76444d = str2;
        this.f76445e = map;
        this.f76446f = kVar;
    }

    @Override // ai.u1, mk.a
    public final void onDismissed(Bundle bundle) {
        this.f76442b.runOnUiThread(new i(this, 1));
        super.onDismissed(bundle);
    }

    /* JADX WARN: Type inference failed for: r5v0, types: [java.lang.Object, java.util.Map] */
    @Override // ai.u1, mk.a
    public final void onError(Bundle bundle) {
        String str = this.f76444d;
        ?? r52 = this.f76445e;
        Activity activity = this.f76442b;
        activity.runOnUiThread(new s1(this, activity, this.f76443c, str, (Map) r52));
        super.onError(bundle);
    }

    @Override // ai.u1, mk.a
    public final void onShown(Bundle bundle) {
        this.f76442b.runOnUiThread(new i(this, 0));
        super.onShown(bundle);
    }
}
