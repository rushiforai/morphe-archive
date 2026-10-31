package lg;

import android.accounts.Account;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.Scope;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import sg.w;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final HashSet f74923a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f74924b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f74925c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f74926d;

    /* renamed from: e, reason: collision with root package name */
    public String f74927e;

    /* renamed from: f, reason: collision with root package name */
    public final Account f74928f;

    /* renamed from: g, reason: collision with root package name */
    public final String f74929g;

    /* renamed from: h, reason: collision with root package name */
    public final HashMap f74930h;

    /* renamed from: i, reason: collision with root package name */
    public String f74931i;

    public b() {
        this.f74923a = new HashSet();
        this.f74930h = new HashMap();
    }

    public final GoogleSignInOptions a() {
        Scope scope = GoogleSignInOptions.f31745t;
        HashSet hashSet = this.f74923a;
        if (hashSet.contains(scope)) {
            Scope scope2 = GoogleSignInOptions.f31744s;
            if (hashSet.contains(scope2)) {
                hashSet.remove(scope2);
            }
        }
        if (this.f74926d && (this.f74928f == null || !hashSet.isEmpty())) {
            hashSet.add(GoogleSignInOptions.f31743r);
        }
        return new GoogleSignInOptions(3, new ArrayList(hashSet), this.f74928f, this.f74926d, this.f74924b, this.f74925c, this.f74927e, this.f74929g, this.f74930h, this.f74931i);
    }

    public final void b() {
        boolean z11 = true;
        this.f74926d = true;
        w.e("747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com");
        String str = this.f74927e;
        if (str != null && !str.equals("747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com")) {
            z11 = false;
        }
        w.a("two different server client ids provided", z11);
        this.f74927e = "747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com";
    }

    public b(GoogleSignInOptions googleSignInOptions) {
        this.f74923a = new HashSet();
        this.f74930h = new HashMap();
        w.h(googleSignInOptions);
        this.f74923a = new HashSet(googleSignInOptions.f31748g);
        this.f74924b = googleSignInOptions.f31751j;
        this.f74925c = googleSignInOptions.f31752k;
        this.f74926d = googleSignInOptions.f31750i;
        this.f74927e = googleSignInOptions.f31753l;
        this.f74928f = googleSignInOptions.f31749h;
        this.f74929g = googleSignInOptions.f31754m;
        this.f74930h = GoogleSignInOptions.d(googleSignInOptions.n);
        this.f74931i = googleSignInOptions.o;
    }
}
