package com.google.android.gms.internal.measurement;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* loaded from: classes3.dex */
public abstract class p6 implements IInterface {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32952a;

    /* renamed from: b, reason: collision with root package name */
    public final IBinder f32953b;

    /* renamed from: c, reason: collision with root package name */
    public final String f32954c;

    public /* synthetic */ p6(IBinder iBinder, String str, int i5) {
        this.f32952a = i5;
        this.f32953b = iBinder;
        this.f32954c = str;
    }

    public Parcel T() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken(this.f32954c);
        return parcelObtain;
    }

    public void U(Parcel parcel, int i5) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            this.f32953b.transact(i5, parcel, parcelObtain, 0);
            parcelObtain.readException();
        } finally {
            parcel.recycle();
            parcelObtain.recycle();
        }
    }

    public Parcel V(Parcel parcel, int i5) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            try {
                this.f32953b.transact(i5, parcel, parcelObtain, 0);
                parcelObtain.readException();
                return parcelObtain;
            } catch (RuntimeException e3) {
                parcelObtain.recycle();
                throw e3;
            }
        } finally {
            parcel.recycle();
        }
    }

    public Parcel W(Parcel parcel, int i5) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            try {
                this.f32953b.transact(i5, parcel, parcelObtain, 0);
                parcelObtain.readException();
                return parcelObtain;
            } catch (RuntimeException e3) {
                parcelObtain.recycle();
                throw e3;
            }
        } finally {
            parcel.recycle();
        }
    }

    public Parcel X() {
        switch (this.f32952a) {
            case 0:
                Parcel parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken(this.f32954c);
                return parcelObtain;
            case 5:
                Parcel parcelObtain2 = Parcel.obtain();
                parcelObtain2.writeInterfaceToken(this.f32954c);
                return parcelObtain2;
            default:
                Parcel parcelObtain3 = Parcel.obtain();
                parcelObtain3.writeInterfaceToken(this.f32954c);
                return parcelObtain3;
        }
    }

    public void Y(Parcel parcel, int i5) {
        try {
            this.f32953b.transact(i5, parcel, null, 1);
        } finally {
            parcel.recycle();
        }
    }

    public void Z(Parcel parcel, int i5) {
        Parcel parcelObtain;
        switch (this.f32952a) {
            case 0:
                parcelObtain = Parcel.obtain();
                try {
                    this.f32953b.transact(i5, parcel, parcelObtain, 0);
                    parcelObtain.readException();
                    return;
                } finally {
                }
            case 4:
                parcelObtain = Parcel.obtain();
                try {
                    this.f32953b.transact(i5, parcel, parcelObtain, 0);
                    parcelObtain.readException();
                    return;
                } finally {
                }
            case 5:
                parcelObtain = Parcel.obtain();
                try {
                    this.f32953b.transact(i5, parcel, parcelObtain, 0);
                    parcelObtain.readException();
                    return;
                } finally {
                }
            default:
                try {
                    this.f32953b.transact(i5, parcel, null, 1);
                    return;
                } finally {
                    parcel.recycle();
                }
        }
    }

    public void a0(Parcel parcel) {
        try {
            this.f32953b.transact(2, parcel, null, 1);
        } finally {
            parcel.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        switch (this.f32952a) {
        }
        return this.f32953b;
    }

    public Parcel b0() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken(this.f32954c);
        return parcelObtain;
    }

    public Parcel c0(Parcel parcel, int i5) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            try {
                this.f32953b.transact(i5, parcel, parcelObtain, 0);
                parcelObtain.readException();
                return parcelObtain;
            } catch (RuntimeException e3) {
                parcelObtain.recycle();
                throw e3;
            }
        } finally {
            parcel.recycle();
        }
    }

    public void d0(Parcel parcel, int i5) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            this.f32953b.transact(i5, parcel, parcelObtain, 0);
            parcelObtain.readException();
        } finally {
            parcel.recycle();
            parcelObtain.recycle();
        }
    }

    public void e0(Parcel parcel, int i5) {
        try {
            this.f32953b.transact(i5, parcel, null, 1);
        } finally {
            parcel.recycle();
        }
    }
}
