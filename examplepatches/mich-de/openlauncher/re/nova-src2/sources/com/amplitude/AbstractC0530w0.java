package com.amplitude;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* renamed from: com.amplitude.w0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0530w0 {
    public static final void a(File file, String content) throws IOException {
        Intrinsics.g(file, "<this>");
        Intrinsics.g(content, "content");
        FileOutputStream fileOutputStream = new FileOutputStream(file, true);
        try {
            byte[] bytes = content.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            fileOutputStream.write(bytes);
            fileOutputStream.flush();
            Unit unit = Unit.f71706a;
            fileOutputStream.close();
        } finally {
        }
    }
}
