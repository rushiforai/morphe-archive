package defpackage;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class i {
    public static final AtomicBoolean a = new AtomicBoolean(false);

    public static final void a() {
        File[] fileArrListFiles;
        if (ec2.a.contains(i.class)) {
            return;
        }
        try {
            if (epe.H()) {
                return;
            }
            File fileU = xz5.U();
            int i = 0;
            if (fileU == null) {
                fileArrListFiles = new File[0];
            } else {
                fileArrListFiles = fileU.listFiles(new fc2(6));
                if (fileArrListFiles == null) {
                    fileArrListFiles = new File[0];
                }
            }
            ArrayList arrayList = new ArrayList(fileArrListFiles.length);
            for (File file : fileArrListFiles) {
                arrayList.add(vv2.Q(file));
            }
            ArrayList arrayList2 = new ArrayList();
            for (Object obj : arrayList) {
                if (((z36) obj).a()) {
                    arrayList2.add(obj);
                }
            }
            List listF1 = bu1.f1(arrayList2, new g(i));
            JSONArray jSONArray = new JSONArray();
            Iterator it2 = iq7.W(0, Math.min(listF1.size(), 5)).iterator();
            while (((m46) it2).c) {
                jSONArray.put(listF1.get(((g46) it2).nextInt()));
            }
            xz5.v0("anr_reports", jSONArray, new h(listF1, i));
        } catch (Throwable th) {
            ec2.a(i.class, th);
        }
    }
}
