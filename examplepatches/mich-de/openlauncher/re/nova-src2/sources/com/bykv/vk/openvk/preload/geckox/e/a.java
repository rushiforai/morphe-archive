package com.bykv.vk.openvk.preload.geckox.e;

import com.bykv.vk.openvk.preload.geckox.e.a.c;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.utils.g;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
final class a {

    /* renamed from: a, reason: collision with root package name */
    private String f22086a;

    /* renamed from: b, reason: collision with root package name */
    private String f22087b;

    /* renamed from: c, reason: collision with root package name */
    private volatile File f22088c;

    /* renamed from: d, reason: collision with root package name */
    private volatile Long f22089d;

    /* renamed from: e, reason: collision with root package name */
    private volatile com.bykv.vk.openvk.preload.geckox.e.a.a f22090e;

    /* renamed from: f, reason: collision with root package name */
    private AtomicBoolean f22091f = new AtomicBoolean(false);

    public a(String str, String str2) {
        this.f22086a = str;
        this.f22087b = str2;
    }

    private synchronized com.bykv.vk.openvk.preload.geckox.e.a.a d(String str) throws Exception {
        if (this.f22090e != null) {
            return this.f22090e;
        }
        File fileE = e(str);
        if (fileE == null) {
            throw new FileNotFoundException("channel no exist，channel:".concat(String.valueOf(str)));
        }
        File file = new File(fileE, "res.macv");
        File file2 = new File(fileE, "res");
        if (file2.exists() && file2.isDirectory()) {
            this.f22090e = new c(fileE);
        } else {
            if (!file.exists() || !file.isFile()) {
                throw new RuntimeException("can not find res, dir:" + fileE.getAbsolutePath());
            }
            this.f22090e = new com.bykv.vk.openvk.preload.geckox.e.a.b(fileE);
        }
        return this.f22090e;
    }

    private synchronized File e(String str) throws Exception {
        if (this.f22088c != null) {
            return this.f22088c;
        }
        if (this.f22089d != null && this.f22089d.longValue() == -1) {
            return null;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f22086a);
        String str2 = File.separator;
        sb2.append(str2);
        sb2.append(str);
        sb2.append(str2);
        sb2.append("select.lock");
        com.bykv.vk.openvk.preload.geckox.f.b bVarA = com.bykv.vk.openvk.preload.geckox.f.b.a(sb2.toString());
        try {
            if (this.f22089d == null) {
                this.f22089d = g.a(new File(this.f22086a, str));
            }
            if (this.f22089d == null) {
                this.f22089d = -1L;
                bVarA.a();
                return null;
            }
            File file = new File(this.f22086a, str2 + str + str2 + this.f22089d + str2 + "using.lock");
            this.f22088c = file.getParentFile();
            com.bykv.vk.openvk.preload.geckox.f.c.a(file.getAbsolutePath());
            File file2 = this.f22088c;
            bVarA.a();
            return file2;
        } catch (Throwable th2) {
            bVarA.a();
            throw th2;
        }
    }

    public final InputStream a(String str) throws Exception {
        return d(this.f22087b).a(a(this.f22087b, str));
    }

    public final boolean b(String str) throws Exception {
        return d(this.f22087b).b(a(this.f22087b, str));
    }

    public final int c(String str) {
        try {
            File file = new File(e(str), "res");
            if (!file.exists() || !file.isDirectory()) {
                return 0;
            }
            int length = file.listFiles().length;
            if (length > 0) {
                return length - 1;
            }
            return 0;
        } catch (Exception e3) {
            e3.printStackTrace();
            return 0;
        }
    }

    private static String a(String str, String str2) {
        return str2.substring(str.length() + 1);
    }

    public final String b() {
        return this.f22087b;
    }

    public final Long a() {
        return this.f22089d;
    }

    public final void c() throws Exception {
        if (this.f22091f.getAndSet(true)) {
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f22086a);
        String str = File.separator;
        sb2.append(str);
        sb2.append(this.f22087b);
        sb2.append(str);
        sb2.append("select.lock");
        com.bykv.vk.openvk.preload.geckox.f.b bVarA = com.bykv.vk.openvk.preload.geckox.f.b.a(sb2.toString());
        GeckoLogger.d("gecko-file-lock", "channel version loader clean");
        try {
            if (this.f22088c == null) {
                return;
            }
            com.bykv.vk.openvk.preload.geckox.f.c.b(this.f22088c.getAbsolutePath() + str + "using.lock");
            bVarA.a();
            com.bykv.vk.openvk.preload.geckox.a.c.a(this.f22086a + str + this.f22087b);
        } finally {
            bVarA.a();
        }
    }
}
