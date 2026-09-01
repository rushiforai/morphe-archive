package defpackage;

import android.webkit.WebView;
import com.medium.reader.R;
import java.io.IOException;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xl0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;

    public /* synthetic */ xl0(Object obj, boolean z, int i) {
        this.a = i;
        this.c = obj;
        this.b = z;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws IOException {
        int i = this.a;
        int i2 = 1;
        c1e c1eVar = c1e.a;
        boolean z = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                x02 x02Var = (x02) obj2;
                ((ul0) x02Var.a).f(z);
                ((tl0) x02Var.b).f(z);
                break;
            case 1:
                l78 l78Var = (l78) obj2;
                WebView webView = (WebView) obj;
                webView.getClass();
                if (!z) {
                    l78Var.setValue(Boolean.valueOf(webView.canGoBack()));
                }
                break;
            case 2:
                ((tjb) obj).c(z ? 1.0f : ((Number) ((m45) obj2).invoke()).floatValue());
                break;
            case 3:
                j12 j12Var = (j12) obj2;
                j12Var.u(z);
                break;
            case 4:
                bgc bgcVar = (bgc) obj2;
                jyb jybVar = (jyb) obj;
                if (!z) {
                    fj6[] fj6VarArr = gyb.a;
                    jybVar.d(eyb.j, c1eVar);
                }
                String strValueOf = String.valueOf(nk7.w0(bgcVar.c.g() * 100.0f) / 100.0f);
                fj6[] fj6VarArr2 = gyb.a;
                iyb iybVar = eyb.b;
                fj6 fj6Var = gyb.a[0];
                jybVar.d(iybVar, strValueOf);
                jybVar.d(sxb.i, new i4(null, new vfc(bgcVar, i2)));
                break;
            default:
                e6d e6dVar = (e6d) obj2;
                g6d g6dVar = (g6d) obj;
                g6dVar.getClass();
                g6dVar.loadUrl("about:blank");
                String strG = ek7.G(g6dVar, R.attr.highlightColorMine);
                String strG2 = ek7.G(g6dVar, R.attr.highlightColor);
                az5 az5Var = e6dVar.b;
                boolean z2 = e6dVar.c;
                String languageName = e6dVar.d.getLanguageName();
                String str = e6dVar.a;
                String str2 = z ? "medium-dark" : "medium-light";
                az5Var.getClass();
                str.getClass();
                String str3 = z ? "lighten" : "darken";
                String strF0 = bu1.F0(az5Var, ",", null, null, new dsb(17), 30);
                String str4 = z2 ? "contentEditable=\"true\"" : "";
                Pattern patternCompile = Pattern.compile("<");
                patternCompile.getClass();
                String strReplaceAll = patternCompile.matcher(str).replaceAll("&lt;");
                strReplaceAll.getClass();
                Pattern patternCompile2 = Pattern.compile(">");
                patternCompile2.getClass();
                String strReplaceAll2 = patternCompile2.matcher(strReplaceAll).replaceAll("&gt;");
                strReplaceAll2.getClass();
                String strX = languageName != null ? ev6.x("'", languageName, "'") : "null";
                StringBuilder sbU = y30.u("\n            <!DOCTYPE html>\n            <html>\n            <head>\n              <meta charset=\"utf-8\">\n              <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0\"/>\n              <link rel=\"stylesheet\" href=\"./styles/main.css\">\n              <style type=\"text/css\">\n                .gl-highlight-overlay-mine {\n                    background-color: ", strG, ";\n                    mix-blend-mode: ", str3, ";\n                }\n                .gl-highlight-overlay-other {\n                    background-color: ");
                ka1.C(sbU, strG2, ";\n                    mix-blend-mode: ", str3, ";\n                }\n              </style>\n              <link rel=\"stylesheet\" href=\"./styles/");
                ka1.D(sbU, str2, ".css\">\n              <script src=\"./javascripts/highlight.min.js\"></script>\n              <script src=\"./javascripts/syntax-highlight.js\"></script>\n              <script>\n                function onLoaded() {\n                    syntaxHighlight.setup(\n                      ", z2, ",\n                      ");
                ka1.C(sbU, strX, ",\n                      [", strF0, "]\n                    )\n                }\n                </script>\n              </head>\n              <body onload=\"onLoaded()\">\n                <pre><code id=\"code-editor\" class=\"hljs\" ");
                sbU.append(str4);
                sbU.append(">");
                sbU.append(strReplaceAll2);
                sbU.append("</code></pre>\n                <div id=\"gl-highlights-container\"></div>\n              </body>\n            </html>\n        ");
                g6dVar.loadDataWithBaseURL("file:///android_asset/", nuc.B(sbU.toString()), "text/html", "utf-8", null);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ xl0(boolean z, Object obj, int i) {
        this.a = i;
        this.b = z;
        this.c = obj;
    }
}
