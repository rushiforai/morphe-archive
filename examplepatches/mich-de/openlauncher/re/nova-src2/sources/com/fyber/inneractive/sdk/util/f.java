package com.fyber.inneractive.sdk.util;

import java.nio.ByteBuffer;
import java.util.concurrent.ConcurrentLinkedQueue;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: b, reason: collision with root package name */
    public static final f f31185b = new f();

    /* renamed from: a, reason: collision with root package name */
    public final ConcurrentLinkedQueue f31186a = new ConcurrentLinkedQueue();

    public f() {
        for (int i5 = 0; i5 < 2; i5++) {
            this.f31186a.offer(ByteBuffer.allocateDirect(ReaderJsonLexerKt.BATCH_SIZE));
        }
    }
}
