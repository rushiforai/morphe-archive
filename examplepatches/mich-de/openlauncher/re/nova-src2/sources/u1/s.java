package u1;

/* loaded from: classes2.dex */
public final class s extends q {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f90361d;

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f90361d) {
            case 0:
                int i5 = this.f90360c;
                this.f90360c = i5 + 2;
                return this.f90358a[i5];
            default:
                int i11 = this.f90360c;
                this.f90360c = i11 + 2;
                return this.f90358a[i11 + 1];
        }
    }
}
