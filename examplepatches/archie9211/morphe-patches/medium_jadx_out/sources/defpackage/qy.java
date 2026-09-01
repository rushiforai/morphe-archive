package defpackage;

import com.google.gson.JsonIOException;
import com.squareup.wire.AnyMessage;
import com.squareup.wire.Message;
import com.squareup.wire.ProtoAdapter;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qy extends jud {
    public final ch5 a;
    public final Map b;
    public final jud c;

    public qy(ch5 ch5Var, Map map) {
        ch5Var.getClass();
        map.getClass();
        this.a = ch5Var;
        this.b = map;
        jud judVarE = ch5Var.e(dc6.class);
        judVarE.getClass();
        this.c = judVarE;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        gd6Var.getClass();
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        dc6 dc6Var = (dc6) this.c.b(gd6Var);
        dc6 dc6VarS = dc6Var.e().s("@type");
        if (dc6VarS == null) {
            ik4.g("expected @type in ".concat(gd6Var.N()));
            return null;
        }
        String strM = dc6VarS.m();
        ProtoAdapter protoAdapter = (ProtoAdapter) this.b.get(strM);
        if (protoAdapter == null) {
            ik4.g(lv8.r("Cannot resolve type: ", strM, " in ", gd6Var.N()));
            return null;
        }
        wg6 type = protoAdapter.getType();
        jud judVarE = this.a.e(type != null ? vx0.T(type) : null);
        judVarE.getClass();
        try {
            Message<?, ?> message = (Message) judVarE.b(new od6(dc6Var));
            AnyMessage.Companion companion = AnyMessage.INSTANCE;
            message.getClass();
            return companion.pack(message);
        } catch (IOException e) {
            throw new JsonIOException(e);
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        AnyMessage anyMessage = (AnyMessage) obj;
        yd6Var.getClass();
        if (anyMessage == null) {
            yd6Var.Q();
            return;
        }
        yd6Var.p();
        yd6Var.L("@type");
        yd6Var.A0(anyMessage.getTypeUrl());
        ProtoAdapter protoAdapter = (ProtoAdapter) this.b.get(anyMessage.getTypeUrl());
        if (protoAdapter == null) {
            ik4.g(ka1.r("Cannot find type for url: ", anyMessage.getTypeUrl()));
            return;
        }
        wg6 type = protoAdapter.getType();
        jud judVarE = this.a.e(type != null ? vx0.T(type) : null);
        judVarE.getClass();
        Object objUnpack = anyMessage.unpack(protoAdapter);
        objUnpack.getClass();
        Message message = (Message) objUnpack;
        try {
            qd6 qd6Var = new qd6();
            judVarE.c(qd6Var, message);
            Iterator it2 = ((z07) qd6Var.G0().e().a.entrySet()).iterator();
            while (((u07) it2).hasNext()) {
                a17 a17VarB = ((y07) it2).b();
                Object key = a17VarB.getKey();
                key.getClass();
                Object value = a17VarB.getValue();
                value.getClass();
                yd6Var.L(gsa.r0((String) key));
                this.c.c(yd6Var, (dc6) value);
            }
            yd6Var.I();
        } catch (IOException e) {
            throw new JsonIOException(e);
        }
    }
}
