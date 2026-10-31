package c60;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class f implements Externalizable {

    /* renamed from: a, reason: collision with root package name */
    public boolean f19799a;

    /* renamed from: e, reason: collision with root package name */
    public boolean f19803e;

    /* renamed from: b, reason: collision with root package name */
    public String f19800b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f19801c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f19802d = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public String f19804f = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    @Override // java.io.Externalizable
    public final void readExternal(ObjectInput objectInput) throws IOException {
        if (objectInput.readBoolean()) {
            String utf = objectInput.readUTF();
            this.f19799a = true;
            this.f19800b = utf;
        }
        int i5 = objectInput.readInt();
        for (int i11 = 0; i11 < i5; i11++) {
            this.f19801c.add(Integer.valueOf(objectInput.readInt()));
        }
        int i12 = objectInput.readInt();
        for (int i13 = 0; i13 < i12; i13++) {
            this.f19802d.add(Integer.valueOf(objectInput.readInt()));
        }
        if (objectInput.readBoolean()) {
            String utf2 = objectInput.readUTF();
            this.f19803e = true;
            this.f19804f = utf2;
        }
    }

    @Override // java.io.Externalizable
    public final void writeExternal(ObjectOutput objectOutput) throws IOException {
        objectOutput.writeBoolean(this.f19799a);
        if (this.f19799a) {
            objectOutput.writeUTF(this.f19800b);
        }
        ArrayList arrayList = this.f19801c;
        int size = arrayList.size();
        objectOutput.writeInt(size);
        for (int i5 = 0; i5 < size; i5++) {
            objectOutput.writeInt(((Integer) arrayList.get(i5)).intValue());
        }
        ArrayList arrayList2 = this.f19802d;
        int size2 = arrayList2.size();
        objectOutput.writeInt(size2);
        for (int i11 = 0; i11 < size2; i11++) {
            objectOutput.writeInt(((Integer) arrayList2.get(i11)).intValue());
        }
        objectOutput.writeBoolean(this.f19803e);
        if (this.f19803e) {
            objectOutput.writeUTF(this.f19804f);
        }
    }
}
