package com.squareup.wire.internal;

import j$.util.DesugarCollections;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000D\n\u0000\n\u0002\u0010!\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010%\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a&\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u0001H\u0086\b¢\u0006\u0004\b\u0003\u0010\u0004\u001a8\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\b\"\u0004\b\u0000\u0010\u0005\"\u0004\b\u0001\u0010\u0006*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0007H\u0086\b¢\u0006\u0004\b\t\u0010\n\u001a\u001f\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u000b2\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010*\n\u0010\u0012\"\u00020\u00112\u00020\u0011*\n\u0010\u0014\"\u00020\u00132\u00020\u0013*\n\u0010\u0015\"\u00020\u00132\u00020\u0013*\n\u0010\u0016\"\u00020\u00132\u00020\u0013*\n\u0010\u0017\"\u00020\u00132\u00020\u0013*\n\u0010\u0019\"\u00020\u00182\u00020\u0018*\n\u0010\u001b\"\u00020\u001a2\u00020\u001a¨\u0006\u001c"}, d2 = {"T", "", "", "toUnmodifiableList", "(Ljava/util/List;)Ljava/util/List;", "K", "V", "", "", "toUnmodifiableMap", "(Ljava/util/Map;)Ljava/util/Map;", "", "string", "", "upperCamel", "camelCase", "(Ljava/lang/String;Z)Ljava/lang/String;", "Ljava/io/Serializable;", "Serializable", "", "JvmDefaultWithCompatibility", "JvmField", "JvmSynthetic", "JvmStatic", "Ljava/io/ObjectStreamException;", "ObjectStreamException", "Ljava/net/ProtocolException;", "ProtocolException", "wire-runtime"}, k = 2, mv = {2, 0, 0}, xi = 48)
public final class _PlatformKt {
    public static final String camelCase(String str, boolean z) {
        str.getClass();
        StringBuilder sb = new StringBuilder(str.length());
        int iCharCount = 0;
        while (iCharCount < str.length()) {
            int iCodePointAt = str.codePointAt(iCharCount);
            iCharCount += Character.charCount(iCodePointAt);
            if (iCodePointAt == 95) {
                z = true;
            } else {
                if (z && 97 <= iCodePointAt && iCodePointAt < 123) {
                    iCodePointAt -= 32;
                }
                sb.appendCodePoint(iCodePointAt);
                z = false;
            }
        }
        return sb.toString();
    }

    public static /* synthetic */ String camelCase$default(String str, boolean z, int i, Object obj) {
        if ((i & 2) != 0) {
            z = false;
        }
        return camelCase(str, z);
    }

    public static final <T> List<T> toUnmodifiableList(List<T> list) {
        list.getClass();
        List<T> listUnmodifiableList = DesugarCollections.unmodifiableList(list);
        listUnmodifiableList.getClass();
        return listUnmodifiableList;
    }

    public static final <K, V> Map<K, V> toUnmodifiableMap(Map<K, V> map) {
        map.getClass();
        Map<K, V> mapUnmodifiableMap = DesugarCollections.unmodifiableMap(map);
        mapUnmodifiableMap.getClass();
        return mapUnmodifiableMap;
    }
}
