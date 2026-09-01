package sprig.graphics;

import android.view.View;
import com.userleap.internal.sessions.util.ViewRedactor;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0006\u0018\u00002\u00020\u0001B\u001d\u0012\u0014\u0010\n\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00020\u00070\u0006¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016R\"\u0010\n\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00020\u00070\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\t¨\u0006\r"}, d2 = {"Lsprig/h/p;", "Lcom/userleap/internal/sessions/util/ViewRedactor;", "Landroid/view/View;", "view", "", "shouldRedact", "", "Ljava/lang/Class;", "a", "Ljava/util/List;", "viewTypes", "<init>", "(Ljava/util/List;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class p implements ViewRedactor {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final List viewTypes;

    public p(List<? extends Class<? extends View>> list) {
        list.getClass();
        this.viewTypes = list;
    }

    @Override // com.userleap.internal.sessions.util.ViewRedactor
    public boolean shouldRedact(View view) {
        view.getClass();
        List list = this.viewTypes;
        if (list != null && list.isEmpty()) {
            return false;
        }
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            if (((Class) it2.next()).isInstance(view)) {
                return true;
            }
        }
        return false;
    }
}
