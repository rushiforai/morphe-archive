package defpackage;

import android.net.Uri;
import java.util.Arrays;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ql1 implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ ql1(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                gyb.g((jyb) obj, 0);
                return c1eVar;
            case 1:
                gyb.g((jyb) obj, 0);
                return c1eVar;
            case 2:
                lt1 lt1Var = (lt1) obj;
                lt1Var.getClass();
                return ka1.r("collections_search_collection_", lt1Var.a);
            case 3:
                ((lx1) obj).getClass();
                return true;
            case 4:
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                for (int i2 = 0; i2 < 4; i2++) {
                    ev6.j(xu6Var, null, f49.f, 3);
                }
                return c1eVar;
            case 5:
                return c1eVar;
            case 6:
                gb2 gb2Var = (gb2) obj;
                if (gb2Var instanceof kb2) {
                    return (kb2) gb2Var;
                }
                return null;
            case 7:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            case 8:
                Map.Entry entry = (Map.Entry) obj;
                entry.getClass();
                String str = (String) entry.getKey();
                Object value = entry.getValue();
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(" : ");
                if (value instanceof Object[]) {
                    value = Arrays.toString((Object[]) value);
                    value.getClass();
                }
                sb.append(value);
                return sb.toString();
            case 9:
                Uri uri = (Uri) obj;
                uri.getClass();
                return ho2.B("playback", uri.getPathSegments());
            case 10:
                Uri uri2 = (Uri) obj;
                uri2.getClass();
                return ho2.B("powertrip", uri2.getPathSegments());
            case 11:
                Uri uri3 = (Uri) obj;
                uri3.getClass();
                return ho2.B("reasonabledoubt", uri3.getPathSegments());
            case 12:
                Uri uri4 = (Uri) obj;
                uri4.getClass();
                return ho2.B("redeem", uri4.getPathSegments());
            case 13:
                Uri uri5 = (Uri) obj;
                uri5.getClass();
                return ho2.B("about", uri5.getPathSegments());
            case 14:
                Uri uri6 = (Uri) obj;
                uri6.getClass();
                return ho2.B("thenewnew", uri6.getPathSegments());
            case 15:
                Uri uri7 = (Uri) obj;
                uri7.getClass();
                return ho2.B("ticks", uri7.getPathSegments());
            case 16:
                Uri uri8 = (Uri) obj;
                uri8.getClass();
                return ho2.B("trustissues", uri8.getPathSegments());
            case 17:
                Uri uri9 = (Uri) obj;
                uri9.getClass();
                return ho2.B("unrulybodies", uri9.getPathSegments());
            case 18:
                Uri uri10 = (Uri) obj;
                uri10.getClass();
                return ho2.B("youthnow", uri10.getPathSegments());
            case 19:
                Uri uri11 = (Uri) obj;
                uri11.getClass();
                return ho2.B("business", uri11.getPathSegments());
            case 20:
                Uri uri12 = (Uri) obj;
                uri12.getClass();
                return ho2.B("discount", uri12.getPathSegments());
            case 21:
                Uri uri13 = (Uri) obj;
                uri13.getClass();
                return ho2.B("verified-authors", uri13.getPathSegments());
            case 22:
                Uri uri14 = (Uri) obj;
                uri14.getClass();
                return ho2.B("mastodon", uri14.getPathSegments());
            case 23:
                Uri uri15 = (Uri) obj;
                uri15.getClass();
                return ho2.B("partner-program", uri15.getPathSegments());
            case 24:
                Uri uri16 = (Uri) obj;
                uri16.getClass();
                return ho2.B("cointalk", uri16.getPathSegments());
            case 25:
                Uri uri17 = (Uri) obj;
                uri17.getClass();
                return ho2.B("partner-program-application", uri17.getPathSegments());
            case 26:
                Uri uri18 = (Uri) obj;
                uri18.getClass();
                return ho2.B("collections", uri18.getPathSegments());
            case 27:
                Uri uri19 = (Uri) obj;
                uri19.getClass();
                return ho2.B("store", uri19.getPathSegments());
            case 28:
                Uri uri20 = (Uri) obj;
                uri20.getClass();
                return ho2.B("tk", uri20.getPathSegments());
            default:
                Uri uri21 = (Uri) obj;
                uri21.getClass();
                return ho2.B("write", uri21.getPathSegments());
        }
    }
}
