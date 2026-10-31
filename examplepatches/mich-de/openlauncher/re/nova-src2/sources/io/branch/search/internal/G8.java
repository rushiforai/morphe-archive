package io.branch.search.internal;

import io.branch.engage.sesame_lite.internal.UtilsKt;
import io.branch.search.internal.requesthandler.model.Link;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class G8 {

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f62518a;

        static {
            int[] iArr = new int[R1.b(8).length];
            iArr[0] = 1;
            iArr[1] = 2;
            iArr[2] = 3;
            iArr[3] = 4;
            iArr[4] = 5;
            iArr[5] = 6;
            iArr[6] = 7;
            iArr[7] = 8;
            f62518a = iArr;
        }
    }

    @NotNull
    public static final JSONArray a(@NotNull List<? extends Link> list) throws JSONException {
        Intrinsics.g(list, "<this>");
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        for (Link link : list) {
            JSONObject jSONObject = new JSONObject();
            if (link instanceof Link.AppLink) {
                Link.AppLink appLink = (Link.AppLink) link;
                jSONObject.put("package", appLink.f65647a);
                jSONObject.put("user", appLink.f65648b);
                jSONObject.put("activity", appLink.f65649c);
                jSONObject.put("@type", link.getF65679e());
            } else if (link instanceof Link.ShortcutLink) {
                Link.ShortcutLink shortcutLink = (Link.ShortcutLink) link;
                jSONObject.put("package", shortcutLink.f65662b);
                jSONObject.put("user", shortcutLink.f65663c);
                jSONObject.put("id", shortcutLink.f65661a);
                jSONObject.put("@type", link.getF65679e());
                jSONObject.put("isDynamic", shortcutLink.f65664d);
            } else if (link instanceof Link.UriLink) {
                jSONObject.put("uri", ((Link.UriLink) link).f65672a);
                jSONObject.put("@type", link.getF65679e());
            } else if (link instanceof Link.ViewIntentLink) {
                jSONObject.put("@type", link.getF65679e());
                Link.ViewIntentLink viewIntentLink = (Link.ViewIntentLink) link;
                jSONObject.put("data", viewIntentLink.f65675a);
                String str = viewIntentLink.f65676b;
                if (str != null) {
                    jSONObject.put("forcePackage", str);
                }
                Boolean bool = viewIntentLink.f65678d;
                if (bool != null) {
                    jSONObject.put("followRedirects", bool.booleanValue());
                }
                String str2 = viewIntentLink.f65677c;
                if (str2 != null) {
                    jSONObject.put("targetPackageName", str2);
                }
            } else if (Intrinsics.b(link, Link.LaunchIntentLink.f65657a)) {
                jSONObject.put("@type", link.getF65679e());
            } else if (link instanceof Link.CustomIntentLink) {
                jSONObject.put("@type", link.getF65679e());
                Link.CustomIntentLink customIntentLink = (Link.CustomIntentLink) link;
                jSONObject.put("data", customIntentLink.f65652a);
                jSONObject.put("category", customIntentLink.f65653b);
                jSONObject.put("packageName", customIntentLink.f65654c);
                jSONObject.put("className", customIntentLink.f65655d);
            } else if (link instanceof Link.TestNotInstalledLink) {
                jSONObject.put("@type", link.getF65679e());
                Link.TestNotInstalledLink testNotInstalledLink = (Link.TestNotInstalledLink) link;
                jSONObject.put("package", testNotInstalledLink.f65670b);
                jSONObject.put("links", a(testNotInstalledLink.f65669a));
            } else if (link instanceof Link.TestInstalledLink) {
                jSONObject.put("@type", link.getF65679e());
                Link.TestInstalledLink testInstalledLink = (Link.TestInstalledLink) link;
                jSONObject.put("package", testInstalledLink.f65667b);
                jSONObject.put("links", a(testInstalledLink.f65666a));
            }
            arrayList.add(jSONObject);
        }
        return new JSONArray((Collection) arrayList);
    }

    @NotNull
    public static final List<Link> a(@NotNull JSONArray jSONArray) {
        int i5;
        Object viewIntentLink;
        Intrinsics.g(jSONArray, "<this>");
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i11 = 0; i11 < length; i11++) {
            JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i11);
            H8 h8 = I8.f62672a;
            Object appLink = null;
            String strOptString = jSONObjectOptJSONObject != null ? jSONObjectOptJSONObject.optString("@type") : null;
            h8.getClass();
            int[] iArrB = R1.b(8);
            int length2 = iArrB.length;
            int i12 = 0;
            while (true) {
                if (i12 < length2) {
                    i5 = iArrB[i12];
                    if (!Intrinsics.b(I8.b(i5), strOptString)) {
                        i12++;
                    }
                } else {
                    i5 = 0;
                }
            }
            switch (i5 == 0 ? -1 : a.f62518a[R1.a(i5)]) {
                case 1:
                    appLink = new Link.AppLink(jSONObjectOptJSONObject.optLong("user"), jSONObjectOptJSONObject.optString("package"), jSONObjectOptJSONObject.optString("activity"));
                    continue;
                    arrayList.add(appLink);
                case 2:
                    String strOptString2 = jSONObjectOptJSONObject.optString("package");
                    long jOptLong = jSONObjectOptJSONObject.optLong("user");
                    String string = jSONObjectOptJSONObject.optString("id").toString();
                    boolean zOptBoolean = jSONObjectOptJSONObject.optBoolean("isDynamic");
                    Intrinsics.f(strOptString2, "optString(\"package\")");
                    appLink = new Link.ShortcutLink(string, strOptString2, jOptLong, zOptBoolean);
                    continue;
                    arrayList.add(appLink);
                case 3:
                    appLink = new Link.UriLink(jSONObjectOptJSONObject.optString("uri"), jSONObjectOptJSONObject.optString("package"));
                    continue;
                    arrayList.add(appLink);
                case 4:
                    String strOptString3 = jSONObjectOptJSONObject.optString("data");
                    String strOptStringNull = UtilsKt.optStringNull(jSONObjectOptJSONObject, "forcePackage");
                    if (strOptStringNull == null || strOptStringNull.length() <= 0) {
                        strOptStringNull = null;
                    }
                    viewIntentLink = new Link.ViewIntentLink(strOptString3, strOptStringNull, jSONObjectOptJSONObject.has("targetPackageName") ? jSONObjectOptJSONObject.getString("targetPackageName") : null, jSONObjectOptJSONObject.has("followRedirects") ? Boolean.valueOf(jSONObjectOptJSONObject.getBoolean("followRedirects")) : null);
                    break;
                case 5:
                    appLink = Link.LaunchIntentLink.f65657a;
                    continue;
                    arrayList.add(appLink);
                case 6:
                    appLink = new Link.CustomIntentLink(jSONObjectOptJSONObject.getString("data"), jSONObjectOptJSONObject.optString("category"), jSONObjectOptJSONObject.optString("packageName"), jSONObjectOptJSONObject.optString("className"));
                    continue;
                    arrayList.add(appLink);
                case 7:
                    String strOptString4 = jSONObjectOptJSONObject.optString("package");
                    JSONArray jSONArrayOptJSONArray = jSONObjectOptJSONObject.optJSONArray("links");
                    List listA = jSONArrayOptJSONArray != null ? a(jSONArrayOptJSONArray) : null;
                    if (listA == null) {
                        listA = EmptyList.f71733a;
                    }
                    viewIntentLink = new Link.TestNotInstalledLink(strOptString4, listA);
                    break;
                case 8:
                    String strOptString5 = jSONObjectOptJSONObject.optString("package");
                    JSONArray jSONArrayOptJSONArray2 = jSONObjectOptJSONObject.optJSONArray("links");
                    List listA2 = jSONArrayOptJSONArray2 != null ? a(jSONArrayOptJSONArray2) : null;
                    if (listA2 == null) {
                        listA2 = EmptyList.f71733a;
                    }
                    viewIntentLink = new Link.TestInstalledLink(strOptString5, listA2);
                    break;
                default:
                    arrayList.add(appLink);
            }
            appLink = viewIntentLink;
            arrayList.add(appLink);
        }
        return b70.g.U0(arrayList);
    }
}
