package com.fyber.inneractive.sdk.player.cache;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final e f28841a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean[] f28842b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f28843c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ g f28844d;

    public d(g gVar, e eVar) {
        this.f28844d = gVar;
        this.f28841a = eVar;
        this.f28842b = eVar.f28847c ? null : new boolean[gVar.f28858g];
    }

    public final void a(byte[] bArr) throws IOException {
        OutputStream cVar;
        FileOutputStream fileOutputStream;
        g gVar = this.f28844d;
        if (gVar.f28858g <= 0) {
            throw new IllegalArgumentException("Expected index 0 to be greater than 0 and less than the maximum value count of " + this.f28844d.f28858g);
        }
        synchronized (gVar) {
            try {
                e eVar = this.f28841a;
                if (eVar.f28848d != this) {
                    throw new IllegalStateException();
                }
                if (!eVar.f28847c) {
                    this.f28842b[0] = true;
                }
                File fileB = eVar.b(0);
                try {
                    fileOutputStream = new FileOutputStream(fileB);
                } catch (FileNotFoundException unused) {
                    this.f28844d.f28852a.mkdirs();
                    try {
                        fileOutputStream = new FileOutputStream(fileB);
                    } catch (FileNotFoundException unused2) {
                        cVar = g.f28851q;
                    }
                }
                cVar = new c(this, fileOutputStream);
            } finally {
            }
        }
        try {
            cVar.write(bArr);
            Charset charset = l.f28872a;
            try {
                cVar.close();
            } catch (RuntimeException e3) {
                throw e3;
            } catch (Exception unused3) {
            }
        } catch (Throwable th2) {
            Charset charset2 = l.f28872a;
            if (cVar != null) {
                try {
                    cVar.close();
                } catch (RuntimeException e11) {
                    throw e11;
                } catch (Exception unused4) {
                }
            }
            throw th2;
        }
    }

    public final void a() {
        if (this.f28843c) {
            g.a(this.f28844d, this, false);
            this.f28844d.c(this.f28841a.f28845a);
        } else {
            g.a(this.f28844d, this, true);
        }
    }
}
