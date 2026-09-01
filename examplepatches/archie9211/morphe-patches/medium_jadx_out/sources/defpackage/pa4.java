package defpackage;

import android.app.PendingIntent;
import android.view.View;
import android.widget.ImageView;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.publicationadmin.ui.featurepost.FeaturePostBottomSheetFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pa4 implements View.OnClickListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ pa4(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws PendingIntent.CanceledException {
        xx5 xx5Var;
        o33 o33Var;
        Object objA;
        switch (this.a) {
            case 0:
                FeaturePostBottomSheetFragment featurePostBottomSheetFragment = (FeaturePostBottomSheetFragment) this.b;
                m15 m15Var = (m15) this.c;
                String str = (String) this.d;
                SourceParameter sourceParameter = (SourceParameter) this.e;
                p13 p13Var = featurePostBottomSheetFragment.H0;
                if (p13Var != null) {
                    p13Var.h(m15Var, str, gp7.u(sourceParameter));
                    return;
                } else {
                    g76.g0("router");
                    throw null;
                }
            case 1:
                FeaturePostBottomSheetFragment featurePostBottomSheetFragment2 = (FeaturePostBottomSheetFragment) this.b;
                m15 m15Var2 = (m15) this.c;
                String str2 = (String) this.d;
                SourceParameter sourceParameter2 = (SourceParameter) this.e;
                p13 p13Var2 = featurePostBottomSheetFragment2.H0;
                if (p13Var2 != null) {
                    p13Var2.h(m15Var2, str2, gp7.u(sourceParameter2));
                    return;
                } else {
                    g76.g0("router");
                    throw null;
                }
            default:
                ImageView imageView = (ImageView) this.b;
                v19 v19Var = (v19) this.c;
                l09 l09Var = (l09) this.d;
                ImageMetadataData imageMetadataData = (ImageMetadataData) this.e;
                imageView.setTransitionName(imageView.getContext().getString(R.string.transition_name_image_carousel));
                wve wveVarT = yo7.t(imageView);
                synchronized (wveVarT) {
                    mv2 mv2Var = wveVarT.a;
                    if (mv2Var == null || (o33Var = (o33) mv2Var.a) == null) {
                        xx5Var = null;
                    } else {
                        try {
                            objA = o33Var.A();
                        } catch (Throwable unused) {
                            objA = null;
                        }
                        xx5Var = (xx5) objA;
                    }
                    break;
                }
                w0d w0dVar = xx5Var instanceof w0d ? (w0d) xx5Var : null;
                cx7 cx7Var = w0dVar != null ? w0dVar.d : null;
                w19 w19Var = v19Var.c;
                String str3 = l09Var.f;
                if (str3 != null) {
                    w19Var.r(str3, v19Var.b, imageMetadataData.getId(), imageMetadataData.getOriginalWidth(), imageMetadataData.getOriginalHeight(), imageMetadataData.getAlt(), imageView, cx7Var);
                    return;
                } else {
                    ay0.e("Required value was null.");
                    return;
                }
        }
    }
}
