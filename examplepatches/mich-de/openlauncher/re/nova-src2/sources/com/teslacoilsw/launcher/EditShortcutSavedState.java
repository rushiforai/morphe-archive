package com.teslacoilsw.launcher;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.launcher.util.NamedIntent;
import ji.a;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/EditShortcutSavedState;", "Landroid/os/Parcelable;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class EditShortcutSavedState implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<EditShortcutSavedState> CREATOR = new a(29);

    /* renamed from: a, reason: collision with root package name */
    public final int f45617a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f45618b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45619c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f45620d;

    /* renamed from: e, reason: collision with root package name */
    public final NamedIntent f45621e;

    /* renamed from: f, reason: collision with root package name */
    public final NamedIntent f45622f;

    public EditShortcutSavedState(int i5, boolean z11, String str, boolean z12, NamedIntent namedIntent, NamedIntent namedIntent2) {
        this.f45617a = i5;
        this.f45618b = z11;
        this.f45619c = str;
        this.f45620d = z12;
        this.f45621e = namedIntent;
        this.f45622f = namedIntent2;
    }

    /* renamed from: b, reason: from getter */
    public final int getF45617a() {
        return this.f45617a;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f45617a);
        parcel.writeInt(this.f45618b ? 1 : 0);
        parcel.writeString(this.f45619c);
        parcel.writeInt(this.f45620d ? 1 : 0);
        NamedIntent namedIntent = this.f45621e;
        if (namedIntent == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            namedIntent.writeToParcel(parcel, i5);
        }
        NamedIntent namedIntent2 = this.f45622f;
        if (namedIntent2 == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            namedIntent2.writeToParcel(parcel, i5);
        }
    }
}
