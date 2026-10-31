package io.branch.search.internal;

import io.branch.search.internal.E2;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class X8 {

    public static final class a extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63663a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ y40.w f63664b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(String str, y40.w wVar) {
            super(0);
            this.f63663a = str;
            this.f63664b = wVar;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return this.f63663a + " hadError: " + this.f63664b.a();
        }
    }

    public static final class b extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63665a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(String str) {
            super(0);
            this.f63665a = str;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return b.c0.q(new StringBuilder(), this.f63665a, " cancelled");
        }
    }

    public static final class c extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63666a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ y40.w f63667b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(String str, y40.w wVar) {
            super(0);
            this.f63666a = str;
            this.f63667b = wVar;
        }

        /* JADX WARN: Removed duplicated region for block: B:9:0x005d  */
        @Override // kotlin.jvm.functions.Function0
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invoke() {
            String str;
            String apiTag = this.f63666a;
            Object obj = this.f63667b.f96716a;
            Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<io.branch.search.ui.BranchContainer<io.branch.search.ui.BranchEntity>>");
            List<BranchContainer> list = (List) obj;
            Intrinsics.g(apiTag, "apiTag");
            ArrayList arrayList = new ArrayList();
            StringBuilder sbK = b.u4.k("[", apiTag, "] returned ");
            sbK.append(list.size());
            sbK.append(" containers  ===============↓↓↓");
            arrayList.add(sbK.toString());
            for (BranchContainer branchContainer : list) {
                CharSequence header = branchContainer.getHeader();
                if (header != null) {
                    str = "[header:" + ((Object) header) + "] ";
                    if (str == null) {
                        str = "[no header] ";
                    }
                }
                arrayList.add("  [containerType: " + branchContainer.getContainerType() + "] " + str + " has " + branchContainer.getContent().size() + " branch entities");
                Iterator it = branchContainer.getContent().iterator();
                while (it.hasNext()) {
                    arrayList.add("    " + ((BranchEntity) it.next()));
                }
            }
            arrayList.add("[" + apiTag + "] end of result ===============↑↑↑");
            return b70.g.f1(arrayList, "\n", null, null, 0, null, 62);
        }
    }

    public static final <T extends BranchEntity> void a(@NotNull C3309p1 c3309p1, @NotNull String apiTag, @NotNull y40.w response) {
        Intrinsics.g(c3309p1, "<this>");
        Intrinsics.g(apiTag, "apiTag");
        Intrinsics.g(response, "response");
        if (response.d()) {
            C3309p1.a(EnumC3131e9.BranchResult, (Throwable) null, new a(apiTag, response));
            return;
        }
        E2 e22 = response.f96717b;
        e22.getClass();
        if (!(e22 instanceof E2.a)) {
            C3309p1.a(EnumC3131e9.BranchResult, (Throwable) null, new c(apiTag, response));
        } else {
            C3309p1.a(EnumC3131e9.BranchResult, (Throwable) null, new b(apiTag));
        }
    }
}
