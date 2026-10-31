package io.branch.search.internal;

import io.branch.search.internal.J2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.c2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3090c2 {

    @NotNull
    public static final d Companion = new d();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64090a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public Throwable f64091b;

    /* renamed from: io.branch.search.internal.c2$a */
    public static final class a extends AbstractC3090c2 {
        public a() {
            super("Bad request.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$b */
    public static final class b extends AbstractC3090c2 {
        public b() {
            super("Poor network connectivity. Please try again later. Please make sure app has internet access permission", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$c */
    public static final class c extends AbstractC3090c2 {
        public c() {
            super("BranchNavigatorClient is not initialized.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$d */
    public static final class d {

        /* renamed from: io.branch.search.internal.c2$d$a */
        public /* synthetic */ class a {

            /* renamed from: a, reason: collision with root package name */
            public static final /* synthetic */ int[] f64092a;

            static {
                int[] iArr = new int[J2.b.values().length];
                iArr[0] = 1;
                iArr[1] = 2;
                iArr[2] = 3;
                iArr[3] = 4;
                iArr[4] = 5;
                iArr[5] = 6;
                iArr[6] = 7;
                iArr[7] = 8;
                iArr[15] = 9;
                iArr[10] = 10;
                iArr[8] = 11;
                iArr[9] = 12;
                iArr[11] = 13;
                iArr[12] = 14;
                iArr[13] = 15;
                iArr[14] = 16;
                iArr[16] = 17;
                f64092a = iArr;
            }
        }
    }

    /* renamed from: io.branch.search.internal.c2$e */
    public static final class e extends AbstractC3090c2 {
        public e() {
            super("EmptyQuery", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$f */
    public static final class f extends AbstractC3090c2 {
        public f() {
            super("Illegal arguments.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$g */
    public static final class g extends AbstractC3090c2 {
        public g() {
            super("Unable to process your request now. An internal error happened. Please try later.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$h */
    public static final class h extends AbstractC3090c2 {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public h(@NotNull String message) {
            super("An internal error was encountered. Please retry the request. (details: " + message + ')', 0);
            Intrinsics.g(message, "message");
        }
    }

    /* renamed from: io.branch.search.internal.c2$i */
    public static final class i extends AbstractC3090c2 {
        public i() {
            super("No regional support.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$j */
    public static final class j extends AbstractC3090c2 {
        public j() {
            super("Poor network connectivity. Please try again later. Please make sure app has internet access permission", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$k */
    public static final class k extends AbstractC3090c2 {
        public k() {
            super("Cannot do a network request, the user is opted out of tracking", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$l */
    public static final class l extends AbstractC3090c2 {
        public l() {
            super("Failed during post processing.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$m */
    public static final class m extends AbstractC3090c2 {
        public m() {
            super("Request was canceled due to new requests being scheduled before it could be completed.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$n */
    public static final class n extends AbstractC3090c2 {
        public n() {
            super("Request to Branch server timed out. Please check your connection or try again later.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$o */
    public static final class o extends AbstractC3090c2 {
        public o() {
            super("An unknown error happened. Unable to open the app.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$p */
    public static final class p extends AbstractC3090c2 {
        public p() {
            super("Unable to open the destination application or its fallback url.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$q */
    public static final class q extends AbstractC3090c2 {
        public q() {
            super("Unable to open the Google Play Store for the app.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$r */
    public static final class r extends AbstractC3090c2 {
        public r() {
            super("Unable to open the web url associated with the app.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$s */
    public static final class s extends AbstractC3090c2 {
        public s() {
            super("Unauthorized request.", 0);
        }
    }

    /* renamed from: io.branch.search.internal.c2$t */
    public static final class t extends AbstractC3090c2 {
        public t() {
            super("Unknown", 0);
        }
    }

    public /* synthetic */ AbstractC3090c2(String str, int i5) {
        this(str);
    }

    @NotNull
    public final String toString() {
        return this.f64090a;
    }

    public AbstractC3090c2(String str) {
        this.f64090a = str;
    }
}
