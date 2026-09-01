package defpackage;

import android.graphics.PointF;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s3c {
    public final ArrayList a;
    public PointF b;
    public boolean c;

    public s3c(PointF pointF, boolean z, List list) {
        this.b = pointF;
        this.c = z;
        this.a = new ArrayList(list);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ShapeData{numCurves=");
        sb.append(this.a.size());
        sb.append("closed=");
        return ev6.A(sb, this.c, '}');
    }

    public s3c() {
        this.a = new ArrayList();
    }
}
