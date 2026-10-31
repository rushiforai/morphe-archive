package u40;

import android.content.Context;
import io.branch.engage.sesame_lite.internal.DB;
import io.branch.engage.sesame_lite.internal.Prefs;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i f90577t;

    /* renamed from: u, reason: collision with root package name */
    public Context f90578u;

    /* renamed from: v, reason: collision with root package name */
    public Prefs f90579v;

    /* renamed from: w, reason: collision with root package name */
    public DB f90580w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f90581x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ b f90582y;

    /* renamed from: z, reason: collision with root package name */
    public int f90583z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(b bVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90582y = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90581x = obj;
        this.f90583z |= Integer.MIN_VALUE;
        return this.f90582y.a(null, this);
    }
}
