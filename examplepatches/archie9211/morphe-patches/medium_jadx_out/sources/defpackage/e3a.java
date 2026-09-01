package defpackage;

import com.medium.android.graphql.fragment.UserProfileData;

/* JADX INFO: loaded from: classes4.dex */
public final class e3a extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public do4 d;
    public int e;
    public final /* synthetic */ eh9 f;
    public UserProfileData g;
    public String h;
    public Long i;
    public int j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e3a(eh9 eh9Var, n92 n92Var) {
        super(n92Var);
        this.f = eh9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.f.a(null, this);
    }
}
