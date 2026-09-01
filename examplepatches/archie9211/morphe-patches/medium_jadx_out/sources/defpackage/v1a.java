package defpackage;

import android.content.Context;
import android.os.Process;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v1a {
    public final Context a;
    public final w5d b;
    public final int c;
    public final w5d d;
    public final w5d e;
    public boolean f;

    public v1a(Context context, upe upeVar) {
        context.getClass();
        upeVar.getClass();
        this.a = context;
        final int i = 0;
        this.b = new w5d(new m45(this) { // from class: u1a
            public final /* synthetic */ v1a b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                v1a v1aVar = this.b;
                switch (i2) {
                    case 0:
                        return ((w1a) v1aVar.e.getValue()).a;
                    default:
                        return v4.g(v1aVar.a);
                }
            }
        });
        this.c = Process.myPid();
        this.d = new w5d(new yj8(14, upeVar));
        final int i2 = 1;
        this.e = new w5d(new m45(this) { // from class: u1a
            public final /* synthetic */ v1a b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                v1a v1aVar = this.b;
                switch (i22) {
                    case 0:
                        return ((w1a) v1aVar.e.getValue()).a;
                    default:
                        return v4.g(v1aVar.a);
                }
            }
        });
    }

    public final String a() {
        return (String) this.b.getValue();
    }

    public final Map b(Map map) {
        w5d w5dVar = this.d;
        if (map != null) {
            LinkedHashMap linkedHashMap = new LinkedHashMap(map);
            linkedHashMap.put(a(), new t1a(Process.myPid(), (String) w5dVar.getValue()));
            return ei7.W(linkedHashMap);
        }
        Map mapSingletonMap = Collections.singletonMap(a(), new t1a(Process.myPid(), (String) w5dVar.getValue()));
        mapSingletonMap.getClass();
        return mapSingletonMap;
    }
}
