package defpackage;

import android.util.Log;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.yourfollowingfeed.ui.FollowedType;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class au2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ au2(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                au2 au2Var = new au2(2, 0, n92Var);
                au2Var.c = obj;
                return au2Var;
            case 1:
                au2 au2Var2 = new au2(2, 1, n92Var);
                au2Var2.c = obj;
                return au2Var2;
            case 2:
                au2 au2Var3 = new au2(2, 2, n92Var);
                au2Var3.c = obj;
                return au2Var3;
            case 3:
                au2 au2Var4 = new au2(2, 3, n92Var);
                au2Var4.c = obj;
                return au2Var4;
            case 4:
                au2 au2Var5 = new au2(2, 4, n92Var);
                au2Var5.c = obj;
                return au2Var5;
            case 5:
                au2 au2Var6 = new au2(2, 5, n92Var);
                au2Var6.c = obj;
                return au2Var6;
            case 6:
                au2 au2Var7 = new au2(2, 6, n92Var);
                au2Var7.c = ((bjb) obj).a;
                return au2Var7;
            case 7:
                au2 au2Var8 = new au2(2, 7, n92Var);
                au2Var8.c = ((bjb) obj).a;
                return au2Var8;
            default:
                au2 au2Var9 = new au2(2, 8, n92Var);
                au2Var9.c = obj;
                return au2Var9;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        int i2 = 2;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((au2) create((rpc) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((au2) create((Set) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((au2) create((pwa) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                ((au2) create((String) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 4:
                return ((au2) create((k7c) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                ((au2) create((List) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 6:
                Object obj3 = ((bjb) obj).a;
                au2 au2Var = new au2(i2, 6, (n92) obj2);
                au2Var.c = obj3;
                au2Var.invokeSuspend(c1eVar);
                return c1eVar;
            case 7:
                Object obj4 = ((bjb) obj).a;
                au2 au2Var2 = new au2(i2, 7, (n92) obj2);
                au2Var2.c = obj4;
                au2Var2.invokeSuspend(c1eVar);
                return c1eVar;
            default:
                return ((au2) create((FollowedType) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                br7.v(obj);
                return Boolean.valueOf(!(((rpc) this.c) instanceof ai4));
            case 1:
                Set set = (Set) this.c;
                br7.v(obj);
                return Boolean.valueOf(set != null);
            case 2:
                br7.v(obj);
                return Boolean.valueOf(((pwa) this.c) == pwa.ShutDown);
            case 3:
                br7.v(obj);
                Log.e("FirebaseSessions", "Error failed to fetch the remote configs: " + ((String) this.c));
                return c1eVar;
            case 4:
                k7c k7cVar = (k7c) this.c;
                br7.v(obj);
                return Boolean.valueOf(k7cVar != k7c.START);
            case 5:
                List list = (List) this.c;
                br7.v(obj);
                String str = "Current user dismissable flags updated: " + list;
                km4.I(wld.a, null, str, new Object[0], str);
                return c1eVar;
            case 6:
                Object obj2 = this.c;
                br7.v(obj);
                if (!(obj2 instanceof ajb)) {
                    String str2 = "Membership status updated with success: " + ((ww7) obj2);
                    km4.I(wld.a, null, str2, new Object[0], str2);
                }
                Throwable thB = bjb.b(obj2);
                if (thB != null) {
                    wld.a.e(thB, ka1.r(MaAxRJinch.xpCuiu, thB.getMessage()), new Object[0]);
                }
                return c1eVar;
            case 7:
                Object obj3 = this.c;
                br7.v(obj);
                Throwable thB2 = bjb.b(obj3);
                if (thB2 == null) {
                    String str3 = "User preferences updated: " + ((gee) obj3);
                    km4.I(wld.a, null, str3, new Object[0], str3);
                } else {
                    wld.a.e(thB2, "Failed to watch user preferences", new Object[0]);
                }
                return c1eVar;
            default:
                FollowedType followedType = (FollowedType) this.c;
                br7.v(obj);
                FollowedType followedType2 = FollowedType.WRITERS_AND_PUBLICATIONS;
                gw4 gw4Var = new gw4(followedType2, followedType == followedType2);
                FollowedType followedType3 = FollowedType.TAGS;
                return d46.R(gw4Var, new gw4(followedType3, followedType == followedType3));
        }
    }
}
