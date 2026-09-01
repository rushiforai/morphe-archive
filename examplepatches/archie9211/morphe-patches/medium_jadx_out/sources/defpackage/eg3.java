package defpackage;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eg3 implements Closeable {
    public final /* synthetic */ int a = 1;
    public final Object b;

    public eg3(ArrayList arrayList, yua yuaVar) {
        this.b = yuaVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                for (InputStream inputStream : (InputStream[]) obj) {
                    zoe.a(inputStream);
                }
                break;
            default:
                ((yua) obj).close();
                break;
        }
    }

    public eg3(InputStream[] inputStreamArr) {
        this.b = inputStreamArr;
    }
}
