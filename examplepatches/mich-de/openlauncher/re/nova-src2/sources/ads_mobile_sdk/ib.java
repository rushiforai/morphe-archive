package ads_mobile_sdk;

import c80.d;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class ib extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public sb f4709a;

    /* renamed from: b, reason: collision with root package name */
    public Ref.LongRef f4710b;

    /* renamed from: c, reason: collision with root package name */
    public Collection f4711c;

    /* renamed from: d, reason: collision with root package name */
    public Iterator f4712d;

    /* renamed from: e, reason: collision with root package name */
    public Map.Entry f4713e;

    /* renamed from: f, reason: collision with root package name */
    public d f4714f;

    /* renamed from: g, reason: collision with root package name */
    public Collection f4715g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f4716h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ sb f4717i;

    /* renamed from: j, reason: collision with root package name */
    public int f4718j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ib(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4717i = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4716h = obj;
        this.f4718j |= Integer.MIN_VALUE;
        return sb.a$1(this.f4717i, null, this);
    }
}
