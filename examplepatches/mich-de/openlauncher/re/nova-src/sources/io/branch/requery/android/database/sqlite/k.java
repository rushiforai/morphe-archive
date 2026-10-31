package io.branch.requery.android.database.sqlite;

import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes4.dex */
public final class k extends ThreadLocal {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61851a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f61852b;

    public /* synthetic */ k(Object obj, int i5) {
        this.f61851a = i5;
        this.f61852b = obj;
    }

    @Override // java.lang.ThreadLocal
    public final Object initialValue() throws InvalidKeyException {
        switch (this.f61851a) {
            case 0:
                return ((SQLiteDatabase) this.f61852b).createSession();
            default:
                og.g gVar = (og.g) this.f61852b;
                try {
                    sl.j jVar = sl.j.f87510c;
                    Mac mac = (Mac) jVar.f87514a.a((String) gVar.f80408c);
                    mac.init((SecretKeySpec) gVar.f80409d);
                    return mac;
                } catch (GeneralSecurityException e3) {
                    throw new IllegalStateException(e3);
                }
        }
    }
}
