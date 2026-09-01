package defpackage;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j40 extends ObjectInputStream {
    @Override // java.io.ObjectInputStream
    public final ObjectStreamClass readClassDescriptor() throws ClassNotFoundException, IOException {
        ObjectStreamClass classDescriptor = super.readClassDescriptor();
        if (g76.L(classDescriptor.getName(), "com.facebook.appevents.AppEventsLogger$AccessTokenAppIdPair$SerializationProxyV1")) {
            classDescriptor = ObjectStreamClass.lookup(x3.class);
        } else if (g76.L(classDescriptor.getName(), "com.facebook.appevents.AppEventsLogger$AppEvent$SerializationProxyV2")) {
            classDescriptor = ObjectStreamClass.lookup(h40.class);
        }
        classDescriptor.getClass();
        return classDescriptor;
    }
}
