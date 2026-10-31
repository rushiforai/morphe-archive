package p8;

import androidx.fragment.app.p;
import java.io.IOException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import m90.h0;
import m90.n;
import m90.y;

/* loaded from: classes2.dex */
public final class e extends n {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f82448b = 0;

    /* renamed from: c, reason: collision with root package name */
    public boolean f82449c;

    /* renamed from: d, reason: collision with root package name */
    public final Lambda f82450d;

    public e(h0 h0Var, p pVar) {
        super(h0Var);
        this.f82450d = pVar;
    }

    /* JADX WARN: Type inference failed for: r3v5, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    @Override // m90.n, m90.h0
    public final void Z(m90.g source, long j11) {
        switch (this.f82448b) {
            case 0:
                if (this.f82449c) {
                    source.skip(j11);
                    break;
                } else {
                    try {
                        super.Z(source, j11);
                        break;
                    } catch (IOException e3) {
                        this.f82449c = true;
                        ((p) this.f82450d).invoke(e3);
                        return;
                    }
                }
            default:
                Intrinsics.g(source, "source");
                if (this.f82449c) {
                    source.skip(j11);
                    break;
                } else {
                    try {
                        super.Z(source, j11);
                        break;
                    } catch (IOException e11) {
                        this.f82449c = true;
                        this.f82450d.invoke(e11);
                    }
                }
        }
    }

    /* JADX WARN: Type inference failed for: r1v4, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    @Override // m90.n, m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        switch (this.f82448b) {
            case 0:
                try {
                    super.close();
                    break;
                } catch (IOException e3) {
                    this.f82449c = true;
                    ((p) this.f82450d).invoke(e3);
                    return;
                }
            default:
                if (!this.f82449c) {
                    try {
                        super.close();
                        break;
                    } catch (IOException e11) {
                        this.f82449c = true;
                        this.f82450d.invoke(e11);
                    }
                }
                break;
        }
    }

    /* JADX WARN: Type inference failed for: r1v4, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    @Override // m90.n, m90.h0, java.io.Flushable
    public final void flush() {
        switch (this.f82448b) {
            case 0:
                try {
                    super.flush();
                    break;
                } catch (IOException e3) {
                    this.f82449c = true;
                    ((p) this.f82450d).invoke(e3);
                    return;
                }
            default:
                if (!this.f82449c) {
                    try {
                        super.flush();
                        break;
                    } catch (IOException e11) {
                        this.f82449c = true;
                        this.f82450d.invoke(e11);
                    }
                }
                break;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public e(y yVar, Function1 function1) {
        super(yVar);
        this.f82450d = (Lambda) function1;
    }
}
