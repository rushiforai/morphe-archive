package vt;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public b f93002t;

    /* renamed from: u, reason: collision with root package name */
    public iu.c f93003u;

    /* renamed from: v, reason: collision with root package name */
    public String f93004v;

    /* renamed from: w, reason: collision with root package name */
    public String f93005w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f93006x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ b f93007y;

    /* renamed from: z, reason: collision with root package name */
    public int f93008z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93007y = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93006x = obj;
        this.f93008z |= Integer.MIN_VALUE;
        return this.f93007y.a(null, null, null, null, null, this);
    }
}
