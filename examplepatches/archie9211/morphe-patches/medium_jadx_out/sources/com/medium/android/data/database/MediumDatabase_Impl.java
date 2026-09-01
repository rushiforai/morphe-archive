package com.medium.android.data.database;

import com.medium.android.data.database.MediumDatabase_Impl;
import defpackage.alb;
import defpackage.cp8;
import defpackage.d46;
import defpackage.dp7;
import defpackage.eo8;
import defpackage.ey3;
import defpackage.m45;
import defpackage.n1b;
import defpackage.q37;
import defpackage.s1b;
import defpackage.v76;
import defpackage.vw3;
import defpackage.w5d;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/medium/android/data/database/MediumDatabase_Impl;", "Lcom/medium/android/data/database/MediumDatabase;", "<init>", "()V", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediumDatabase_Impl extends MediumDatabase {
    public final w5d l;
    public final w5d m;
    public final w5d n;

    public MediumDatabase_Impl() {
        final int i = 0;
        this.l = new w5d(new m45(this) { // from class: cp7
            public final /* synthetic */ MediumDatabase_Impl b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                MediumDatabase_Impl mediumDatabase_Impl = this.b;
                switch (i2) {
                    case 0:
                        return new q37(mediumDatabase_Impl);
                    case 1:
                        return new eo8(mediumDatabase_Impl);
                    default:
                        return new ep8(mediumDatabase_Impl);
                }
            }
        });
        final int i2 = 1;
        this.m = new w5d(new m45(this) { // from class: cp7
            public final /* synthetic */ MediumDatabase_Impl b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                MediumDatabase_Impl mediumDatabase_Impl = this.b;
                switch (i22) {
                    case 0:
                        return new q37(mediumDatabase_Impl);
                    case 1:
                        return new eo8(mediumDatabase_Impl);
                    default:
                        return new ep8(mediumDatabase_Impl);
                }
            }
        });
        final int i3 = 2;
        this.n = new w5d(new m45(this) { // from class: cp7
            public final /* synthetic */ MediumDatabase_Impl b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i3;
                MediumDatabase_Impl mediumDatabase_Impl = this.b;
                switch (i22) {
                    case 0:
                        return new q37(mediumDatabase_Impl);
                    case 1:
                        return new eo8(mediumDatabase_Impl);
                    default:
                        return new ep8(mediumDatabase_Impl);
                }
            }
        });
    }

    @Override // defpackage.elb
    public final List c(LinkedHashMap linkedHashMap) {
        return new ArrayList();
    }

    @Override // defpackage.elb
    public final v76 d() {
        return new v76(this, new LinkedHashMap(), new LinkedHashMap(), "lists_catalog_download_state", "offline_catalog", "offline_post");
    }

    @Override // defpackage.elb
    public final vw3 e() {
        return new dp7(this);
    }

    @Override // defpackage.elb
    public final Set i() {
        return new LinkedHashSet();
    }

    @Override // defpackage.elb
    public final LinkedHashMap j() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        s1b s1bVar = n1b.a;
        linkedHashMap.put(s1bVar.b(q37.class), ey3.a);
        linkedHashMap.put(s1bVar.b(eo8.class), d46.Q(s1bVar.b(alb.class)));
        linkedHashMap.put(s1bVar.b(cp8.class), d46.Q(s1bVar.b(alb.class)));
        return linkedHashMap;
    }

    @Override // com.medium.android.data.database.MediumDatabase
    public final q37 s() {
        return (q37) this.l.getValue();
    }

    @Override // com.medium.android.data.database.MediumDatabase
    public final eo8 t() {
        return (eo8) this.m.getValue();
    }

    @Override // com.medium.android.data.database.MediumDatabase
    public final cp8 u() {
        return (cp8) this.n.getValue();
    }
}
