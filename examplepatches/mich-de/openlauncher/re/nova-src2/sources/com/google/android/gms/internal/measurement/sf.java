package com.google.android.gms.internal.measurement;

import android.net.Uri;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.IOException;

/* loaded from: classes3.dex */
public final /* synthetic */ class sf implements cl.d0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33069a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ vf f33070b;

    public /* synthetic */ sf(vf vfVar, int i5) {
        this.f33069a = i5;
        this.f33070b = vfVar;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) throws zzsk {
        ListenableFuture listenableFuture;
        switch (this.f33069a) {
            case 0:
                vf vfVar = this.f33070b;
                synchronized (vfVar.f33156i) {
                    listenableFuture = (ListenableFuture) vfVar.f33150c;
                }
                return listenableFuture;
            case 1:
                vf vfVar2 = this.f33070b;
                return cl.w0.b(vfVar2.e((Uri) cl.w0.a((ListenableFuture) vfVar2.f33149b)));
            case 2:
                vf vfVar3 = this.f33070b;
                vfVar3.f((Uri) cl.w0.a((ListenableFuture) vfVar3.f33149b), obj);
                return cl.z0.f20092b;
            default:
                vf vfVar4 = this.f33070b;
                Uri uri = (Uri) obj;
                Uri uriBuild = uri.buildUpon().path(String.valueOf(uri.getPath()).concat(".bak")).build();
                try {
                    ye yeVar = (ye) vfVar4.f33153f;
                    we weVarB = yeVar.b(uriBuild);
                    if (weVarB.f33193a.b(weVarB.f33196d)) {
                        we weVarB2 = yeVar.b(uriBuild);
                        we weVarB3 = yeVar.b(uri);
                        nf nfVar = weVarB2.f33193a;
                        if (nfVar != weVarB3.f33193a) {
                            throw new zzsk("Cannot rename file across backends");
                        }
                        nfVar.f(weVarB2.f33196d, weVarB3.f33196d);
                    }
                    return cl.z0.f20092b;
                } catch (IOException e3) {
                    return new cl.y0(e3);
                }
        }
    }
}
