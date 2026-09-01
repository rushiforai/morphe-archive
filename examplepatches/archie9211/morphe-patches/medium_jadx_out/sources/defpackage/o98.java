package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SectionModel;
import java.util.HashSet;
import java.util.Random;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o98 {
    public final Random a = new Random();
    public final HashSet b = new HashSet();

    public final String a() {
        String hexString;
        HashSet hashSet;
        do {
            hexString = Integer.toHexString(this.a.nextInt(ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID));
            hexString.getClass();
            while (hexString.length() < 4) {
                hexString = "0".concat(hexString);
            }
            hashSet = this.b;
        } while (hashSet.contains(hexString));
        hashSet.add(hexString);
        return hexString;
    }

    public final ParagraphPb b(ParagraphPb paragraphPb) {
        paragraphPb.getClass();
        String str = paragraphPb.name;
        if (str != null && str.length() != 0) {
            this.b.add(str);
            return paragraphPb;
        }
        n29 n29VarNewBuilder = paragraphPb.newBuilder();
        n29VarNewBuilder.a = a();
        return n29VarNewBuilder.build();
    }

    public final SectionModel c(SectionModel sectionModel) {
        String str = sectionModel.name;
        if (str != null && str.length() != 0) {
            this.b.add(str);
            return sectionModel;
        }
        ivb ivbVarNewBuilder = sectionModel.newBuilder();
        ivbVarNewBuilder.a = a();
        return ivbVarNewBuilder.build();
    }
}
