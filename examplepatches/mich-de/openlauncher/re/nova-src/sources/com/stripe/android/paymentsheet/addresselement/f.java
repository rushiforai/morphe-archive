package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcelable;
import com.stripe.android.paymentsheet.addresselement.AddressLauncher$AdditionalFieldsConfiguration;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class f {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f44725a;

    static {
        int[] iArr = new int[AddressLauncher$AdditionalFieldsConfiguration.FieldConfiguration.values().length];
        try {
            Parcelable.Creator<AddressLauncher$AdditionalFieldsConfiguration.FieldConfiguration> creator = AddressLauncher$AdditionalFieldsConfiguration.FieldConfiguration.CREATOR;
            iArr[0] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            Parcelable.Creator<AddressLauncher$AdditionalFieldsConfiguration.FieldConfiguration> creator2 = AddressLauncher$AdditionalFieldsConfiguration.FieldConfiguration.CREATOR;
            iArr[1] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            Parcelable.Creator<AddressLauncher$AdditionalFieldsConfiguration.FieldConfiguration> creator3 = AddressLauncher$AdditionalFieldsConfiguration.FieldConfiguration.CREATOR;
            iArr[2] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        f44725a = iArr;
    }
}
