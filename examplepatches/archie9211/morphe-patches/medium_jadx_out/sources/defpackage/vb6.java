package defpackage;

import com.google.firebase.encoders.EncodingException;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vb6 implements lm8 {
    public final /* synthetic */ int a;

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        switch (this.a) {
            case 0:
                throw new EncodingException("Couldn't find encoder for type " + obj.getClass().getCanonicalName());
            case 1:
                Map.Entry entry = (Map.Entry) obj;
                mm8 mm8Var = (mm8) obj2;
                mm8Var.a(y7a.f, entry.getKey());
                mm8Var.a(y7a.g, entry.getValue());
                return;
            default:
                throw new EncodingException("Couldn't find encoder for type " + obj.getClass().getCanonicalName());
        }
    }
}
