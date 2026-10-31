package com.amplitude;

import android.view.View;
import com.amplitude.android.sessionreplay.config.MaskLevel;
import io.flutter.plugin.common.BinaryMessenger;
import java.nio.ByteBuffer;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes2.dex */
public final class A {

    /* renamed from: a, reason: collision with root package name */
    public final B0 f20176a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.a2 f20177b;

    /* renamed from: c, reason: collision with root package name */
    public BinaryMessenger f20178c;

    /* renamed from: d, reason: collision with root package name */
    public A0 f20179d;

    public A(B0 scope, t70.a2 mainDispatcher) {
        Intrinsics.g(scope, "scope");
        Intrinsics.g(mainDispatcher, "mainDispatcher");
        this.f20176a = scope;
        this.f20177b = mainDispatcher;
    }

    public final void a(View view, MaskLevel maskLevel, K1 k12) {
        Intrinsics.g(view, "view");
    }

    public static final void a(A this$0, ByteBuffer byteBuffer, BinaryMessenger.BinaryReply binaryReply) {
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(binaryReply, "<anonymous parameter 1>");
        if (byteBuffer != null) {
            byte[] bArr = new byte[byteBuffer.remaining()];
            byteBuffer.get(bArr);
            String str = new String(bArr, Charsets.f72000b);
            A0 a02 = this$0.f20179d;
            if (a02 != null) {
                a02.invoke(str);
            }
        }
    }

    public final void a(String message) {
        Intrinsics.g(message, "message");
        BinaryMessenger binaryMessenger = this.f20178c;
        if (binaryMessenger == null) {
            return;
        }
        byte[] bytes = message.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(bytes.length);
        byteBufferAllocateDirect.put(bytes);
        t70.m0.t(this.f20176a, this.f20177b, null, new C0539y(binaryMessenger, byteBufferAllocateDirect, null), 2);
    }
}
