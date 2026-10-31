package ads_mobile_sdk;

import android.app.Activity;
import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class gf0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public rf0 f3829a;

    /* renamed from: b, reason: collision with root package name */
    public Activity f3830b;

    /* renamed from: c, reason: collision with root package name */
    public ArrayList f3831c;

    /* renamed from: d, reason: collision with root package name */
    public Ref.IntRef f3832d;

    /* renamed from: e, reason: collision with root package name */
    public Ref.IntRef f3833e;

    /* renamed from: f, reason: collision with root package name */
    public int f3834f;

    /* renamed from: g, reason: collision with root package name */
    public int f3835g;

    /* renamed from: h, reason: collision with root package name */
    public int f3836h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f3837i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ rf0 f3838j;

    /* renamed from: k, reason: collision with root package name */
    public int f3839k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gf0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3838j = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3837i = obj;
        this.f3839k |= Integer.MIN_VALUE;
        return this.f3838j.a((Activity) null, this);
    }
}
