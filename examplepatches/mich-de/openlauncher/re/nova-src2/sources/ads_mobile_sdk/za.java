package ads_mobile_sdk;

import c80.d;
import java.util.Set;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class za extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public sb f12495a;

    /* renamed from: b, reason: collision with root package name */
    public Set f12496b;

    /* renamed from: c, reason: collision with root package name */
    public d f12497c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f12498d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ sb f12499e;

    /* renamed from: f, reason: collision with root package name */
    public int f12500f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public za(sb sbVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12499e = sbVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12498d = obj;
        this.f12500f |= Integer.MIN_VALUE;
        return sb.a(this.f12499e, (Set) null, this);
    }
}
