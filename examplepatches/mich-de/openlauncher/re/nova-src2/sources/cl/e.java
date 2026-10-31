package cl;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class e extends Throwable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19995a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(int i5) {
        super("Failure occurred while trying to finish a future.");
        this.f19995a = i5;
    }

    @Override // java.lang.Throwable
    public synchronized Throwable fillInStackTrace() {
        switch (this.f19995a) {
            case 0:
                synchronized (this) {
                }
                return this;
            case 1:
                synchronized (this) {
                }
                return this;
            case 2:
                synchronized (this) {
                }
                return this;
            case 3:
                synchronized (this) {
                }
                return this;
            case 4:
                synchronized (this) {
                }
                return this;
            case 5:
            default:
                return super.fillInStackTrace();
            case 6:
                synchronized (this) {
                }
                return this;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(String str, int i5) {
        super(str);
        this.f19995a = i5;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(String message) {
        super(message);
        this.f19995a = 5;
        Intrinsics.g(message, "message");
    }
}
