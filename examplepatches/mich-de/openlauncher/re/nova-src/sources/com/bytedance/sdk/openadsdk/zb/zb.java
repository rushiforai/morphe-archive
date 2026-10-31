package com.bytedance.sdk.openadsdk.zb;

import com.bytedance.sdk.component.utils.ul;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes2.dex */
public abstract class zb {
    protected boolean ycx = false;

    /* renamed from: zb, reason: collision with root package name */
    private final ExecutorService f27494zb = Executors.newSingleThreadExecutor();

    public class ycx implements Callable<Void> {

        /* renamed from: zb, reason: collision with root package name */
        private final File f27495zb;

        @Override // java.util.concurrent.Callable
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public Void call() throws Exception {
            zb.this.zb(this.f27495zb);
            return null;
        }

        private ycx(File file) {
            this.f27495zb = file;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(File file) throws IOException {
        if (this.ycx) {
            List<File> listYcx = ul.ycx(file);
            listYcx.toString();
            ycx(listYcx);
        } else {
            try {
                ul.zb(file);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyNY7y6dBg==", "d/w4sQqvYuGJRtI=", "T+E4lguVZ+WBSdxanh61Jl8=", 60);
            }
            ycx(ul.ycx(file.getParentFile()));
        }
    }

    public abstract void ycx(List<File> list);

    public abstract boolean ycx(long j11, int i5);

    public abstract boolean ycx(File file, long j11, int i5);

    public void ycx(File file) throws IOException {
        this.f27494zb.submit(new ycx(file));
    }

    public long zb(List<File> list) {
        Iterator<File> it = list.iterator();
        long length = 0;
        while (it.hasNext()) {
            length += it.next().length();
        }
        return length;
    }
}
