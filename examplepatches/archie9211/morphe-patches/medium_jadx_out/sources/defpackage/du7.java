package defpackage;

import com.medium.reader.R;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class du7 {
    public static final ez4 a;

    static {
        d05 d05Var = d05.h;
        ocb ocbVarD = o7f.d(R.font.sohne_bold, d05Var, 0, 8);
        ocb ocbVarD2 = o7f.d(R.font.sohne_bold_italic, d05Var, 1, 8);
        d05 d05Var2 = d05.g;
        ocb ocbVarD3 = o7f.d(R.font.sohne_medium, d05Var2, 0, 8);
        ocb ocbVarD4 = o7f.d(R.font.sohne_medium_italic, d05Var2, 1, 8);
        d05 d05Var3 = d05.f;
        ocb ocbVarD5 = o7f.d(R.font.sohne_regular, d05Var3, 0, 8);
        ocb ocbVarD6 = o7f.d(R.font.sohne_regular_italic, d05Var3, 1, 8);
        d05 d05Var4 = d05.e;
        List listAsList = Arrays.asList(ocbVarD, ocbVarD2, ocbVarD3, ocbVarD4, ocbVarD5, ocbVarD6, o7f.d(R.font.sohne_light, d05Var4, 0, 8), o7f.d(R.font.sohne_light_italic, d05Var4, 1, 8));
        listAsList.getClass();
        a = new ez4(listAsList);
    }

    public static final mkd a(zo7 zo7Var) {
        long j = zo7Var.n;
        List listAsList = Arrays.asList(o7f.d(R.font.gt_super_regular, null, 0, 14));
        listAsList.getClass();
        return new mkd(j, 0L, d05.f, new ez4(listAsList), 0L, 0, 0L, new bb9(true), 16252890);
    }

    public static final mkd b(zo7 zo7Var) {
        return new mkd(zo7Var.n, 0L, d05.f, a, 0L, 0, 0L, new bb9(true), 16252890);
    }

    public static final mkd c(zo7 zo7Var) {
        long j = zo7Var.n;
        d05 d05Var = d05.f;
        List listAsList = Arrays.asList(o7f.d(R.font.source_serif_pro_regular, d05Var, 0, 8), o7f.d(R.font.source_serif_pro_regular_italic, d05Var, 1, 8));
        listAsList.getClass();
        return new mkd(j, 0L, d05Var, new ez4(listAsList), 0L, 0, 0L, new bb9(true), 16252890);
    }
}
