package fa;

import android.content.ContentProviderOperation;
import android.content.ContentValues;
import android.content.OperationApplicationException;
import android.net.Uri;
import android.os.RemoteException;
import java.util.ArrayList;
import o9.g2;

/* loaded from: classes2.dex */
public final class o0 extends m0 {

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f54452d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f54453e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ p0 f54454f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o0(p0 p0Var, ArrayList arrayList, ArrayList arrayList2) {
        super(p0Var);
        this.f54454f = p0Var;
        this.f54452d = arrayList2;
        this.f54453e = arrayList;
    }

    @Override // java.lang.Runnable
    public final void run() throws RemoteException, OperationApplicationException {
        ArrayList<ContentProviderOperation> arrayList = new ArrayList<>();
        ArrayList arrayList2 = this.f54453e;
        int size = arrayList2.size();
        for (int i5 = 0; i5 < size; i5++) {
            ga.e eVar = (ga.e) arrayList2.get(i5);
            int i11 = eVar.f57289a;
            Uri uriC = g2.c(i11);
            arrayList.add(ContentProviderOperation.newUpdate(uriC).withValues((ContentValues) this.f54452d.get(i5)).build());
            a(eVar, i11);
        }
        try {
            this.f54454f.f54455a.getContentResolver().applyBatch("com.teslacoilsw.launcher.settings", arrayList);
        } catch (Exception e3) {
            e3.printStackTrace();
        }
    }
}
