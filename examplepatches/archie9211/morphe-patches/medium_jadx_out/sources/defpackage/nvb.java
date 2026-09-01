package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.proto.model.SectionModel;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nvb {
    public static final /* synthetic */ int a = 0;

    static {
        d46.Q(new SectionModel(null, 0, null, null, null, null, null, null, null, null, PhotoshopDirectory.TAG_EPS_OPTIONS, null));
    }

    public static Integer a(int i, List list) {
        int i2;
        if (list == null || list.isEmpty()) {
            return null;
        }
        int size = list.size();
        d46.X(list.size(), size);
        int i3 = size - 1;
        int i4 = 0;
        while (true) {
            if (i4 > i3) {
                i2 = -(i4 + 1);
                break;
            }
            i2 = (i4 + i3) >>> 1;
            SectionModel sectionModel = (SectionModel) list.get(i2);
            sectionModel.getClass();
            int iQ = g76.Q(sectionModel.start_index, i);
            if (iQ >= 0) {
                if (iQ <= 0) {
                    break;
                }
                i3 = i2 - 1;
            } else {
                i4 = i2 + 1;
            }
        }
        int i5 = (-i2) - 2;
        if (i2 >= 0) {
            return Integer.valueOf(i2);
        }
        if (i5 >= 0) {
            return Integer.valueOf(i5);
        }
        return null;
    }

    public static boolean b(f17 f17Var) {
        Collection<f09> collection;
        f17Var.getClass();
        if (f17Var.isEmpty()) {
            return true;
        }
        wn5 wn5Var = (wn5) f17Var.listIterator(0);
        if (wn5Var.hasNext()) {
            ArrayList arrayList = new ArrayList();
            Object next = wn5Var.next();
            while (wn5Var.hasNext()) {
                Object next2 = wn5Var.next();
                arrayList.add(new f09(next, next2));
                next = next2;
            }
            collection = arrayList;
        } else {
            collection = ey3.a;
        }
        if (collection.isEmpty()) {
            return true;
        }
        for (f09 f09Var : collection) {
            if (((SectionModel) f09Var.a).start_index >= ((SectionModel) f09Var.b).start_index) {
                return false;
            }
        }
        return true;
    }
}
