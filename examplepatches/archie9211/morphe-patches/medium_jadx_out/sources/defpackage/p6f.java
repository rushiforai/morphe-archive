package defpackage;

import com.squareup.wire.AnyMessage;
import com.squareup.wire.Message;
import com.squareup.wire.RuntimeEnumAdapter;
import com.squareup.wire.WireEnum;
import com.squareup.wire.internal.ReflectionKt;
import com.squareup.wire.internal.RuntimeMessageAdapter;
import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p6f implements kud {
    public final Map a;

    public p6f(int i) {
        this.a = fy3.a;
    }

    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        ch5Var.getClass();
        kxdVar.getClass();
        Class clsC = kxdVar.c();
        if (g76.L(clsC, AnyMessage.class)) {
            return new qy(ch5Var, this.a);
        }
        int i = 0;
        if (Message.class.isAssignableFrom(clsC)) {
            clsC.getClass();
            RuntimeMessageAdapter runtimeMessageAdapterCreateRuntimeMessageAdapter = ReflectionKt.createRuntimeMessageAdapter(clsC, false, clsC.getClassLoader());
            return new hz7(runtimeMessageAdapterCreateRuntimeMessageAdapter, (ArrayList) ih5.a.jsonAdapters(runtimeMessageAdapterCreateRuntimeMessageAdapter, ch5Var)).a();
        }
        if (!WireEnum.class.isAssignableFrom(clsC)) {
            return null;
        }
        RuntimeEnumAdapter.Companion companion = RuntimeEnumAdapter.INSTANCE;
        clsC.getClass();
        return new p04(i, new xl2(companion.create(clsC))).a();
    }

    public p6f() {
        this(0);
    }
}
