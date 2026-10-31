package he;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes3.dex */
public interface h {

    /* renamed from: a, reason: collision with root package name */
    public static final ByteBuffer f59733a = ByteBuffer.allocateDirect(0).order(ByteOrder.nativeOrder());

    ByteBuffer a();

    boolean b();

    g c(g gVar);

    void d(ByteBuffer byteBuffer);

    void e();

    boolean f();

    void flush();

    void reset();
}
