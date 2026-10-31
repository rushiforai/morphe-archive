package kl;

import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public abstract class c0 {

    /* renamed from: a, reason: collision with root package name */
    public static final tl.a f71572a = tl.a.a(new byte[0]);

    public static final tl.a a(int i5) {
        return tl.a.a(ByteBuffer.allocate(5).put((byte) 0).putInt(i5).array());
    }

    public static final tl.a b(int i5) {
        return tl.a.a(ByteBuffer.allocate(5).put((byte) 1).putInt(i5).array());
    }
}
