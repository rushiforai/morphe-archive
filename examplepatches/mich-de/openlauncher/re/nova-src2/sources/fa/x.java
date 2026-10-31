package fa;

import android.content.Context;
import android.content.Intent;
import android.os.UserHandle;
import android.util.AtomicFile;
import android.util.Log;
import android.util.Xml;
import com.google.android.gms.internal.measurement.v6;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.dex */
public final class x {

    /* renamed from: e, reason: collision with root package name */
    public static final x7.c f54523e = new x7.c(new bb.a(18));

    /* renamed from: b, reason: collision with root package name */
    public final Context f54525b;

    /* renamed from: d, reason: collision with root package name */
    public List f54527d;

    /* renamed from: a, reason: collision with root package name */
    public final v6 f54524a = new v6(28);

    /* renamed from: c, reason: collision with root package name */
    public int f54526c = 0;

    public x(Context context) {
        this.f54525b = context;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r4v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r4v2, types: [java.util.List] */
    public final void a() {
        w wVarF;
        if (this.f54527d == null) {
            b00.z0 z0Var = new b00.z0(this, 10);
            v6 v6Var = this.f54524a;
            v6Var.getClass();
            String str = (String) v6Var.f33136b;
            x7.c cVar = ja.h.f69294h;
            Context context = this.f54525b;
            ja.h hVar = (ja.h) cVar.h(context);
            Objects.requireNonNull(hVar);
            ?? arrayList = new ArrayList();
            try {
                FileInputStream fileInputStreamOpenRead = new AtomicFile(context.getFileStreamPath(str)).openRead();
                try {
                    XmlPullParser xmlPullParserNewPullParser = Xml.newPullParser();
                    xmlPullParserNewPullParser.setInput(new InputStreamReader(fileInputStreamOpenRead, StandardCharsets.UTF_8));
                    o9.j.b(xmlPullParserNewPullParser, "items");
                    int depth = xmlPullParserNewPullParser.getDepth();
                    while (true) {
                        int next = xmlPullParserNewPullParser.next();
                        if (next == 3 && xmlPullParserNewPullParser.getDepth() <= depth) {
                            break;
                        }
                        if (next == 1) {
                            break;
                        }
                        if (next == 2 && "entry".equals(xmlPullParserNewPullParser.getName())) {
                            try {
                                int i5 = Integer.parseInt(xmlPullParserNewPullParser.getAttributeValue(null, "itemType"));
                                UserHandle userHandleE = hVar.e(Long.parseLong(xmlPullParserNewPullParser.getAttributeValue(null, "profileId")));
                                Intent uri = Intent.parseUri(xmlPullParserNewPullParser.getAttributeValue(null, "intent"), 0);
                                if (userHandleE != null && uri != null && (wVarF = z0Var.f(i5, userHandleE, uri)) != null) {
                                    arrayList.add(wVarF);
                                }
                            } catch (Exception unused) {
                            }
                        }
                    }
                    if (fileInputStreamOpenRead != null) {
                        fileInputStreamOpenRead.close();
                    }
                } finally {
                }
            } catch (FileNotFoundException unused2) {
            } catch (IOException e3) {
                e = e3;
                Log.e("PersistedItemArray", "Unable to read items in " + str, e);
                arrayList = Collections.EMPTY_LIST;
            } catch (XmlPullParserException e11) {
                e = e11;
                Log.e("PersistedItemArray", "Unable to read items in " + str, e);
                arrayList = Collections.EMPTY_LIST;
            }
            this.f54527d = arrayList;
        }
    }

    public final void b(w wVar) {
        Exception exc = new Exception();
        ya.x xVar = ya.j.f97149d;
        xVar.a(new androidx.fragment.app.d(16, this, wVar, exc));
        if (this.f54526c != 0) {
            return;
        }
        xVar.a(new ae.m(this, 6));
    }
}
