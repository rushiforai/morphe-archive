package defpackage;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Spanned;
import android.view.inputmethod.EditorInfo;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yw3 {
    public static final Object j = new Object();
    public static volatile yw3 k;
    public final ReentrantReadWriteLock a;
    public final d80 b;
    public volatile int c;
    public final Handler d;
    public final wj e;
    public final xw3 f;
    public final no3 g;
    public final int h;
    public final cz2 i;

    public yw3(nz4 nz4Var) {
        ReentrantReadWriteLock reentrantReadWriteLock = new ReentrantReadWriteLock();
        this.a = reentrantReadWriteLock;
        this.c = 3;
        xw3 xw3Var = (xw3) nz4Var.b;
        this.f = xw3Var;
        int i = nz4Var.a;
        this.h = i;
        this.i = (cz2) nz4Var.c;
        this.d = new Handler(Looper.getMainLooper());
        this.b = new d80(0);
        this.g = new no3(16);
        wj wjVar = new wj(this);
        this.e = wjVar;
        reentrantReadWriteLock.writeLock().lock();
        if (i == 0) {
            try {
                this.c = 0;
            } catch (Throwable th) {
                this.a.writeLock().unlock();
                throw th;
            }
        }
        reentrantReadWriteLock.writeLock().unlock();
        if (c() == 0) {
            try {
                xw3Var.a(new uw3(wjVar));
            } catch (Throwable th2) {
                f(th2);
            }
        }
    }

    public static yw3 a() {
        yw3 yw3Var;
        synchronized (j) {
            try {
                yw3Var = k;
                if (!(yw3Var != null)) {
                    throw new IllegalStateException("EmojiCompat is not initialized.\n\nYou must initialize EmojiCompat prior to referencing the EmojiCompat instance.\n\nThe most likely cause of this error is disabling the EmojiCompatInitializer\neither explicitly in AndroidManifest.xml, or by including\nandroidx.emoji2:emoji2-bundled.\n\nAutomatic initialization is typically performed by EmojiCompatInitializer. If\nyou are not expecting to initialize EmojiCompat manually in your application,\nplease check to ensure it has not been removed from your APK's manifest. You can\ndo this in Android Studio using Build > Analyze APK.\n\nIn the APK Analyzer, ensure that the startup entry for\nEmojiCompatInitializer and InitializationProvider is present in\n AndroidManifest.xml. If it is missing or contains tools:node=\"remove\", and you\nintend to use automatic configuration, verify:\n\n  1. Your application does not include emoji2-bundled\n  2. All modules do not contain an exclusion manifest rule for\n     EmojiCompatInitializer or InitializationProvider. For more information\n     about manifest exclusions see the documentation for the androidx startup\n     library.\n\nIf you intend to use emoji2-bundled, please call EmojiCompat.init. You can\nlearn more in the documentation for BundledEmojiCompatConfig.\n\nIf you intended to perform manual configuration, it is recommended that you call\nEmojiCompat.init immediately on application startup.\n\nIf you still cannot resolve this issue, please open a bug with your specific\nconfiguration to help improve error message.");
                }
            } finally {
            }
        }
        return yw3Var;
    }

    public static boolean d() {
        return k != null;
    }

    public final int b(CharSequence charSequence, int i) {
        if (!(c() == 1)) {
            ygf.f("Not initialized yet");
            return 0;
        }
        jq7.h("charSequence cannot be null", charSequence);
        ku3 ku3Var = (ku3) this.e.b;
        ku3Var.getClass();
        if (i < 0 || i >= charSequence.length()) {
            return -1;
        }
        if (charSequence instanceof Spanned) {
            Spanned spanned = (Spanned) charSequence;
            cyd[] cydVarArr = (cyd[]) spanned.getSpans(i, i + 1, cyd.class);
            if (cydVarArr.length > 0) {
                return spanned.getSpanStart(cydVarArr[0]);
            }
        }
        return ((kx3) ku3Var.H(charSequence, Math.max(0, i - 16), Math.min(charSequence.length(), i + 16), Integer.MAX_VALUE, true, new kx3(i))).b;
    }

    public final int c() {
        this.a.readLock().lock();
        try {
            return this.c;
        } finally {
            this.a.readLock().unlock();
        }
    }

    public final void e() {
        if (!(this.h == 1)) {
            ygf.f("Set metadataLoadStrategy to LOAD_STRATEGY_MANUAL to execute manual loading");
            return;
        }
        if (c() == 1) {
            return;
        }
        this.a.writeLock().lock();
        try {
            if (this.c == 0) {
                return;
            }
            this.c = 0;
            this.a.writeLock().unlock();
            wj wjVar = this.e;
            yw3 yw3Var = (yw3) wjVar.a;
            try {
                yw3Var.f.a(new uw3(wjVar));
            } catch (Throwable th) {
                yw3Var.f(th);
            }
        } finally {
            this.a.writeLock().unlock();
        }
    }

    public final void f(Throwable th) {
        ArrayList arrayList = new ArrayList();
        this.a.writeLock().lock();
        try {
            this.c = 2;
            arrayList.addAll(this.b);
            this.b.clear();
            this.a.writeLock().unlock();
            this.d.post(new u41(arrayList, this.c, th));
        } catch (Throwable th2) {
            this.a.writeLock().unlock();
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:108:? A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:110:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008f A[Catch: all -> 0x0082, TRY_ENTER, TryCatch #0 {all -> 0x0082, blocks: (B:38:0x005a, B:41:0x005f, B:43:0x0063, B:45:0x0070, B:52:0x008f, B:54:0x0099, B:56:0x009c, B:58:0x00a0, B:60:0x00b0, B:61:0x00b3), top: B:101:0x005a }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a0 A[Catch: all -> 0x0082, TryCatch #0 {all -> 0x0082, blocks: (B:38:0x005a, B:41:0x005f, B:43:0x0063, B:45:0x0070, B:52:0x008f, B:54:0x0099, B:56:0x009c, B:58:0x00a0, B:60:0x00b0, B:61:0x00b3), top: B:101:0x005a }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00c2 A[Catch: all -> 0x00f8, TRY_ENTER, TryCatch #1 {all -> 0x00f8, blocks: (B:65:0x00c2, B:68:0x00ca, B:50:0x0085), top: B:103:0x0085 }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0100  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.CharSequence g(int r12, int r13, int r14, java.lang.CharSequence r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 300
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yw3.g(int, int, int, java.lang.CharSequence):java.lang.CharSequence");
    }

    public final void h(ww3 ww3Var) {
        this.a.writeLock().lock();
        try {
            if (this.c == 1 || this.c == 2) {
                this.d.post(new u41(Arrays.asList(ww3Var), this.c, (Throwable) null));
            } else {
                this.b.add(ww3Var);
            }
            this.a.writeLock().unlock();
        } catch (Throwable th) {
            this.a.writeLock().unlock();
            throw th;
        }
    }

    public final void i(EditorInfo editorInfo) {
        if (c() != 1 || editorInfo == null) {
            return;
        }
        if (editorInfo.extras == null) {
            editorInfo.extras = new Bundle();
        }
        wj wjVar = this.e;
        wjVar.getClass();
        Bundle bundle = editorInfo.extras;
        vz7 vz7Var = (vz7) ((n0c) wjVar.c).b;
        int iA = vz7Var.a(4);
        bundle.putInt("android.support.text.emoji.emojiCompat_metadataVersion", iA != 0 ? ((ByteBuffer) vz7Var.d).getInt(iA + vz7Var.a) : 0);
        editorInfo.extras.putBoolean("android.support.text.emoji.emojiCompat_replaceAll", false);
    }
}
