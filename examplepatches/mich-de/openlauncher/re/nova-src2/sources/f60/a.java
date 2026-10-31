package f60;

import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes4.dex */
public final class a implements c60.a {

    /* renamed from: a, reason: collision with root package name */
    public static final Logger f54338a = Logger.getLogger(a.class.getName());

    @Override // c60.a
    public final InputStream k(String str) {
        InputStream resourceAsStream = a.class.getResourceAsStream(str);
        if (resourceAsStream == null) {
            f54338a.log(Level.WARNING, "File " + str + " not found");
        }
        return resourceAsStream;
    }
}
