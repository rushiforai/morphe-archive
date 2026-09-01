package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.io.IOException;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class hec extends o3e implements jec, tvd {
    @Override // defpackage.o3e
    /* JADX INFO: renamed from: q0, reason: merged with bridge method [inline-methods] */
    public abstract hec n0(boolean z);

    @Override // defpackage.o3e
    /* JADX INFO: renamed from: r0, reason: merged with bridge method [inline-methods] */
    public abstract hec p0(uvd uvdVar);

    public String toString() throws IOException {
        StringBuilder sb = new StringBuilder();
        Iterator it2 = getAnnotations().iterator();
        while (it2.hasNext()) {
            String[] strArr = {"[", w83.e.w((yx) it2.next(), null), "] "};
            for (int i = 0; i < 3; i++) {
                sb.append(strArr[i]);
            }
        }
        sb.append(j0());
        if (!h0().isEmpty()) {
            bu1.E0(h0(), sb, ", ", "<", ">", null, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
        }
        if (k0()) {
            sb.append("?");
        }
        return sb.toString();
    }
}
