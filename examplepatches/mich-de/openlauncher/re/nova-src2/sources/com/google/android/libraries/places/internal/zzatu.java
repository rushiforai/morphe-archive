package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import b.c0;
import com.google.android.libraries.places.internal.zzato;
import com.google.android.libraries.places.internal.zzatu;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes3.dex */
public abstract class zzatu<MessageType extends zzatu<MessageType, BuilderType>, BuilderType extends zzato<MessageType, BuilderType>> extends zzart<MessageType, BuilderType> {
    private static final Map zzb = new ConcurrentHashMap();
    public static final /* synthetic */ int zzd = 0;
    private int zze = -1;
    protected zzawo zzc = zzawo.zzc();

    public static Object zzaA(Method method, Object obj, Object... objArr) {
        try {
            return method.invoke(obj, objArr);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException("Couldn't use Java reflection to implement protocol message reflection.", e3);
        } catch (InvocationTargetException e11) {
            Throwable cause = e11.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            if (cause instanceof Error) {
                throw ((Error) cause);
            }
            throw new RuntimeException("Unexpected exception thrown by generated accessor method.", cause);
        }
    }

    public static Object zzaB(zzavf zzavfVar, String str, Object[] objArr) {
        return new zzavr(zzavfVar, str, objArr);
    }

    public static void zzaE(Class cls, zzatu zzatuVar) {
        zzatuVar.zzaD();
        zzb.put(cls, zzatuVar);
    }

    public static final boolean zzaG(zzatu zzatuVar, boolean z11) {
        byte bByteValue = ((Byte) zzatuVar.zzb(1, null, null)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        boolean zZzh = zzavp.zza().zzb(zzatuVar.getClass()).zzh(zzatuVar);
        if (z11) {
            zzatuVar.zzb(2, true != zZzh ? null : zzatuVar, null);
        }
        return zZzh;
    }

    public static zzatu zzas(Class cls) throws ClassNotFoundException {
        Map map = zzb;
        zzatu zzatuVar = (zzatu) map.get(cls);
        if (zzatuVar == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                zzatuVar = (zzatu) map.get(cls);
            } catch (ClassNotFoundException e3) {
                throw new IllegalStateException("Class initialization cannot fail.", e3);
            }
        }
        if (zzatuVar != null) {
            return zzatuVar;
        }
        zzatu zzatuVar2 = (zzatu) ((zzatu) zzawx.zze(cls)).zzb(6, null, null);
        if (zzatuVar2 == null) {
            throw new IllegalStateException();
        }
        map.put(cls, zzatuVar2);
        return zzatuVar2;
    }

    public static zzatz zzau() {
        return zzatv.zzf();
    }

    public static zzatz zzav(zzatz zzatzVar) {
        int size = zzatzVar.size();
        return zzatzVar.zzd(size == 0 ? 10 : size + size);
    }

    public static zzaub zzaw() {
        return zzauu.zzf();
    }

    public static zzauc zzax() {
        return zzavq.zze();
    }

    public static zzauc zzay(zzauc zzaucVar) {
        int size = zzaucVar.size();
        return zzaucVar.zzd(size == 0 ? 10 : size + size);
    }

    private final int zzc(zzavt zzavtVar) {
        return zzavp.zza().zzb(getClass()).zza(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return zzavp.zza().zzb(getClass()).zzg(this, (zzatu) obj);
    }

    public final int hashCode() {
        if (zzaH()) {
            return zzap();
        }
        int i5 = this.zza;
        if (i5 != 0) {
            return i5;
        }
        int iZzap = zzap();
        this.zza = iZzap;
        return iZzap;
    }

    public final String toString() {
        return zzavh.zza(this, super.toString());
    }

    public final void zzaC() {
        zzavp.zza().zzb(getClass()).zzd(this);
        zzaD();
    }

    public final void zzaD() {
        this.zze &= LayoutNode.NotPlacedPlaceOrder;
    }

    public final void zzaF(int i5) {
        this.zze = (this.zze & Integer.MIN_VALUE) | LayoutNode.NotPlacedPlaceOrder;
    }

    public final boolean zzaH() {
        return (this.zze & Integer.MIN_VALUE) != 0;
    }

    @Override // com.google.android.libraries.places.internal.zzavf
    public final /* synthetic */ zzave zzaI() {
        return (zzato) zzb(5, null, null);
    }

    @Override // com.google.android.libraries.places.internal.zzavf
    public final /* synthetic */ zzave zzaJ() {
        zzato zzatoVar = (zzato) zzb(5, null, null);
        zzatoVar.zzq(this);
        return zzatoVar;
    }

    @Override // com.google.android.libraries.places.internal.zzavf
    public final void zzaK(zzasx zzasxVar) throws IOException {
        zzavp.zza().zzb(getClass()).zzj(this, zzasy.zza(zzasxVar));
    }

    @Override // com.google.android.libraries.places.internal.zzavg
    public final /* synthetic */ zzavf zzaL() {
        return (zzatu) zzb(6, null, null);
    }

    @Override // com.google.android.libraries.places.internal.zzavg
    public final boolean zzaM() {
        return zzaG(this, true);
    }

    @Override // com.google.android.libraries.places.internal.zzart
    public final int zzak(zzavt zzavtVar) {
        if (zzaH()) {
            int iZza = zzavtVar.zza(this);
            if (iZza >= 0) {
                return iZza;
            }
            throw new IllegalStateException(c0.h(iZza, "serialized size must be non-negative, was "));
        }
        int i5 = this.zze & LayoutNode.NotPlacedPlaceOrder;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        int iZza2 = zzavtVar.zza(this);
        if (iZza2 < 0) {
            throw new IllegalStateException(c0.h(iZza2, "serialized size must be non-negative, was "));
        }
        this.zze = (this.zze & Integer.MIN_VALUE) | iZza2;
        return iZza2;
    }

    public final int zzap() {
        return zzavp.zza().zzb(getClass()).zzb(this);
    }

    @Override // com.google.android.libraries.places.internal.zzavf
    public final int zzaq() {
        if (zzaH()) {
            int iZzc = zzc(null);
            if (iZzc >= 0) {
                return iZzc;
            }
            throw new IllegalStateException(c0.h(iZzc, "serialized size must be non-negative, was "));
        }
        int i5 = this.zze & LayoutNode.NotPlacedPlaceOrder;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        int iZzc2 = zzc(null);
        if (iZzc2 < 0) {
            throw new IllegalStateException(c0.h(iZzc2, "serialized size must be non-negative, was "));
        }
        this.zze = (this.zze & Integer.MIN_VALUE) | iZzc2;
        return iZzc2;
    }

    public final zzato zzar() {
        return (zzato) zzb(5, null, null);
    }

    public final zzatu zzat() {
        return (zzatu) zzb(4, null, null);
    }

    @Override // com.google.android.libraries.places.internal.zzavf
    public final zzavn zzaz() {
        return (zzavn) zzb(7, null, null);
    }

    public abstract Object zzb(int i5, Object obj, Object obj2);
}
