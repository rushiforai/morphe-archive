package com.bytedance.sdk.component.lud.zb.sya.ycx;

import android.content.Context;
import java.io.File;

/* loaded from: classes2.dex */
public class zb implements com.bytedance.sdk.component.lud.zb, Cloneable {

    /* renamed from: jw, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.lud.zb f24030jw;

    /* renamed from: dj, reason: collision with root package name */
    private int f24031dj;
    private File fby;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f24032lt;
    private boolean lud;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f24033ul;
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f24034zb;

    public zb(int i5, int i11, int i12, long j11, File file) {
        this(i5, i11, i12, j11, i11 != 0, j11 != 0, file);
    }

    public static com.bytedance.sdk.component.lud.zb jw() {
        return f24030jw;
    }

    @Override // com.bytedance.sdk.component.lud.zb
    public int dj() {
        return this.f24031dj;
    }

    @Override // com.bytedance.sdk.component.lud.zb
    public File fby() {
        return this.fby;
    }

    @Override // com.bytedance.sdk.component.lud.zb
    public boolean lt() {
        return this.f24033ul;
    }

    @Override // com.bytedance.sdk.component.lud.zb
    public boolean lud() {
        return this.lud;
    }

    @Override // com.bytedance.sdk.component.lud.zb
    public int sya() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.component.lud.zb
    public boolean ul() {
        return this.f24032lt;
    }

    @Override // com.bytedance.sdk.component.lud.zb
    public long ycx() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.lud.zb
    public int zb() {
        return this.f24034zb;
    }

    public zb(int i5, int i11, int i12, long j11, boolean z11, boolean z12, File file) {
        this.ycx = j11;
        this.f24034zb = i5;
        this.sya = i11;
        this.f24031dj = i12;
        this.lud = z11;
        this.f24032lt = z12;
        this.fby = file;
        this.f24033ul = i12 != 0;
    }

    public static void ycx(Context context, com.bytedance.sdk.component.lud.zb zbVar) {
        if (zbVar != null) {
            f24030jw = zbVar;
        } else {
            f24030jw = ycx(new File(context.getCacheDir(), "image"));
        }
    }

    public static com.bytedance.sdk.component.lud.zb ycx(File file) {
        long jYcx;
        int iSya;
        int iDj;
        file.mkdirs();
        if (f24030jw == null) {
            iSya = 10;
            iDj = 14;
            jYcx = 20;
        } else {
            jYcx = f24030jw.ycx();
            iSya = f24030jw.sya();
            iDj = f24030jw.dj();
        }
        return new zb(0, iSya, iDj, jYcx, file);
    }
}
