package com.tiktok.appevents;

import com.tiktok.appevents.TTAppEvent;
import com.tiktok.appevents.TTCrashHandler;
import com.tiktok.util.IOUtils;
import h6.c1;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes4.dex */
public class TTSafeReadObjectUtil {
    public static <T> T safeReadObjects(final List<Class<?>> list, final long j11, final long j12, InputStream inputStream) throws IOException, ClassNotFoundException {
        FilterInputStream filterInputStream = new FilterInputStream(inputStream) { // from class: com.tiktok.appevents.TTSafeReadObjectUtil.1
            private long length = 0;

            private void checkLength() {
                if (this.length <= j12) {
                    return;
                }
                throw new SecurityException("too many bytes from stream. Limit is " + j12);
            }

            @Override // java.io.FilterInputStream, java.io.InputStream
            public int read() throws IOException {
                int i5 = super.read();
                if (i5 != -1) {
                    this.length++;
                    checkLength();
                }
                return i5;
            }

            @Override // java.io.FilterInputStream, java.io.InputStream
            public int read(byte[] bArr, int i5, int i11) throws IOException {
                int i12 = super.read(bArr, i5, i11);
                if (i12 > 0) {
                    this.length += i12;
                    checkLength();
                }
                return i12;
            }
        };
        ObjectInputStream objectInputStream = new ObjectInputStream(filterInputStream) { // from class: com.tiktok.appevents.TTSafeReadObjectUtil.2
            private int objCount = 0;
            boolean enableResolve = enableResolveObject(true);

            @Override // java.io.ObjectInputStream
            public Class<?> resolveClass(ObjectStreamClass objectStreamClass) throws ClassNotFoundException, IOException {
                Class<?> clsResolveClass = super.resolveClass(objectStreamClass);
                if (clsResolveClass.isArray() || clsResolveClass.equals(String.class) || Number.class.isAssignableFrom(clsResolveClass) || list.contains(clsResolveClass)) {
                    return clsResolveClass;
                }
                throw new SecurityException(c1.r(clsResolveClass, "deserialize unauthorized "));
            }

            @Override // java.io.ObjectInputStream
            public Object resolveObject(Object obj) throws IOException {
                int i5 = this.objCount;
                this.objCount = i5 + 1;
                if (i5 <= j11) {
                    return super.resolveObject(obj);
                }
                throw new SecurityException("too many objects from stream. Limit is " + j11);
            }
        };
        T t6 = (T) objectInputStream.readObject();
        IOUtils.close(inputStream, filterInputStream, objectInputStream);
        return t6;
    }

    public static TTAppEventPersist safeReadTTAppEventPersist(InputStream inputStream) throws IOException, ClassNotFoundException {
        ArrayList arrayList = new ArrayList();
        arrayList.add(TTAppEventPersist.class);
        arrayList.add(ArrayList.class);
        arrayList.add(TTAppEvent.class);
        arrayList.add(Enum.class);
        arrayList.add(String.class);
        arrayList.add(Date.class);
        arrayList.add(Long.class);
        arrayList.add(TTUserInfo.class);
        arrayList.add(TTAppEvent.TTAppEventType.class);
        return (TTAppEventPersist) safeReadObjects(arrayList, Long.MAX_VALUE, Long.MAX_VALUE, inputStream);
    }

    public static TTCrashHandler.TTCrashReport safeReadTTCrashHandler(InputStream inputStream) throws IOException, ClassNotFoundException {
        ArrayList arrayList = new ArrayList();
        arrayList.add(TTCrashHandler.TTCrashReport.class);
        arrayList.add(TTCrashHandler.TTCrashReport.Monitor.class);
        arrayList.add(String.class);
        arrayList.add(Long.class);
        arrayList.add(Integer.class);
        arrayList.add(ArrayList.class);
        arrayList.add(CopyOnWriteArrayList.class);
        arrayList.add(List.class);
        return (TTCrashHandler.TTCrashReport) safeReadObjects(arrayList, Long.MAX_VALUE, Long.MAX_VALUE, inputStream);
    }
}
