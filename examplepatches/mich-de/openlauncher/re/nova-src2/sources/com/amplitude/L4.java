package com.amplitude;

import android.content.Context;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import kotlin.io.TextStreamsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.text.Charsets;

/* loaded from: classes2.dex */
public final class L4 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f20320a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ M4 f20321b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public L4(Context context, M4 m42) {
        super(0);
        this.f20320a = context;
        this.f20321b = m42;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws IOException {
        String strB;
        Context context = this.f20320a;
        Intrinsics.g(context, "<this>");
        try {
            InputStream inputStreamOpen = context.getAssets().open("amp-rrweb.js");
            Intrinsics.f(inputStreamOpen, "open(...)");
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStreamOpen, Charsets.f72000b), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            try {
                strB = TextStreamsKt.b(bufferedReader);
                bufferedReader.close();
            } finally {
            }
        } catch (IOException unused) {
            strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return r70.j.F0(strB, "__AMP_HANDSHAKE_TOKEN__", this.f20321b.f20330f, false);
    }
}
