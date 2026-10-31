package com.bytedance.adsdk.ugeno.jc.ycx;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.fby.dj;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.fby.ycx;
import com.bytedance.adsdk.ugeno.jc.lt.zb;
import com.bytedance.adsdk.ugeno.lt;
import com.bytedance.adsdk.ugeno.zb;
import com.bytedance.adsdk.ugeno.zb.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class ycx extends zb {

    /* renamed from: ci, reason: collision with root package name */
    private String f22345ci;
    private int liq;

    /* renamed from: nc, reason: collision with root package name */
    private String f22346nc;

    /* renamed from: pg, reason: collision with root package name */
    private String f22347pg;

    /* renamed from: sp, reason: collision with root package name */
    private int f22348sp;
    private ycx.C0015ycx tpg;
    private String vbt;
    private boolean vy;

    /* renamed from: yw, reason: collision with root package name */
    private boolean f22349yw;

    public ycx(Context context) {
        super(context);
        this.vbt = "row";
    }

    private void dj() {
        if (TextUtils.isEmpty(this.f22346nc)) {
            return;
        }
        ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setCompoundDrawables(null, null, null, null);
        if (!this.f22346nc.startsWith("local://")) {
            lt.ycx().zb().ycx(this.f22665jw, this.f22346nc, new zb.ycx() { // from class: com.bytedance.adsdk.ugeno.jc.ycx.ycx.1
                @Override // com.bytedance.adsdk.ugeno.zb.ycx
                public void ycx(final Bitmap bitmap) {
                    if (bitmap == null) {
                        return;
                    }
                    fby.ycx(new Runnable() { // from class: com.bytedance.adsdk.ugeno.jc.ycx.ycx.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            ycx.this.zb(new BitmapDrawable(((sya) ycx.this).f22701zb.getResources(), bitmap));
                        }
                    });
                }
            });
        } else {
            try {
                ry(this.f22346nc.replace("local://", b.f42142b));
            } catch (Throwable unused) {
            }
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void dc() {
        super.dc();
        if (this.vy) {
            ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setTextColor(this.liq);
        }
        if (this.f22349yw) {
            if (this.row) {
                ycx(this.tpg);
            } else {
                dj(this.f22348sp);
            }
        }
    }

    public void ry(String str) {
        Context context = this.f22701zb;
        zb(fby.ycx(context, dj.zb(context, str)));
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void sz() {
        super.sz();
        if (this.vy) {
            ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setTextColor(((com.bytedance.adsdk.ugeno.jc.lt.zb) this).f22332qt);
        }
        if (this.f22349yw) {
            if (this.row) {
                ycx(this.f22664jp);
            } else {
                dj(this.yzp);
            }
        }
    }

    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        dj();
        ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setGravity(17);
    }

    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb, com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "direction":
                this.vbt = str2;
                break;
            case "highlightTextColor":
            case "highlightedTextColor":
                this.liq = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                this.vy = true;
                break;
            case "image":
                this.f22346nc = str2;
                break;
            case "highlightImage":
                this.f22347pg = str2;
                break;
            case "highlightBackgroundColor":
                if (com.bytedance.adsdk.ugeno.fby.ycx.sya(str2)) {
                    this.row = true;
                    this.tpg = com.bytedance.adsdk.ugeno.fby.ycx.zb(str2);
                } else {
                    this.f22348sp = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                    this.row = false;
                }
                this.f22349yw = true;
                break;
            case "highlightBackgroundImage":
                this.f22345ci = str2;
                break;
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    public void zb(Drawable drawable) {
        if (drawable == null) {
            return;
        }
        String str = this.vbt;
        switch (str.hashCode()) {
            case -1781065991:
                if (str.equals("column_reverse")) {
                    ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, (Drawable) null, drawable);
                    return;
                }
                break;
            case -1354837162:
                if (str.equals("column")) {
                    ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setCompoundDrawablesWithIntrinsicBounds((Drawable) null, drawable, (Drawable) null, (Drawable) null);
                    return;
                }
                break;
            case -207799939:
                if (str.equals("row_reverse")) {
                    ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, drawable, (Drawable) null);
                    return;
                }
                break;
            case 113114:
                str.equals("row");
                break;
        }
        ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setCompoundDrawablesWithIntrinsicBounds(drawable, (Drawable) null, (Drawable) null, (Drawable) null);
    }
}
