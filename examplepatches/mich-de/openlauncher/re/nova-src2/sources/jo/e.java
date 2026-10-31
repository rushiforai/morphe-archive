package jo;

import android.util.Log;
import b70.h;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import r70.k;

/* loaded from: classes3.dex */
public final class e {
    public static void a(c cVar, String toolName, b bVar, Long l9, Map extras) {
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(extras, "extras");
        StringBuilder sb2 = new StringBuilder("AI_TOOL phase=");
        sb2.append(cVar.name());
        sb2.append(" tool=");
        sb2.append(toolName);
        sb2.append(" outcome=");
        sb2.append(bVar.name());
        if (l9 != null) {
            sb2.append(" ms=");
            sb2.append(l9.longValue());
        }
        for (Map.Entry entry : extras.entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            if (value != null) {
                String string = value.toString();
                sb2.append(' ');
                sb2.append(str);
                sb2.append('=');
                if (k.L0(string, ' ')) {
                    sb2.append(AbstractJsonLexerKt.STRING);
                    sb2.append(string);
                    sb2.append(AbstractJsonLexerKt.STRING);
                } else {
                    sb2.append(string);
                }
            }
        }
        String string2 = sb2.toString();
        Intrinsics.f(string2, "toString(...)");
        if (d.f69628a[bVar.ordinal()] == 1) {
            return;
        }
        Log.i("AI_TOOL", string2);
    }

    public static /* synthetic */ void b(c cVar, String str, b bVar, Long l9, Map map, int i5) {
        if ((i5 & 8) != 0) {
            l9 = null;
        }
        if ((i5 & 16) != 0) {
            map = h.f17594a;
        }
        a(cVar, str, bVar, l9, map);
    }
}
