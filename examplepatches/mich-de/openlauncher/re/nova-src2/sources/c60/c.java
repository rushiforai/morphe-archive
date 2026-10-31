package c60;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class c implements Externalizable {

    /* renamed from: d, reason: collision with root package name */
    public boolean f19767d;

    /* renamed from: g, reason: collision with root package name */
    public boolean f19770g;

    /* renamed from: a, reason: collision with root package name */
    public String f19764a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: b, reason: collision with root package name */
    public String f19765b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f19766c = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public String f19768e = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: f, reason: collision with root package name */
    public boolean f19769f = false;

    /* renamed from: h, reason: collision with root package name */
    public String f19771h = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    @Override // java.io.Externalizable
    public final void readExternal(ObjectInput objectInput) throws IOException {
        this.f19764a = objectInput.readUTF();
        this.f19765b = objectInput.readUTF();
        int i5 = objectInput.readInt();
        for (int i11 = 0; i11 < i5; i11++) {
            this.f19766c.add(objectInput.readUTF());
        }
        if (objectInput.readBoolean()) {
            String utf = objectInput.readUTF();
            this.f19767d = true;
            this.f19768e = utf;
        }
        if (objectInput.readBoolean()) {
            String utf2 = objectInput.readUTF();
            this.f19770g = true;
            this.f19771h = utf2;
        }
        this.f19769f = objectInput.readBoolean();
    }

    @Override // java.io.Externalizable
    public final void writeExternal(ObjectOutput objectOutput) throws IOException {
        objectOutput.writeUTF(this.f19764a);
        objectOutput.writeUTF(this.f19765b);
        ArrayList arrayList = this.f19766c;
        int size = arrayList.size();
        objectOutput.writeInt(size);
        for (int i5 = 0; i5 < size; i5++) {
            objectOutput.writeUTF((String) arrayList.get(i5));
        }
        objectOutput.writeBoolean(this.f19767d);
        if (this.f19767d) {
            objectOutput.writeUTF(this.f19768e);
        }
        objectOutput.writeBoolean(this.f19770g);
        if (this.f19770g) {
            objectOutput.writeUTF(this.f19771h);
        }
        objectOutput.writeBoolean(this.f19769f);
    }
}
