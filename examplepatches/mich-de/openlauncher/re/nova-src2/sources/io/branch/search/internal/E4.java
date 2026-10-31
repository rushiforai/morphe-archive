package io.branch.search.internal;

import android.content.ContentValues;
import android.os.Parcel;
import android.os.Parcelable;
import com.amplitude.android.migration.DatabaseConstants;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class E4<T extends Parcelable> {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final KClass<T> f62394a;

    public static final class a {
    }

    public E4(@NotNull KClass<T> klass) {
        Intrinsics.g(klass, "klass");
        this.f62394a = klass;
    }

    @NotNull
    public static ContentValues a(@NotNull Parcelable value) {
        Intrinsics.g(value, "value");
        ContentValues contentValues = new ContentValues();
        contentValues.put(DatabaseConstants.KEY_FIELD, D1.a(value));
        return contentValues;
    }

    @Nullable
    public final T a(@Nullable ContentValues contentValues) {
        byte[] asByteArray;
        if (contentValues == null || (asByteArray = contentValues.getAsByteArray(DatabaseConstants.KEY_FIELD)) == null) {
            return null;
        }
        KClass<T> kClass = this.f62394a;
        Parcel parcelObtain = Parcel.obtain();
        Intrinsics.f(parcelObtain, "obtain()");
        parcelObtain.unmarshall(asByteArray, 0, asByteArray.length);
        parcelObtain.setDataPosition(0);
        T t6 = (T) parcelObtain.readParcelable(JvmClassMappingKt.b(kClass).getClassLoader());
        Intrinsics.d(t6);
        parcelObtain.recycle();
        return t6;
    }
}
