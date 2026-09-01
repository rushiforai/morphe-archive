package defpackage;

import com.medium.android.graphql.fragment.FollowedTagData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i12 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i12(Object obj, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.c = obj;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        int i2 = 3;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                new i12((nya) this.c, (n92) obj3, 0).invokeSuspend(c1eVar);
                return c1eVar;
            case 1:
                new i12((rya) this.c, (n92) obj3, 1).invokeSuspend(c1eVar);
                return c1eVar;
            case 2:
                ((Number) obj2).floatValue();
                new i12((bgc) this.c, (n92) obj3, 2).invokeSuspend(c1eVar);
                return c1eVar;
            case 3:
                String str = (String) obj;
                ((Boolean) obj2).getClass();
                new i12(i2, i2, (n92) obj3).c = str;
                br7.v(c1eVar);
                return str;
            default:
                ((Number) obj).intValue();
                i12 i12Var = new i12(i2, 4, (n92) obj3);
                i12Var.c = (FollowedTagData) obj2;
                return i12Var.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        String displayTitle;
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                br7.v(obj);
                ((nya) this.c).a = true;
                return c1eVar;
            case 1:
                br7.v(obj);
                try {
                    c68 c68Var = (c68) ((rya) this.c).a;
                    if (c68Var != null) {
                        c68Var.close();
                    }
                    break;
                } catch (Throwable unused) {
                }
                return c1eVar;
            case 2:
                br7.v(obj);
                ((bgc) this.c).n.invoke();
                return c1eVar;
            case 3:
                String str = (String) this.c;
                br7.v(obj);
                return str;
            default:
                FollowedTagData followedTagData = (FollowedTagData) this.c;
                br7.v(obj);
                String normalizedTagSlug = followedTagData.getNormalizedTagSlug();
                if (normalizedTagSlug != null && (displayTitle = followedTagData.getDisplayTitle()) != null) {
                    return new dw4(normalizedTagSlug, displayTitle, false);
                }
                ay0.e("Required value was null.");
                return null;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i12(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }
}
