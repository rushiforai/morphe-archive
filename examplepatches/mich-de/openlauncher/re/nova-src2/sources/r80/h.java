package r80;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import nova.branch.engage.sesame_lite.internal.DB;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.Prefs;

/* loaded from: classes.dex */
public final class h extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public m f85675t;

    /* renamed from: u, reason: collision with root package name */
    public Context f85676u;

    /* renamed from: v, reason: collision with root package name */
    public Pkgs f85677v;

    /* renamed from: w, reason: collision with root package name */
    public Prefs f85678w;

    /* renamed from: x, reason: collision with root package name */
    public DB f85679x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f85680y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ i f85681z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85681z = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85680y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f85681z.a(null, this);
    }
}
