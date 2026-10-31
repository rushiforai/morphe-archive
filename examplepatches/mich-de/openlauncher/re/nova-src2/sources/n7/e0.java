package n7;

import androidx.webkit.StartUpLocation;
import java.io.PrintWriter;
import java.io.StringWriter;

/* loaded from: classes2.dex */
public final class e0 implements StartUpLocation {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f77917a;

    public e0(Throwable th2) {
        this.f77917a = th2;
    }

    @Override // androidx.webkit.StartUpLocation
    public final String getStackInformation() {
        StringWriter stringWriter = new StringWriter();
        this.f77917a.printStackTrace(new PrintWriter(stringWriter));
        return stringWriter.toString();
    }
}
