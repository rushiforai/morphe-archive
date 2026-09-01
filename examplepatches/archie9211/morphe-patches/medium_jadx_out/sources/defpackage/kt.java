package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kt implements bi7 {
    public final /* synthetic */ int a;

    public kt(fa4 fa4Var) {
        this.a = 2;
    }

    public String a(sw5 sw5Var, ew8 ew8Var) {
        sw5Var.getClass();
        cfc cfcVar = ew8Var.b;
        xe3 xe3Var = cfcVar.a;
        xe3 xe3Var2 = cfcVar.b;
        int i = xe3Var instanceof ue3 ? ((ue3) xe3Var).a : 0;
        int i2 = xe3Var2 instanceof ue3 ? ((ue3) xe3Var2).a : 0;
        if (i == 0 && i2 == 0) {
            String id = sw5Var.getId();
            id.getClass();
            if (!muc.b0(id)) {
                return "https://cdn-images-1.medium.com/".concat(id);
            }
            ygf.f("Tried to fetch image with no imageId");
            return null;
        }
        int i3 = tw5.a[ew8Var.c.ordinal()];
        if (i3 != 1) {
            if (i3 != 2) {
                ygf.a();
                return null;
            }
            String id2 = sw5Var.getId();
            if (id2 == null || muc.b0(id2)) {
                ygf.f("Tried to fetch image with no imageId");
                return null;
            }
            StringBuilder sbB = ev6.B(i, i2, "https://cdn-images-1.medium.com/v2/resize:fit:", ":", "/format:webp/");
            sbB.append(id2);
            return sbB.toString();
        }
        String id3 = sw5Var.getId();
        Double focusPercentX = sw5Var.getFocusPercentX();
        Double dValueOf = focusPercentX != null ? Double.valueOf(focusPercentX.doubleValue() / 100.0d) : null;
        Double focusPercentY = sw5Var.getFocusPercentY();
        Double dValueOf2 = focusPercentY != null ? Double.valueOf(focusPercentY.doubleValue() / 100.0d) : null;
        if (id3 == null || muc.b0(id3)) {
            ygf.f("Tried to fetch image with no imageId");
            return null;
        }
        if (dValueOf == null || dValueOf2 == null) {
            StringBuilder sbB2 = ev6.B(i, i2, "https://cdn-images-1.medium.com/v2/resize:fill:", ":", "/format:webp/");
            sbB2.append(id3);
            return sbB2.toString();
        }
        StringBuilder sbB3 = ev6.B(i, i2, "https://cdn-images-1.medium.com/v2/resize:fill:", ":", "/gravity:fp:");
        sbB3.append(dValueOf);
        sbB3.append(":");
        sbB3.append(dValueOf2);
        sbB3.append("/format:webp/");
        sbB3.append(id3);
        return sbB3.toString();
    }

    @Override // defpackage.bi7
    public final Object map(Object obj, ew8 ew8Var) {
        switch (this.a) {
            case 0:
                return gq7.W(((Uri) obj).toString());
            case 1:
                return gq7.d(((File) obj).getPath());
            case 2:
                return a((sw5) obj, ew8Var);
            case 3:
                return gq7.d(((g59) obj).a.t());
            case 4:
                int iIntValue = ((Number) obj).intValue();
                Context context = ew8Var.a;
                try {
                    if (context.getResources().getResourceEntryName(iIntValue) != null) {
                        return gq7.W("android.resource://" + context.getPackageName() + '/' + iIntValue);
                    }
                } catch (Resources.NotFoundException unused) {
                }
                return null;
            default:
                return gq7.W((String) obj);
        }
    }

    public /* synthetic */ kt(int i) {
        this.a = i;
    }
}
