package com.medium.android.core.membership;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g04;
import defpackage.rv8;
import defpackage.tfd;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002B\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\r\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u001d\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\u0007¢\u0006\u0004\b\u000e\u0010\u000fR\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012j\u0002\b\u0013j\u0002\b\u0014¨\u0006\u0015"}, d2 = {"Lcom/medium/android/core/membership/UpsellPromoId;", "Landroid/os/Parcelable;", "", "", "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", "NONE", "INTRO_OFFER", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UpsellPromoId implements Parcelable {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ UpsellPromoId[] $VALUES;
    public static final Parcelable.Creator<UpsellPromoId> CREATOR;
    private final String value;
    public static final UpsellPromoId NONE = new UpsellPromoId("NONE", 0, "none");
    public static final UpsellPromoId INTRO_OFFER = new UpsellPromoId("INTRO_OFFER", 1, "intro_offer");

    private static final /* synthetic */ UpsellPromoId[] $values() {
        return new UpsellPromoId[]{NONE, INTRO_OFFER};
    }

    static {
        UpsellPromoId[] upsellPromoIdArr$values = $values();
        $VALUES = upsellPromoIdArr$values;
        $ENTRIES = rv8.x(upsellPromoIdArr$values);
        CREATOR = new tfd(4);
    }

    private UpsellPromoId(String str, int i, String str2) {
        this.value = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static UpsellPromoId valueOf(String str) {
        return (UpsellPromoId) Enum.valueOf(UpsellPromoId.class, str);
    }

    public static UpsellPromoId[] values() {
        return (UpsellPromoId[]) $VALUES.clone();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String getValue() {
        return this.value;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(name());
    }
}
