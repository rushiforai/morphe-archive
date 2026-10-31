package ads_mobile_sdk;

import android.app.Activity;
import android.view.ViewGroup;
import android.view.Window;
import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class pr1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public rr1 f8353a;

    /* renamed from: b, reason: collision with root package name */
    public Activity f8354b;

    /* renamed from: c, reason: collision with root package name */
    public Window f8355c;

    /* renamed from: d, reason: collision with root package name */
    public ViewGroup f8356d;

    /* renamed from: e, reason: collision with root package name */
    public lu f8357e;

    /* renamed from: f, reason: collision with root package name */
    public int f8358f;

    /* renamed from: g, reason: collision with root package name */
    public int f8359g;

    /* renamed from: h, reason: collision with root package name */
    public int f8360h;

    /* renamed from: i, reason: collision with root package name */
    public int f8361i;

    /* renamed from: j, reason: collision with root package name */
    public int f8362j;

    /* renamed from: k, reason: collision with root package name */
    public /* synthetic */ Object f8363k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ rr1 f8364l;

    /* renamed from: m, reason: collision with root package name */
    public int f8365m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pr1(rr1 rr1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8364l = rr1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8363k = obj;
        this.f8365m |= Integer.MIN_VALUE;
        return rr1.a(this.f8364l, (Map) null, this);
    }
}
