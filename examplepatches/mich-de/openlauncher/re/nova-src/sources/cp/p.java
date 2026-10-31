package cp;

import java.io.IOException;
import java.io.StringWriter;

/* loaded from: classes4.dex */
public abstract class p {
    public final String toString() {
        try {
            StringWriter stringWriter = new StringWriter();
            kp.b bVar = new kp.b(stringWriter);
            bVar.f72108h = 1;
            fp.s.f55565z.getClass();
            fp.g.e(bVar, this);
            return stringWriter.toString();
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }
}
