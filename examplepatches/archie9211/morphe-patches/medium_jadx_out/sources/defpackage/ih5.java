package defpackage;

import com.squareup.wire.internal.JsonFormatter;
import com.squareup.wire.internal.JsonIntegration;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ih5 extends JsonIntegration {
    public static final ih5 a = new ih5();

    @Override // com.squareup.wire.internal.JsonIntegration
    public final Object formatterAdapter(JsonFormatter jsonFormatter) {
        jsonFormatter.getClass();
        return new p04(1, jsonFormatter).a();
    }

    @Override // com.squareup.wire.internal.JsonIntegration
    public final Object frameworkAdapter(Object obj, Type type) {
        ch5 ch5Var = (ch5) obj;
        ch5Var.getClass();
        type.getClass();
        return ch5Var.d(kxd.b(type)).a();
    }

    @Override // com.squareup.wire.internal.JsonIntegration
    public final Object listAdapter(Object obj) {
        jud judVar = (jud) obj;
        judVar.getClass();
        return new hh5(judVar, 0).a();
    }

    @Override // com.squareup.wire.internal.JsonIntegration
    public final Object mapAdapter(Object obj, JsonFormatter jsonFormatter, Object obj2) {
        jud judVar = (jud) obj2;
        ((ch5) obj).getClass();
        jsonFormatter.getClass();
        judVar.getClass();
        return new ht1(jsonFormatter, 1, judVar).a();
    }

    @Override // com.squareup.wire.internal.JsonIntegration
    public final Object structAdapter(Object obj) {
        ch5 ch5Var = (ch5) obj;
        ch5Var.getClass();
        jud judVarE = ch5Var.e(Object.class);
        judVarE.getClass();
        return new hh5(judVarE, 1).a();
    }
}
