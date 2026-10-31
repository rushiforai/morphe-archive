package iw;

import android.content.Context;
import e10.w;
import gv.r0;
import gv.z0;
import java.util.List;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;
import jr.q0;
import jv.v0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.json.JsonBuilder;
import kotlinx.serialization.json.JsonObject;
import kotlinx.serialization.protobuf.schema.ProtoBufSchemaGenerator;
import mx.c0;
import xu.t;
import xu.v;

/* loaded from: classes4.dex */
public final /* synthetic */ class p implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68173a;

    public /* synthetic */ p(int i5) {
        this.f68173a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x0098  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        boolean z11;
        switch (this.f68173a) {
            case 0:
                String it = (String) obj;
                Intrinsics.g(it, "it");
                return zg.a.H(ps.j.d(it));
            case 1:
                JsonBuilder Json = (JsonBuilder) obj;
                Intrinsics.g(Json, "$this$Json");
                Json.setIgnoreUnknownKeys(true);
                return Unit.f71706a;
            case 2:
                return ((Context) obj).getString(2132017707);
            case 3:
                return ((Context) obj).getString(2132020426);
            case 4:
                return ((Context) obj).getString(2132020395);
            case 5:
                return ((Context) obj).getString(2132017558);
            case 6:
                List it2 = (List) obj;
                Intrinsics.g(it2, "it");
                return (q0) b70.g.h1(it2);
            case 7:
                return Unit.f71706a;
            case 8:
                return Unit.f71706a;
            case 9:
                return Unit.f71706a;
            case 10:
                return Unit.f71706a;
            case 11:
                return Unit.f71706a;
            case 12:
                return Unit.f71706a;
            case 13:
                return Unit.f71706a;
            case 14:
                return Unit.f71706a;
            case 15:
                Intrinsics.g((HttpsURLConnection) obj, "<this>");
                return Unit.f71706a;
            case 16:
                z0 z0Var = (z0) obj;
                if (z0Var != null) {
                    r0 r0Var = r0.f57931a;
                    z11 = (z0Var.b(r0Var) == null && z0Var.a(r0Var) == null) ? false : true;
                }
                return Boolean.valueOf(z11);
            case 17:
                v it3 = (v) obj;
                Intrinsics.g(it3, "it");
                return Boolean.valueOf(it3 instanceof t);
            case 18:
                return ((v0) obj).f70182f;
            case 19:
                return Unit.f71706a;
            case 20:
                return Unit.f71706a;
            case 21:
                return Unit.f71706a;
            case 22:
                return Boolean.valueOf(((l10.n) obj).f74437a == c0.WEATHER);
            case 23:
                w wVar = w.f51855b;
                wVar.getClass();
                return b.c0.E(wVar.encodeToString(k30.c.Companion.serializer(), (k30.c) obj), "\n");
            case 24:
                return Boolean.valueOf(((l10.n) obj).f74437a == c0.WEATHER);
            case 25:
                return SerialDescriptorsKt.buildClassSerialDescriptor$lambda$0((ClassSerialDescriptorBuilder) obj);
            case 26:
                return SerialDescriptorsKt.buildSerialDescriptor$lambda$5((ClassSerialDescriptorBuilder) obj);
            case 27:
                return JsonObject.toString$lambda$1((Map.Entry) obj);
            case 28:
                return ProtoBufSchemaGenerator.generateSchemaText$lambda$1$lambda$0((String) obj);
            default:
                return ProtoBufSchemaGenerator.SyntheticPolymorphicType$lambda$30$lambda$29((ClassSerialDescriptorBuilder) obj);
        }
    }

    public /* synthetic */ p(jt.z0 z0Var) {
        this.f68173a = 13;
    }
}
