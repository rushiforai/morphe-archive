package c60;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class d implements Externalizable {
    public boolean A;
    public f B;
    public boolean C;
    public f D;
    public boolean E;
    public f F;
    public boolean G;
    public f H;
    public String I;
    public int J;
    public String K;
    public boolean L;
    public String M;
    public boolean N;
    public String O;
    public boolean P;
    public String Q;
    public boolean R;
    public String S;
    public boolean T;
    public String U;
    public boolean V;
    public ArrayList W;
    public ArrayList X;
    public boolean Y;
    public boolean Z;

    /* renamed from: a, reason: collision with root package name */
    public boolean f19772a;

    /* renamed from: a0, reason: collision with root package name */
    public String f19773a0;

    /* renamed from: b, reason: collision with root package name */
    public f f19774b;

    /* renamed from: b0, reason: collision with root package name */
    public boolean f19775b0;

    /* renamed from: c, reason: collision with root package name */
    public boolean f19776c;

    /* renamed from: d, reason: collision with root package name */
    public f f19777d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f19778e;

    /* renamed from: f, reason: collision with root package name */
    public f f19779f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f19780g;

    /* renamed from: h, reason: collision with root package name */
    public f f19781h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f19782i;

    /* renamed from: j, reason: collision with root package name */
    public f f19783j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f19784k;

    /* renamed from: l, reason: collision with root package name */
    public f f19785l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f19786m;
    public f n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public f f19787p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f19788q;

    /* renamed from: r, reason: collision with root package name */
    public f f19789r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f19790s;

    /* renamed from: t, reason: collision with root package name */
    public f f19791t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f19792u;

    /* renamed from: v, reason: collision with root package name */
    public f f19793v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f19794w;

    /* renamed from: x, reason: collision with root package name */
    public f f19795x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f19796y;

    /* renamed from: z, reason: collision with root package name */
    public f f19797z;

    @Override // java.io.Externalizable
    public final void readExternal(ObjectInput objectInput) throws IOException {
        if (objectInput.readBoolean()) {
            f fVar = new f();
            fVar.readExternal(objectInput);
            this.f19772a = true;
            this.f19774b = fVar;
        }
        if (objectInput.readBoolean()) {
            f fVar2 = new f();
            fVar2.readExternal(objectInput);
            this.f19776c = true;
            this.f19777d = fVar2;
        }
        if (objectInput.readBoolean()) {
            f fVar3 = new f();
            fVar3.readExternal(objectInput);
            this.f19778e = true;
            this.f19779f = fVar3;
        }
        if (objectInput.readBoolean()) {
            f fVar4 = new f();
            fVar4.readExternal(objectInput);
            this.f19780g = true;
            this.f19781h = fVar4;
        }
        if (objectInput.readBoolean()) {
            f fVar5 = new f();
            fVar5.readExternal(objectInput);
            this.f19782i = true;
            this.f19783j = fVar5;
        }
        if (objectInput.readBoolean()) {
            f fVar6 = new f();
            fVar6.readExternal(objectInput);
            this.f19784k = true;
            this.f19785l = fVar6;
        }
        if (objectInput.readBoolean()) {
            f fVar7 = new f();
            fVar7.readExternal(objectInput);
            this.f19786m = true;
            this.n = fVar7;
        }
        if (objectInput.readBoolean()) {
            f fVar8 = new f();
            fVar8.readExternal(objectInput);
            this.o = true;
            this.f19787p = fVar8;
        }
        if (objectInput.readBoolean()) {
            f fVar9 = new f();
            fVar9.readExternal(objectInput);
            this.f19788q = true;
            this.f19789r = fVar9;
        }
        if (objectInput.readBoolean()) {
            f fVar10 = new f();
            fVar10.readExternal(objectInput);
            this.f19790s = true;
            this.f19791t = fVar10;
        }
        if (objectInput.readBoolean()) {
            f fVar11 = new f();
            fVar11.readExternal(objectInput);
            this.f19792u = true;
            this.f19793v = fVar11;
        }
        if (objectInput.readBoolean()) {
            f fVar12 = new f();
            fVar12.readExternal(objectInput);
            this.f19794w = true;
            this.f19795x = fVar12;
        }
        if (objectInput.readBoolean()) {
            f fVar13 = new f();
            fVar13.readExternal(objectInput);
            this.f19796y = true;
            this.f19797z = fVar13;
        }
        if (objectInput.readBoolean()) {
            f fVar14 = new f();
            fVar14.readExternal(objectInput);
            this.A = true;
            this.B = fVar14;
        }
        if (objectInput.readBoolean()) {
            f fVar15 = new f();
            fVar15.readExternal(objectInput);
            this.C = true;
            this.D = fVar15;
        }
        if (objectInput.readBoolean()) {
            f fVar16 = new f();
            fVar16.readExternal(objectInput);
            this.E = true;
            this.F = fVar16;
        }
        if (objectInput.readBoolean()) {
            f fVar17 = new f();
            fVar17.readExternal(objectInput);
            this.G = true;
            this.H = fVar17;
        }
        this.I = objectInput.readUTF();
        this.J = objectInput.readInt();
        this.K = objectInput.readUTF();
        if (objectInput.readBoolean()) {
            String utf = objectInput.readUTF();
            this.L = true;
            this.M = utf;
        }
        if (objectInput.readBoolean()) {
            String utf2 = objectInput.readUTF();
            this.N = true;
            this.O = utf2;
        }
        if (objectInput.readBoolean()) {
            String utf3 = objectInput.readUTF();
            this.P = true;
            this.Q = utf3;
        }
        if (objectInput.readBoolean()) {
            String utf4 = objectInput.readUTF();
            this.R = true;
            this.S = utf4;
        }
        if (objectInput.readBoolean()) {
            String utf5 = objectInput.readUTF();
            this.T = true;
            this.U = utf5;
        }
        this.V = objectInput.readBoolean();
        int i5 = objectInput.readInt();
        for (int i11 = 0; i11 < i5; i11++) {
            c cVar = new c();
            cVar.readExternal(objectInput);
            this.W.add(cVar);
        }
        int i12 = objectInput.readInt();
        for (int i13 = 0; i13 < i12; i13++) {
            c cVar2 = new c();
            cVar2.readExternal(objectInput);
            this.X.add(cVar2);
        }
        this.Y = objectInput.readBoolean();
        if (objectInput.readBoolean()) {
            String utf6 = objectInput.readUTF();
            this.Z = true;
            this.f19773a0 = utf6;
        }
        this.f19775b0 = objectInput.readBoolean();
    }

    @Override // java.io.Externalizable
    public final void writeExternal(ObjectOutput objectOutput) throws IOException {
        ArrayList arrayList = this.X;
        ArrayList arrayList2 = this.W;
        objectOutput.writeBoolean(this.f19772a);
        if (this.f19772a) {
            this.f19774b.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19776c);
        if (this.f19776c) {
            this.f19777d.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19778e);
        if (this.f19778e) {
            this.f19779f.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19780g);
        if (this.f19780g) {
            this.f19781h.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19782i);
        if (this.f19782i) {
            this.f19783j.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19784k);
        if (this.f19784k) {
            this.f19785l.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19786m);
        if (this.f19786m) {
            this.n.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.o);
        if (this.o) {
            this.f19787p.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19788q);
        if (this.f19788q) {
            this.f19789r.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19790s);
        if (this.f19790s) {
            this.f19791t.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19792u);
        if (this.f19792u) {
            this.f19793v.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19794w);
        if (this.f19794w) {
            this.f19795x.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.f19796y);
        if (this.f19796y) {
            this.f19797z.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.A);
        if (this.A) {
            this.B.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.C);
        if (this.C) {
            this.D.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.E);
        if (this.E) {
            this.F.writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.G);
        if (this.G) {
            this.H.writeExternal(objectOutput);
        }
        objectOutput.writeUTF(this.I);
        objectOutput.writeInt(this.J);
        objectOutput.writeUTF(this.K);
        objectOutput.writeBoolean(this.L);
        if (this.L) {
            objectOutput.writeUTF(this.M);
        }
        objectOutput.writeBoolean(this.N);
        if (this.N) {
            objectOutput.writeUTF(this.O);
        }
        objectOutput.writeBoolean(this.P);
        if (this.P) {
            objectOutput.writeUTF(this.Q);
        }
        objectOutput.writeBoolean(this.R);
        if (this.R) {
            objectOutput.writeUTF(this.S);
        }
        objectOutput.writeBoolean(this.T);
        if (this.T) {
            objectOutput.writeUTF(this.U);
        }
        objectOutput.writeBoolean(this.V);
        int size = arrayList2.size();
        objectOutput.writeInt(size);
        for (int i5 = 0; i5 < size; i5++) {
            ((c) arrayList2.get(i5)).writeExternal(objectOutput);
        }
        int size2 = arrayList.size();
        objectOutput.writeInt(size2);
        for (int i11 = 0; i11 < size2; i11++) {
            ((c) arrayList.get(i11)).writeExternal(objectOutput);
        }
        objectOutput.writeBoolean(this.Y);
        objectOutput.writeBoolean(this.Z);
        if (this.Z) {
            objectOutput.writeUTF(this.f19773a0);
        }
        objectOutput.writeBoolean(this.f19775b0);
    }
}
