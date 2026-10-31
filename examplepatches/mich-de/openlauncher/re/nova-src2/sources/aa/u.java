package aa;

import android.content.ComponentName;
import android.content.pm.PackageInstaller;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.os.Trace;
import android.os.UserHandle;
import android.util.Pair;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.stream.Collectors;

/* loaded from: classes2.dex */
public final /* synthetic */ class u implements BiConsumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f655a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f656b;

    public /* synthetic */ u(Object obj, int i5) {
        this.f655a = i5;
        this.f656b = obj;
    }

    @Override // java.util.function.BiConsumer
    public final void accept(Object obj, Object obj2) {
        switch (this.f655a) {
            case 0:
                d0 d0Var = (d0) this.f656b;
                Pair pair = (Pair) obj;
                List list = (List) obj2;
                d0Var.getClass();
                Map map = (Map) list.stream().collect(Collectors.groupingBy(new t(1)));
                Trace.beginSection("loadIconSubsectionInBulk");
                try {
                    Cursor cursorG = d0Var.g(list, (UserHandle) pair.first, ((Boolean) pair.second).booleanValue());
                    try {
                        int columnIndexOrThrow = cursorG.getColumnIndexOrThrow("componentName");
                        while (cursorG.moveToNext()) {
                            ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(cursorG.getString(columnIndexOrThrow));
                            List list2 = (List) map.get(componentNameUnflattenFromString);
                            if (componentNameUnflattenFromString != null) {
                                ba.b bVarE = d0Var.e(componentNameUnflattenFromString, (UserHandle) pair.first, new v(list2, 0), d0Var.o, cursorG, false, ((Boolean) pair.second).booleanValue());
                                Iterator it = list2.iterator();
                                while (it.hasNext()) {
                                    d0Var.c(bVarE, ((ga.d) it.next()).f57281a);
                                }
                            }
                        }
                        cursorG.close();
                    } finally {
                    }
                } catch (SQLiteException unused) {
                } catch (Throwable th2) {
                    Trace.endSection();
                    throw th2;
                }
                Trace.endSection();
                return;
            default:
                ((ja.c) this.f656b).f69277a.put(((PackageInstaller.SessionInfo) obj2).getSessionId(), (ya.g0) obj);
                return;
        }
    }
}
