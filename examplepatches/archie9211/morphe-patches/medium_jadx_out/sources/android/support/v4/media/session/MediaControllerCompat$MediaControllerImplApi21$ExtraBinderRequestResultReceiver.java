package android.support.v4.media.session;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcelable;
import android.os.ResultReceiver;
import androidx.versionedparcelable.ParcelImpl;
import defpackage.f49;
import defpackage.hu5;
import defpackage.iu5;
import defpackage.pse;
import defpackage.rd6;
import defpackage.rl7;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
class MediaControllerCompat$MediaControllerImplApi21$ExtraBinderRequestResultReceiver extends ResultReceiver {
    public WeakReference a;

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // android.os.ResultReceiver
    public final void onReceiveResult(int i, Bundle bundle) {
        iu5 iu5Var;
        pse pseVar;
        Bundle bundle2;
        a aVar = (a) this.a.get();
        if (aVar == null || bundle == null) {
            return;
        }
        synchronized (aVar.b) {
            try {
                MediaSessionCompat$Token mediaSessionCompat$Token = aVar.e;
                IBinder binder = bundle.getBinder("android.support.v4.media.session.EXTRA_BINDER");
                int i2 = b.f;
                if (binder == null) {
                    iu5Var = null;
                } else {
                    IInterface iInterfaceQueryLocalInterface = binder.queryLocalInterface("android.support.v4.media.session.IMediaSession");
                    if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof iu5)) {
                        hu5 hu5Var = new hu5();
                        hu5Var.e = binder;
                        iu5Var = hu5Var;
                    } else {
                        iu5Var = (iu5) iInterfaceQueryLocalInterface;
                    }
                }
                mediaSessionCompat$Token.b(iu5Var);
                MediaSessionCompat$Token mediaSessionCompat$Token2 = aVar.e;
                try {
                    bundle2 = (Bundle) bundle.getParcelable("android.support.v4.media.session.SESSION_TOKEN2");
                } catch (RuntimeException unused) {
                }
                if (bundle2 == null) {
                    pseVar = null;
                } else {
                    bundle2.setClassLoader(f49.class.getClassLoader());
                    Parcelable parcelable = bundle2.getParcelable("a");
                    if (!(parcelable instanceof ParcelImpl)) {
                        throw new IllegalArgumentException("Invalid parcel");
                    }
                    pseVar = ((ParcelImpl) parcelable).a;
                }
                mediaSessionCompat$Token2.c(pseVar);
                ArrayList arrayList = aVar.c;
                if (aVar.e.a() != null) {
                    Iterator it2 = arrayList.iterator();
                    if (!it2.hasNext()) {
                        arrayList.clear();
                    } else {
                        if (it2.next() == null) {
                            aVar.d.put(null, new rl7());
                            throw null;
                        }
                        rd6.m();
                    }
                }
            } finally {
            }
        }
    }
}
