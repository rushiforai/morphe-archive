package p10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.json.Json;

/* loaded from: classes4.dex */
public final class s {

    /* renamed from: d, reason: collision with root package name */
    public static final y5.f f81891d = v70.o.h("coin_balance");

    /* renamed from: e, reason: collision with root package name */
    public static final y5.f f81892e = v70.o.m("coin_history");

    /* renamed from: f, reason: collision with root package name */
    public static final Json f81893f = w20.f.f93675a;

    /* renamed from: g, reason: collision with root package name */
    public static final KSerializer f81894g = BuiltinSerializersKt.ListSerializer(k.Companion.serializer());

    /* renamed from: a, reason: collision with root package name */
    public final t5.g f81895a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f81896b;

    /* renamed from: c, reason: collision with root package name */
    public final cw.y1 f81897c;

    public s(t5.g gVar) {
        o oVar = o.f81856d;
        this.f81895a = gVar;
        this.f81896b = oVar;
        this.f81897c = new cw.y1(gVar.getData(), 5);
    }

    public final Object a(long j11, String str, ContinuationImpl continuationImpl) {
        a80.e eVar = t70.y0.f88884a;
        return t70.m0.y(a80.d.f488c, new q(this, j11, str, null), continuationImpl);
    }
}
