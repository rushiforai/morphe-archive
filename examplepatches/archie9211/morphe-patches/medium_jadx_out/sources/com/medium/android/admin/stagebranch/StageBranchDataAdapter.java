package com.medium.android.admin.stagebranch;

import defpackage.ay0;
import defpackage.dd6;
import defpackage.hd6;
import defpackage.pmd;
import defpackage.u35;
import defpackage.zd6;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001J\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u0005\u0010\u0006J!\u0010\u000b\u001a\u00020\n2\u0006\u0010\b\u001a\u00020\u00072\b\u0010\t\u001a\u0004\u0018\u00010\u0004H\u0007¢\u0006\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Lcom/medium/android/admin/stagebranch/StageBranchDataAdapter;", "", "Lhd6;", "jsonReader", "Lcom/medium/android/admin/stagebranch/StageBranchData;", "fromJson", "(Lhd6;)Lcom/medium/android/admin/stagebranch/StageBranchData;", "Lzd6;", "writer", "value", "Lc1e;", "toJson", "(Lzd6;Lcom/medium/android/admin/stagebranch/StageBranchData;)V", "admin_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class StageBranchDataAdapter {
    @u35
    public final StageBranchData fromJson(hd6 jsonReader) {
        jsonReader.getClass();
        if (jsonReader.I() == dd6.NULL) {
            jsonReader.a0();
            return null;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        jsonReader.m();
        boolean zNextBoolean = false;
        String strQ = null;
        while (jsonReader.hasNext()) {
            String strX = jsonReader.X();
            if (strX != null) {
                int iHashCode = strX.hashCode();
                if (iHashCode != 115180) {
                    if (iHashCode != 3552281) {
                        if (iHashCode == 1671308008 && strX.equals("disable")) {
                            zNextBoolean = jsonReader.nextBoolean();
                        }
                    } else if (strX.equals("tags")) {
                        jsonReader.m();
                        while (jsonReader.hasNext()) {
                            linkedHashMap.put(jsonReader.X(), jsonReader.q());
                        }
                        jsonReader.B();
                    }
                } else if (strX.equals("ttl")) {
                    strQ = jsonReader.q();
                }
            }
            jsonReader.v();
        }
        jsonReader.B();
        if (!zNextBoolean) {
            if (strQ != null) {
                return new StageBranchData(strQ, linkedHashMap);
            }
            ay0.e("TTL is required");
        }
        return null;
    }

    @pmd
    public final void toJson(zd6 writer, StageBranchData value) {
        writer.getClass();
        if (value == null) {
            writer.I();
            return;
        }
        writer.m();
        writer.D("ttl");
        writer.Q(value.getTimeToLive());
        writer.D("tags");
        writer.m();
        for (Map.Entry<String, String> entry : value.getServices().entrySet()) {
            String key = entry.getKey();
            String value2 = entry.getValue();
            writer.D(key);
            writer.Q(value2);
        }
        writer.p();
        writer.p();
    }
}
