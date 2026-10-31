package com.bytedance.sdk.component.adexpress.ycx.zb;

import android.text.TextUtils;
import android.util.Pair;
import b.c0;
import com.bytedance.sdk.component.adexpress.ycx.sya.ycx;
import com.bytedance.sdk.component.utils.rmf;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public abstract class sya {
    public void sya(List<ycx.C0036ycx> list) {
        if (list == null || list.isEmpty()) {
            return;
        }
        Iterator<ycx.C0036ycx> it = list.iterator();
        while (it.hasNext()) {
            File file = new File(ycx(), com.bytedance.sdk.component.utils.lud.ycx(it.next().ycx()));
            File file2 = new File(file + ".tmp");
            if (file.exists()) {
                try {
                    file.delete();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "X+shkBe5Xs+FRPNSmx+sJ1rqCIcRs3s=", 347);
                }
            }
            if (file2.exists()) {
                try {
                    file2.delete();
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "X+shkBe5Xs+FRPNSmx+sJ1rqCIcRs3s=", 353);
                }
            }
        }
    }

    public abstract File ycx();

    public boolean ycx(Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> map) {
        if (map == null || map.size() == 0) {
            return false;
        }
        Iterator<String> it = map.keySet().iterator();
        while (it.hasNext()) {
            com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar = map.get(it.next());
            if (ycxVar != null && !ycx(ycxVar.lt())) {
                return false;
            }
        }
        return true;
    }

    public List<ycx.C0036ycx> zb(com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar, com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar2) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        List<ycx.C0036ycx> arrayList3 = new ArrayList<>();
        if (ycxVar2 == null || ycxVar2.lt().isEmpty()) {
            arrayList2.addAll(ycxVar.lt());
        } else if (ycxVar.lt().isEmpty()) {
            arrayList.addAll(ycxVar2.lt());
        } else {
            for (ycx.C0036ycx c0036ycx : ycxVar.lt()) {
                if (!ycxVar2.lt().contains(c0036ycx) && c0036ycx != null && c0036ycx.ycx() != null && c0036ycx.zb() != null) {
                    arrayList2.add(c0036ycx);
                }
            }
            for (ycx.C0036ycx c0036ycx2 : ycxVar2.lt()) {
                if (!ycxVar.lt().contains(c0036ycx2)) {
                    arrayList.add(c0036ycx2);
                }
            }
        }
        if (ycx(arrayList2, arrayList3)) {
            return arrayList;
        }
        return null;
    }

    public boolean ycx(List<ycx.C0036ycx> list) throws IOException {
        if (list == null || list.size() <= 0 || ycx() == null) {
            return false;
        }
        for (ycx.C0036ycx c0036ycx : list) {
            String strYcx = com.bytedance.sdk.component.utils.lud.ycx(c0036ycx.ycx());
            if (TextUtils.isEmpty(strYcx)) {
                return false;
            }
            File file = new File(ycx(), strYcx);
            String strYcx2 = com.bytedance.sdk.component.utils.lud.ycx(file);
            if (!file.exists() || !file.isFile() || c0036ycx.zb() == null || !c0036ycx.zb().equals(strYcx2)) {
                return false;
            }
        }
        return true;
    }

    public static boolean sya(com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar, com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar2) {
        if (ycxVar != null) {
            try {
                if (!TextUtils.isEmpty(ycxVar.sya())) {
                    if (ycxVar2 == null) {
                        return false;
                    }
                    String strUl = ycxVar.ul();
                    String strUl2 = ycxVar2.ul();
                    if ((!TextUtils.isEmpty(strUl2) && !strUl2.equals(strUl)) || ycx(ycxVar.sya(), ycxVar2.sya())) {
                        return true;
                    }
                    Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> mapYcx = ycxVar.ycx();
                    Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> mapYcx2 = ycxVar2.ycx();
                    if (mapYcx.isEmpty()) {
                        return !mapYcx2.isEmpty();
                    }
                    if (mapYcx2.isEmpty()) {
                        return false;
                    }
                    return ycx(mapYcx, mapYcx2);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "VesokS6pZdOJb9lahR+lHUvqLIEG", 474);
                th2.getMessage();
                return false;
            }
        }
        return true;
    }

    public boolean ycx(ycx.zb zbVar) {
        if (zbVar == null || ycx() == null) {
            return false;
        }
        List<Pair<String, String>> listZb = zbVar.zb();
        if (listZb == null || listZb.size() <= 0) {
            return true;
        }
        Iterator<Pair<String, String>> it = listZb.iterator();
        while (it.hasNext()) {
            File file = new File(ycx(), (String) it.next().first);
            if (!file.exists() || !file.isFile()) {
                return false;
            }
        }
        return true;
    }

    public void zb(List<ycx.C0036ycx> list) {
        if (list == null || list.isEmpty()) {
            return;
        }
        Iterator<ycx.C0036ycx> it = list.iterator();
        while (it.hasNext()) {
            File file = new File(ycx(), com.bytedance.sdk.component.utils.lud.ycx(it.next().ycx()));
            File file2 = new File(file + ".tmp");
            if (file.exists()) {
                try {
                    file.delete();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "X+EJkA+5fcI=", 291);
                }
            }
            if (file2.exists()) {
                try {
                    file2.delete();
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "X+EJkA+5fcI=", 297);
                }
            }
        }
    }

    public List<ycx.C0036ycx> ycx(com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar, com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar2) {
        Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> mapYcx = ycxVar.ycx();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        List<ycx.C0036ycx> arrayList3 = new ArrayList<>();
        if (mapYcx.size() == 0) {
            if (ycxVar2 != null && ycxVar2.ycx().size() != 0) {
                Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> mapYcx2 = ycxVar2.ycx();
                Iterator<String> it = mapYcx2.keySet().iterator();
                while (it.hasNext()) {
                    com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar3 = mapYcx2.get(it.next());
                    if (ycxVar3 != null) {
                        arrayList.addAll(ycxVar3.lt());
                    }
                }
            }
        } else if (ycxVar2 != null && ycxVar2.ycx().size() != 0) {
            Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> mapYcx3 = ycxVar2.ycx();
            for (String str : mapYcx.keySet()) {
                com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar4 = mapYcx.get(str);
                com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar5 = mapYcx3.get(str);
                if (ycxVar5 == null && ycxVar4 != null) {
                    arrayList2.addAll(ycxVar4.lt());
                } else if (ycxVar4 == null && ycxVar5 != null) {
                    arrayList.addAll(ycxVar5.lt());
                } else if (ycxVar4 != null) {
                    for (ycx.C0036ycx c0036ycx : ycxVar4.lt()) {
                        if (c0036ycx != null && !ycxVar5.lt().contains(c0036ycx) && c0036ycx.zb() != null && c0036ycx.ycx() != null) {
                            arrayList2.add(c0036ycx);
                        }
                    }
                    for (ycx.C0036ycx c0036ycx2 : ycxVar5.lt()) {
                        if (c0036ycx2 != null && !ycxVar4.lt().contains(c0036ycx2)) {
                            arrayList.add(c0036ycx2);
                        }
                    }
                }
            }
        } else if (mapYcx.size() != 0) {
            Iterator<String> it2 = mapYcx.keySet().iterator();
            while (it2.hasNext()) {
                com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar6 = mapYcx.get(it2.next());
                if (ycxVar6 != null) {
                    arrayList2.addAll(ycxVar6.lt());
                }
            }
        }
        if (ycx(arrayList2, arrayList3)) {
            return arrayList;
        }
        return null;
    }

    public static void zb(File file, com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar, String str) {
        if (ycxVar == null || file == null) {
            return;
        }
        try {
            new File(file, str).delete();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "WOIolBE=", 578);
        }
        if (ycxVar.lt() != null) {
            Iterator<ycx.C0036ycx> it = ycxVar.lt().iterator();
            while (it.hasNext()) {
                try {
                    new File(file, com.bytedance.sdk.component.utils.lud.ycx(it.next().ycx())).delete();
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "WOIolBE=", 589);
                }
            }
        }
    }

    private boolean ycx(List<ycx.C0036ycx> list, List<ycx.C0036ycx> list2) {
        for (ycx.C0036ycx c0036ycx : list) {
            String strYcx = c0036ycx.ycx();
            String strYcx2 = com.bytedance.sdk.component.utils.lud.ycx(strYcx);
            File file = new File(ycx(), strYcx2);
            File file2 = new File(file + ".tmp");
            if (file.exists()) {
                try {
                    file.delete();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "SessmQ+lTcikRcBTgB6hLA==", Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE);
                }
            }
            if (file2.exists()) {
                try {
                    file2.delete();
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "SessmQ+lTcikRcBTgB6hLA==", Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE);
                }
            }
            com.bytedance.sdk.component.ul.zb.ycx ycxVarLt = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().lt();
            ycxVarLt.sya(strYcx);
            ycxVarLt.ycx(ycx().getAbsolutePath(), strYcx2);
            com.bytedance.sdk.component.ul.zb zbVarLud = ycxVarLt.lud();
            list2.add(c0036ycx);
            if (zbVarLud == null || !zbVarLud.lt() || zbVarLud.lud() == null || !zbVarLud.lud().exists()) {
                sya(list2);
                return false;
            }
        }
        return true;
    }

    public boolean ycx(String str) {
        File file = new File(ycx().getAbsoluteFile(), c0.E(com.bytedance.sdk.component.utils.lud.ycx(str), ".zip"));
        com.bytedance.sdk.component.ul.zb.ycx ycxVarLt = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().lt();
        ycxVarLt.sya(str);
        ycxVarLt.ycx(file.getParent(), file.getName());
        com.bytedance.sdk.component.ul.zb zbVarLud = ycxVarLt.lud();
        if (zbVarLud.lt() && zbVarLud.lud() != null && zbVarLud.lud().exists()) {
            File fileLud = zbVarLud.lud();
            try {
                rmf.ycx(fileLud.getAbsolutePath(), file.getParent());
                if (!fileLud.exists()) {
                    return true;
                }
                fileLud.delete();
                return true;
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "X+E6mw+zaMOyT8R8nhKoIU3r", Sdk.SDKError.Reason.BLACK_SCREEN_DETECTION_ERROR_VALUE);
            }
        }
        return false;
    }

    public void ycx(int i5) {
        if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().dj() != null) {
            com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().dj().ycx(i5);
        }
    }

    public static void ycx(File file, com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar, String str) throws IOException {
        FileOutputStream fileOutputStream;
        if (ycxVar == null) {
            return;
        }
        String strJc = ycxVar.jc();
        if (TextUtils.isEmpty(strJc)) {
            return;
        }
        File file2 = new File(file, str);
        File file3 = new File(file2 + ".tmp");
        if (file3.exists()) {
            file3.delete();
        }
        FileOutputStream fileOutputStream2 = null;
        try {
            try {
                fileOutputStream = new FileOutputStream(file3);
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                fileOutputStream.write(strJc.getBytes("utf-8"));
                if (file2.exists()) {
                    file2.delete();
                }
                file3.renameTo(file2);
                fileOutputStream.close();
            } catch (Throwable th3) {
                th = th3;
                fileOutputStream2 = fileOutputStream;
                try {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "SO87kDO3buqPTtJR", 393);
                    if (fileOutputStream2 != null) {
                        fileOutputStream2.close();
                    }
                } catch (Throwable th4) {
                    if (fileOutputStream2 != null) {
                        try {
                            fileOutputStream2.close();
                        } catch (IOException e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "SO87kDO3buqPTtJR", 399);
                        }
                    }
                    throw th4;
                }
            }
        } catch (IOException e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "SO87kDO3buqPTtJR", 399);
        }
    }

    private static boolean ycx(Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> map, Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> map2) {
        if (map.size() != map2.size()) {
            return true;
        }
        for (String str : map2.keySet()) {
            com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar = map.get(str);
            if (ycxVar == null) {
                return true;
            }
            com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar2 = map2.get(str);
            if (ycxVar2 == null) {
                return false;
            }
            if (ycx(ycxVar.sya(), ycxVar2.sya())) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0042, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean ycx(String str, String str2) {
        String[] strArrSplit = str2.split("\\.");
        String[] strArrSplit2 = str.split("\\.");
        int iMin = Math.min(strArrSplit.length, strArrSplit2.length);
        int i5 = 0;
        while (true) {
            if (i5 >= iMin) {
                break;
            }
            int length = strArrSplit[i5].length() - strArrSplit2[i5].length();
            if (length == 0) {
                int iCompareTo = strArrSplit[i5].compareTo(strArrSplit2[i5]);
                if (iCompareTo > 0) {
                    return true;
                }
                if (iCompareTo < 0) {
                    return false;
                }
                if (i5 == iMin - 1) {
                    return strArrSplit.length > strArrSplit2.length;
                }
                i5++;
            } else if (length > 0) {
                return true;
            }
        }
    }

    public static boolean ycx(com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar, String str) {
        if (ycxVar == null) {
            return true;
        }
        try {
            if (TextUtils.isEmpty(ycxVar.sya())) {
                return true;
            }
            if (TextUtils.isEmpty(str)) {
                return false;
            }
            return ycx(ycxVar.sya(), str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKjS9RViTOhO17PPZw=", "VesokTasbcaUTw==", 558);
            return false;
        }
    }
}
