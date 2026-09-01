package com.squareup.wire.internal;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.WireEnum;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000,\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\u001a/\u0010\u0006\u001a\u00020\u0005\"\u0004\b\u0000\u0010\u00002\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00028\u00000\u00012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003¢\u0006\u0004\b\u0006\u0010\u0007\u001a3\u0010\u0006\u001a\u00020\u0005\"\u0004\b\u0000\u0010\u00002\u0010\u0010\t\u001a\f\u0012\u0002\b\u0003\u0012\u0004\u0012\u00028\u00000\b2\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003¢\u0006\u0004\b\u0006\u0010\n\"'\u0010\u0010\u001a\u0004\u0018\u00018\u0000\"\b\b\u0000\u0010\f*\u00020\u000b*\b\u0012\u0004\u0012\u00028\u00000\r8F¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0011"}, d2 = {"T", "", "list", "Lcom/squareup/wire/ProtoAdapter;", "adapter", "Lc1e;", "redactElements", "(Ljava/util/List;Lcom/squareup/wire/ProtoAdapter;)V", "", "map", "(Ljava/util/Map;Lcom/squareup/wire/ProtoAdapter;)V", "Lcom/squareup/wire/WireEnum;", "E", "Ljava/lang/Class;", "getIdentityOrNull", "(Ljava/lang/Class;)Lcom/squareup/wire/WireEnum;", "identityOrNull", "wire-runtime"}, k = 5, mv = {2, 0, 0}, xi = 48, xs = "com/squareup/wire/internal/Internal")
final /* synthetic */ class Internal__InternalJvmKt {
    public static final <E extends WireEnum> E getIdentityOrNull(Class<E> cls) {
        E e;
        cls.getClass();
        E[] enumConstants = cls.getEnumConstants();
        enumConstants.getClass();
        int length = enumConstants.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                e = null;
                break;
            }
            e = enumConstants[i];
            E e2 = e;
            e2.getClass();
            if (e2.getValue() == 0) {
                break;
            }
            i++;
        }
        return e;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final <T> void redactElements(Map<?, T> map, ProtoAdapter<T> protoAdapter) {
        map.getClass();
        protoAdapter.getClass();
        for (Map.Entry entry : map.entrySet()) {
            entry.setValue(protoAdapter.redact(entry.getValue()));
        }
    }

    public static final <T> void redactElements(List<T> list, ProtoAdapter<T> protoAdapter) {
        list.getClass();
        protoAdapter.getClass();
        int size = list.size();
        for (int i = 0; i < size; i++) {
            list.set(i, protoAdapter.redact(list.get(i)));
        }
    }
}
