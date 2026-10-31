package io.branch.search.internal;

import android.os.Parcel;
import io.branch.search.internal.multiprocess.ZeroStateCacheModel;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import kotlin.Unit;
import kotlin.io.ByteStreamsKt;
import kotlin.io.FilesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class If {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final File f62691a;

    public static final class a {
    }

    public static final class b extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ ZeroStateCacheModel f62692a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(ZeroStateCacheModel zeroStateCacheModel) {
            super(0);
            this.f62692a = zeroStateCacheModel;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "getFullCacheModel - cacheModel=" + this.f62692a + AbstractJsonLexerKt.END_OBJ;
        }
    }

    public static final class c extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ ZeroStateCacheModel f62693a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(ZeroStateCacheModel zeroStateCacheModel) {
            super(0);
            this.f62693a = zeroStateCacheModel;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Zero state cache updated with results=" + this.f62693a;
        }
    }

    public If(@NotNull F4 contextDelegate) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        this.f62691a = contextDelegate.a(EnumC3073b2.FILES);
    }

    public final void a() {
        try {
            File fileU0 = FilesKt.u0(this.f62691a, "zero_state_cache");
            if (fileU0.exists()) {
                fileU0.delete();
            }
        } catch (Throwable th2) {
            C3309p1.a("ZeroStateCacheDataSource", th2, "Error clearing ZS cache");
        }
    }

    @Nullable
    public final ZeroStateCacheModel b() {
        Parcel parcelObtain = Parcel.obtain();
        Intrinsics.f(parcelObtain, "obtain()");
        try {
            File fileU0 = FilesKt.u0(this.f62691a, "zero_state_cache");
            if (!fileU0.exists()) {
                return null;
            }
            FileInputStream fileInputStream = new FileInputStream(fileU0);
            try {
                byte[] bArrB = ByteStreamsKt.b(fileInputStream);
                fileInputStream.close();
                parcelObtain.unmarshall(bArrB, 0, bArrB.length);
                parcelObtain.setDataPosition(0);
                ZeroStateCacheModel zeroStateCacheModel = (ZeroStateCacheModel) parcelObtain.readParcelable(ZeroStateCacheModel.class.getClassLoader());
                C3309p1.a("ZeroStateCacheDataSource", new b(zeroStateCacheModel));
                return zeroStateCacheModel;
            } finally {
            }
        } catch (Throwable th2) {
            try {
                C3309p1.a("ZeroStateCacheDataSource", th2, "Error reading ZS from cache - clearing");
                a();
                return null;
            } finally {
                parcelObtain.recycle();
            }
        }
    }

    @Nullable
    public final ZeroStateCacheModel a(@NotNull ZeroStateCacheModel cacheModel) {
        Intrinsics.g(cacheModel, "cacheModel");
        ZeroStateCacheModel zeroStateCacheModelB = b();
        Parcel parcelObtain = Parcel.obtain();
        Intrinsics.f(parcelObtain, "obtain()");
        try {
            File fileU0 = FilesKt.u0(this.f62691a, "zero_state_cache");
            if (!fileU0.exists()) {
                fileU0.createNewFile();
            }
            parcelObtain.writeParcelable(cacheModel, 0);
            byte[] bArrMarshall = parcelObtain.marshall();
            FileOutputStream fileOutputStream = new FileOutputStream(fileU0);
            try {
                fileOutputStream.write(bArrMarshall);
                Unit unit = Unit.f71706a;
                fileOutputStream.close();
                C3309p1.a("ZeroStateCacheDataSource", new c(cacheModel));
                return zeroStateCacheModelB;
            } finally {
            }
        } catch (Throwable th2) {
            try {
                C3309p1.a("ZeroStateCacheDataSource", th2, "Error writing ZS to cache");
                parcelObtain.recycle();
                return null;
            } finally {
                parcelObtain.recycle();
            }
        }
    }
}
