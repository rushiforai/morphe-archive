package qw;

import android.graphics.BitmapFactory;
import java.net.URL;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public l f84352t;

    /* renamed from: u, reason: collision with root package name */
    public URL f84353u;

    /* renamed from: v, reason: collision with root package name */
    public BitmapFactory.Options f84354v;

    /* renamed from: w, reason: collision with root package name */
    public int f84355w;

    /* renamed from: x, reason: collision with root package name */
    public int f84356x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f84357y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ l f84358z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84358z = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84357y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f84358z.a(null, 0, 0, this);
    }
}
