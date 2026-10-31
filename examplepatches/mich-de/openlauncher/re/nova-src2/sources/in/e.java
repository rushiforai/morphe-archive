package in;

import com.google.gson.Gson;
import java.util.Date;

/* loaded from: classes.dex */
public class e implements com.google.gson.i0 {
    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        if (aVar.f76504a == Date.class) {
            return new h(g.f61690b, 2, 2);
        }
        return null;
    }

    public final String toString() {
        return "DefaultDateTypeAdapter#DEFAULT_STYLE_FACTORY";
    }
}
