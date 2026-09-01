package defpackage;

import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import org.xmlpull.v1.XmlPullParser;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qt {
    public final XmlPullParser a;
    public int b = 0;
    public final my6 c;

    public qt(XmlResourceParser xmlResourceParser) {
        this.a = xmlResourceParser;
        my6 my6Var = new my6();
        my6Var.a = new float[64];
        this.c = my6Var;
    }

    public final float a(TypedArray typedArray, String str, int i, float f) {
        if (dl7.t(this.a, str)) {
            f = typedArray.getFloat(i, f);
        }
        b(typedArray.getChangingConfigurations());
        return f;
    }

    public final void b(int i) {
        this.b = i | this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qt)) {
            return false;
        }
        qt qtVar = (qt) obj;
        return g76.L(this.a, qtVar.a) && this.b == qtVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("AndroidVectorParser(xmlParser=");
        sb.append(this.a);
        sb.append(", config=");
        return km4.A(sb, this.b, ')');
    }
}
