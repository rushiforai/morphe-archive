package jo;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedDeque;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f69615a = 0;

    static {
        new AtomicLong(0L);
        new ConcurrentLinkedDeque();
    }

    public static boolean a() {
        if (!fo.d.j()) {
            return false;
        }
        fo.d.c();
        return false;
    }

    public static String b() {
        return fo.d.j() ? fo.d.c().f55441f : "INSTA_AI";
    }

    public static void c(int i5, String str, String str2, String error, String str3, String str4) {
        Intrinsics.g(error, "error");
        a();
    }

    public static void d(String exchangeId, String str, String query, String enrichedQuery, String str2, String str3, int i5, List list, String str4, Map map) {
        Intrinsics.g(exchangeId, "exchangeId");
        Intrinsics.g(query, "query");
        Intrinsics.g(enrichedQuery, "enrichedQuery");
        a();
    }

    public static void e(String exchangeId, String str, String str2, List toolCalls, List suggestions, long j11, int i5) {
        Intrinsics.g(exchangeId, "exchangeId");
        Intrinsics.g(toolCalls, "toolCalls");
        Intrinsics.g(suggestions, "suggestions");
        a();
    }

    public static void f(String exchangeId, String str, Map details) {
        Intrinsics.g(exchangeId, "exchangeId");
        Intrinsics.g(details, "details");
        a();
    }

    public static void g(String str, String toolName, Map args, boolean z11, String resultSummary, long j11) {
        Intrinsics.g(toolName, "toolName");
        Intrinsics.g(args, "args");
        Intrinsics.g(resultSummary, "resultSummary");
        a();
    }
}
