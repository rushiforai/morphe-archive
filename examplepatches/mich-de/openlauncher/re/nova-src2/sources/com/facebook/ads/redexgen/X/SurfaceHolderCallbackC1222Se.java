package com.facebook.ads.redexgen.X;

import android.graphics.SurfaceTexture;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.TextureView;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Se, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class SurfaceHolderCallbackC1222Se implements YC, InterfaceC1170Qe, WE, TS, SurfaceHolder.Callback, TextureView.SurfaceTextureListener {
    public static String[] A01 = {"exxbpzcvIz96IPgBJXqt6pp5itorUF0v", b.f42142b, "vaPUn1aNMiZ346cWCU2pc8maO9eEgJtl", b.f42142b, "Zerdoj33HxDipZN8U41vAIMmtEo1dxqV", "Hd0EHkxqhfRSUHQCJm03k00NKThSKgEe", "Y3XMdSyeNt7JpS9ShLboIeCRpeyuEUYI", "8w3zvrsb6gjp4AAyphlBNpXR3J0KmDiy"};
    public final /* synthetic */ AnonymousClass93 A00;

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final /* synthetic */ void AE0(VC vc, OA oa2) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final /* synthetic */ void AE1(long j11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final /* synthetic */ void AE2(Exception exc) {
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final /* synthetic */ void AEV(int i5, long j11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final /* synthetic */ void AH5(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final /* synthetic */ void AHf(VC vc, OA oa2) {
    }

    public SurfaceHolderCallbackC1222Se(AnonymousClass93 anonymousClass93) {
        this.A00 = anonymousClass93;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final void ADw(String str, long j11, long j12) {
        Iterator it = this.A00.A0H.iterator();
        while (it.hasNext()) {
            ((InterfaceC1170Qe) it.next()).ADw(str, j11, j12);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final void ADx(O7 o72) {
        Iterator it = this.A00.A0H.iterator();
        while (it.hasNext()) {
            ((InterfaceC1170Qe) it.next()).ADx(o72);
        }
        this.A00.A07 = null;
        this.A00.A09 = null;
        this.A00.A01 = 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final void ADy(O7 o72) {
        this.A00.A09 = o72;
        Iterator it = this.A00.A0H.iterator();
        while (it.hasNext()) {
            ((InterfaceC1170Qe) it.next()).ADy(o72);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final void ADz(VC vc) {
        this.A00.A07 = vc;
        Iterator it = this.A00.A0H.iterator();
        while (it.hasNext()) {
            InterfaceC1170Qe interfaceC1170Qe = (InterfaceC1170Qe) it.next();
            if (A01[4].charAt(30) != 'q') {
                throw new RuntimeException();
            }
            A01[0] = "QeMGbFFoOT7FNJ57RKOwk9Jq4PSH3GCD";
            interfaceC1170Qe.ADz(vc);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1170Qe
    public final void AE5(int i5, long j11, long j12) {
        Iterator it = this.A00.A0H.iterator();
        while (it.hasNext()) {
            ((InterfaceC1170Qe) it.next()).AE5(i5, j11, j12);
        }
    }

    @Override // com.facebook.ads.redexgen.X.WE
    @MetaExoPlayerCustomization
    public final void AEa(C1249Tf c1249Tf) {
        Iterator it = this.A00.A0I.iterator();
        while (it.hasNext()) {
            ((LJ) it.next()).AEa(c1249Tf);
        }
    }

    @Override // com.facebook.ads.redexgen.X.WE
    @MetaExoPlayerCustomization
    public final void AEb(List<C1251Th> list) {
        Iterator it = this.A00.A0I.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            String[] strArr = A01;
            if (strArr[2].charAt(9) == strArr[5].charAt(9)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[3] = b.f42142b;
            strArr2[1] = b.f42142b;
            if (zHasNext) {
                ((LJ) it.next()).AEb(list);
            } else {
                return;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final void AEn(int i5, long j11) {
        Iterator it = this.A00.A0K.iterator();
        while (it.hasNext()) {
            ((YC) it.next()).AEn(i5, j11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.TS
    public final void AFx(Metadata metadata, long j11) {
        Iterator it = this.A00.A0J.iterator();
        while (it.hasNext()) {
            TS ts2 = (TS) it.next();
            if (A01[4].charAt(30) != 'q') {
                throw new RuntimeException();
            }
            A01[0] = "SvUpNKWuGEySYhNFFwIH5w5ikbhc16eE";
            ts2.AFx(metadata, j11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final void AGm(Object obj, long j11) {
        if (this.A00.A03 == obj) {
            Iterator it = this.A00.A0L.iterator();
            while (it.hasNext()) {
                it.next();
            }
        }
        Iterator it2 = this.A00.A0K.iterator();
        while (it2.hasNext()) {
            ((YC) it2.next()).AGm(obj, j11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final void AHX(String str, long j11, long j12) {
        Iterator it = this.A00.A0K.iterator();
        while (it.hasNext()) {
            ((YC) it.next()).AHX(str, j11, j12);
        }
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final void AHY(O7 o72) {
        Iterator it = this.A00.A0K.iterator();
        while (it.hasNext()) {
            ((YC) it.next()).AHY(o72);
        }
        this.A00.A08 = null;
        this.A00.A0A = null;
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final void AHZ(O7 o72) {
        this.A00.A0A = o72;
        Iterator it = this.A00.A0K.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            String[] strArr = A01;
            if (strArr[3].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            A01[0] = "FRbb1fiCbWCVoQ1qe3xdf1r3l5tYMl7U";
            if (zHasNext) {
                ((YC) it.next()).AHZ(o72);
            } else {
                return;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final void AHe(VC vc) {
        this.A00.A08 = vc;
        Iterator it = this.A00.A0K.iterator();
        while (it.hasNext()) {
            ((YC) it.next()).AHe(vc);
        }
    }

    @Override // com.facebook.ads.redexgen.X.YC
    public final void AHl(C1259Tp c1259Tp) {
        Iterator it = this.A00.A0L.iterator();
        while (it.hasNext()) {
            ((NA) it.next()).AHk(c1259Tp.A03, c1259Tp.A01, c1259Tp.A02, c1259Tp.A00);
        }
        Iterator it2 = this.A00.A0K.iterator();
        while (it2.hasNext()) {
            ((YC) it2.next()).AHl(c1259Tp);
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i5, int i11) {
        this.A00.A0F(new Surface(surfaceTexture), true);
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        this.A00.A0F(null, true);
        return true;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i5, int i11) {
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceChanged(SurfaceHolder surfaceHolder, int i5, int i11, int i12) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceCreated(SurfaceHolder surfaceHolder) {
        this.A00.A0F(surfaceHolder.getSurface(), false);
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        this.A00.A0F(null, false);
    }
}
