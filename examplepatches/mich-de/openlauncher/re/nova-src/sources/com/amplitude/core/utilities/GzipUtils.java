package com.amplitude.core.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u000e\n\u0000\bÀ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006¨\u0006\u0007"}, d2 = {"Lcom/amplitude/core/utilities/GzipUtils;", b.f42142b, "()V", "compress", b.f42142b, "data", b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class GzipUtils {

    @NotNull
    public static final GzipUtils INSTANCE = new GzipUtils();

    private GzipUtils() {
    }

    @NotNull
    public final byte[] compress(@NotNull String data) throws IOException {
        Intrinsics.g(data, "data");
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
        try {
            byte[] bytes = data.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            gZIPOutputStream.write(bytes);
            Unit unit = Unit.f71706a;
            gZIPOutputStream.close();
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            Intrinsics.f(byteArray, "toByteArray(...)");
            return byteArray;
        } finally {
        }
    }
}
