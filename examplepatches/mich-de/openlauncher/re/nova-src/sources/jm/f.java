package jm;

import com.google.firebase.encoders.EncodingException;
import java.util.Map;

/* loaded from: classes3.dex */
public final /* synthetic */ class f implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69599a;

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        switch (this.f69599a) {
            case 0:
                Map.Entry entry = (Map.Entry) obj;
                gm.e eVar = (gm.e) obj2;
                eVar.f(g.f69601g, entry.getKey());
                eVar.f(g.f69602h, entry.getValue());
                return;
            default:
                throw new EncodingException("Couldn't find encoder for type " + obj.getClass().getCanonicalName());
        }
    }
}
