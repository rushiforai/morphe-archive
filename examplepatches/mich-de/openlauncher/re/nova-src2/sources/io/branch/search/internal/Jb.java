package io.branch.search.internal;

import io.branch.search.internal.AbstractC3393u1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class Jb extends AbstractC3393u1 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final AbstractC3393u1 f62746a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<AbstractC3393u1> f62747b;

    public Jb(@NotNull AbstractC3393u1 abstractC3393u1, @NotNull ArrayList repeatedBinding) {
        Intrinsics.g(abstractC3393u1, "default");
        Intrinsics.g(repeatedBinding, "repeatedBinding");
        this.f62746a = abstractC3393u1;
        this.f62747b = repeatedBinding;
    }

    @Override // io.branch.search.internal.AbstractC3393u1
    @Nullable
    public final String a(@Nullable String str) {
        return this.f62746a.a(str);
    }

    @Override // io.branch.search.internal.AbstractC3393u1
    @Nullable
    public final List<String[]> c(@Nullable String str) {
        List<AbstractC3393u1> list = this.f62747b;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((AbstractC3393u1) it.next()).b(str));
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        return arrayList;
    }

    public static final class a {
        @JvmStatic
        @NotNull
        public static Jb a(@NotNull AbstractC3393u1 abstractC3393u1, @NotNull List api) {
            Intrinsics.g(abstractC3393u1, "default");
            Intrinsics.g(api, "api");
            ArrayList arrayList = new ArrayList(b70.c.u0(api, 10));
            Iterator it = api.iterator();
            while (it.hasNext()) {
                arrayList.add(new C3181h8((Map) it.next(), abstractC3393u1));
            }
            return new Jb(abstractC3393u1, arrayList);
        }

        @JvmStatic
        @NotNull
        public static Jb a(@NotNull AbstractC3393u1.a aVar, @NotNull List api) {
            Intrinsics.g(aVar, "default");
            Intrinsics.g(api, "api");
            ArrayList arrayList = new ArrayList(b70.c.u0(api, 10));
            Iterator it = api.iterator();
            while (it.hasNext()) {
                arrayList.add(C3198i8.a((JSONObject) it.next()));
            }
            return a((AbstractC3393u1) aVar, (List) arrayList);
        }
    }
}
