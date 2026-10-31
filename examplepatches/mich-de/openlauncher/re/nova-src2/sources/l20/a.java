package l20;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x80.h0;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {
    public /* synthetic */ Object A;
    public final /* synthetic */ f B;
    public int C;

    /* renamed from: t, reason: collision with root package name */
    public Object f74601t;

    /* renamed from: u, reason: collision with root package name */
    public Object f74602u;

    /* renamed from: v, reason: collision with root package name */
    public Collection f74603v;

    /* renamed from: w, reason: collision with root package name */
    public Iterator f74604w;

    /* renamed from: x, reason: collision with root package name */
    public List f74605x;

    /* renamed from: y, reason: collision with root package name */
    public ArrayList f74606y;

    /* renamed from: z, reason: collision with root package name */
    public h0 f74607z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.B = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.C |= Integer.MIN_VALUE;
        return f.l(this.B, null, null, this);
    }
}
