package com.datadog.android.core;

import android.content.Context;
import androidx.work.Worker;
import androidx.work.WorkerParameters;
import defpackage.b18;
import defpackage.bu1;
import defpackage.d66;
import defpackage.e66;
import defpackage.f49;
import defpackage.i37;
import defpackage.j37;
import defpackage.l66;
import defpackage.n6e;
import defpackage.sg8;
import defpackage.uu2;
import defpackage.ymb;
import defpackage.ysb;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u00002\u00020\u0001:\u0001\bB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Lcom/datadog/android/core/UploadWorker;", "Landroidx/work/Worker;", "Landroid/content/Context;", "appContext", "Landroidx/work/WorkerParameters;", "workerParams", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "n6e", "dd-sdk-android-core_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class UploadWorker extends Worker {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UploadWorker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
    }

    @Override // androidx.work.Worker
    public final i37 b() {
        l66 l66VarA = uu2.a(getInputData().a("_dd.sdk.instanceName"));
        l66 l66Var = l66VarA instanceof l66 ? l66VarA : null;
        if (l66Var == null || (l66Var instanceof sg8)) {
            f49.K(ymb.a, d66.ERROR, e66.USER, b18.p, null, false, 56);
            return j37.a();
        }
        List<ysb> listA = l66Var.a();
        ArrayList arrayList = new ArrayList();
        for (ysb ysbVar : listA) {
            if (ysbVar == null) {
                ysbVar = null;
            }
            if (ysbVar != null) {
                arrayList.add(ysbVar);
            }
        }
        List listO1 = bu1.o1(arrayList);
        Collections.shuffle(listO1);
        LinkedList linkedList = new LinkedList();
        Iterator it2 = ((ArrayList) listO1).iterator();
        while (it2.hasNext()) {
            linkedList.offer(new n6e(linkedList, l66Var, (ysb) it2.next()));
        }
        while (!linkedList.isEmpty()) {
            n6e n6eVar = (n6e) linkedList.poll();
            if (n6eVar != null) {
                n6eVar.run();
            }
        }
        return j37.a();
    }
}
