package sprig.graphics;

import android.view.View;
import com.userleap.internal.sessions.util.ViewRedactor;
import defpackage.muc;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: renamed from: sprig.h.c, reason: case insensitive filesystem */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0006\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00070\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\t¨\u0006\r"}, d2 = {"Lsprig/h/c;", "Lcom/userleap/internal/sessions/util/ViewRedactor;", "Landroid/view/View;", "view", "", "shouldRedact", "", "", "a", "Ljava/util/List;", "classNames", "<init>", "(Ljava/util/List;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class C0051c implements ViewRedactor {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final List classNames;

    public C0051c(List<String> list) {
        list.getClass();
        this.classNames = list;
    }

    @Override // com.userleap.internal.sessions.util.ViewRedactor
    public boolean shouldRedact(View view) {
        view.getClass();
        List list = this.classNames;
        if (list == null || !list.isEmpty()) {
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                if (muc.Q(view.getClass().getName(), (String) it2.next(), false)) {
                    return true;
                }
            }
        }
        return false;
    }
}
