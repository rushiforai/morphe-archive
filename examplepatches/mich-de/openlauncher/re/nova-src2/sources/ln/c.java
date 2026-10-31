package ln;

import com.google.gson.Gson;
import com.google.gson.h0;
import com.google.gson.i0;
import java.sql.Timestamp;
import java.util.Date;

/* loaded from: classes.dex */
public class c implements i0 {
    @Override // com.google.gson.i0
    public final h0 a(Gson gson, mn.a aVar) {
        if (aVar.f76504a == Timestamp.class) {
            return new d(gson.getAdapter(Date.class));
        }
        return null;
    }
}
