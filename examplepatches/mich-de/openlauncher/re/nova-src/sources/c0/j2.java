package c0;

/* loaded from: classes.dex */
public interface j2 {
    boolean a();

    long b(s sVar, s sVar2, s sVar3);

    s k(long j11, s sVar, s sVar2, s sVar3);

    s p(long j11, s sVar, s sVar2, s sVar3);

    default s t(s sVar, s sVar2, s sVar3) {
        return p(b(sVar, sVar2, sVar3), sVar, sVar2, sVar3);
    }
}
