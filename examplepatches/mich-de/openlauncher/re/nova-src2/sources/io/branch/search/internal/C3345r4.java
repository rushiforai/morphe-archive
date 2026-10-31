package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import io.branch.search.ui.Image;
import java.util.ArrayList;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.r4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3345r4<T extends BranchEntity> implements BranchContainer<T>, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f65609a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Image f65610b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final List<T> f65611c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f65612d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Lazy f65613e;

    @NotNull
    public static final b Companion = new b();

    @JvmField
    @NotNull
    public static final Parcelable.Creator<C3345r4<BranchEntity>> CREATOR = new a();

    /* renamed from: io.branch.search.internal.r4$a */
    public static final class a implements Parcelable.Creator<C3345r4<BranchEntity>> {
        @Override // android.os.Parcelable.Creator
        public final C3345r4<BranchEntity> createFromParcel(Parcel parcel) {
            BranchEntity branchEntity;
            Intrinsics.g(parcel, "parcel");
            String string = parcel.readString();
            Image image = (Image) parcel.readParcelable(Image.class.getClassLoader());
            int i5 = parcel.readInt();
            ArrayList arrayList = new ArrayList();
            for (int i11 = 0; i11 < i5; i11++) {
                byte[] bArrCreateByteArray = parcel.createByteArray();
                if (bArrCreateByteArray == null) {
                    branchEntity = null;
                } else {
                    Parcel parcelObtain = Parcel.obtain();
                    parcelObtain.unmarshall(bArrCreateByteArray, 0, bArrCreateByteArray.length);
                    parcelObtain.setDataPosition(0);
                    branchEntity = (BranchEntity) parcelObtain.readParcelable(BranchEntity.class.getClassLoader());
                    parcelObtain.recycle();
                }
                if (branchEntity != null) {
                    arrayList.add(branchEntity);
                }
            }
            String string2 = parcel.readString();
            if (string2 == null) {
                string2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            return new C3345r4<>(string, image, arrayList, string2);
        }

        @Override // android.os.Parcelable.Creator
        public final C3345r4<BranchEntity>[] newArray(int i5) {
            return new C3345r4[i5];
        }
    }

    /* renamed from: io.branch.search.internal.r4$b */
    public static final class b {
    }

    public C3345r4(@Nullable String str, @Nullable Image image, @NotNull ArrayList content, @NotNull String containerType) {
        Intrinsics.g(content, "content");
        Intrinsics.g(containerType, "containerType");
        this.f65609a = str;
        this.f65610b = image;
        this.f65611c = content;
        this.f65612d = containerType;
        this.f65613e = LazyKt.a(new C3362s4(this));
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3345r4)) {
            return false;
        }
        C3345r4 c3345r4 = (C3345r4) obj;
        return Intrinsics.b(this.f65609a, c3345r4.f65609a) && Intrinsics.b(this.f65610b, c3345r4.f65610b) && Intrinsics.b(this.f65611c, c3345r4.f65611c) && Intrinsics.b(this.f65612d, c3345r4.f65612d);
    }

    @Override // io.branch.search.ui.BranchContainer
    @NotNull
    public final String getContainerType() {
        return this.f65612d;
    }

    @Override // io.branch.search.ui.BranchContainer
    @NotNull
    public final List<T> getContent() {
        return this.f65611c;
    }

    @Override // io.branch.search.ui.BranchContainer
    @Nullable
    public final CharSequence getHeader() {
        return (CharSequence) this.f65613e.getValue();
    }

    @Nullable
    public final Image getImage() {
        return this.f65610b;
    }

    public final int hashCode() {
        String str = this.f65609a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Image image = this.f65610b;
        return this.f65612d.hashCode() + C3265m8.a(this.f65611c, (iHashCode + (image != null ? image.hashCode() : 0)) * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ContainerImpl(_header=");
        sb2.append(this.f65609a);
        sb2.append(", image=");
        sb2.append(this.f65610b);
        sb2.append(", content=");
        sb2.append(this.f65611c);
        sb2.append(", containerType=");
        return Z.a(sb2, this.f65612d, ')');
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(@NotNull Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f65609a);
        dest.writeParcelable(this.f65610b, i5);
        dest.writeInt(this.f65611c.size());
        for (T branchEntity : this.f65611c) {
            BranchEntity.Companion.getClass();
            Intrinsics.g(branchEntity, "branchEntity");
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeParcelable(branchEntity, 0);
            byte[] bArrMarshall = parcelObtain.marshall();
            parcelObtain.recycle();
            Intrinsics.f(bArrMarshall, "parcel.marshall()\n      …also { parcel.recycle() }");
            dest.writeByteArray(bArrMarshall);
        }
        dest.writeString(this.f65612d);
    }
}
