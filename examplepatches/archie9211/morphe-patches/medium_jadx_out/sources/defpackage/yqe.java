package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yqe extends xqe {
    public i69[] a;
    public String b;
    public int c;

    public yqe(yqe yqeVar) {
        this.a = null;
        this.c = 0;
        this.b = yqeVar.b;
        this.a = wo7.n(yqeVar.a);
    }

    public i69[] getPathData() {
        return this.a;
    }

    public String getPathName() {
        return this.b;
    }

    public void setPathData(i69[] i69VarArr) {
        if (!wo7.j(this.a, i69VarArr)) {
            this.a = wo7.n(i69VarArr);
            return;
        }
        i69[] i69VarArr2 = this.a;
        for (int i = 0; i < i69VarArr.length; i++) {
            i69VarArr2[i].a = i69VarArr[i].a;
            int i2 = 0;
            while (true) {
                float[] fArr = i69VarArr[i].b;
                if (i2 < fArr.length) {
                    i69VarArr2[i].b[i2] = fArr[i2];
                    i2++;
                }
            }
        }
    }

    public yqe() {
        this.a = null;
        this.c = 0;
    }
}
