package defpackage;

import com.medium.android.graphql.fragment.ImageMetadataData;
import gen.model.ImageMetadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bx5 implements bi7 {
    public final /* synthetic */ int a;
    public final kt b;

    public bx5(fa4 fa4Var, int i) {
        this.a = i;
        switch (i) {
            case 1:
                this.b = new kt(fa4Var);
                break;
            case 2:
                this.b = new kt(fa4Var);
                break;
            default:
                this.b = new kt(fa4Var);
                break;
        }
    }

    @Override // defpackage.bi7
    public final Object map(Object obj, ew8 ew8Var) {
        int i = this.a;
        kt ktVar = this.b;
        switch (i) {
            case 0:
                String str = ((ax5) obj).a;
                str.getClass();
                return ktVar.a(new sw5(str, null, null, null, 62), ew8Var);
            case 1:
                ImageMetadataData imageMetadataData = (ImageMetadataData) obj;
                imageMetadataData.getClass();
                sw5 sw5VarM = pxf.M(imageMetadataData);
                if (sw5VarM != null) {
                    return ktVar.a(sw5VarM, ew8Var);
                }
                return null;
            default:
                ImageMetadata imageMetadata = (ImageMetadata) obj;
                imageMetadata.getClass();
                String str2 = imageMetadata.id;
                if (str2 == null) {
                    return null;
                }
                return ktVar.a(new sw5(str2, imageMetadata.original_width, imageMetadata.original_height, imageMetadata.focus_percent_x != null ? Double.valueOf(r0.floatValue()) : null, imageMetadata.focus_percent_y != null ? Double.valueOf(r0.floatValue()) : null, imageMetadata.alt), ew8Var);
        }
    }
}
