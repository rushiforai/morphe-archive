package m70;

import java.io.ByteArrayOutputStream;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a extends ByteArrayOutputStream {
    public a() {
        super(8193);
    }

    public final byte[] a() {
        byte[] buf = ((ByteArrayOutputStream) this).buf;
        Intrinsics.f(buf, "buf");
        return buf;
    }
}
