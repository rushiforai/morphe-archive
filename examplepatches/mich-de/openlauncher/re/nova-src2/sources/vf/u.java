package vf;

import android.graphics.drawable.Drawable;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import androidx.cardview.widget.CardView;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertPathBuilder;
import java.security.cert.CertPathBuilderException;
import java.security.cert.CertStore;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.PKIXBuilderParameters;
import java.security.cert.X509CertSelector;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import kotlin.jvm.internal.StringCompanionObject;

/* loaded from: classes3.dex */
public final class u implements we.q {
    public static final void f(ArrayList arrayList, List list) throws CertPathBuilderException, NoSuchAlgorithmException, IOException, KeyStoreException, CertificateException, InvalidAlgorithmParameterException {
        LinkedList linkedListR = p7.u.R(list);
        KeyStore keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
        keyStore.load(null, null);
        int i5 = 0;
        for (Object obj : arrayList) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            keyStore.setCertificateEntry(String.format(Locale.ROOT, "ca_%d", Arrays.copyOf(new Object[]{Integer.valueOf(i5)}, 1)), (Certificate) arrayList.get(i5));
            i5 = i11;
        }
        X509CertSelector x509CertSelector = new X509CertSelector();
        x509CertSelector.setCertificate((X509Certificate) linkedListR.get(0));
        PKIXBuilderParameters pKIXBuilderParameters = new PKIXBuilderParameters(keyStore, x509CertSelector);
        pKIXBuilderParameters.setRevocationEnabled(false);
        pKIXBuilderParameters.addCertStore(CertStore.getInstance("Collection", new CollectionCertStoreParameters(linkedListR)));
        CertPathBuilder.getInstance("PKIX").build(pKIXBuilderParameters);
    }

    @Override // we.q
    public MediaCodecInfo a(int i5) {
        return MediaCodecList.getCodecInfoAt(i5);
    }

    @Override // we.q
    public boolean b(String str, String str2, MediaCodecInfo.CodecCapabilities codecCapabilities) {
        return "secure-playback".equals(str) && "video/avc".equals(str2);
    }

    @Override // we.q
    public boolean c(String str, MediaCodecInfo.CodecCapabilities codecCapabilities) {
        return false;
    }

    @Override // we.q
    public int d() {
        return MediaCodecList.getCodecCount();
    }

    @Override // we.q
    public boolean e() {
        return false;
    }

    public int g(int i5) {
        return i5 == 7 ? 6 : 3;
    }

    public void h(og.i iVar, float f11) {
        y.a aVar = (y.a) ((Drawable) iVar.f80412b);
        CardView cardView = (CardView) iVar.f80413c;
        boolean z11 = cardView.f13852a;
        boolean z12 = cardView.f13853b;
        if (f11 != aVar.f96491e || aVar.f96492f != z11 || aVar.f96493g != z12) {
            aVar.f96491e = f11;
            aVar.f96492f = z11;
            aVar.f96493g = z12;
            aVar.b(null);
            aVar.invalidateSelf();
        }
        if (!cardView.f13852a) {
            iVar.r(0, 0, 0, 0);
            return;
        }
        y.a aVar2 = (y.a) ((Drawable) iVar.f80412b);
        float f12 = aVar2.f96491e;
        float f13 = aVar2.f96487a;
        int iCeil = (int) Math.ceil(y.b.a(f12, f13, cardView.f13853b));
        int iCeil2 = (int) Math.ceil(y.b.b(f12, f13, cardView.f13853b));
        iVar.r(iCeil, iCeil2, iCeil, iCeil2);
    }
}
