package ads_mobile_sdk;

import android.app.Activity;
import java.io.Closeable;
import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class bf0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f1393a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f1394b;

    /* renamed from: c, reason: collision with root package name */
    public Closeable f1395c;

    /* renamed from: d, reason: collision with root package name */
    public Activity f1396d;

    /* renamed from: e, reason: collision with root package name */
    public ArrayList f1397e;

    /* renamed from: f, reason: collision with root package name */
    public int f1398f;

    /* renamed from: g, reason: collision with root package name */
    public int f1399g;

    /* renamed from: h, reason: collision with root package name */
    public int f1400h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f1401i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ rf0 f1402j;

    /* renamed from: k, reason: collision with root package name */
    public int f1403k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bf0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1402j = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1401i = obj;
        this.f1403k |= Integer.MIN_VALUE;
        return this.f1402j.e(this);
    }
}
