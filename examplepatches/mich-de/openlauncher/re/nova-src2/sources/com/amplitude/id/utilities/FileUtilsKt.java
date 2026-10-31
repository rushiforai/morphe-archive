package com.amplitude.id.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.io.File;
import java.io.IOException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u000e\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003¨\u0006\u0004"}, d2 = {"createDirectory", b.f42142b, "location", "Ljava/io/File;", "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class FileUtilsKt {
    public static final void createDirectory(@NotNull File location) throws IOException {
        Intrinsics.g(location, "location");
        if (!location.exists() && !location.mkdirs() && !location.isDirectory()) {
            throw new IOException(c1.q(location, "Could not create directory at "));
        }
    }
}
