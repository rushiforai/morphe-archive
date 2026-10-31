package b60;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c extends d {

    /* renamed from: f, reason: collision with root package name */
    public final int f17580f;

    public c() {
        super(2048);
        this.f17580f = 4098;
    }

    @Override // b60.d
    public final Object a(Object obj) {
        ByteBuffer byteBuffer = (ByteBuffer) obj;
        byteBuffer.clear();
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        return byteBuffer;
    }

    @Override // b60.d
    public final Object b() {
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(this.f17580f);
        Intrinsics.d(byteBufferAllocate);
        return byteBufferAllocate;
    }

    @Override // b60.d
    public final void d(Object obj) {
        ByteBuffer instance = (ByteBuffer) obj;
        Intrinsics.g(instance, "instance");
        if (instance.capacity() != this.f17580f) {
            throw new IllegalStateException("Check failed.");
        }
        if (instance.isDirect()) {
            throw new IllegalStateException("Check failed.");
        }
    }
}
