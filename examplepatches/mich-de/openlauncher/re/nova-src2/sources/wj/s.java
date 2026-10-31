package wj;

/* loaded from: classes3.dex */
public final class s extends d {

    /* renamed from: h, reason: collision with root package name */
    public int f94488h;

    /* renamed from: i, reason: collision with root package name */
    public int f94489i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f94490j;

    /* renamed from: k, reason: collision with root package name */
    public int f94491k;

    @Override // wj.d
    public final void a() {
        super.a();
        if (this.f94491k < 0) {
            throw new IllegalArgumentException("Stop indicator size must be >= 0.");
        }
        if (this.f94488h == 0) {
            if (this.f94414b > 0 && this.f94419g == 0) {
                throw new IllegalArgumentException("Rounded corners without gap are not supported in contiguous indeterminate animation.");
            }
            if (this.f94415c.length < 3) {
                throw new IllegalArgumentException("Contiguous indeterminate animation must be used with 3 or more indicator colors.");
            }
        }
    }
}
