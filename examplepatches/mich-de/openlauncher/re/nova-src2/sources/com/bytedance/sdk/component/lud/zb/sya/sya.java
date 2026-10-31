package com.bytedance.sdk.component.lud.zb.sya;

import a5.k;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.widget.ImageView;
import com.bytedance.sdk.component.lud.dy;
import com.bytedance.sdk.component.lud.ea;
import com.bytedance.sdk.component.lud.fby;
import com.bytedance.sdk.component.lud.jc;
import com.bytedance.sdk.component.lud.jw;
import com.bytedance.sdk.component.lud.thx;
import com.bytedance.sdk.component.lud.uh;
import com.bytedance.sdk.component.lud.xkz;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.tiktok.util.UrlConst;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;

/* loaded from: classes2.dex */
public class sya implements jw {

    /* renamed from: av, reason: collision with root package name */
    private byte[] f23993av;
    private xkz bhi;

    /* renamed from: dj, reason: collision with root package name */
    private String f23994dj;

    /* renamed from: dv, reason: collision with root package name */
    private int f23995dv;

    /* renamed from: dy, reason: collision with root package name */
    private uh f23996dy;

    /* renamed from: ea, reason: collision with root package name */
    private int f23997ea;
    private int fby;

    /* renamed from: hf, reason: collision with root package name */
    private ExecutorService f23998hf;
    private com.bytedance.sdk.component.lud.ul htf;

    /* renamed from: jc, reason: collision with root package name */
    private fby f23999jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f24000jw;

    /* renamed from: lt, reason: collision with root package name */
    private ImageView.ScaleType f24001lt;
    private dy lud;

    /* renamed from: ok, reason: collision with root package name */
    private WeakReference<ImageView> f24002ok;
    private int oty;
    private final Handler pmi;

    /* renamed from: ry, reason: collision with root package name */
    private volatile boolean f24003ry;
    private String sya;
    private boolean syc;
    private int thx;

    /* renamed from: tn, reason: collision with root package name */
    private com.bytedance.sdk.component.lud.zb f24004tn;
    private boolean tru;

    /* renamed from: uh, reason: collision with root package name */
    private boolean f24005uh;

    /* renamed from: ul, reason: collision with root package name */
    private Bitmap.Config f24006ul;
    private int wie;
    private lt wwx;
    private boolean xkz;
    Future<?> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f24007zb;

    public class ycx implements dy {

        /* renamed from: zb, reason: collision with root package name */
        private dy f24008zb;

        public ycx(dy dyVar) {
            this.f24008zb = dyVar;
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(final ea eaVar) {
            Bitmap bitmapYcx;
            final ImageView imageView = (ImageView) sya.this.f24002ok.get();
            if (imageView != null && sya.this.f23997ea != 3 && ycx(imageView)) {
                Object objZb = eaVar.zb();
                if (objZb instanceof Bitmap) {
                    final Bitmap bitmap = (Bitmap) eaVar.zb();
                    sya.this.pmi.post(new Runnable() { // from class: com.bytedance.sdk.component.lud.zb.sya.sya.ycx.1
                        @Override // java.lang.Runnable
                        public void run() {
                            imageView.setImageBitmap(bitmap);
                        }
                    });
                } else if (objZb instanceof Drawable) {
                    final Drawable drawable = (Drawable) eaVar.zb();
                    sya.this.pmi.post(new Runnable() { // from class: com.bytedance.sdk.component.lud.zb.sya.sya.ycx.2
                        @Override // java.lang.Runnable
                        public void run() {
                            if (Build.VERSION.SDK_INT >= 28 && k.v(drawable)) {
                                k.j(drawable).start();
                            }
                            imageView.setImageDrawable(drawable);
                        }
                    });
                }
            }
            try {
                if (sya.this.f23999jc != null && (eaVar.zb() instanceof Bitmap) && (bitmapYcx = sya.this.f23999jc.ycx((Bitmap) eaVar.zb())) != null) {
                    eaVar.ycx(bitmapYcx);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pVw==", "a+8qvA69bsKyT8ZIiQK0bHLjLJIGkGbGhE/FcYUCtC1V6z+iEb1514VY", "VOAegAC/bNST", 620);
            }
            if (sya.this.wie == 5) {
                sya.this.pmi.postAtFrontOfQueue(new Runnable() { // from class: com.bytedance.sdk.component.lud.zb.sya.sya.ycx.3
                    @Override // java.lang.Runnable
                    public void run() {
                        if (ycx.this.f24008zb != null) {
                            ycx.this.f24008zb.ycx(eaVar);
                        }
                    }
                });
                return;
            }
            dy dyVar = this.f24008zb;
            if (dyVar != null) {
                dyVar.ycx(eaVar);
            }
        }

        private boolean ycx(ImageView imageView) {
            Object tag;
            return (imageView == null || (tag = imageView.getTag(1094453505)) == null || !tag.equals(sya.this.sya)) ? false : true;
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(final int i5, final String str, final Throwable th2) {
            if (sya.this.wie == 5) {
                sya.this.pmi.post(new Runnable() { // from class: com.bytedance.sdk.component.lud.zb.sya.sya.ycx.4
                    @Override // java.lang.Runnable
                    public void run() {
                        if (ycx.this.f24008zb != null) {
                            ycx.this.f24008zb.ycx(i5, str, th2);
                        }
                    }
                });
                return;
            }
            dy dyVar = this.f24008zb;
            if (dyVar != null) {
                dyVar.ycx(i5, str, th2);
            }
        }
    }

    public static class zb implements jc {

        /* renamed from: dj, reason: collision with root package name */
        private String f24014dj;

        /* renamed from: dy, reason: collision with root package name */
        private lt f24015dy;

        /* renamed from: ea, reason: collision with root package name */
        private uh f24016ea;
        private int fby;
        private ExecutorService htf;

        /* renamed from: lt, reason: collision with root package name */
        private Bitmap.Config f24019lt;
        private ImageView.ScaleType lud;

        /* renamed from: ok, reason: collision with root package name */
        private boolean f24020ok;
        private int pmi;

        /* renamed from: ry, reason: collision with root package name */
        private boolean f24021ry;
        private String sya;
        private com.bytedance.sdk.component.lud.zb syc;
        private boolean thx;

        /* renamed from: uh, reason: collision with root package name */
        private int f24022uh;

        /* renamed from: ul, reason: collision with root package name */
        private int f24023ul;
        private fby wie;
        private xkz wwx;
        private String xkz;
        private dy ycx;

        /* renamed from: zb, reason: collision with root package name */
        private ImageView f24024zb;

        /* renamed from: jw, reason: collision with root package name */
        private int f24018jw = 1;

        /* renamed from: jc, reason: collision with root package name */
        private int f24017jc = 5;

        public zb(lt ltVar) {
            this.f24015dy = ltVar;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc dj(int i5) {
            this.pmi = i5;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc lud(int i5) {
            this.f24022uh = i5;
            return this;
        }

        public jc sya(String str) {
            this.f24014dj = str;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc ycx(String str) {
            this.sya = str;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc zb(int i5) {
            this.fby = i5;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc sya(int i5) {
            this.f24018jw = i5;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc ycx(ImageView.ScaleType scaleType) {
            this.lud = scaleType;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc zb(String str) {
            this.xkz = str;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc ycx(Bitmap.Config config) {
            this.f24019lt = config;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc ycx(int i5) {
            this.f24023ul = i5;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc ycx(uh uhVar) {
            this.f24016ea = uhVar;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc ycx(boolean z11) {
            this.f24021ry = z11;
            return this;
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jw ycx(dy dyVar, int i5) {
            this.f24017jc = i5;
            return ycx(dyVar);
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jw ycx(dy dyVar) {
            this.ycx = dyVar;
            return new sya(this).htf();
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jw ycx(ImageView imageView) {
            this.f24024zb = imageView;
            return new sya(this).htf();
        }

        @Override // com.bytedance.sdk.component.lud.jc
        public jc ycx(fby fbyVar) {
            this.wie = fbyVar;
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public jw htf() {
        try {
            if (this.wwx == null) {
                dy dyVar = this.lud;
                if (dyVar != null) {
                    dyVar.ycx(1005, "not init !", null);
                    return this;
                }
            } else {
                String strYcx = ycx();
                if (TextUtils.isEmpty(strYcx)) {
                    this.lud.ycx(2000, "url is empty", null);
                    return this;
                }
                thx thxVarUl = this.wwx.ul();
                if (!strYcx.startsWith("http://") && !strYcx.startsWith(UrlConst.HTTPS) && thxVarUl != null) {
                    thxVarUl.ycx(1006, "url is not validate ".concat(strYcx));
                }
                ExecutorService executorServiceLt = this.f23998hf == null ? this.wwx.lt() : null;
                Runnable runnable = new Runnable() { // from class: com.bytedance.sdk.component.lud.zb.sya.sya.1
                    @Override // java.lang.Runnable
                    public void run() {
                        sya syaVar = sya.this;
                        com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar = new com.bytedance.sdk.component.lud.zb.sya.ycx(syaVar, syaVar.f23996dy);
                        try {
                            ArrayList arrayList = new ArrayList();
                            arrayList.add(new com.bytedance.sdk.component.lud.zb.zb.zb());
                            arrayList.add(new com.bytedance.sdk.component.lud.zb.zb.lud());
                            arrayList.add(new com.bytedance.sdk.component.lud.zb.zb.ycx());
                            arrayList.add(new com.bytedance.sdk.component.lud.zb.zb.sya());
                            arrayList.add(new com.bytedance.sdk.component.lud.zb.zb.dj());
                            for (int i5 = 0; i5 < arrayList.size(); i5++) {
                                if (sya.this.f24003ry) {
                                    ycxVar.ycx(BackupConstant.SCENE_CLOSED_WITHOUT_SHOW, "canceled", null);
                                    return;
                                }
                                com.bytedance.sdk.component.lud.zb.zb.lt ltVar = (com.bytedance.sdk.component.lud.zb.zb.lt) arrayList.get(i5);
                                if (sya.this.f23996dy != null && ltVar != null && !"data_intercept".equals(ltVar.ycx())) {
                                    sya.this.f23996dy.ycx(ltVar.ycx(), sya.this);
                                }
                                sya syaVar2 = sya.this;
                                boolean zYcx = ltVar.ycx(syaVar2, syaVar2.f23996dy, ycxVar);
                                if (sya.this.f23996dy != null && !"data_intercept".equals(ltVar.ycx())) {
                                    sya.this.f23996dy.zb(ltVar.ycx(), sya.this);
                                }
                                if (!zYcx) {
                                    return;
                                }
                            }
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pVw==", "a+8qvA69bsKyT8ZIiQK0bAo=", "Sfsj", 378);
                            ycxVar.ycx(2000, th2.getMessage(), th2);
                        }
                    }
                };
                if (this.tru) {
                    runnable.run();
                    return this;
                }
                ExecutorService executorService = this.f23998hf;
                if (executorService != null) {
                    this.ycx = executorService.submit(runnable);
                    return this;
                }
                if (executorServiceLt != null) {
                    this.ycx = executorServiceLt.submit(runnable);
                }
            }
            return this;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pVw==", "a+8qvA69bsKyT8ZIiQK0", "Ses8gAavfQ==", 391);
            Log.e("ImageRequest", e3.getMessage());
            return this;
        }
    }

    public lt dy() {
        return this.wwx;
    }

    public int ea() {
        return this.f23997ea;
    }

    public Bitmap.Config jc() {
        return this.f24006ul;
    }

    public boolean ok() {
        return this.f24005uh;
    }

    public xkz pmi() {
        return this.bhi;
    }

    public byte[] ry() {
        return this.f23993av;
    }

    public int syc() {
        return this.thx;
    }

    public String uh() {
        return fby() + ea();
    }

    public com.bytedance.sdk.component.lud.zb wie() {
        return this.f24004tn;
    }

    public com.bytedance.sdk.component.lud.ul xkz() {
        return this.htf;
    }

    private sya(zb zbVar) {
        this.pmi = new Handler(Looper.getMainLooper());
        this.f24005uh = true;
        this.f23993av = null;
        this.f24007zb = zbVar.f24014dj;
        this.lud = new ycx(zbVar.ycx);
        this.f24002ok = new WeakReference<>(zbVar.f24024zb);
        this.f24001lt = zbVar.lud;
        this.f24006ul = zbVar.f24019lt;
        this.fby = zbVar.f24023ul;
        this.f24000jw = zbVar.fby;
        this.f23997ea = zbVar.f24018jw;
        this.wie = zbVar.f24017jc;
        this.f23996dy = zbVar.f24016ea;
        this.f24004tn = ycx(zbVar);
        if (!TextUtils.isEmpty(zbVar.sya)) {
            zb(zbVar.sya);
            ycx(zbVar.sya);
        }
        this.xkz = zbVar.f24020ok;
        this.syc = zbVar.f24021ry;
        this.wwx = zbVar.f24015dy;
        this.f23999jc = zbVar.wie;
        this.oty = zbVar.f24022uh;
        this.f23995dv = zbVar.pmi;
        this.f23998hf = zbVar.htf;
        this.tru = zbVar.thx;
        this.bhi = zbVar.wwx;
    }

    private com.bytedance.sdk.component.lud.zb ycx(zb zbVar) {
        return zbVar.syc != null ? zbVar.syc : !TextUtils.isEmpty(zbVar.xkz) ? com.bytedance.sdk.component.lud.zb.sya.ycx.zb.ycx(new File(zbVar.xkz)) : com.bytedance.sdk.component.lud.zb.sya.ycx.zb.jw();
    }

    public int dj() {
        return this.f23995dv;
    }

    public String fby() {
        return this.sya;
    }

    public ImageView.ScaleType jw() {
        return this.f24001lt;
    }

    public dy lt() {
        return this.lud;
    }

    public int lud() {
        return this.oty;
    }

    @Override // com.bytedance.sdk.component.lud.jw
    public int sya() {
        return this.f24000jw;
    }

    public String ul() {
        return this.f23994dj;
    }

    public void zb(String str) {
        WeakReference<ImageView> weakReference = this.f24002ok;
        if (weakReference != null && weakReference.get() != null) {
            this.f24002ok.get().setTag(1094453505, str);
        }
        this.sya = str;
    }

    @Override // com.bytedance.sdk.component.lud.jw
    public int zb() {
        return this.fby;
    }

    @Override // com.bytedance.sdk.component.lud.jw
    public String ycx() {
        return this.f24007zb;
    }

    public void ycx(String str) {
        this.f23994dj = str;
    }

    public void ycx(boolean z11) {
        this.f24005uh = z11;
    }

    public void ycx(byte[] bArr) {
        this.f23993av = bArr;
    }

    public void ycx(int i5) {
        this.thx = i5;
    }
}
