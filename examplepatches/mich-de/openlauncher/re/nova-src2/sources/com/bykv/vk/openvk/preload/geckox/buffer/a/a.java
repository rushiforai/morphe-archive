package com.bykv.vk.openvk.preload.geckox.buffer.a;

import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import java.io.File;
import java.io.IOException;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public String f22038a;

    /* renamed from: b, reason: collision with root package name */
    public String f22039b;

    /* renamed from: c, reason: collision with root package name */
    public String f22040c;

    /* renamed from: d, reason: collision with root package name */
    public String f22041d;

    /* renamed from: e, reason: collision with root package name */
    public String f22042e;

    /* renamed from: f, reason: collision with root package name */
    public String f22043f;

    /* renamed from: g, reason: collision with root package name */
    public int f22044g;

    public static com.bykv.vk.openvk.preload.geckox.buffer.a a(File file, long j11) throws IOException {
        com.bykv.vk.openvk.preload.geckox.buffer.a aVarB = b(file, j11);
        GeckoLogger.d("gecko-debug-tag", "buffer type:" + aVarB.getClass());
        return aVarB;
    }

    private static com.bykv.vk.openvk.preload.geckox.buffer.a b(File file, long j11) throws IOException {
        if (j11 <= 0) {
            try {
                return new b(file);
            } catch (Exception e3) {
                throw new IOException("create FileBuffer failed! file:" + file.getAbsolutePath() + " caused by:" + e3.getMessage(), e3);
            }
        }
        try {
            return new c(j11, file);
        } catch (Exception e11) {
            throw new RuntimeException("create random access file failed! file:" + file.getAbsolutePath() + " caused by:" + e11.getMessage(), e11);
        }
    }
}
