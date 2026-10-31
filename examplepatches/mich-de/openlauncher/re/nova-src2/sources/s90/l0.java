package s90;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.channels.Channels;
import o9.d4;

/* loaded from: classes5.dex */
public final /* synthetic */ class l0 implements b1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86975a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n0 f86976b;

    public /* synthetic */ l0(n0 n0Var, int i5) {
        this.f86975a = i5;
        this.f86976b = n0Var;
    }

    @Override // s90.b1
    /* renamed from: run */
    public final void mo109run() throws IOException {
        switch (this.f86975a) {
            case 0:
                n0 n0Var = this.f86976b;
                y0 y0Var = (y0) n0Var;
                if (y0Var.f87069k == null) {
                    y0Var.f87071m.f86864l = 10;
                    y0Var.f87067i.setDoOutput(true);
                    y0Var.f87067i.connect();
                    y0Var.f87071m.f86864l = 12;
                    OutputStream outputStream = y0Var.f87067i.getOutputStream();
                    y0Var.f87070l = outputStream;
                    y0Var.f87069k = Channels.newChannel(outputStream);
                }
                n0Var.f86982a.set(0);
                n0Var.b(new l0(n0Var, 1), "readFromProvider");
                break;
            default:
                n0 n0Var2 = this.f86976b;
                n0Var2.f86985d.read(n0Var2, n0Var2.f86986e);
                n0Var2.f86984c.execute(new d4(n0Var2, 5));
                break;
        }
    }
}
