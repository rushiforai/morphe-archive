package com.android.launcher3.util;

import aa.d;
import android.content.ComponentName;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import java.util.Arrays;

/* loaded from: classes.dex */
public class ComponentKey implements Parcelable {
    public static final Parcelable.Creator<ComponentKey> CREATOR = new d(20);

    /* renamed from: a, reason: collision with root package name */
    public final ComponentName f21251a;

    /* renamed from: b, reason: collision with root package name */
    public final UserHandle f21252b;

    /* renamed from: c, reason: collision with root package name */
    public final int f21253c;

    public ComponentKey(ComponentName componentName, UserHandle userHandle) {
        if (componentName == null || userHandle == null) {
            throw new NullPointerException(componentName == null ? "componentName" : "user");
        }
        this.f21251a = componentName;
        this.f21252b = userHandle;
        this.f21253c = Arrays.hashCode(new Object[]{componentName, userHandle});
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        ComponentKey componentKey = (ComponentKey) obj;
        return componentKey.f21251a.equals(this.f21251a) && componentKey.f21252b.equals(this.f21252b);
    }

    public final int hashCode() {
        return this.f21253c;
    }

    public final String toString() {
        return this.f21251a.flattenToString() + "#" + this.f21252b.hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        this.f21251a.writeToParcel(parcel, i5);
        this.f21252b.writeToParcel(parcel, i5);
    }

    public ComponentKey(Parcel parcel) {
        this(ComponentName.readFromParcel(parcel), UserHandle.readFromParcel(parcel));
    }
}
