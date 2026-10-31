package io.branch.search.internal;

import android.database.Cursor;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.gb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3167gb<T, R> {

    @NotNull
    public static final a Companion = a.f64589a;

    /* renamed from: io.branch.search.internal.gb$a */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f64589a = new a();

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final b f64590b = new b();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final C0339a f64591c = new C0339a();

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public static final c f64592d = new c();

        /* renamed from: io.branch.search.internal.gb$a$a, reason: collision with other inner class name */
        public static final class C0339a implements InterfaceC3167gb<Pair<? extends String, ? extends String>, Pair<? extends String, ? extends String>> {
            @Override // io.branch.search.internal.InterfaceC3167gb
            public final Object a(Cursor cur, String sessionId) {
                Intrinsics.g(sessionId, "sessionId");
                Intrinsics.g(cur, "cur");
                return new Pair(cur.getString(0), cur.getString(1));
            }

            @Override // io.branch.search.internal.InterfaceC3167gb
            public final Object a(String sessionId, ArrayList queryResults) {
                Intrinsics.g(sessionId, "sessionId");
                Intrinsics.g(queryResults, "queryResults");
                if (queryResults.isEmpty()) {
                    return new Pair(null, null);
                }
                return (Pair) queryResults.get(0);
            }
        }

        /* renamed from: io.branch.search.internal.gb$a$b */
        public static final class b implements InterfaceC3167gb<String, List<? extends String>> {
            @Override // io.branch.search.internal.InterfaceC3167gb
            public final Object a(Cursor cur, String sessionId) {
                Intrinsics.g(sessionId, "sessionId");
                Intrinsics.g(cur, "cur");
                return cur.getString(0);
            }

            @Override // io.branch.search.internal.InterfaceC3167gb
            public final Object a(String sessionId, ArrayList queryResults) {
                Intrinsics.g(sessionId, "sessionId");
                Intrinsics.g(queryResults, "queryResults");
                return queryResults;
            }
        }

        /* renamed from: io.branch.search.internal.gb$a$c */
        public static final class c implements InterfaceC3167gb<Pair<? extends String, ? extends String>, Map<String, ? extends String>> {
            @Override // io.branch.search.internal.InterfaceC3167gb
            public final Object a(Cursor cur, String sessionId) {
                Intrinsics.g(sessionId, "sessionId");
                Intrinsics.g(cur, "cur");
                return new Pair(cur.getString(0), cur.getString(1));
            }

            @Override // io.branch.search.internal.InterfaceC3167gb
            public final Object a(String sessionId, ArrayList queryResults) {
                Intrinsics.g(sessionId, "sessionId");
                Intrinsics.g(queryResults, "queryResults");
                ArrayList arrayList = new ArrayList();
                Iterator it = queryResults.iterator();
                while (it.hasNext()) {
                    Pair pair = (Pair) it.next();
                    String str = (String) pair.f71683a;
                    Pair pair2 = str == null ? null : new Pair(str, pair.f71684b);
                    if (pair2 != null) {
                        arrayList.add(pair2);
                    }
                }
                return MapsKt.r0(arrayList);
            }
        }
    }

    @Nullable
    Object a(@NotNull Cursor cursor, @NotNull String str);

    Object a(@NotNull String str, @NotNull ArrayList arrayList);
}
