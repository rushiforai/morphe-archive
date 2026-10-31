package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
final class zzaup extends zzaut {
    private static final Class zza = Collections.unmodifiableList(Collections.EMPTY_LIST).getClass();

    private zzaup() {
        throw null;
    }

    private static List zzf(Object obj, long j11, int i5) {
        List list = (List) zzawx.zzf(obj, j11);
        if (list.isEmpty()) {
            List zzaumVar = list instanceof zzaun ? new zzaum(i5) : ((list instanceof zzavo) && (list instanceof zzauc)) ? ((zzauc) list).zzd(i5) : new ArrayList(i5);
            zzawx.zzs(obj, j11, zzaumVar);
            return zzaumVar;
        }
        if (zza.isAssignableFrom(list.getClass())) {
            ArrayList arrayList = new ArrayList(list.size() + i5);
            arrayList.addAll(list);
            zzawx.zzs(obj, j11, arrayList);
            return arrayList;
        }
        if (list instanceof zzaws) {
            zzaum zzaumVar2 = new zzaum(list.size() + i5);
            zzaumVar2.addAll(zzaumVar2.size(), (zzaws) list);
            zzawx.zzs(obj, j11, zzaumVar2);
            return zzaumVar2;
        }
        if ((list instanceof zzavo) && (list instanceof zzauc)) {
            zzauc zzaucVar = (zzauc) list;
            if (!zzaucVar.zzc()) {
                zzauc zzaucVarZzd = zzaucVar.zzd(list.size() + i5);
                zzawx.zzs(obj, j11, zzaucVarZzd);
                return zzaucVarZzd;
            }
        }
        return list;
    }

    @Override // com.google.android.libraries.places.internal.zzaut
    public final List zza(Object obj, long j11) {
        return zzf(obj, j11, 10);
    }

    @Override // com.google.android.libraries.places.internal.zzaut
    public final void zzb(Object obj, long j11) {
        Object objUnmodifiableList;
        List list = (List) zzawx.zzf(obj, j11);
        if (list instanceof zzaun) {
            objUnmodifiableList = ((zzaun) list).zze();
        } else {
            if (zza.isAssignableFrom(list.getClass())) {
                return;
            }
            if ((list instanceof zzavo) && (list instanceof zzauc)) {
                zzauc zzaucVar = (zzauc) list;
                if (zzaucVar.zzc()) {
                    zzaucVar.zzb();
                    return;
                }
                return;
            }
            objUnmodifiableList = Collections.unmodifiableList(list);
        }
        zzawx.zzs(obj, j11, objUnmodifiableList);
    }

    @Override // com.google.android.libraries.places.internal.zzaut
    public final void zzc(Object obj, Object obj2, long j11) {
        List list = (List) zzawx.zzf(obj2, j11);
        List listZzf = zzf(obj, j11, list.size());
        int size = listZzf.size();
        int size2 = list.size();
        if (size > 0 && size2 > 0) {
            listZzf.addAll(list);
        }
        if (size > 0) {
            list = listZzf;
        }
        zzawx.zzs(obj, j11, list);
    }

    public /* synthetic */ zzaup(zzauo zzauoVar) {
        super(null);
    }
}
