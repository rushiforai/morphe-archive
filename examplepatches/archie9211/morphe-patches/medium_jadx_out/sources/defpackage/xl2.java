package defpackage;

import com.medium.proto.obv.post.AnchorType;
import com.squareup.wire.RuntimeEnumAdapter;
import com.squareup.wire.WireEnum;
import com.squareup.wire.WireEnumConstant;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xl2 {
    public final LinkedHashMap a;

    /* JADX WARN: Multi-variable type inference failed */
    public xl2(RuntimeEnumAdapter runtimeEnumAdapter) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        wg6 type = runtimeEnumAdapter.getType();
        Class clsT = type != null ? vx0.T(type) : null;
        Class cls = clsT != null ? clsT : null;
        if (cls != null) {
            WireEnum[] wireEnumArr = (WireEnum[]) cls.getEnumConstants();
            for (AnchorType anchorType : wireEnumArr == null ? new WireEnum[0] : wireEnumArr) {
                anchorType.getClass();
                String strName = anchorType.name();
                linkedHashMap.put(strName, anchorType);
                linkedHashMap.put(String.valueOf(anchorType.getValue()), anchorType);
                linkedHashMap2.put(anchorType, strName);
                WireEnumConstant wireEnumConstant = (WireEnumConstant) cls.getDeclaredField(strName).getAnnotation(WireEnumConstant.class);
                if (wireEnumConstant != null && wireEnumConstant.declaredName().length() > 0) {
                    linkedHashMap.put(wireEnumConstant.declaredName(), anchorType);
                    linkedHashMap2.put(anchorType, wireEnumConstant.declaredName());
                }
            }
        }
        this.a = linkedHashMap;
    }

    public yl2 a() {
        return new yl2(this.a, null, null);
    }

    public xl2() {
        this.a = new LinkedHashMap();
    }
}
