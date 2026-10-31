package io.branch.search.internal.multiprocess;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import io.branch.search.internal.C3482z5;
import io.branch.search.internal.Cb;
import io.branch.search.internal.D4;
import io.branch.search.internal.F4;
import io.branch.search.internal.InterfaceC3133eb;
import io.branch.search.internal.InterfaceC3272mf;
import io.branch.search.internal.R1;
import java.lang.reflect.InvocationTargetException;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/multiprocess/UserAgentProvider;", "Landroid/content/ContentProvider;", "<init>", "()V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public class UserAgentProvider extends ContentProvider {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Lazy f65293a = LazyKt.a(new a());

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public InterfaceC3272mf f65294b;

    public static final class a extends Lambda implements Function0<F4> {
        public a() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            Context context = UserAgentProvider.this.getContext();
            Intrinsics.d(context);
            return new F4(context);
        }
    }

    @Override // android.content.ContentProvider
    public final int delete(@NotNull Uri uri, @Nullable String str, @Nullable String[] strArr) {
        Intrinsics.g(uri, "uri");
        InterfaceC3272mf interfaceC3272mf = this.f65294b;
        if (interfaceC3272mf == null) {
            return 0;
        }
        interfaceC3272mf.a();
        Unit unit = Unit.f71706a;
        return 0;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public final String getType(@NotNull Uri uri) {
        Intrinsics.g(uri, "uri");
        return null;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public final Uri insert(@NotNull Uri uri, @Nullable ContentValues contentValues) {
        Intrinsics.g(uri, "uri");
        return null;
    }

    @Override // android.content.ContentProvider
    public final boolean onCreate() {
        return true;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public final Cursor query(@NotNull Uri uri, @Nullable String[] strArr, @Nullable String str, @Nullable String[] strArr2, @Nullable String str2) {
        Intrinsics.g(uri, "uri");
        return query(uri, strArr, new Bundle(), null);
    }

    @Override // android.content.ContentProvider
    public final int update(@NotNull Uri uri, @Nullable ContentValues contentValues, @Nullable String str, @Nullable String[] strArr) {
        Intrinsics.g(uri, "uri");
        return 0;
    }

    @Override // android.content.ContentProvider
    @NotNull
    public final Cursor query(@NotNull Uri uri, @Nullable String[] strArr, @Nullable Bundle bundle, @Nullable CancellationSignal cancellationSignal) throws IllegalAccessException, InstantiationException, IllegalArgumentException, InvocationTargetException {
        InterfaceC3133eb c3482z5;
        InterfaceC3272mf cb2;
        Intrinsics.g(uri, "uri");
        Intrinsics.d(bundle);
        String string = bundle.getString("PROCESS_HANDLER");
        if (string != null) {
            Object objNewInstance = Class.forName(string).getConstructor(Context.class).newInstance(getContext());
            Intrinsics.e(objNewInstance, "null cannot be cast to non-null type io.branch.search.plugin.ProcessHandler");
            c3482z5 = (InterfaceC3133eb) objNewInstance;
        } else {
            Context context = getContext();
            Intrinsics.d(context);
            c3482z5 = new C3482z5(context);
        }
        if (this.f65294b == null) {
            InterfaceC3272mf.b bVar = InterfaceC3272mf.Companion;
            F4 context2 = (F4) this.f65293a.getValue();
            bVar.getClass();
            Intrinsics.g(context2, "context");
            int iA = R1.a(1);
            if (iA == 0) {
                cb2 = new Cb(context2, c3482z5);
            } else {
                if (iA != 1 && iA != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                cb2 = new D4(context2, c3482z5);
            }
            this.f65294b = cb2;
        }
        MatrixCursor matrixCursor = new MatrixCursor(new String[]{"user_agent"}, 1);
        InterfaceC3272mf interfaceC3272mf = this.f65294b;
        Intrinsics.d(interfaceC3272mf);
        matrixCursor.addRow(new String[]{(String) interfaceC3272mf.b().f71683a});
        return matrixCursor;
    }
}
