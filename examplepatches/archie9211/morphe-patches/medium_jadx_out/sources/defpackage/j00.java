package defpackage;

import com.apollographql.apollo.exception.ApolloException;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class j00 {
    public final UUID a;
    public final hv8 b;
    public final du8 c;
    public final List d;
    public final ApolloException e;
    public final Map f;
    public final s44 g;
    public final boolean h;

    public j00(UUID uuid, hv8 hv8Var, du8 du8Var, List list, ApolloException apolloException, Map map, s44 s44Var, boolean z) {
        this.a = uuid;
        this.b = hv8Var;
        this.c = du8Var;
        this.d = list;
        this.e = apolloException;
        this.f = map;
        this.g = s44Var;
        this.h = z;
    }

    public final i00 a() {
        i00 i00Var = new i00(this.b, this.a, this.c, this.d, this.f, this.e);
        i00Var.a(this.g);
        i00Var.a = this.h;
        return i00Var;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ApolloResponse(operationName=");
        hv8 hv8Var = this.b;
        sb.append(hv8Var.name());
        sb.append(", data=");
        du8 du8Var = this.c;
        String strJ = kSWQKWZ.SGhL;
        sb.append(du8Var == null ? strJ : hv8Var.name().concat(".Data"));
        sb.append(", errors=");
        List list = this.d;
        sb.append(list != null ? Integer.valueOf(list.size()) : strJ);
        sb.append(", exception=");
        ApolloException apolloException = this.e;
        if (apolloException != null) {
            strJ = n1b.a.b(apolloException.getClass()).j();
            if (strJ == null) {
                strJ = "true";
            }
        }
        return ev6.z(sb, strJ, ')');
    }
}
