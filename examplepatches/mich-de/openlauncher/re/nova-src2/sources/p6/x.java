package p6;

import android.net.Uri;
import io.sentry.w3;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.Pair;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class x extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f82284j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z f82285k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x(z zVar, int i5) {
        super(0);
        this.f82284j = i5;
        this.f82285k = zVar;
    }

    /* JADX WARN: Type inference failed for: r1v16, types: [java.lang.Object, kotlin.Lazy] */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.lang.Object, kotlin.Lazy] */
    /* JADX WARN: Type inference failed for: r1v22, types: [java.lang.Object, kotlin.Lazy] */
    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        List list;
        switch (this.f82284j) {
            case 0:
                Pair pair = (Pair) this.f82285k.f82307h.getValue();
                return (pair == null || (list = (List) pair.f71683a) == null) ? new ArrayList() : list;
            case 1:
                String str = this.f82285k.f82300a;
                if (Uri.parse(str).getFragment() == null) {
                    return null;
                }
                ArrayList arrayList = new ArrayList();
                String fragment = Uri.parse(str).getFragment();
                StringBuilder sb2 = new StringBuilder();
                Intrinsics.d(fragment);
                z.a(fragment, arrayList, sb2);
                String string = sb2.toString();
                Intrinsics.f(string, "fragRegex.toString()");
                return new Pair(arrayList, string);
            case 2:
                String str2 = (String) this.f82285k.f82309j.getValue();
                if (str2 != null) {
                    return Pattern.compile(str2, 2);
                }
                return null;
            case 3:
                Pair pair2 = (Pair) this.f82285k.f82307h.getValue();
                if (pair2 != null) {
                    return (String) pair2.f71684b;
                }
                return null;
            case 4:
                String str3 = this.f82285k.f82300a;
                return Boolean.valueOf((str3 == null || Uri.parse(str3).getQuery() == null) ? false : true);
            case 5:
                return null;
            case 6:
                String str4 = this.f82285k.f82302c;
                if (str4 != null) {
                    return Pattern.compile(str4, 2);
                }
                return null;
            default:
                z zVar = this.f82285k;
                String str5 = zVar.f82300a;
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                if (((Boolean) zVar.f82304e.getValue()).booleanValue()) {
                    Uri uri = Uri.parse(str5);
                    for (String paramName : uri.getQueryParameterNames()) {
                        StringBuilder sb3 = new StringBuilder();
                        List<String> queryParameters = uri.getQueryParameters(paramName);
                        int i5 = 1;
                        if (queryParameters.size() > 1) {
                            throw new IllegalArgumentException(b.c0.n("Query parameter ", paramName, " must only be present once in ", str5, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance.").toString());
                        }
                        String queryParam = (String) b70.g.Y0(queryParameters);
                        if (queryParam == null) {
                            zVar.f82306g = true;
                            queryParam = paramName;
                        }
                        Matcher matcher = z.n.matcher(queryParam);
                        w wVar = new w();
                        int iEnd = 0;
                        while (matcher.find()) {
                            String strGroup = matcher.group(i5);
                            Intrinsics.e(strGroup, "null cannot be cast to non-null type kotlin.String");
                            wVar.f82282b.add(strGroup);
                            Intrinsics.f(queryParam, "queryParam");
                            String strSubstring = queryParam.substring(iEnd, matcher.start());
                            Intrinsics.f(strSubstring, "substring(...)");
                            sb3.append(Pattern.quote(strSubstring));
                            sb3.append("(.+?)?");
                            iEnd = matcher.end();
                            i5 = 1;
                        }
                        if (iEnd < queryParam.length()) {
                            String strSubstring2 = queryParam.substring(iEnd);
                            Intrinsics.f(strSubstring2, "substring(...)");
                            sb3.append(Pattern.quote(strSubstring2));
                        }
                        String string2 = sb3.toString();
                        Intrinsics.f(string2, "argRegex.toString()");
                        wVar.f82281a = r70.j.F0(string2, w3.DEFAULT_PROPAGATION_TARGETS, "\\E.*\\Q", false);
                        Intrinsics.f(paramName, "paramName");
                        linkedHashMap.put(paramName, wVar);
                    }
                }
                return linkedHashMap;
        }
    }
}
