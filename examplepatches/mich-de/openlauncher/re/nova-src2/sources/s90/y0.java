package s90;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.nio.channels.WritableByteChannel;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import org.chromium.net.impl.CallbackExceptionImpl;

/* loaded from: classes5.dex */
public final class y0 extends n0 {

    /* renamed from: i, reason: collision with root package name */
    public final HttpURLConnection f87067i;

    /* renamed from: j, reason: collision with root package name */
    public final AtomicBoolean f87068j;

    /* renamed from: k, reason: collision with root package name */
    public WritableByteChannel f87069k;

    /* renamed from: l, reason: collision with root package name */
    public OutputStream f87070l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ a1 f87071m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y0(a1 a1Var, Executor executor, z0 z0Var, HttpURLConnection httpURLConnection, q90.a aVar) {
        super(executor, z0Var, aVar);
        this.f87071m = a1Var;
        this.f87068j = new AtomicBoolean(false);
        this.f87067i = httpURLConnection;
    }

    @Override // s90.n0
    public final void c(Exception exc) {
        this.f87071m.c(new CallbackExceptionImpl("Exception received from UploadDataProvider", exc));
    }
}
