package wy;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmission;
import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmissionPayload;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class g implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        b bVar = SmartFolderSubmission.CREATOR;
        Object[] objArrCreateTypedArray = parcel.createTypedArray(bVar);
        Intrinsics.d(objArrCreateTypedArray);
        Object[] objArrCreateTypedArray2 = parcel.createTypedArray(bVar);
        Intrinsics.d(objArrCreateTypedArray2);
        return new SmartFolderSubmissionPayload((SmartFolderSubmission[]) objArrCreateTypedArray, (SmartFolderSubmission[]) objArrCreateTypedArray2);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new SmartFolderSubmissionPayload[i5];
    }

    @NotNull
    public final KSerializer<SmartFolderSubmissionPayload> serializer() {
        return f.f94896a;
    }
}
