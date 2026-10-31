package c60;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class e implements Externalizable {

    /* renamed from: a, reason: collision with root package name */
    public ArrayList f19798a;

    @Override // java.io.Externalizable
    public final void readExternal(ObjectInput objectInput) throws IOException {
        int i5 = objectInput.readInt();
        for (int i11 = 0; i11 < i5; i11++) {
            d dVar = new d();
            dVar.f19774b = null;
            dVar.f19777d = null;
            dVar.f19779f = null;
            dVar.f19781h = null;
            dVar.f19783j = null;
            dVar.f19785l = null;
            dVar.n = null;
            dVar.f19787p = null;
            dVar.f19789r = null;
            dVar.f19791t = null;
            dVar.f19793v = null;
            dVar.f19795x = null;
            dVar.f19797z = null;
            dVar.B = null;
            dVar.D = null;
            dVar.F = null;
            dVar.H = null;
            dVar.I = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            dVar.J = 0;
            dVar.K = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            dVar.M = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            dVar.O = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            dVar.Q = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            dVar.S = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            dVar.U = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            dVar.V = false;
            dVar.W = new ArrayList();
            dVar.X = new ArrayList();
            dVar.Y = false;
            dVar.f19773a0 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            dVar.f19775b0 = false;
            dVar.readExternal(objectInput);
            this.f19798a.add(dVar);
        }
    }

    @Override // java.io.Externalizable
    public final void writeExternal(ObjectOutput objectOutput) throws IOException {
        ArrayList arrayList = this.f19798a;
        int size = arrayList.size();
        objectOutput.writeInt(size);
        for (int i5 = 0; i5 < size; i5++) {
            ((d) arrayList.get(i5)).writeExternal(objectOutput);
        }
    }
}
