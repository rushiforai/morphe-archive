package io.branch.search.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import android.os.UserHandle;
import android.text.TextUtils;
import com.tiktok.util.TTConst;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.internal.V7;
import io.branch.search.internal.ui.InvisibleRedirectActivity;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.u2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3394u2 implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final JSONObject f65959a;

    /* renamed from: io.branch.search.internal.u2$d */
    public interface d {
        void a(boolean z11, JSONObject jSONObject);
    }

    /* renamed from: io.branch.search.internal.u2$e */
    public static class e extends b {
        public static Parcelable.Creator<e> CREATOR = new a();

        /* renamed from: io.branch.search.internal.u2$e$a */
        public class a implements Parcelable.Creator<e> {
            @Override // android.os.Parcelable.Creator
            public final e createFromParcel(Parcel parcel) {
                return new e(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final e[] newArray(int i5) {
                return new e[i5];
            }
        }

        public e(JSONObject jSONObject) throws JSONException {
            super(jSONObject);
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b
        public final V7 a(Context context, J8 j82) {
            String strA = j82.a();
            V7.Companion.getClass();
            return V7.a.a(context, strA);
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b
        public final String toString() {
            return b.c0.q(new StringBuilder("LaunchIntent( extras="), super.toString(), ")");
        }

        public e(Parcel parcel) {
            super(parcel);
        }
    }

    /* renamed from: io.branch.search.internal.u2$f */
    public static class f {

        /* renamed from: a, reason: collision with root package name */
        public final boolean f65970a;

        public f(boolean z11) {
            this.f65970a = z11;
        }
    }

    /* renamed from: io.branch.search.internal.u2$k */
    public static final class k extends b {
        public static Parcelable.Creator<k> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public final Uri f65977c;

        /* renamed from: d, reason: collision with root package name */
        public final String f65978d;

        /* renamed from: e, reason: collision with root package name */
        public final String f65979e;

        /* renamed from: f, reason: collision with root package name */
        public final Boolean f65980f;

        /* renamed from: g, reason: collision with root package name */
        public Boolean f65981g;

        /* renamed from: io.branch.search.internal.u2$k$a */
        public class a implements Parcelable.Creator<k> {
            @Override // android.os.Parcelable.Creator
            public final k createFromParcel(Parcel parcel) {
                return new k(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final k[] newArray(int i5) {
                return new k[i5];
            }
        }

        public k(JSONObject jSONObject) throws JSONException {
            super(jSONObject);
            this.f65981g = Boolean.FALSE;
            this.f65977c = Uri.parse(jSONObject.getString("data"));
            this.f65978d = jSONObject.has("forcePackage") ? jSONObject.getString("forcePackage") : null;
            this.f65979e = jSONObject.has("targetPackageName") ? jSONObject.getString("targetPackageName") : null;
            this.f65980f = Boolean.valueOf(jSONObject.has("followRedirects") && jSONObject.getBoolean("followRedirects"));
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b
        public final V7 a(Context context, J8 j82) {
            V7.a aVar = V7.Companion;
            String str = this.f65978d;
            Uri uri = this.f65977c;
            aVar.getClass();
            return V7.a.a(uri, str);
        }

        @Override // io.branch.search.internal.AbstractC3394u2
        public final boolean b() {
            if (this.f65978d == null && this.f65963b.isEmpty()) {
                return "http".equalsIgnoreCase(this.f65977c.getScheme()) || "https".equalsIgnoreCase(this.f65977c.getScheme());
            }
            return false;
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("ViewIntent{data=");
            sb2.append(this.f65977c);
            sb2.append(", target='");
            sb2.append(this.f65978d);
            sb2.append("', targetPackageName='");
            sb2.append(this.f65979e);
            sb2.append("', followRedirects=");
            sb2.append(this.f65980f);
            sb2.append(", openAsApp=");
            sb2.append(this.f65981g);
            sb2.append(", extras=");
            return Z.a(sb2, super.toString(), AbstractJsonLexerKt.END_OBJ);
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b, io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeParcelable(this.f65977c, i5);
            parcel.writeString(this.f65978d);
            parcel.writeString(this.f65979e);
            parcel.writeByte(this.f65980f.booleanValue() ? (byte) 1 : (byte) 0);
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b, io.branch.search.internal.AbstractC3394u2
        public final f a(C3431w5 c3431w5, InterfaceC3331q6.b.c cVar, b50.f fVar) throws JSONException {
            if (this.f65980f.booleanValue()) {
                try {
                    InvisibleRedirectActivity.Companion aVar = InvisibleRedirectActivity.INSTANCE;
                    Context context = c3431w5.f66216a.f62438a;
                    String str = this.f65979e;
                    if (str == null) {
                        str = this.f65978d;
                    }
                    Uri uri = this.f65977c;
                    aVar.getClass();
                    InvisibleRedirectActivity.Companion.a(context, fVar, str, uri);
                    return new f(true);
                } catch (Exception unused) {
                    return new f(false);
                }
            }
            if (!this.f65981g.booleanValue()) {
                return super.a(c3431w5, cVar, fVar);
            }
            if (!fVar.openIntent(c3431w5.f66216a.f62438a, new Intent("android.intent.action.MAIN").setPackage(this.f65977c.getHost()), Process.myUserHandle())) {
                return new f(false);
            }
            try {
                new JSONObject(this.f65959a.toString()).put("used_hacked_intent", true);
                return new f(true);
            } catch (JSONException unused2) {
                String string = UUID.randomUUID().toString();
                C3296o5.a aVar2 = C3296o5.f65426a;
                C3296o5.a(new F6(string, "BranchLinkHandler.open", "Failed to attach 'used_hacked_intent' LinkOpenResult.payload", null));
                return new f(true);
            }
        }

        public k(Parcel parcel) {
            super(parcel);
            this.f65981g = Boolean.FALSE;
            this.f65977c = (Uri) parcel.readParcelable(Uri.class.getClassLoader());
            this.f65978d = parcel.readString();
            this.f65979e = parcel.readString();
            this.f65980f = Boolean.valueOf(parcel.readByte() == 1);
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b, io.branch.search.internal.AbstractC3394u2
        public final C3458xf a(C3431w5 c3431w5, J8 j82) {
            String str;
            Context context = c3431w5.f66216a.f62438a;
            V7.a aVar = V7.Companion;
            String str2 = this.f65978d;
            Uri uri = this.f65977c;
            aVar.getClass();
            V7 v7A = V7.a.a(uri, str2);
            StringBuilder sb2 = new StringBuilder();
            if (!this.f65980f.booleanValue() || ((str = this.f65978d) == null && this.f65979e == null)) {
                C3201ib c3201ib = C3201ib.f64744a;
                long jCurrentTimeMillis = System.currentTimeMillis();
                c3201ib.getClass();
                if (!C3201ib.a(jCurrentTimeMillis, context, v7A).isEmpty()) {
                    C3458xf.Companion.getClass();
                    return C3458xf.f66299c;
                }
                String str3 = this.f65978d;
                if (str3 != null) {
                    String str4 = C3390tf.a(context, str3) ? "No valid activities for target app." : "Target app not installed.";
                    if (sb2.length() == 0) {
                        sb2.append(str4);
                    } else {
                        sb2.append(" ");
                        sb2.append(str4);
                    }
                } else if (sb2.length() == 0) {
                    sb2.append("No valid activities.");
                } else {
                    sb2.append(" ");
                    sb2.append("No valid activities.");
                }
            } else {
                if (str == null) {
                    str = this.f65979e;
                }
                if (C3390tf.a(context, str, Process.myUserHandle())) {
                    C3458xf.Companion.getClass();
                    return C3458xf.f66299c;
                }
                if (sb2.length() == 0) {
                    sb2.append("No valid activities.");
                } else {
                    sb2.append(" ");
                    sb2.append("No valid activities.");
                }
            }
            if ("android-app".equals(this.f65977c.getScheme()) && TextUtils.isEmpty(this.f65977c.getPath())) {
                boolean zA = C3390tf.a(context, this.f65977c.getHost(), Process.myUserHandle());
                this.f65981g = Boolean.valueOf(zA);
                if (zA) {
                    C3458xf.Companion.getClass();
                    return C3458xf.f66299c;
                }
                if (sb2.length() == 0) {
                    sb2.append("Failed to open as an app.");
                } else {
                    sb2.append(" ");
                    sb2.append("Failed to open as an app.");
                }
                return C3458xf.a(sb2.toString());
            }
            return C3458xf.a(sb2.toString());
        }
    }

    public AbstractC3394u2(JSONObject jSONObject) {
        this.f65959a = jSONObject;
    }

    public static AbstractC3394u2 a(F4 f42, JSONObject jSONObject) throws JSONException {
        String string = jSONObject.getString("@type");
        string.getClass();
        switch (string) {
            case "uri_intent":
                return new j(jSONObject);
            case "test_not_installed":
                return new i(f42, jSONObject);
            case "intent":
                return new c(jSONObject);
            case "shortcut":
                return new g(f42, jSONObject);
            case "view_intent":
                return new k(jSONObject);
            case "app":
                return new a(jSONObject);
            case "test_installed":
                return new h(f42, jSONObject);
            case "launch_intent":
                return new e(jSONObject);
            default:
                throw new JSONException("Unknown type!");
        }
    }

    public abstract f a(C3431w5 c3431w5, InterfaceC3331q6.b.c cVar, b50.f fVar);

    public abstract C3458xf a(C3431w5 c3431w5, J8 j82);

    public boolean b() {
        return false;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f65959a.toString());
    }

    /* renamed from: io.branch.search.internal.u2$h */
    public static class h extends l {
        public static final Parcelable.Creator<h> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public final String f65974c;

        /* renamed from: io.branch.search.internal.u2$h$a */
        public class a implements Parcelable.Creator<h> {
            @Override // android.os.Parcelable.Creator
            public final h createFromParcel(Parcel parcel) {
                return new h(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final h[] newArray(int i5) {
                return new h[i5];
            }
        }

        public h(F4 f42, JSONObject jSONObject) throws JSONException {
            super(f42, jSONObject);
            this.f65974c = jSONObject.getString("package");
        }

        @Override // io.branch.search.internal.AbstractC3394u2.l, io.branch.search.internal.AbstractC3394u2
        public final C3458xf a(C3431w5 c3431w5, J8 j82) {
            return !C3390tf.a(c3431w5.f66216a.f62438a, this.f65974c) ? C3458xf.a("App is not installed.") : super.a(c3431w5, j82);
        }

        public final String toString() {
            return b.c0.q(new StringBuilder("TestInstalled{packageName='"), this.f65974c, "'}");
        }

        @Override // io.branch.search.internal.AbstractC3394u2.l, io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeString(this.f65974c);
        }

        public h(Parcel parcel) {
            super(parcel);
            this.f65974c = parcel.readString();
        }
    }

    /* renamed from: io.branch.search.internal.u2$i */
    public static class i extends l {
        public static final Parcelable.Creator<i> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public final String f65975c;

        /* renamed from: io.branch.search.internal.u2$i$a */
        public class a implements Parcelable.Creator<i> {
            @Override // android.os.Parcelable.Creator
            public final i createFromParcel(Parcel parcel) {
                return new i(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final i[] newArray(int i5) {
                return new i[i5];
            }
        }

        public i(F4 f42, JSONObject jSONObject) throws JSONException {
            super(f42, jSONObject);
            this.f65975c = jSONObject.getString("package");
        }

        @Override // io.branch.search.internal.AbstractC3394u2.l, io.branch.search.internal.AbstractC3394u2
        public final C3458xf a(C3431w5 c3431w5, J8 j82) {
            return C3390tf.a(c3431w5.f66216a.f62438a, this.f65975c) ? C3458xf.a("App is installed.") : super.a(c3431w5, j82);
        }

        public final String toString() {
            return b.c0.q(new StringBuilder("TestNotInstalled{packageName='"), this.f65975c, "'}");
        }

        @Override // io.branch.search.internal.AbstractC3394u2.l, io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeString(this.f65975c);
        }

        public i(Parcel parcel) {
            super(parcel);
            this.f65975c = parcel.readString();
        }
    }

    /* renamed from: io.branch.search.internal.u2$j */
    public static class j extends b {
        public static Parcelable.Creator<j> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public final String f65976c;

        /* renamed from: io.branch.search.internal.u2$j$a */
        public class a implements Parcelable.Creator<j> {
            @Override // android.os.Parcelable.Creator
            public final j createFromParcel(Parcel parcel) {
                return new j(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final j[] newArray(int i5) {
                return new j[i5];
            }
        }

        public j(JSONObject jSONObject) throws JSONException {
            super(jSONObject);
            this.f65976c = jSONObject.getString("uri");
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b
        public final V7 a(Context context, J8 j82) {
            try {
                V7.a aVar = V7.Companion;
                String str = this.f65976c;
                aVar.getClass();
                return V7.a.a(str);
            } catch (URISyntaxException e3) {
                C3296o5.a aVar2 = C3296o5.f65426a;
                C3296o5.a(new F6("BranchLinkHandler.createIntent", "Uri syntax exception", null, e3, null));
                return null;
            }
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b
        public final String toString() {
            return b.c0.q(new StringBuilder("UriIntent{uri='"), this.f65976c, "'}");
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b, io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeString(this.f65976c);
        }

        public j(Parcel parcel) {
            super(parcel);
            this.f65976c = parcel.readString();
        }
    }

    public AbstractC3394u2(Parcel parcel) {
        try {
            this.f65959a = new JSONObject(parcel.readString());
        } catch (JSONException unused) {
            throw new IllegalArgumentException("Unable to read parceled payload");
        }
    }

    /* renamed from: io.branch.search.internal.u2$l */
    public static abstract class l extends AbstractC3394u2 {

        /* renamed from: b, reason: collision with root package name */
        public final ArrayList f65982b;

        public l(F4 f42, JSONObject jSONObject) throws JSONException {
            super(jSONObject);
            this.f65982b = new ArrayList();
            JSONArray jSONArray = jSONObject.getJSONArray("links");
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                this.f65982b.add(AbstractC3394u2.a(f42, jSONArray.getJSONObject(i5)));
            }
        }

        @Override // io.branch.search.internal.AbstractC3394u2
        public final f a(C3431w5 c3431w5, InterfaceC3331q6.b.c cVar, b50.f fVar) {
            Iterator it = this.f65982b.iterator();
            while (it.hasNext()) {
                f fVarA = ((AbstractC3394u2) it.next()).a(c3431w5, cVar, fVar);
                if (fVarA.f65970a) {
                    return fVarA;
                }
            }
            return new f(false);
        }

        @Override // io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i5) {
            parcel.writeString(this.f65959a.toString());
            parcel.writeList(this.f65982b);
        }

        @Override // io.branch.search.internal.AbstractC3394u2
        public C3458xf a(C3431w5 c3431w5, J8 j82) {
            StringBuilder sb2 = new StringBuilder("Validating wrapper.");
            Iterator it = this.f65982b.iterator();
            while (it.hasNext()) {
                C3458xf c3458xfA = ((AbstractC3394u2) it.next()).a(c3431w5, j82);
                if (c3458xfA.f66300a) {
                    return c3458xfA;
                }
                sb2.append(" ");
                sb2.append(c3458xfA.f66301b);
            }
            return C3458xf.a(sb2.toString());
        }

        public l(Parcel parcel) {
            super(parcel);
            ArrayList arrayList = new ArrayList();
            this.f65982b = arrayList;
            parcel.readList(arrayList, AbstractC3394u2.class.getClassLoader());
        }
    }

    /* renamed from: io.branch.search.internal.u2$a */
    public static class a extends AbstractC3394u2 {
        public static Parcelable.Creator<a> CREATOR = new C0352a();

        /* renamed from: b, reason: collision with root package name */
        public final String f65960b;

        /* renamed from: c, reason: collision with root package name */
        public final String f65961c;

        /* renamed from: d, reason: collision with root package name */
        public final Integer f65962d;

        /* renamed from: io.branch.search.internal.u2$a$a, reason: collision with other inner class name */
        public class C0352a implements Parcelable.Creator<a> {
            @Override // android.os.Parcelable.Creator
            public final a createFromParcel(Parcel parcel) {
                return new a(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final a[] newArray(int i5) {
                return new a[i5];
            }
        }

        public a(JSONObject jSONObject) throws JSONException {
            super(jSONObject);
            this.f65960b = jSONObject.getString("package");
            if (jSONObject.isNull("activity")) {
                this.f65961c = null;
            } else {
                this.f65961c = jSONObject.getString("activity");
            }
            this.f65962d = Integer.valueOf(jSONObject.getInt("user"));
        }

        @Override // io.branch.search.internal.AbstractC3394u2
        public final f a(C3431w5 c3431w5, InterfaceC3331q6.b.c cVar, b50.f fVar) {
            ComponentName componentName;
            LauncherApps launcherApps = (LauncherApps) c3431w5.f66216a.f62438a.getSystemService(LauncherApps.class);
            UserHandle userHandle = ((C3356rf) c3431w5.f66216a.f62440c.getValue()).f65680a.getUserHandle(this.f65962d.intValue());
            if (this.f65961c == null) {
                try {
                    componentName = T9.a(launcherApps.getActivityList(this.f65960b, userHandle)).getComponentName();
                } catch (IllegalStateException e3) {
                    String str = this.f65960b + "::" + this.f65962d;
                    C3296o5.a aVar = C3296o5.f65426a;
                    C3296o5.a(new F6("AppIntent.open", str, null, e3, null));
                    return new f(false);
                }
            } else {
                componentName = new ComponentName(this.f65960b, this.f65961c);
            }
            try {
                if (fVar.openIntent(c3431w5.f66216a.f62438a, new Intent("android.intent.action.MAIN").setPackage(this.f65960b).setComponent(componentName), userHandle)) {
                    return new f(true);
                }
                launcherApps.startMainActivity(componentName, userHandle, null, null);
                return new f(true);
            } catch (SecurityException unused) {
                launcherApps.startAppDetailsActivity(componentName, userHandle, null, null);
                return new f(true);
            } catch (Exception e11) {
                String str2 = this.f65960b + "::" + this.f65962d;
                C3296o5.a aVar2 = C3296o5.f65426a;
                C3296o5.a(new F6("AppIntent.open", str2, null, e11, null));
                return new f(false);
            }
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("AppOpen{packageName='");
            sb2.append(this.f65960b);
            sb2.append("', activity='");
            sb2.append(this.f65961c);
            sb2.append("', userId=");
            return a2.c.o(sb2, this.f65962d, AbstractJsonLexerKt.END_OBJ);
        }

        @Override // io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeString(this.f65959a.toString());
            parcel.writeString(this.f65960b);
            parcel.writeString(this.f65961c);
            parcel.writeInt(this.f65962d.intValue());
        }

        public a(Parcel parcel) {
            super(parcel);
            this.f65960b = parcel.readString();
            this.f65961c = parcel.readString();
            this.f65962d = Integer.valueOf(parcel.readInt());
        }

        @Override // io.branch.search.internal.AbstractC3394u2
        public final C3458xf a(C3431w5 c3431w5, J8 j82) {
            LauncherApps launcherApps = (LauncherApps) c3431w5.f66216a.f62438a.getSystemService(LauncherApps.class);
            UserHandle userHandle = ((C3356rf) c3431w5.f66216a.f62440c.getValue()).f65680a.getUserHandle(this.f65962d.intValue());
            if (userHandle == null) {
                String str = "User handle is null for userId " + this.f65962d;
                C3309p1.a("AppIntent.validate", str);
                return C3458xf.a(str);
            }
            try {
                T9.a(launcherApps.getActivityList(this.f65960b, userHandle));
                C3458xf.Companion.getClass();
                return C3458xf.f66299c;
            } catch (Exception unused) {
                String str2 = "Validation failed for " + this.f65960b + "::" + this.f65962d;
                C3309p1.a("AppIntent.validate", str2);
                return C3458xf.a(str2);
            }
        }
    }

    /* renamed from: io.branch.search.internal.u2$c */
    public static class c extends b {
        public static Parcelable.Creator<c> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public final String f65964c;

        /* renamed from: d, reason: collision with root package name */
        public final Uri f65965d;

        /* renamed from: e, reason: collision with root package name */
        public final String f65966e;

        /* renamed from: f, reason: collision with root package name */
        public final String f65967f;

        /* renamed from: g, reason: collision with root package name */
        public final String f65968g;

        /* renamed from: h, reason: collision with root package name */
        public final String f65969h;

        /* renamed from: io.branch.search.internal.u2$c$a */
        public class a implements Parcelable.Creator<c> {
            @Override // android.os.Parcelable.Creator
            public final c createFromParcel(Parcel parcel) {
                return new c(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final c[] newArray(int i5) {
                return new c[i5];
            }
        }

        public c(JSONObject jSONObject) throws JSONException {
            super(jSONObject);
            this.f65965d = jSONObject.has("data") ? Uri.parse(jSONObject.getString("data")) : null;
            this.f65964c = jSONObject.getString("action");
            this.f65966e = jSONObject.has(TTConst.TRACK_TYPE) ? jSONObject.getString(TTConst.TRACK_TYPE) : null;
            this.f65967f = jSONObject.has("category") ? jSONObject.getString("category") : null;
            this.f65968g = jSONObject.has("package") ? jSONObject.getString("package") : null;
            this.f65969h = jSONObject.has("class") ? jSONObject.getString("class") : null;
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b
        public final V7 a(Context context, J8 j82) {
            V7.a aVar = V7.Companion;
            String str = this.f65964c;
            String str2 = this.f65968g;
            Uri uri = this.f65965d;
            String str3 = this.f65966e;
            String str4 = this.f65967f;
            String str5 = this.f65969h;
            aVar.getClass();
            return V7.a.a(str, str2, uri, str3, str4, str5);
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("CustomIntent{action='");
            sb2.append(this.f65964c);
            sb2.append("', data=");
            sb2.append(this.f65965d);
            sb2.append(", type='");
            sb2.append(this.f65966e);
            sb2.append("', category='");
            sb2.append(this.f65967f);
            sb2.append("', packageName='");
            sb2.append(this.f65968g);
            sb2.append("', className='");
            sb2.append(this.f65969h);
            sb2.append("', extras=");
            return Z.a(sb2, super.toString(), AbstractJsonLexerKt.END_OBJ);
        }

        @Override // io.branch.search.internal.AbstractC3394u2.b, io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeParcelable(this.f65965d, i5);
            parcel.writeString(this.f65964c);
            parcel.writeString(this.f65966e);
            parcel.writeString(this.f65967f);
            parcel.writeString(this.f65968g);
            parcel.writeString(this.f65969h);
        }

        public c(Parcel parcel) {
            super(parcel);
            this.f65965d = (Uri) parcel.readParcelable(Uri.class.getClassLoader());
            this.f65964c = parcel.readString();
            this.f65966e = parcel.readString();
            this.f65967f = parcel.readString();
            this.f65968g = parcel.readString();
            this.f65969h = parcel.readString();
        }
    }

    /* renamed from: io.branch.search.internal.u2$b */
    public static abstract class b extends AbstractC3394u2 {

        /* renamed from: b, reason: collision with root package name */
        public final HashMap f65963b;

        public b(JSONObject jSONObject) throws JSONException {
            super(jSONObject);
            this.f65963b = new HashMap();
            if (jSONObject.has("extras")) {
                JSONObject jSONObject2 = jSONObject.getJSONObject("extras");
                Iterator<String> itKeys = jSONObject2.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    this.f65963b.put(next, jSONObject2.get(next));
                }
            }
        }

        public abstract V7 a(Context context, J8 j82);

        @Override // io.branch.search.internal.AbstractC3394u2
        public f a(C3431w5 c3431w5, InterfaceC3331q6.b.c cVar, b50.f fVar) {
            Context context = c3431w5.f66216a.f62438a;
            V7 v7A = a(context, cVar);
            if (v7A != null) {
                Intent intent = v7A.f63506b;
                Bundle bundle = new Bundle();
                T7.a(this.f65963b, bundle);
                if (!bundle.isEmpty()) {
                    intent.putExtras(bundle);
                }
                intent.setFlags(intent.getFlags() | 268435456);
                try {
                    fVar.openIntent(context, intent, null);
                    return new f(true);
                } catch (Exception e3) {
                    C3296o5.a(UUID.randomUUID().toString(), e3, "BranchLinkHandler.open");
                }
            }
            return new f(false);
        }

        public String toString() {
            if (this.f65963b.isEmpty()) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            return "extras=" + this.f65963b;
        }

        @Override // io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i5) {
            parcel.writeString(this.f65959a.toString());
            parcel.writeMap(this.f65963b);
        }

        public b(Parcel parcel) {
            super(parcel);
            HashMap map = new HashMap();
            this.f65963b = map;
            parcel.readMap(map, String.class.getClassLoader());
        }

        @Override // io.branch.search.internal.AbstractC3394u2
        public C3458xf a(C3431w5 c3431w5, J8 j82) {
            V7 v7A = a(c3431w5.f66216a.f62438a, j82);
            if (v7A != null) {
                C3201ib c3201ib = C3201ib.f64744a;
                long jCurrentTimeMillis = System.currentTimeMillis();
                Context context = c3431w5.f66216a.f62438a;
                c3201ib.getClass();
                if (!C3201ib.a(jCurrentTimeMillis, context, v7A).isEmpty()) {
                    C3458xf.Companion.getClass();
                    return C3458xf.f66299c;
                }
                return C3458xf.a("No valid activities or app not installed.");
            }
            return C3458xf.a("No intent created.");
        }
    }

    /* renamed from: io.branch.search.internal.u2$g */
    public static class g extends AbstractC3394u2 {
        public static Parcelable.Creator<g> CREATOR = new a();

        /* renamed from: b, reason: collision with root package name */
        public final String f65971b;

        /* renamed from: c, reason: collision with root package name */
        public final UserHandle f65972c;

        /* renamed from: d, reason: collision with root package name */
        public final String f65973d;

        /* renamed from: io.branch.search.internal.u2$g$a */
        public class a implements Parcelable.Creator<g> {
            @Override // android.os.Parcelable.Creator
            public final g createFromParcel(Parcel parcel) {
                return new g(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final g[] newArray(int i5) {
                return new g[i5];
            }
        }

        public g(F4 f42, JSONObject jSONObject) throws JSONException {
            super(jSONObject);
            this.f65971b = jSONObject.getString("id");
            this.f65973d = jSONObject.has("package") ? jSONObject.getString("package") : null;
            if (!jSONObject.has("user")) {
                this.f65972c = Process.myUserHandle();
                return;
            }
            UserHandle userHandle = f42.e().getUserHandle(jSONObject.getInt("user"));
            if (userHandle == null) {
                throw new JSONException("Unable to get a user id for the Shortcut");
            }
            this.f65972c = userHandle;
        }

        @Override // io.branch.search.internal.AbstractC3394u2
        public final f a(C3431w5 c3431w5, InterfaceC3331q6.b.c cVar, b50.f fVar) {
            Context context = c3431w5.f66216a.f62438a;
            String strA = this.f65973d;
            if (strA == null) {
                strA = cVar.a();
            }
            return c3431w5.f66217b.b(context, this.f65971b, strA, this.f65972c) ? new f(true) : new f(false);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Shortcut{id='");
            sb2.append(this.f65971b);
            sb2.append("', user=");
            sb2.append(this.f65972c);
            sb2.append(", packageName='");
            return b.c0.q(sb2, this.f65973d, "'}");
        }

        @Override // io.branch.search.internal.AbstractC3394u2, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeString(this.f65959a.toString());
            parcel.writeString(this.f65971b);
            parcel.writeString(this.f65973d);
            parcel.writeParcelable(this.f65972c, i5);
        }

        @Override // io.branch.search.internal.AbstractC3394u2
        public final C3458xf a(C3431w5 c3431w5, J8 j82) {
            Context context = c3431w5.f66216a.f62438a;
            String strA = this.f65973d;
            if (strA == null) {
                strA = j82.a();
            }
            C3458xf c3458xfA = c3431w5.f66217b.a(context, this.f65971b, strA, this.f65972c);
            if (c3458xfA.f66300a) {
                C3458xf.Companion.getClass();
                return C3458xf.f66299c;
            }
            return C3458xf.a("Validating shortcut. " + c3458xfA.f66301b);
        }

        public g(Parcel parcel) {
            super(parcel);
            this.f65971b = parcel.readString();
            this.f65973d = parcel.readString();
            this.f65972c = (UserHandle) parcel.readParcelable(UserHandle.class.getClassLoader());
        }
    }
}
