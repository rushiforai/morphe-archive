package defpackage;

import android.content.Context;
import android.content.res.Resources;
import com.medium.android.core.models.CatalogName;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class af1 {
    public static final String a(CatalogName catalogName, x12 x12Var) {
        catalogName.getClass();
        Resources resources = ((Context) ((p65) x12Var).j(eo.b)).getResources();
        resources.getClass();
        return b(catalogName, resources);
    }

    public static final String b(CatalogName catalogName, Resources resources) {
        catalogName.getClass();
        resources.getClass();
        if (catalogName instanceof CatalogName.ReadingList) {
            String string = resources.getString(R.string.reading_list);
            string.getClass();
            return string;
        }
        if (catalogName instanceof CatalogName.Name) {
            return ((CatalogName.Name) catalogName).getName();
        }
        ygf.a();
        return null;
    }
}
