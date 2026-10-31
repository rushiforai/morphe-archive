package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes3.dex */
public interface c {

    /* renamed from: a, reason: collision with root package name */
    public static final ByteBuffer f28982a = ByteBuffer.allocateDirect(0).order(ByteOrder.nativeOrder());

    ByteBuffer a();

    void a(ByteBuffer byteBuffer);

    boolean a(int i5, int i11, int i12);

    void b();

    boolean c();

    boolean d();

    int e();

    void f();

    void flush();
}
