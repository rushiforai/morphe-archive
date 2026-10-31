package y90;

import com.google.android.gms.internal.measurement.ag;
import java.util.regex.Pattern;

/* loaded from: classes5.dex */
public final class j extends da0.a {

    /* renamed from: e, reason: collision with root package name */
    public static final Pattern[][] f97050e = {new Pattern[]{null, null}, new Pattern[]{Pattern.compile("^<(?:script|pre|style)(?:\\s|>|$)", 2), Pattern.compile("</(?:script|pre|style)>", 2)}, new Pattern[]{Pattern.compile("^<!--"), Pattern.compile("-->")}, new Pattern[]{Pattern.compile("^<[?]"), Pattern.compile("\\?>")}, new Pattern[]{Pattern.compile("^<![A-Z]"), Pattern.compile(">")}, new Pattern[]{Pattern.compile("^<!\\[CDATA\\["), Pattern.compile("\\]\\]>")}, new Pattern[]{Pattern.compile("^</?(?:address|article|aside|base|basefont|blockquote|body|caption|center|col|colgroup|dd|details|dialog|dir|div|dl|dt|fieldset|figcaption|figure|footer|form|frame|frameset|h1|h2|h3|h4|h5|h6|head|header|hr|html|iframe|legend|li|link|main|menu|menuitem|nav|noframes|ol|optgroup|option|p|param|section|source|summary|table|tbody|td|tfoot|th|thead|title|tr|track|ul)(?:\\s|[/]?[>]|$)", 2), null}, new Pattern[]{Pattern.compile("^(?:<[A-Za-z][A-Za-z0-9-]*(?:\\s+[a-zA-Z_:][a-zA-Z0-9:._-]*(?:\\s*=\\s*(?:[^\"'=<>`\\x00-\\x20]+|'[^']*'|\"[^\"]*\"))?)*\\s*/?>|</[A-Za-z][A-Za-z0-9-]*\\s*[>])\\s*$", 2), null}};

    /* renamed from: b, reason: collision with root package name */
    public final Pattern f97052b;

    /* renamed from: a, reason: collision with root package name */
    public final ba0.j f97051a = new ba0.j(0);

    /* renamed from: c, reason: collision with root package name */
    public boolean f97053c = false;

    /* renamed from: d, reason: collision with root package name */
    public ag f97054d = new ag(14, false);

    public j(Pattern pattern) {
        this.f97052b = pattern;
    }

    @Override // da0.a
    public final void a(CharSequence charSequence) {
        ag agVar = this.f97054d;
        StringBuilder sb2 = (StringBuilder) agVar.f32386b;
        if (agVar.f32385a != 0) {
            sb2.append('\n');
        }
        sb2.append(charSequence);
        agVar.f32385a++;
        Pattern pattern = this.f97052b;
        if (pattern == null || !pattern.matcher(charSequence).find()) {
            return;
        }
        this.f97053c = true;
    }

    @Override // da0.a
    public final void d() {
        ((StringBuilder) this.f97054d.f32386b).toString();
        this.f97051a.getClass();
        this.f97054d = null;
    }

    @Override // da0.a
    public final ba0.a e() {
        return this.f97051a;
    }

    @Override // da0.a
    public final cf.c h(g gVar) {
        if (this.f97053c) {
            return null;
        }
        if (gVar.f97038h && this.f97052b == null) {
            return null;
        }
        return cf.c.a(gVar.f97032b);
    }
}
