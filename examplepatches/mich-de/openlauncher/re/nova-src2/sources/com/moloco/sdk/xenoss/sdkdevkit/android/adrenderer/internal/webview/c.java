package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview;

import android.content.Context;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import kotlin.io.TextStreamsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class c implements j {

    /* renamed from: b, reason: collision with root package name */
    public static final int f42016b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f42017a;

    public c(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f42017a = context;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview.j
    @NotNull
    public String a(@NotNull String fileName) throws IOException {
        Intrinsics.g(fileName, "fileName");
        InputStream inputStreamOpen = this.f42017a.getAssets().open(fileName);
        Intrinsics.f(inputStreamOpen, "open(...)");
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStreamOpen, Charsets.f72000b), UserMetadata.MAX_INTERNAL_KEY_SIZE);
        try {
            String strB = TextStreamsKt.b(bufferedReader);
            bufferedReader.close();
            return strB;
        } finally {
        }
    }
}
