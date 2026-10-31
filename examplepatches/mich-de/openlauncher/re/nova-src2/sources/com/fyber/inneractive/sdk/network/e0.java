package com.fyber.inneractive.sdk.network;

import android.content.Context;
import android.net.Uri;
import android.util.Base64;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.File;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class e0 extends d0 {

    /* renamed from: e, reason: collision with root package name */
    public static final String f28706e = IAlog.a(e0.class);

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.cache.g f28707d;

    public e0(Context context, com.fyber.inneractive.sdk.cache.a aVar, com.fyber.inneractive.sdk.player.cache.g gVar) {
        super(context, aVar);
        this.f28707d = gVar;
    }

    @Override // com.fyber.inneractive.sdk.network.d0
    public final com.fyber.inneractive.sdk.cache.n a() {
        try {
            if (this.f28707d != null && this.f28699b.d()) {
                com.fyber.inneractive.sdk.player.cache.g gVar = this.f28707d;
                String strC = this.f28699b.c();
                gVar.getClass();
                try {
                } catch (Exception e3) {
                    IAlog.f("%s: failure on filePath: %s", IAlog.a(com.fyber.inneractive.sdk.player.cache.g.class), e3);
                }
                if (gVar.f28860i == null) {
                    throw new IllegalStateException("cache is closed");
                }
                if (!com.fyber.inneractive.sdk.player.cache.g.f28850p.matcher(strC).matches()) {
                    throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,120}: \"" + strC + "\"");
                }
                com.fyber.inneractive.sdk.player.cache.e eVar = (com.fyber.inneractive.sdk.player.cache.e) gVar.f28861j.get(strC);
                File fileA = eVar == null ? null : eVar.a(0);
                String absolutePath = (fileA == null || !fileA.exists()) ? null : fileA.getAbsolutePath();
                Uri uri = (Uri) this.f28699b.a(absolutePath);
                if (uri == null) {
                    new c0();
                    return new com.fyber.inneractive.sdk.cache.n();
                }
                IAlog.a("Get cached file: %s", absolutePath);
                if (this.f28700c == null) {
                    this.f28700c = this.f28698a.getSharedPreferences("IAConfigurationPreferences", 0);
                }
                return new com.fyber.inneractive.sdk.cache.n(uri, this.f28700c.getString(this.f28699b.b(), null));
            }
            new c0();
            return new com.fyber.inneractive.sdk.cache.n();
        } catch (Exception unused) {
            b();
            return new com.fyber.inneractive.sdk.cache.n();
        }
    }

    @Override // com.fyber.inneractive.sdk.network.d0
    public final boolean a(String str, String str2) {
        com.fyber.inneractive.sdk.player.cache.g gVar;
        try {
            byte[] bArrDecode = Base64.decode(str2, 0);
            if (bArrDecode != null && (gVar = this.f28707d) != null) {
                com.fyber.inneractive.sdk.player.cache.d dVarA = gVar.a(str);
                if (dVarA == null) {
                    IAlog.f("%s: Error getting editor", f28706e);
                    return false;
                }
                dVarA.a(bArrDecode);
                dVarA.a();
                return true;
            }
            IAlog.f("%s: Invalid content", f28706e);
            return false;
        } catch (IOException e3) {
            e = e3;
            IAlog.f("%s: Error writing cache: ", f28706e, e);
            return false;
        } catch (IllegalArgumentException e11) {
            e = e11;
            IAlog.f("%s: Error writing cache: ", f28706e, e);
            return false;
        }
    }
}
