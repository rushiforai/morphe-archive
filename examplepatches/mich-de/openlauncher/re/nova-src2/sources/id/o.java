package id;

import ads_mobile_sdk.vo1;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.view.View;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.publisher.AdLoad;
import com.moloco.sdk.publisher.MediationInfo;
import com.moloco.sdk.publisher.Moloco;
import com.moloco.sdk.publisher.MolocoAd;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.NativeAd;
import eg.x;
import java.util.Iterator;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class o extends x implements AdLoad.Listener {
    public final String n;
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final String f61545p;

    /* renamed from: q, reason: collision with root package name */
    public final eg.f f61546q;

    /* renamed from: r, reason: collision with root package name */
    public NativeAd f61547r;

    public o(eg.f fVar, String str, String str2, String str3) {
        this.n = str;
        this.o = str2;
        this.f61545p = str3;
        this.f61546q = fVar;
    }

    @Override // eg.x
    public final void a() {
        NativeAd nativeAd = this.f61547r;
        if (nativeAd != null) {
            nativeAd.destroy();
        }
        this.f61547r = null;
    }

    @Override // eg.x
    public final void b(View view) {
        NativeAd nativeAd = this.f61547r;
        if (nativeAd != null) {
            nativeAd.handleGeneralAdClick();
        }
    }

    @Override // eg.x
    public final void c() {
        NativeAd nativeAd = this.f61547r;
        if (nativeAd != null) {
            nativeAd.handleImpression();
        }
    }

    @Override // eg.x
    public final void d(ni.o oVar, Map map) {
        final int i5 = 0;
        oVar.setOnClickListener(new View.OnClickListener(this) { // from class: id.j

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ o f61539b;

            {
                this.f61539b = this;
            }

            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                switch (i5) {
                    case 0:
                        NativeAd nativeAd = this.f61539b.f61547r;
                        if (nativeAd != null) {
                            nativeAd.handleGeneralAdClick();
                            break;
                        }
                        break;
                    default:
                        NativeAd nativeAd2 = this.f61539b.f61547r;
                        if (nativeAd2 != null) {
                            nativeAd2.handleGeneralAdClick();
                            break;
                        }
                        break;
                }
            }
        });
        Iterator it = map.values().iterator();
        while (it.hasNext()) {
            final int i11 = 1;
            ((View) it.next()).setOnClickListener(new View.OnClickListener(this) { // from class: id.j

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ o f61539b;

                {
                    this.f61539b = this;
                }

                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    switch (i11) {
                        case 0:
                            NativeAd nativeAd = this.f61539b.f61547r;
                            if (nativeAd != null) {
                                nativeAd.handleGeneralAdClick();
                                break;
                            }
                            break;
                        default:
                            NativeAd nativeAd2 = this.f61539b.f61547r;
                            if (nativeAd2 != null) {
                                nativeAd2.handleGeneralAdClick();
                                break;
                            }
                            break;
                    }
                }
            });
        }
    }

    public final void f() {
        Moloco.createNativeAd(new MediationInfo(MolocoMediationAdapter.MEDIATION_PLATFORM_NAME), this.n, this.f61545p, new m(this));
    }

    @Override // com.moloco.sdk.publisher.AdLoad.Listener
    public final void onAdLoadFailed(MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        this.f61546q.onFailure(new bg.a(molocoAdError.getErrorType().getErrorCode(), molocoAdError.getErrorType().getDescription(), "com.moloco.sdk"));
    }

    @Override // com.moloco.sdk.publisher.AdLoad.Listener
    public final void onAdLoadSuccess(MolocoAd molocoAd) {
        NativeAd.Assets assets;
        Drawable drawableCreateFromPath;
        Intrinsics.g(molocoAd, "molocoAd");
        this.f52759l = true;
        NativeAd nativeAd = this.f61547r;
        if (nativeAd != null && (assets = nativeAd.getAssets()) != null) {
            assets.getRating();
            String sponsorText = assets.getSponsorText();
            if (sponsorText != null) {
                this.f52753f = sponsorText;
            }
            this.f52754g = "Google Play";
            String title = assets.getTitle();
            if (title != null) {
                this.f52748a = title;
            }
            String description = assets.getDescription();
            if (description != null) {
                this.f52750c = description;
            }
            String callToActionText = assets.getCallToActionText();
            if (callToActionText != null) {
                this.f52752e = callToActionText;
            }
            Uri iconUri = assets.getIconUri();
            if (iconUri != null && (drawableCreateFromPath = Drawable.createFromPath(iconUri.toString())) != null) {
                this.f52751d = new l(drawableCreateFromPath);
            }
            View mediaView = assets.getMediaView();
            if (mediaView != null) {
                mediaView.setTag("native_ad_media_view");
                this.f52756i = mediaView;
            }
        }
        vo1 vo1Var = (vo1) this.f61546q.onSuccess(this);
        NativeAd nativeAd2 = this.f61547r;
        if (nativeAd2 == null) {
            return;
        }
        nativeAd2.setInteractionListener(new n(vo1Var));
    }
}
