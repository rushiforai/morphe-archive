package defpackage;

import com.medium.android.data.notification.YMl.DtuT;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class l6e extends co6 implements m45 {
    public final /* synthetic */ m6e a;
    public final /* synthetic */ String b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l6e(m6e m6eVar, String str, int i, int i2) {
        super(0);
        this.a = m6eVar;
        this.b = str;
        this.c = i;
        this.d = i2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        m6e m6eVar = this.a;
        Throwable th = m6eVar.c;
        int i = m6eVar.b;
        StringBuilder sb = new StringBuilder();
        sb.append(ho2.C(this.c, DtuT.wvqOVYIkQlavdNb, this.b, " [", " bytes] (Logs Request)"));
        if (m6eVar instanceof a6e) {
            sb.append(" failed because of a DNS error");
        } else if (m6eVar instanceof b6e) {
            sb.append(" failed because of a processing error or invalid data");
        } else if (m6eVar instanceof c6e) {
            sb.append(" failed because of an intake rate limitation");
        } else if (m6eVar instanceof d6e) {
            sb.append(" failed because of a server processing error");
        } else if (m6eVar instanceof e6e) {
            sb.append(" failed because your token is invalid");
        } else if (m6eVar instanceof f6e) {
            sb.append(" failed because of a network error");
        } else if (m6eVar instanceof g6e) {
            sb.append(" failed because of an error when creating the request");
        } else if (m6eVar instanceof i6e) {
            sb.append(" failed because of an unknown error");
        } else if (m6eVar instanceof j6e) {
            sb.append(" failed because of an unexpected HTTP error (status code = " + i + ")");
        } else if (m6eVar instanceof k6e) {
            sb.append(" status is unknown");
        } else if (m6eVar instanceof h6e) {
            sb.append(" sent successfully.");
        }
        if (th != null) {
            sb.append(" (");
            sb.append(th.getClass().getName());
            sb.append(": ");
            sb.append(th.getMessage());
            sb.append(")");
        }
        if (m6eVar.a) {
            sb.append("; we will retry later.");
        } else if (!(m6eVar instanceof h6e)) {
            sb.append("; the batch was dropped.");
        }
        if (m6eVar instanceof e6e) {
            sb.append(" Make sure that the provided token still exists and you're targeting the relevant Datadog site.");
        }
        sb.append(String.format(Locale.US, " This request was attempted %d time(s).", Arrays.copyOf(new Object[]{Integer.valueOf(this.d), Integer.valueOf(i)}, 2)));
        return sb.toString();
    }
}
