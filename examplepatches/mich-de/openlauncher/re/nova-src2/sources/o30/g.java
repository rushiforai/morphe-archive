package o30;

import android.text.TextUtils;
import java.util.Iterator;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public int f79491a;

    /* renamed from: b, reason: collision with root package name */
    public int f79492b;

    /* renamed from: c, reason: collision with root package name */
    public String f79493c;

    /* renamed from: d, reason: collision with root package name */
    public String f79494d;

    /* renamed from: e, reason: collision with root package name */
    public String f79495e;

    /* renamed from: f, reason: collision with root package name */
    public long f79496f;

    /* renamed from: g, reason: collision with root package name */
    public String f79497g;

    /* renamed from: h, reason: collision with root package name */
    public String f79498h;

    /* renamed from: i, reason: collision with root package name */
    public String f79499i;

    public static g a(String str, String str2) {
        TextUtils.SimpleStringSplitter simpleStringSplitter = new TextUtils.SimpleStringSplitter(AbstractJsonLexerKt.COLON);
        simpleStringSplitter.setString(str);
        Iterator<String> it = simpleStringSplitter.iterator();
        if (!it.hasNext()) {
            throw new IllegalArgumentException("Blank response.");
        }
        String next = it.next();
        String next2 = it.hasNext() ? it.next() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String[] strArrSplit = TextUtils.split(next, Pattern.quote("|"));
        if (strArrSplit.length < 6) {
            throw new IllegalArgumentException("Wrong number of fields.");
        }
        g gVar = new g();
        gVar.f79497g = next2;
        gVar.f79491a = Integer.parseInt(strArrSplit[0]);
        gVar.f79492b = Integer.parseInt(strArrSplit[1]);
        gVar.f79493c = strArrSplit[2];
        gVar.f79499i = str2;
        gVar.f79494d = strArrSplit[3];
        gVar.f79498h = str;
        gVar.f79495e = strArrSplit[4];
        gVar.f79496f = Long.parseLong(strArrSplit[5]);
        return gVar;
    }

    public final String toString() {
        return TextUtils.join("|", new Object[]{Integer.valueOf(this.f79491a), Integer.valueOf(this.f79492b), this.f79493c, this.f79494d, this.f79495e, Long.valueOf(this.f79496f)});
    }
}
