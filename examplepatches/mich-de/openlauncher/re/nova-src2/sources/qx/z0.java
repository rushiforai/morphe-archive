package qx;

import android.view.View;
import b.u4;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import io.branch.search.ui.BranchEntity;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final /* synthetic */ class z0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84660a;

    public /* synthetic */ z0(int i5) {
        this.f84660a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5;
        boolean zAfter;
        switch (this.f84660a) {
            case 0:
                ((r) obj).f();
                return Unit.f71706a;
            case 1:
                ((r) obj).f();
                return Unit.f71706a;
            case 2:
                KProperty[] kPropertyArr = j3.y.f68878a;
                j3.a0 a0Var = j3.w.f68856e;
                Unit unit = Unit.f71706a;
                ((j3.k) ((j3.b0) obj)).f(a0Var, unit);
                return unit;
            case 3:
                return Boolean.valueOf(((View) obj).getVisibility() == 0);
            case 4:
                String str = (String) obj;
                Locale locale = Locale.getDefault();
                Intrinsics.g(str, "<this>");
                Intrinsics.g(locale, "locale");
                if (str.length() <= 0) {
                    return str;
                }
                char cCharAt = str.charAt(0);
                if (!Character.isLowerCase(cCharAt)) {
                    return str;
                }
                StringBuilder sb2 = new StringBuilder();
                char titleCase = Character.toTitleCase(cCharAt);
                if (titleCase != Character.toUpperCase(cCharAt)) {
                    sb2.append(titleCase);
                    i5 = 1;
                } else {
                    i5 = 1;
                    String strSubstring = str.substring(0, 1);
                    Intrinsics.f(strSubstring, "substring(...)");
                    String upperCase = strSubstring.toUpperCase(locale);
                    Intrinsics.f(upperCase, "toUpperCase(...)");
                    sb2.append(upperCase);
                }
                String strSubstring2 = str.substring(i5);
                Intrinsics.f(strSubstring2, "substring(...)");
                sb2.append(strSubstring2);
                return sb2.toString();
            case 5:
                return ((JSONObject) obj).getJSONArray("data");
            case 6:
                try {
                    String string = ((JSONObject) obj).getJSONObject("pagination").getString("cursor");
                    x80.v vVar = new x80.v();
                    vVar.e(null, "https://api.twitch.tv/helix/streams/followed");
                    x80.v vVarG = vVar.b().g();
                    vVarG.g("after", string);
                    return vVarG.b().f95633i;
                } catch (JSONException unused) {
                    return null;
                }
            case 7:
                return ((JSONObject) obj).getJSONArray("data");
            case 8:
                JSONObject jSONObject = (JSONObject) obj;
                return u4.m(jSONObject.getString("user_name"), " - ", jSONObject.getString("title"));
            case 9:
                return ((JSONObject) obj).getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            case 10:
                return u4.i("%\\{width\\}|%\\{height\\}", ((JSONObject) obj).getString("thumbnail_url"), "128");
            case 11:
                try {
                    String string2 = ((JSONObject) obj).getJSONObject("pagination").getString("cursor");
                    x80.v vVar2 = new x80.v();
                    vVar2.e(null, "https://api.twitch.tv/helix/videos");
                    x80.v vVarG2 = vVar2.b().g();
                    vVarG2.g("after", string2);
                    return vVarG2.b().f95633i;
                } catch (JSONException unused2) {
                    return null;
                }
            case 12:
                try {
                    Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(((JSONObject) obj).getString("published_at"));
                    Intrinsics.d(date);
                    zAfter = date.after(new Date(System.currentTimeMillis() - 86400000));
                } catch (Throwable unused3) {
                    zAfter = false;
                }
                return Boolean.valueOf(zAfter);
            case 13:
                return ((JSONObject) obj).getJSONArray("data");
            case 14:
                JSONObject jSONObject2 = (JSONObject) obj;
                return u4.m(jSONObject2.getString("user_name"), " - ", jSONObject2.getString("title"));
            case 15:
                return b.c0.k("https://twitch.tv/", ((JSONObject) obj).getString("user_login"));
            case 16:
                return u4.i("\\{width\\}|\\{height\\}", ((JSONObject) obj).getString("thumbnail_url"), "128");
            case 17:
                return null;
            case 18:
                JSONObject jSONObject3 = (JSONObject) obj;
                return u4.m(jSONObject3.getString("user_name"), " - ", jSONObject3.getString("title"));
            case 19:
                return b.c0.k("https://twitch.tv/", ((JSONObject) obj).getString("user_login"));
            case 20:
                return u4.i("\\{width\\}|\\{height\\}", ((JSONObject) obj).getString("thumbnail_url"), "128");
            case 21:
                String line = (String) obj;
                Intrinsics.g(line, "line");
                return line;
            case 22:
                CharSequence it = (CharSequence) obj;
                Intrinsics.g(it, "it");
                return it.toString();
            case 23:
                pw.a it2 = (pw.a) obj;
                Intrinsics.g(it2, "it");
                if (!it2.f83106b) {
                    it2 = null;
                }
                if (it2 != null) {
                    return it2.f83105a;
                }
                return null;
            case 24:
                pw.a it3 = (pw.a) obj;
                Intrinsics.g(it3, "it");
                if (!it3.f83106b) {
                    it3 = null;
                }
                if (it3 != null) {
                    return it3.f83105a;
                }
                return null;
            case 25:
                pw.a it4 = (pw.a) obj;
                Intrinsics.g(it4, "it");
                if (!it4.f83106b) {
                    it4 = null;
                }
                if (it4 != null) {
                    return it4.f83105a;
                }
                return null;
            case 26:
                return Boolean.valueOf(((rs.j) obj).f86197l);
            case 27:
                j3.b0 semantics = (j3.b0) obj;
                Intrinsics.g(semantics, "$this$semantics");
                j3.y.k("LinkLogoIcon", semantics);
                return Unit.f71706a;
            case 28:
                j3.b0 semantics2 = (j3.b0) obj;
                Intrinsics.g(semantics2, "$this$semantics");
                j3.y.k("CircularProgressIndicator", semantics2);
                return Unit.f71706a;
            default:
                BranchEntity branchEntity = (BranchEntity) obj;
                return Boolean.valueOf(!(branchEntity instanceof BranchEntity.HeroAd) ? !((branchEntity instanceof BranchEntity.HeroV2) && ((BranchEntity.HeroV2) branchEntity).f66431e == 2) : ((BranchEntity.HeroAd) branchEntity).f66424g != 2);
        }
    }
}
