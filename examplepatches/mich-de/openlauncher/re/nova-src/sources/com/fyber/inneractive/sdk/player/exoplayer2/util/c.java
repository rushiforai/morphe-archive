package com.fyber.inneractive.sdk.player.exoplayer2.util;

import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final File f30429a;

    /* renamed from: b, reason: collision with root package name */
    public final File f30430b;

    public c(File file) {
        this.f30429a = file;
        this.f30430b = new File(file.getPath() + ".bak");
    }

    public final FileInputStream a() {
        if (this.f30430b.exists()) {
            this.f30429a.delete();
            this.f30430b.renameTo(this.f30429a);
        }
        return new FileInputStream(this.f30429a);
    }

    public final b b() throws IOException {
        if (this.f30429a.exists()) {
            if (this.f30430b.exists()) {
                this.f30429a.delete();
            } else if (!this.f30429a.renameTo(this.f30430b)) {
                Log.w("AtomicFile", "Couldn't rename file " + this.f30429a + " to backup file " + this.f30430b);
            }
        }
        try {
            return new b(this.f30429a);
        } catch (FileNotFoundException unused) {
            if (!this.f30429a.getParentFile().mkdirs()) {
                throw new IOException("Couldn't create directory " + this.f30429a);
            }
            try {
                return new b(this.f30429a);
            } catch (FileNotFoundException unused2) {
                throw new IOException("Couldn't create " + this.f30429a);
            }
        }
    }
}
