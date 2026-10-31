package wy;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmission;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        String string = parcel.readString();
        Intrinsics.d(string);
        String[] strArrCreateStringArray = parcel.createStringArray();
        Intrinsics.d(strArrCreateStringArray);
        return new SmartFolderSubmission(string, strArrCreateStringArray);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new SmartFolderSubmission[i5];
    }

    @NotNull
    public final KSerializer<SmartFolderSubmission> serializer() {
        return a.f94888a;
    }
}
