package defpackage;

import android.os.BadParcelableException;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Messenger;
import android.util.Log;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ll7 extends Handler {
    public final WeakReference a;
    public WeakReference b;

    public ll7(nl7 nl7Var) {
        this.a = new WeakReference(nl7Var);
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        WeakReference weakReference = this.b;
        if (weakReference == null || weakReference.get() == null) {
            return;
        }
        WeakReference weakReference2 = this.a;
        if (weakReference2.get() == null) {
            return;
        }
        Bundle data = message.getData();
        zm7.w(data);
        nl7 nl7Var = (nl7) weakReference2.get();
        Messenger messenger = (Messenger) this.b.get();
        try {
            int i = message.what;
            if (i == 1) {
                zm7.w(data.getBundle("data_root_hints"));
                data.getString("data_media_item_id");
                nl7Var.getClass();
                return;
            }
            if (i == 2) {
                nl7Var.getClass();
                return;
            }
            if (i != 3) {
                Log.w("MediaBrowserCompat", "Unhandled message: " + message + "\n  Client version: 1\n  Service version: " + message.arg1);
                return;
            }
            zm7.w(data.getBundle("data_options"));
            zm7.w(data.getBundle("data_notify_children_changed_options"));
            String string = data.getString("data_media_item_id");
            data.getParcelableArrayList("data_media_item_list");
            if (nl7Var.g != messenger) {
                return;
            }
            if (nl7Var.e.get(string) != null) {
                throw new ClassCastException();
            }
            if (pl7.b) {
                Log.d("MediaBrowserCompat", "onLoadChildren for id that isn't subscribed id=" + string);
            }
        } catch (BadParcelableException unused) {
            Log.e("MediaBrowserCompat", "Could not unparcel the data.");
            if (message.what == 1) {
                nl7Var.getClass();
            }
        }
    }
}
