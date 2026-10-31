package io.branch.search.internal;

import android.database.MatrixCursor;
import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.E2;
import io.branch.search.internal.util.CorosKt;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import java.util.List;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class A4<R, T extends Parcelable> implements InterfaceC3481z4 {

    @NotNull
    public static final c Companion = new c();

    public static final class c {
        @NotNull
        public static MatrixCursor a(@NotNull Throwable exception) {
            Intrinsics.g(exception, "exception");
            MatrixCursor matrixCursor = new MatrixCursor(new String[]{"error"});
            E2.Companion.getClass();
            matrixCursor.addRow(new byte[][]{D1.a(E2.b.a(exception))});
            return matrixCursor;
        }
    }

    public A4() {
    }

    @NotNull
    public final MatrixCursor a(@NotNull Function1 block) {
        Intrinsics.g(block, "block");
        y40.w wVar = (y40.w) t70.m0.u(CorosKt.getBNCScope().getCoroutineContext(), new B4(block, null));
        List value = (List) wVar.b();
        E2 exception = wVar.c();
        RequestMetadata requestMetadata = wVar.e();
        Intrinsics.g(value, "value");
        Intrinsics.g(exception, "exception");
        Intrinsics.g(requestMetadata, "requestMetadata");
        if (!(exception instanceof E2.c)) {
            MatrixCursor matrixCursor = new MatrixCursor(new String[]{"error"});
            matrixCursor.addRow(new byte[][]{D1.a(exception)});
            return matrixCursor;
        }
        MatrixCursor matrixCursor2 = new MatrixCursor(new String[]{a(), "request_metadata"});
        int i5 = 0;
        for (Object obj : value) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            Parcelable parcelable = (Parcelable) obj;
            if (i5 == 0) {
                matrixCursor2.addRow(new byte[][]{D1.a(parcelable), D1.a(requestMetadata)});
            } else {
                matrixCursor2.addRow(new byte[][]{D1.a(parcelable), null});
            }
            i5 = i11;
        }
        return matrixCursor2;
    }

    @NotNull
    public abstract BranchContainer a(@NotNull byte[] bArr);

    @NotNull
    public abstract String a();

    @NotNull
    public abstract Pair<String, String>[] a(R r11);

    public /* synthetic */ A4(int i5) {
        this();
    }

    public static final class a extends A4<y40.c, BranchContainer<BranchEntity>> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final a f61923a = new a();

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final String f61924b = "APPSTORE";

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final String f61925c = "appstore";

        public a() {
            super(0);
        }

        @Override // io.branch.search.internal.A4
        public final Pair[] a(y40.c cVar) {
            y40.c r11 = cVar;
            Intrinsics.g(r11, "r");
            y40.c.Companion.getClass();
            return y40.b.a(r11);
        }

        @Override // io.branch.search.internal.InterfaceC3481z4
        @NotNull
        public final String getPath() {
            return f61924b;
        }

        @Override // io.branch.search.internal.A4
        public final BranchContainer a(byte[] byteArray) {
            Intrinsics.g(byteArray, "byteArray");
            Parcel parcelObtain = Parcel.obtain();
            Intrinsics.f(parcelObtain, "obtain()");
            try {
                parcelObtain.unmarshall(byteArray, 0, byteArray.length);
                parcelObtain.setDataPosition(0);
                Parcelable parcelable = parcelObtain.readParcelable(BranchContainer.class.getClassLoader());
                Intrinsics.d(parcelable);
                parcelObtain.recycle();
                return (BranchContainer) parcelable;
            } catch (Throwable th2) {
                parcelObtain.recycle();
                throw th2;
            }
        }

        @Override // io.branch.search.internal.A4
        @NotNull
        public final String a() {
            return f61925c;
        }
    }

    public static final class b extends A4<y40.e, BranchContainer<BranchEntity>> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final b f61926a = new b();

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final String f61927b = "AUTOSUGGEST";

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final String f61928c = "autosuggest";

        public b() {
            super(0);
        }

        @Override // io.branch.search.internal.A4
        public final Pair[] a(y40.e eVar) {
            y40.e r11 = eVar;
            Intrinsics.g(r11, "r");
            y40.e.Companion.getClass();
            return y40.d.a(r11);
        }

        @Override // io.branch.search.internal.InterfaceC3481z4
        @NotNull
        public final String getPath() {
            return f61927b;
        }

        @Override // io.branch.search.internal.A4
        public final BranchContainer a(byte[] byteArray) {
            Intrinsics.g(byteArray, "byteArray");
            Parcel parcelObtain = Parcel.obtain();
            Intrinsics.f(parcelObtain, "obtain()");
            try {
                parcelObtain.unmarshall(byteArray, 0, byteArray.length);
                parcelObtain.setDataPosition(0);
                Parcelable parcelable = parcelObtain.readParcelable(BranchContainer.class.getClassLoader());
                Intrinsics.d(parcelable);
                parcelObtain.recycle();
                return (BranchContainer) parcelable;
            } catch (Throwable th2) {
                parcelObtain.recycle();
                throw th2;
            }
        }

        @Override // io.branch.search.internal.A4
        @NotNull
        public final String a() {
            return f61928c;
        }
    }

    public static final class d extends A4<y40.b0, BranchContainer<BranchEntity>> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final d f61929a = new d();

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final String f61930b = "COMPOSITE_SEARCH";

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final String f61931c = "app";

        public d() {
            super(0);
        }

        @Override // io.branch.search.internal.A4
        public final Pair[] a(y40.b0 b0Var) {
            y40.b0 r11 = b0Var;
            Intrinsics.g(r11, "r");
            y40.b0.Companion.getClass();
            return y40.z.a(r11);
        }

        @Override // io.branch.search.internal.InterfaceC3481z4
        @NotNull
        public final String getPath() {
            return f61930b;
        }

        @Override // io.branch.search.internal.A4
        public final BranchContainer a(byte[] byteArray) {
            Intrinsics.g(byteArray, "byteArray");
            Parcel parcelObtain = Parcel.obtain();
            Intrinsics.f(parcelObtain, "obtain()");
            try {
                parcelObtain.unmarshall(byteArray, 0, byteArray.length);
                parcelObtain.setDataPosition(0);
                Parcelable parcelable = parcelObtain.readParcelable(BranchContainer.class.getClassLoader());
                Intrinsics.d(parcelable);
                parcelObtain.recycle();
                return (BranchContainer) parcelable;
            } catch (Throwable th2) {
                parcelObtain.recycle();
                throw th2;
            }
        }

        @Override // io.branch.search.internal.A4
        @NotNull
        public final String a() {
            return f61931c;
        }
    }

    public static final class e extends A4<y40.d0, BranchContainer<BranchEntity>> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final e f61932a = new e();

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final String f61933b = "ZERO_STATE";

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final String f61934c = "zero_state";

        public e() {
            super(0);
        }

        @Override // io.branch.search.internal.A4
        public final Pair[] a(y40.d0 d0Var) {
            y40.d0 r11 = d0Var;
            Intrinsics.g(r11, "r");
            y40.d0.Companion.getClass();
            return y40.c0.a(r11);
        }

        @Override // io.branch.search.internal.InterfaceC3481z4
        @NotNull
        public final String getPath() {
            return f61933b;
        }

        @Override // io.branch.search.internal.A4
        public final BranchContainer a(byte[] byteArray) {
            Intrinsics.g(byteArray, "byteArray");
            Parcel parcelObtain = Parcel.obtain();
            Intrinsics.f(parcelObtain, "obtain()");
            try {
                parcelObtain.unmarshall(byteArray, 0, byteArray.length);
                parcelObtain.setDataPosition(0);
                Parcelable parcelable = parcelObtain.readParcelable(BranchContainer.class.getClassLoader());
                Intrinsics.d(parcelable);
                parcelObtain.recycle();
                return (BranchContainer) parcelable;
            } catch (Throwable th2) {
                parcelObtain.recycle();
                throw th2;
            }
        }

        @Override // io.branch.search.internal.A4
        @NotNull
        public final String a() {
            return f61934c;
        }
    }
}
