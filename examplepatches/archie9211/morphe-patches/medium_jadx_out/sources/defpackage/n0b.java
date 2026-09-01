package defpackage;

import java.lang.reflect.Member;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class n0b extends x55 implements x45 {
    public static final n0b a = new n0b(1, Member.class, "isSynthetic", "isSynthetic()Z", 0);

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Member member = (Member) obj;
        member.getClass();
        return Boolean.valueOf(member.isSynthetic());
    }
}
