package o9;

import android.content.res.Resources;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public final class c0 extends f {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f0 f79784d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(f0 f0Var) {
        super(f0Var, f0Var.f(), 0);
        this.f79784d = f0Var;
    }

    @Override // o9.f, o9.i
    public final int a(XmlPullParser xmlPullParser) throws XmlPullParserException, Resources.NotFoundException, IOException {
        int iD = j.d(xmlPullParser, "folderItems");
        if (iD != 0) {
            xmlPullParser = this.f79784d.f79912e.getXml(iD);
            j.b(xmlPullParser, "folder");
        }
        return super.a(xmlPullParser);
    }
}
