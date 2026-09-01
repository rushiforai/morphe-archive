package defpackage;

import android.net.Uri;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iu7 {
    public static final Pattern b = Pattern.compile("/m/callback/email");
    public static final Pattern c = Pattern.compile("/(_/ios|m/app)/login/([\\da-f]+)");
    public static final x2b d = new x2b("/m/global-identity-2");
    public static final x2b e = new x2b(".*-([a-z\\d]{10,24})");
    public static final x2b f = new x2b("/p/[a-z\\d]{10,24}");
    public static final d01 g;
    public static final d01 h;
    public static final e01 i;
    public final Uri a;

    static {
        d01 d01Var = f01.a;
        d01Var.getClass();
        g = d01Var;
        d01 d01Var2 = f01.c;
        d01Var2.getClass();
        h = d01Var2;
        e01 e01Var = f01.b;
        e01Var.getClass();
        i = e01Var;
    }

    public iu7() {
        i03 i03Var = i03.a;
        this.a = Uri.parse(i03.b);
    }

    public static String a(Uri uri) {
        uri.getClass();
        try {
            String queryParameter = uri.getQueryParameter("source");
            if (queryParameter == null) {
                return null;
            }
            if (muc.b0(queryParameter)) {
                return null;
            }
            return queryParameter;
        } catch (UnsupportedOperationException unused) {
            return null;
        }
    }

    public final boolean b(Uri uri) {
        String path;
        Uri uriC = c(uri);
        if (g76.L(this.a.getHost(), uriC.getHost()) && (path = uriC.getPath()) != null) {
            return b.matcher(path).matches() || c.matcher(path).matches();
        }
        return false;
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public final Uri c(Uri uri) {
        String path;
        uri.getClass();
        String host = uri.getHost();
        String strGroup = null;
        uriC = null;
        Uri uriC = null;
        strGroup = null;
        if (host == null || muc.b0(host)) {
            host = null;
        }
        Uri uri2 = this.a;
        String host2 = uri2.getHost();
        if (host2 == null) {
            ay0.e("Base uri host cannot be null");
            return null;
        }
        if (g76.L(host, host2) && (path = uri.getPath()) != null && d.a.matcher(path).find() && uri.getQueryParameter("redirectUrl") != null) {
            String queryParameter = uri.getQueryParameter("redirectUrl");
            if (queryParameter == null) {
                ay0.e("Required value was null.");
                return null;
            }
            Uri uri3 = Uri.parse(queryParameter);
            String host3 = uri3.getHost();
            if (host3 != null && muc.Q(host3, host2, false)) {
                return c(uri3);
            }
            Uri uriBuild = uri3.buildUpon().scheme(uri2.getScheme()).authority(uri2.getAuthority()).build();
            String path2 = uriBuild.getPath();
            if (path2 == null) {
                uriC = c(uriBuild);
            } else if (!path2.equals("/") && !path2.equals("")) {
                if (f.c(path2)) {
                    uriC = uri2.buildUpon().path(path2).encodedQuery(uriBuild.getEncodedQuery()).build();
                } else {
                    ij7 ij7VarB = e.b(path2);
                    if (ij7VarB != null) {
                        String str = (String) ((gj7) ij7VarB.a()).get(1);
                        uriC = uri2.buildUpon().appendEncodedPath("p/" + str).encodedQuery(uriBuild.getEncodedQuery()).build();
                    } else {
                        uriC = c(uriBuild);
                    }
                }
            }
            return uriC == null ? uri3 : uriC;
        }
        if ("medium".equals(uri.getScheme())) {
            if (g76.L(uri.getAuthority(), "help")) {
                Uri uriBuild2 = uri.buildUpon().scheme(uri2.getScheme()).authority(uri.getAuthority() + "." + uri2.getAuthority()).path(uri.getPath()).build();
                uriBuild2.getClass();
                return uriBuild2;
            }
            Uri.Builder builderAuthority = uri.buildUpon().scheme(uri2.getScheme()).authority(uri2.getAuthority());
            if (uri.getAuthority() == null || !(!muc.b0(r0))) {
                builderAuthority.path(uri.getPath());
            } else {
                builderAuthority.path(uri.getAuthority() + uri.getPath());
            }
            Uri uriBuild3 = builderAuthority.build();
            uriBuild3.getClass();
            return uriBuild3;
        }
        if (host != null && muc.Q(host, host2, false)) {
            if (!muc.b0(host)) {
                Matcher matcher = Pattern.compile("([a-z\\d-]+)." + uri2.getHost()).matcher(host);
                if (matcher.matches()) {
                    strGroup = matcher.group(1);
                }
            }
            if (strGroup != null && !i.contains(strGroup)) {
                for (Map.Entry entry : h.entrySet()) {
                    String str2 = (String) entry.getKey();
                    String str3 = (String) entry.getValue();
                    if (strGroup.equalsIgnoreCase(str2)) {
                        Uri uriBuild4 = uri2.buildUpon().path(str3 + uri.getPath()).encodedQuery(uri.getEncodedQuery()).build();
                        uriBuild4.getClass();
                        return uriBuild4;
                    }
                }
                Uri uriBuild5 = uri2.buildUpon().appendEncodedPath("@".concat(strGroup)).appendEncodedPath(uri.getPath()).encodedQuery(uri.getEncodedQuery()).build();
                uriBuild5.getClass();
                return uriBuild5;
            }
        } else if (host != null) {
            d01 d01Var = g;
            if (d01Var.containsKey(host)) {
                Uri uriBuild6 = uri2.buildUpon().path(d01Var.get(host) + uri.getPath()).encodedQuery(uri.getEncodedQuery()).build();
                uriBuild6.getClass();
                return uriBuild6;
            }
        }
        return uri;
    }
}
