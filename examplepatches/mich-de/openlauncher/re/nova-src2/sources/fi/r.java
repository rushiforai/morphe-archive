package fi;

import android.location.Location;
import com.google.android.gms.tasks.Task;

/* loaded from: classes3.dex */
public final class r implements h, c, e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ j f55156a;

    public /* synthetic */ r(j jVar) {
        this.f55156a = jVar;
    }

    @Override // fi.h
    public void onCanceled() {
        this.f55156a.f55135a.w();
    }

    @Override // fi.e
    public void onComplete(Task task) {
        if (task.q()) {
            return;
        }
        Exception excL = task.l();
        excL.getClass();
        this.f55156a.b(excL);
    }

    @Override // fi.c
    public Object then(Task task) {
        boolean zQ = task.q();
        j jVar = this.f55156a;
        if (zQ) {
            jVar.c((Location) task.m());
            return null;
        }
        Exception excL = task.l();
        excL.getClass();
        jVar.b(excL);
        return null;
    }
}
