package com.apm.insight.l;

import android.annotation.TargetApi;
import android.os.Debug;
import java.util.Map;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    private static a f21745a = new b(0);

    public static class a {
        private a() {
        }

        public int a(Debug.MemoryInfo memoryInfo) {
            return -1;
        }

        public int b(Debug.MemoryInfo memoryInfo) {
            return -1;
        }

        public int c(Debug.MemoryInfo memoryInfo) {
            return -1;
        }

        public /* synthetic */ a(byte b11) {
            this();
        }
    }

    @TargetApi(19)
    public static class b extends a {
        private b() {
            super((byte) 0);
        }

        @Override // com.apm.insight.l.c.a
        public final int a(Debug.MemoryInfo memoryInfo) {
            return memoryInfo.getTotalPrivateClean();
        }

        @Override // com.apm.insight.l.c.a
        public final int b(Debug.MemoryInfo memoryInfo) {
            return memoryInfo.getTotalSharedClean();
        }

        @Override // com.apm.insight.l.c.a
        public final int c(Debug.MemoryInfo memoryInfo) {
            return memoryInfo.getTotalSwappablePss();
        }

        public /* synthetic */ b(byte b11) {
            this();
        }
    }

    public static int a(Debug.MemoryInfo memoryInfo) {
        return f21745a.a(memoryInfo);
    }

    public static int b(Debug.MemoryInfo memoryInfo) {
        return f21745a.b(memoryInfo);
    }

    public static int c(Debug.MemoryInfo memoryInfo) {
        return f21745a.c(memoryInfo);
    }

    /* renamed from: com.apm.insight.l.c$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        public static Long a(Map<? super String, Long> map, String str, Long l9) {
            if (str == null || map == null) {
                return -1L;
            }
            Long l11 = map.get(str);
            if (l11 != null) {
                l9 = Long.valueOf(l9.longValue() + l11.longValue());
            }
            map.put(str, l9);
            return l9;
        }

        public static Float a(Map<? super String, Float> map) {
            float fFloatValue = 0.0f;
            for (Float f11 : map.values()) {
                if (f11 != null) {
                    fFloatValue = f11.floatValue() + fFloatValue;
                }
            }
            return Float.valueOf(fFloatValue);
        }

        public static int a(Object obj, int i5) {
            if (obj != null) {
                if (obj instanceof Integer) {
                    return ((Integer) obj).intValue();
                }
                if (obj instanceof String) {
                    try {
                        return Integer.parseInt(String.valueOf(obj));
                    } catch (Throwable unused) {
                    }
                }
            }
            return i5;
        }
    }
}
