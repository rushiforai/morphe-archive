package ya0;

import java.util.Locale;
import java.util.ResourceBundle;

/* loaded from: classes.dex */
public final class b extends xa0.a {
    public final c n;
    public wa0.c o;

    public b(c cVar) {
        this.n = cVar;
    }

    @Override // xa0.a, wa0.a
    public final /* bridge */ /* synthetic */ Object a(Locale locale) {
        g(locale);
        return this;
    }

    @Override // xa0.a, wa0.c
    public final String b(a aVar, String str) {
        wa0.c cVar = this.o;
        return cVar == null ? super.b(aVar, str) : cVar.b(aVar, str);
    }

    @Override // xa0.a, wa0.c
    public final String c(a aVar) {
        wa0.c cVar = this.o;
        return cVar == null ? super.c(aVar) : cVar.c(aVar);
    }

    @Override // xa0.a
    /* renamed from: f */
    public final /* bridge */ /* synthetic */ xa0.a a(Locale locale) {
        g(locale);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void g(Locale locale) {
        ResourceBundle bundle = ResourceBundle.getBundle("org.ocpsoft.prettytime.i18n.Resources", locale);
        boolean z11 = bundle instanceof d;
        c cVar = this.n;
        if (z11) {
            wa0.c cVarA = ((d) bundle).a(cVar);
            if (cVarA != null) {
                this.o = cVarA;
            }
        } else {
            this.o = null;
        }
        if (this.o == null) {
            this.f95743h = bundle.getString(cVar.a().concat("Pattern"));
            this.f95744i = bundle.getString(cVar.a().concat("FuturePrefix")).trim();
            this.f95745j = bundle.getString(cVar.a().concat("FutureSuffix")).trim();
            this.f95746k = bundle.getString(cVar.a().concat("PastPrefix")).trim();
            this.f95747l = bundle.getString(cVar.a().concat("PastSuffix")).trim();
            this.f95737b = bundle.getString(cVar.a().concat("SingularName"));
            this.f95738c = bundle.getString(cVar.a().concat("PluralName"));
            try {
                this.f95740e = bundle.getString(cVar.a().concat("FuturePluralName"));
            } catch (Exception unused) {
            }
            try {
                this.f95739d = bundle.getString(cVar.a().concat("FutureSingularName"));
            } catch (Exception unused2) {
            }
            try {
                this.f95742g = bundle.getString(cVar.a().concat("PastPluralName"));
            } catch (Exception unused3) {
            }
            try {
                this.f95741f = bundle.getString(cVar.a().concat("PastSingularName"));
            } catch (Exception unused4) {
            }
        }
    }
}
