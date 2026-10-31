package p80;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import java.util.ArrayList;
import ninja.sesame.lib.bridge.v1.SesameShortcut;
import ninja.sesame.lib.bridge.v1.ShortcutAction;

/* loaded from: classes5.dex */
public final class a implements c {

    /* renamed from: a, reason: collision with root package name */
    public IBinder f82455a;

    public final Intent T(ShortcutAction shortcutAction) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            if (shortcutAction != null) {
                parcelObtain.writeInt(1);
                shortcutAction.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.f82455a.transact(7, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            Intent intent = parcelObtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(parcelObtain2) : null;
            parcelObtain2.recycle();
            parcelObtain.recycle();
            return intent;
        } catch (Throwable th2) {
            parcelObtain2.recycle();
            parcelObtain.recycle();
            throw th2;
        }
    }

    public final Bundle U(long j11, long j12, int i5, String[] strArr) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            parcelObtain.writeLong(j11);
            parcelObtain.writeLong(j12);
            parcelObtain.writeInt(i5);
            parcelObtain.writeStringArray(strArr);
            this.f82455a.transact(10, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcelObtain2) : null;
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    public final Bundle V(SesameShortcut sesameShortcut) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            if (sesameShortcut != null) {
                parcelObtain.writeInt(1);
                sesameShortcut.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.f82455a.transact(9, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            Bundle bundle = parcelObtain2.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcelObtain2) : null;
            parcelObtain2.recycle();
            parcelObtain.recycle();
            return bundle;
        } catch (Throwable th2) {
            parcelObtain2.recycle();
            parcelObtain.recycle();
            throw th2;
        }
    }

    public final ArrayList W(int i5, String str) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            parcelObtain.writeString(str);
            parcelObtain.writeInt(i5);
            this.f82455a.transact(5, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.createTypedArrayList(SesameShortcut.CREATOR);
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    public final ArrayList X(int i5, String str, String[] strArr) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            parcelObtain.writeString(str);
            parcelObtain.writeInt(i5);
            parcelObtain.writeStringArray(strArr);
            this.f82455a.transact(1, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.createTypedArrayList(SesameShortcut.CREATOR);
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    public final ArrayList Y(ComponentName componentName, int i5, String[] strArr) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            parcelObtain.writeInt(1);
            componentName.writeToParcel(parcelObtain, 0);
            parcelObtain.writeInt(i5);
            parcelObtain.writeStringArray(strArr);
            this.f82455a.transact(2, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.createTypedArrayList(SesameShortcut.CREATOR);
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    public final ArrayList Z(String str) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            parcelObtain.writeString(str);
            this.f82455a.transact(4, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.createTypedArrayList(SesameShortcut.CREATOR);
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    public final void a0(String str, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            parcelObtain.writeString(str);
            parcelObtain.writeInt(1);
            bundle.writeToParcel(parcelObtain, 0);
            this.f82455a.transact(13, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.f82455a;
    }

    public final ArrayList b0(int i5, String str, String[] strArr) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            parcelObtain.writeString(str);
            parcelObtain.writeInt(i5);
            parcelObtain.writeStringArray(strArr);
            this.f82455a.transact(3, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.createTypedArrayList(SesameShortcut.CREATOR);
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    public final void c0(String str) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            parcelObtain.writeString(str);
            this.f82455a.transact(12, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    public final void d0(ShortcutAction shortcutAction) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            if (shortcutAction != null) {
                parcelObtain.writeInt(1);
                shortcutAction.writeToParcel(parcelObtain, 0);
            } else {
                parcelObtain.writeInt(0);
            }
            this.f82455a.transact(8, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            parcelObtain2.recycle();
            parcelObtain.recycle();
        } catch (Throwable th2) {
            parcelObtain2.recycle();
            parcelObtain.recycle();
            throw th2;
        }
    }

    public final Bundle e0() {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("ninja.sesame.lib.bridge.v1_1.ISesameConnect");
            this.f82455a.transact(14, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcelObtain2) : null;
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }
}
