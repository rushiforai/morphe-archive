package com.bytedance.sdk.openadsdk.core.syc.zb;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Message;
import android.text.TextUtils;
import android.view.SurfaceHolder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.c;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAd;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.sya.ycx;
import com.bytedance.sdk.openadsdk.core.sya.zb;
import com.bytedance.sdk.openadsdk.core.syc.zb.lt;
import com.bytedance.sdk.openadsdk.core.widget.htf;
import com.bytedance.sdk.openadsdk.core.widget.thx;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.ea;
import com.bytedance.sdk.openadsdk.utils.wie;
import java.lang.ref.WeakReference;
import ob.g;
import org.jetbrains.annotations.Nullable;
import pb.a;
import pb.b;
import pb.d;
import pb.e;
import pb.f;

/* loaded from: classes2.dex */
public class lud implements g, e, tru.ycx, ycx.InterfaceC0083ycx, htf.ycx, thx.zb {
    boolean aeu;

    /* renamed from: av, reason: collision with root package name */
    com.bytedance.sdk.openadsdk.core.sya.ycx f26256av;
    ob.e bhi;

    /* renamed from: dj, reason: collision with root package name */
    f f26257dj;

    /* renamed from: dv, reason: collision with root package name */
    thx f26258dv;

    /* renamed from: dy, reason: collision with root package name */
    int f26259dy;

    /* renamed from: ea, reason: collision with root package name */
    ImageView f26260ea;
    ImageView fby;

    /* renamed from: hf, reason: collision with root package name */
    boolean f26261hf;
    int htf;

    /* renamed from: jc, reason: collision with root package name */
    View f26262jc;

    /* renamed from: jw, reason: collision with root package name */
    View f26263jw;
    private final String kgy;

    /* renamed from: lt, reason: collision with root package name */
    View f26264lt;
    ImageView lud;

    /* renamed from: ok, reason: collision with root package name */
    View f26265ok;
    ycx oty;
    boolean pmi;
    com.bytedance.sdk.openadsdk.core.sya.ycx rmf;
    private long rmy;

    /* renamed from: ry, reason: collision with root package name */
    TextView f26266ry;
    ViewGroup sya;
    int syc;
    int thx;

    /* renamed from: tn, reason: collision with root package name */
    Context f26267tn;
    com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya tru;

    /* renamed from: uh, reason: collision with root package name */
    boolean f26268uh;

    /* renamed from: ul, reason: collision with root package name */
    View f26269ul;
    int wie;
    tn wwx;
    int xkz;

    /* renamed from: xz, reason: collision with root package name */
    private lt.ycx f26270xz;
    protected final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected final int f26271zb;

    public lud(Context context, ViewGroup viewGroup, boolean z11, int i5, tn tnVar, ob.e eVar, boolean z12) {
        this.ycx = 228;
        this.f26271zb = 160;
        this.pmi = true;
        this.f26261hf = true;
        this.aeu = true;
        this.kgy = Build.MODEL;
        if (this instanceof dj) {
            return;
        }
        this.f26267tn = pmi.ycx().getApplicationContext();
        dj(z12);
        this.sya = viewGroup;
        this.pmi = z11;
        this.thx = i5;
        this.bhi = eVar;
        this.wwx = tnVar;
        dj(8);
        ycx(context, this.sya);
        dj();
        ok();
    }

    private boolean oty() {
        return tn.lud(this.wwx) && (!com.bytedance.sdk.openadsdk.core.ry.lt.ycx(this.wwx.tx()) ? this.wwx.jp() == null : this.wwx.nc() == null) && this.wwx.xf() == 1;
    }

    public void dj() {
        this.f26257dj.a(this);
        this.lud.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.core.syc.zb.lud.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (lud.this.dy()) {
                    TextView textView = lud.this.f26266ry;
                    if (textView == null || textView.getVisibility() != 0) {
                        lud ludVar = lud.this;
                        ludVar.oty.ycx(ludVar, view);
                    }
                }
            }
        });
    }

    public boolean dv() {
        return (this.thx & 4) != 4 || this.pmi;
    }

    public boolean dy() {
        return this.oty != null;
    }

    public void ea() {
        ycx(true, false);
    }

    public void fby() {
        dc.lud(this.f26264lt);
    }

    @Override // com.bytedance.sdk.openadsdk.core.sya.ycx.InterfaceC0083ycx
    public long getVideoProgress() {
        if (this.rmy <= 0) {
            tn tnVar = this.wwx;
            if (tnVar != null && tnVar.ci() != null) {
                this.rmy = (long) (this.wwx.ci().f22186d * 1000.0d);
            }
            ob.e eVar = this.bhi;
            if (eVar != null) {
                this.rmy = eVar.jw();
            }
        }
        return this.rmy;
    }

    public void htf() {
        ImageView imageView = this.f26260ea;
        if (imageView != null) {
            imageView.setImageBitmap(null);
        }
    }

    public boolean jc() {
        return false;
    }

    public void jw() {
        dj(8);
        if (dv()) {
            this.f26257dj.setVisibility(8);
        }
        ImageView imageView = this.fby;
        if (imageView != null) {
            imageView.setImageDrawable(null);
        }
        dj(8);
        dc.ycx(this.f26262jc, 8);
        dc.ycx((View) this.f26260ea, 8);
        dc.ycx(this.f26265ok, 8);
        thx thxVar = this.f26258dv;
        if (thxVar != null) {
            thxVar.ycx(true);
        }
    }

    public void lt() {
    }

    public void lud() {
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00cd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ok() {
        String str;
        int i5;
        String str2;
        int i11;
        com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya syaVar;
        com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar;
        String str3 = this.f26261hf ? "embeded_ad" : "embeded_ad_landingpage";
        if (this.wwx.um()) {
            str2 = "rewarded_video";
            i11 = 7;
        } else if (this.wwx.cfr()) {
            str2 = "fullscreen_interstitial_ad";
            i11 = 5;
        } else {
            if (!this.wwx.bp()) {
                str = str3;
                i5 = 1;
                if (this.wwx.liq() == 4) {
                    this.tru = com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(this.f26267tn, str);
                }
                com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar2 = new com.bytedance.sdk.openadsdk.core.sya.ycx(this.f26267tn, this.wwx, str, i5);
                this.f26256av = ycxVar2;
                ycxVar2.ycx(this);
                this.f26256av.sya(true);
                if (this.f26261hf) {
                    this.f26256av.ycx(false);
                    this.f26256av.dj(true);
                } else {
                    this.f26256av.ycx(true);
                }
                this.f26256av.ycx(this.bhi);
                this.f26256av.lt(true);
                this.f26256av.ycx(new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.syc.zb.lud.1
                    @Override // com.bytedance.sdk.openadsdk.core.sya.zb.ycx
                    public void ycx(View view, int i12) {
                        if (lud.this.f26270xz != null) {
                            lud.this.f26270xz.ycx(view, i12);
                        }
                    }
                });
                syaVar = this.tru;
                if (syaVar != null && (ycxVar = this.f26256av) != null) {
                    ycxVar.ycx(syaVar);
                }
                if (oty()) {
                    return;
                }
                com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar3 = new com.bytedance.sdk.openadsdk.core.sya.ycx(this.f26267tn, this.wwx, str, i5) { // from class: com.bytedance.sdk.openadsdk.core.syc.zb.lud.2
                    @Override // com.bytedance.sdk.openadsdk.core.sya.ycx
                    public boolean sya() {
                        View view = lud.this.f26262jc;
                        if (view != null && view.getVisibility() == 0) {
                            return true;
                        }
                        View view2 = lud.this.f26265ok;
                        return view2 != null && view2.getVisibility() == 0;
                    }

                    @Override // com.bytedance.sdk.openadsdk.core.sya.ycx
                    public boolean zb() {
                        thx thxVar = lud.this.f26258dv;
                        boolean zYcx = thxVar != null ? thxVar.ycx() : false;
                        lud.this.lud.getVisibility();
                        return zYcx || lud.this.lud.getVisibility() == 0;
                    }
                };
                this.rmf = ycxVar3;
                ycxVar3.ycx(new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.syc.zb.lud.3
                    @Override // com.bytedance.sdk.openadsdk.core.sya.zb.ycx
                    public void ycx(View view, int i12) {
                        if (lud.this.f26270xz != null) {
                            lud.this.f26270xz.ycx(view, i12);
                        }
                    }
                });
                this.rmf.sya(true);
                this.rmf.ycx(this.f26261hf);
                this.rmf.ycx(this.bhi);
                this.rmf.lt(true);
                com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya syaVar2 = this.tru;
                if (syaVar2 != null) {
                    this.rmf.ycx(syaVar2);
                }
                this.rmf.ycx(this);
                return;
            }
            str2 = "banner_ad";
            i11 = 2;
        }
        str = str2;
        i5 = i11;
        if (this.wwx.liq() == 4) {
        }
        com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar22 = new com.bytedance.sdk.openadsdk.core.sya.ycx(this.f26267tn, this.wwx, str, i5);
        this.f26256av = ycxVar22;
        ycxVar22.ycx(this);
        this.f26256av.sya(true);
        if (this.f26261hf) {
        }
        this.f26256av.ycx(this.bhi);
        this.f26256av.lt(true);
        this.f26256av.ycx(new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.syc.zb.lud.1
            @Override // com.bytedance.sdk.openadsdk.core.sya.zb.ycx
            public void ycx(View view, int i12) {
                if (lud.this.f26270xz != null) {
                    lud.this.f26270xz.ycx(view, i12);
                }
            }
        });
        syaVar = this.tru;
        if (syaVar != null) {
            ycxVar.ycx(syaVar);
        }
        if (oty()) {
        }
    }

    @TargetApi(14)
    public void pmi() {
        dc.ycx((View) this.sya, 0);
        f fVar = this.f26257dj;
        if (fVar != null) {
            dc.ycx(fVar.c(), 0);
        }
    }

    public f ry() {
        return this.f26257dj;
    }

    public void sya(boolean z11) {
    }

    public void syc() {
        thx thxVar = this.f26258dv;
        if (thxVar != null) {
            thxVar.ycx(false);
        }
    }

    public boolean thx() {
        return this.pmi;
    }

    @Override // com.bytedance.sdk.openadsdk.core.widget.htf.ycx
    public boolean tn() {
        thx thxVar = this.f26258dv;
        return thxVar != null && thxVar.ycx();
    }

    public void uh() {
        try {
            dc.ycx(this.f26262jc, 8);
            dc.ycx((View) this.f26260ea, 8);
            dc.ycx(this.f26265ok, 8);
            dc.ycx((View) this.f26266ry, 8);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CSRBrMnyYFe3kuJB6ksXuE=", "de85nBW5X86ET9hxjQivPU8=", "X+c+hg61etShTvRSmhSy", 585);
        }
    }

    public void ul() {
        tn tnVar;
        dc.lt(this.f26264lt);
        dc.lt(this.f26269ul);
        if (this.fby != null && (tnVar = this.wwx) != null && tnVar.ci() != null && this.wwx.ci().f22188f != null) {
            dc.lt(this.fby);
            com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(this.wwx.ci().f22188f, this.wwx.ci().f22184b, this.wwx.ci().f22183a, this.fby, this.wwx);
        }
        if (this.lud.getVisibility() == 0) {
            dc.ycx((View) this.lud, 8);
        }
    }

    public void wie() {
        dc.lt(this.f26264lt);
        dc.lt(this.f26269ul);
        if (this.lud.getVisibility() == 0) {
            dc.ycx((View) this.lud, 8);
        }
    }

    public boolean wwx() {
        return this.f26268uh;
    }

    public void xkz() {
        if (this.oty == null || this.f26258dv != null) {
            return;
        }
        thx thxVar = new thx();
        this.f26258dv = thxVar;
        thxVar.ycx(this.f26267tn, this.sya);
        this.f26258dv.ycx(this.oty, this);
    }

    public void ycx(int i5) {
    }

    public void zb(@Nullable ViewGroup viewGroup) {
    }

    private void lt(int i5) {
        dc.ycx(this.f26265ok, i5);
    }

    private int lud(int i5) {
        if (this.f26259dy <= 0 || this.wie <= 0) {
            return 0;
        }
        int iZb = dc.zb(this.f26267tn, 228.0f);
        int iZb2 = dc.zb(this.f26267tn, 160.0f);
        int i11 = (int) (this.wie * ((i5 * 1.0f) / this.f26259dy));
        return i11 > iZb ? iZb : i11 < iZb2 ? iZb2 : i11;
    }

    public void sya(int i5) {
        dc.ycx((View) this.sya, 0);
        f fVar = this.f26257dj;
        if (fVar != null) {
            fVar.setVisibility(i5);
        }
    }

    public void ycx(long j11) {
    }

    public void zb(boolean z11) {
    }

    public void dj(boolean z11) {
        this.f26261hf = z11;
        if (z11) {
            com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar = this.f26256av;
            if (ycxVar != null) {
                ycxVar.ycx(true);
            }
            com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar2 = this.rmf;
            if (ycxVar2 != null) {
                ycxVar2.ycx(true);
                return;
            }
            return;
        }
        com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar3 = this.f26256av;
        if (ycxVar3 != null) {
            ycxVar3.ycx(false);
        }
        com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar4 = this.rmf;
        if (ycxVar4 != null) {
            ycxVar4.ycx(false);
        }
    }

    public void ycx(long j11, long j12) {
    }

    public boolean zb(int i5) {
        return false;
    }

    public void ycx(Message message) {
    }

    public void zb(boolean z11, boolean z12) {
        ImageView imageView = this.lud;
        if (imageView != null) {
            if (z11) {
                imageView.setImageDrawable(ea.ycx(this.f26267tn, "tt_play_movebar_textpage"));
            } else {
                imageView.setImageDrawable(ea.ycx(this.f26267tn, "tt_stop_movebar_textpage"));
            }
        }
    }

    public void sya(int i5, int i11) {
        this.f26259dy = i5;
        this.wie = i11;
    }

    public void ycx(View view, boolean z11) {
    }

    public void ycx(@Nullable ViewGroup viewGroup) {
    }

    public void sya(@Nullable ViewGroup viewGroup) {
        if (viewGroup == null) {
            return;
        }
        if (this.sya.getParent() == null) {
            viewGroup.addView(this.sya);
        }
        dj(0);
    }

    public void ycx(String str) {
    }

    public void zb(int i5, int i11) {
        ViewGroup.LayoutParams layoutParams = this.sya.getLayoutParams();
        if (layoutParams == null) {
            return;
        }
        if (i5 == -1 || i5 == -2 || i5 > 0) {
            layoutParams.width = i5;
        }
        if (i11 == -1 || i11 == -2 || i11 > 0) {
            layoutParams.height = i11;
        }
        this.sya.setLayoutParams(layoutParams);
    }

    @Override // ob.g
    @SuppressLint({"ClickableViewAccessibility"})
    public /* bridge */ /* synthetic */ void ycx(Object obj, WeakReference weakReference, boolean z11) {
        ycx((tn) obj, (WeakReference<Context>) weakReference, z11);
    }

    @Override // ob.g
    public View sya() {
        return this.sya;
    }

    public void ycx(lt.ycx ycxVar) {
        this.f26270xz = ycxVar;
    }

    public void ycx(PAGNativeAd pAGNativeAd) {
        com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar = this.f26256av;
        if (ycxVar != null) {
            ycxVar.ycx(pAGNativeAd);
        }
        com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar2 = this.rmf;
        if (ycxVar2 != null) {
            ycxVar2.ycx(pAGNativeAd);
        }
    }

    @Override // ob.g
    public void zb() {
        dc.lud(this.f26264lt);
        dc.lud(this.f26269ul);
        ImageView imageView = this.fby;
        if (imageView != null) {
            dc.lud(imageView);
        }
    }

    public void dj(int i5) {
        this.htf = i5;
        dc.ycx((View) this.sya, i5);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v19, types: [android.view.TextureView] */
    public void ycx(Context context, View view) {
        d aVar;
        tn tnVar = this.wwx;
        if ((tnVar == null || ((!tnVar.iqv() && !this.wwx.bp()) || com.bytedance.sdk.openadsdk.core.settings.ea.zb().jp())) && view != null) {
            view.setKeepScreenOn(true);
        }
        ob.e eVar = this.bhi;
        if (eVar != null && eVar.syc()) {
            aVar = new a(this.f26267tn, null);
        } else {
            d dVar = new d(this.f26267tn);
            b bVar = new b(dVar);
            dVar.f82494b = bVar;
            d.f82492c.add(bVar);
            aVar = dVar;
        }
        if (view instanceof RelativeLayout) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(13);
            ((RelativeLayout) view).addView(aVar, 0, layoutParams);
        }
        dc.ycx((View) aVar, 8);
        this.f26257dj = aVar;
        this.lud = (ImageView) view.findViewById(wie.bah);
        this.f26264lt = view.findViewById(wie.f27214nq);
        this.f26269ul = view.findViewById(wie.xh);
        this.fby = (ImageView) view.findViewById(wie.spv);
        this.f26263jw = view.findViewById(wie.pyn);
    }

    @Override // pb.e
    public void zb(SurfaceHolder surfaceHolder) {
        if (surfaceHolder != this.f26257dj.getHolder()) {
            return;
        }
        this.f26268uh = false;
        if (dy()) {
            this.oty.zb(this, surfaceHolder);
        }
    }

    @Override // pb.e
    public void zb(SurfaceTexture surfaceTexture) {
        ob.e eVar = this.bhi;
        if (eVar != null) {
            eVar.ycx(surfaceTexture);
        }
    }

    public lud(Context context, ViewGroup viewGroup, boolean z11, int i5, tn tnVar, ob.e eVar) {
        this(context, viewGroup, z11, i5, tnVar, eVar, true);
    }

    public void ycx(View view, Context context) {
        View view2;
        if (view == null || context == null || (view2 = this.f26263jw) == null || view2.getParent() == null || this.f26262jc != null) {
            return;
        }
        this.f26262jc = this.f26263jw;
        this.f26260ea = (ImageView) view.findViewById(wie.hfd);
        this.f26265ok = view.findViewById(wie.skm);
        this.f26266ry = (TextView) view.findViewById(wie.xym);
    }

    public boolean ycx(int i5, c cVar, boolean z11) {
        thx thxVar = this.f26258dv;
        return thxVar == null || thxVar.ycx(i5, cVar, z11);
    }

    public void ycx(ob.f fVar) {
        if (fVar instanceof ycx) {
            this.oty = (ycx) fVar;
            xkz();
        }
    }

    public void ycx(int i5, int i11) {
        if (i5 == -1) {
            i5 = dc.dj(this.f26267tn);
        }
        if (i5 <= 0) {
            return;
        }
        this.xkz = i5;
        if (!thx() && !jc() && (this.thx & 8) != 8) {
            this.syc = lud(i5);
        } else {
            this.syc = i11;
        }
        zb(this.xkz, this.syc);
    }

    @Override // ob.g
    public void ycx() {
        ycx(false, this.pmi);
        uh();
    }

    @Override // ob.g
    public void ycx(boolean z11) {
        this.aeu = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00a0  */
    @SuppressLint({"ClickableViewAccessibility"})
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(tn tnVar, WeakReference<Context> weakReference, boolean z11) {
        tn tnVar2;
        tn tnVar3;
        if (tnVar == null) {
            return;
        }
        ycx(false, this.pmi);
        ycx(this.sya, pmi.ycx());
        View view = this.f26262jc;
        if (view != null) {
            dc.ycx(view, 0);
        }
        ImageView imageView = this.f26260ea;
        if (imageView != null) {
            dc.ycx((View) imageView, 0);
        }
        dc.ycx(this.f26265ok, 0);
        if (this.f26260ea == null || (tnVar3 = this.wwx) == null || tnVar3.ci() == null || this.wwx.ci().f22188f == null) {
            tnVar2 = tnVar;
        } else {
            tnVar2 = tnVar;
            com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(this.wwx.ci().f22188f, this.wwx.ci().f22184b, this.wwx.ci().f22183a, this.f26260ea, tnVar2);
        }
        dc.ycx((View) this.f26266ry, 0);
        String strBah = tnVar2.bah();
        if (TextUtils.isEmpty(strBah)) {
            int iLiq = tnVar2.liq();
            if (iLiq == 2 || iLiq == 3) {
                strBah = wwx.ycx(this.f26267tn, "tt_video_mobile_go_detail");
            } else if (iLiq == 4) {
                strBah = wwx.ycx(this.f26267tn, "tt_video_download_apk");
            } else if (iLiq == 5) {
                strBah = wwx.ycx(this.f26267tn, "tt_video_dial_phone");
            } else if (iLiq != 8) {
                strBah = wwx.ycx(this.f26267tn, "tt_video_mobile_go_detail");
            }
        }
        TextView textView = this.f26266ry;
        if (textView != null) {
            textView.setText(strBah);
            this.f26266ry.setOnClickListener(this.f26256av);
            this.f26266ry.setOnTouchListener(this.f26256av);
        }
        if (this.aeu) {
            return;
        }
        lt(4);
    }

    @Override // pb.e
    public void ycx(SurfaceHolder surfaceHolder) {
        if (surfaceHolder != this.f26257dj.getHolder()) {
            return;
        }
        this.f26268uh = true;
        if (dy()) {
            this.oty.ycx(this, surfaceHolder);
        }
    }

    @Override // pb.e
    public void ycx(SurfaceHolder surfaceHolder, int i5, int i11, int i12) {
        if (surfaceHolder != this.f26257dj.getHolder()) {
            return;
        }
        dy();
    }

    @Override // pb.e
    public void ycx(SurfaceTexture surfaceTexture, int i5, int i11) {
        this.f26268uh = true;
        if (dy()) {
            this.oty.ycx(this, surfaceTexture);
        }
    }

    @Override // pb.e
    public boolean ycx(SurfaceTexture surfaceTexture) {
        this.f26268uh = false;
        if (!dy()) {
            return true;
        }
        this.oty.zb(this, surfaceTexture);
        return true;
    }

    public void ycx(boolean z11, boolean z12, boolean z13) {
        dc.ycx((View) this.lud, (!z11 || this.f26264lt.getVisibility() == 0) ? 8 : 0);
    }

    public void ycx(boolean z11, boolean z12) {
        dc.ycx((View) this.lud, 8);
    }

    @Override // ob.g
    public void ycx(Drawable drawable) {
        ViewGroup viewGroup = this.sya;
        if (viewGroup != null) {
            viewGroup.setBackgroundDrawable(drawable);
        }
    }
}
