package io.branch.search.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* renamed from: io.branch.search.internal.p7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3315p7 extends IInterface {

    /* renamed from: io.branch.search.internal.p7$a */
    public static abstract class a extends Binder implements InterfaceC3315p7 {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int f65476a = 0;

        /* renamed from: io.branch.search.internal.p7$a$a, reason: collision with other inner class name */
        public static class C0345a implements InterfaceC3315p7 {

            /* renamed from: a, reason: collision with root package name */
            public final IBinder f65477a;

            public C0345a(IBinder iBinder) {
                this.f65477a = iBinder;
            }

            @Override // android.os.IInterface
            public final IBinder asBinder() {
                return this.f65477a;
            }
        }

        public a() {
            attachInterface(this, "io.branch.search.service.IBranchSearchService");
        }

        @Override // android.os.IInterface
        public final IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public final boolean onTransact(int i5, Parcel parcel, Parcel parcel2, int i11) throws RemoteException {
            if (i5 != 1598968902) {
                return super.onTransact(i5, parcel, parcel2, i11);
            }
            parcel2.writeString("io.branch.search.service.IBranchSearchService");
            return true;
        }
    }
}
