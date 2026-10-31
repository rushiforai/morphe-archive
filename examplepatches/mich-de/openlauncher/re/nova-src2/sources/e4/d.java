package e4;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public Object[] f52149a = new Object[256];

    /* renamed from: b, reason: collision with root package name */
    public int f52150b;

    public void a(Object obj) {
        int i5 = this.f52150b;
        Object[] objArr = this.f52149a;
        if (objArr == null) {
            objArr = new Object[16];
            this.f52149a = objArr;
        } else if (i5 == objArr.length) {
            Object[] objArr2 = new Object[(i5 >> 2) + i5];
            System.arraycopy(objArr, 0, objArr2, 0, i5);
            this.f52149a = objArr2;
            objArr = objArr2;
        }
        objArr[i5] = obj;
        this.f52150b = i5 + 1;
    }

    public void b(b bVar) {
        int i5 = this.f52150b;
        Object[] objArr = this.f52149a;
        if (i5 < objArr.length) {
            objArr[i5] = bVar;
            this.f52150b = i5 + 1;
        }
    }
}
