package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
class fby {
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:17:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static com.bytedance.adsdk.zb.sya.zb.sya ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        com.bytedance.adsdk.zb.sya.zb.sya syaVarYcx;
        String strNextString;
        jsonReader.beginObject();
        char c11 = 2;
        int iNextInt = 2;
        while (true) {
            syaVarYcx = null;
            if (!jsonReader.hasNext()) {
                strNextString = null;
                break;
            }
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (!strNextName.equals("d")) {
                if (strNextName.equals("ty")) {
                    strNextString = jsonReader.nextString();
                    break;
                }
                jsonReader.skipValue();
            } else {
                iNextInt = jsonReader.nextInt();
            }
        }
        if (strNextString == null) {
            return null;
        }
        switch (strNextString.hashCode()) {
            case 3239:
                if (!strNextString.equals("el")) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case 3270:
                if (strNextString.equals("fl")) {
                    c11 = 1;
                    break;
                }
                break;
            case 3295:
                if (!strNextString.equals("gf")) {
                }
                break;
            case 3307:
                if (strNextString.equals("gr")) {
                    c11 = 3;
                    break;
                }
                break;
            case 3308:
                if (strNextString.equals("gs")) {
                    c11 = 4;
                    break;
                }
                break;
            case 3488:
                if (strNextString.equals("mm")) {
                    c11 = 5;
                    break;
                }
                break;
            case 3633:
                if (strNextString.equals("rc")) {
                    c11 = 6;
                    break;
                }
                break;
            case 3634:
                if (strNextString.equals("rd")) {
                    c11 = 7;
                    break;
                }
                break;
            case 3646:
                if (strNextString.equals("rp")) {
                    c11 = '\b';
                    break;
                }
                break;
            case 3669:
                if (strNextString.equals("sh")) {
                    c11 = '\t';
                    break;
                }
                break;
            case 3679:
                if (strNextString.equals("sr")) {
                    c11 = '\n';
                    break;
                }
                break;
            case 3681:
                if (strNextString.equals("st")) {
                    c11 = 11;
                    break;
                }
                break;
            case 3705:
                if (strNextString.equals("tm")) {
                    c11 = '\f';
                    break;
                }
                break;
            case 3710:
                if (strNextString.equals("tr")) {
                    c11 = '\r';
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                syaVarYcx = lt.ycx(jsonReader, ulVar, iNextInt);
                break;
            case 1:
                syaVarYcx = ifb.ycx(jsonReader, ulVar);
                break;
            case 2:
                syaVarYcx = dy.ycx(jsonReader, ulVar);
                break;
            case 3:
                syaVarYcx = yzp.ycx(jsonReader, ulVar);
                break;
            case 4:
                syaVarYcx = wie.ycx(jsonReader, ulVar);
                break;
            case 5:
                syaVarYcx = oty.ycx(jsonReader);
                ulVar.ycx("Animation contains merge paths. Merge paths are only supported on KitKat+ and must be manually enabled by calling enableMergePathsForKitKatAndAbove().");
                break;
            case 6:
                syaVarYcx = rmf.ycx(jsonReader, ulVar);
                break;
            case 7:
                syaVarYcx = xz.ycx(jsonReader, ulVar);
                break;
            case '\b':
                syaVarYcx = aeu.ycx(jsonReader, ulVar);
                break;
            case '\t':
                syaVarYcx = dwi.ycx(jsonReader, ulVar);
                break;
            case '\n':
                syaVarYcx = av.ycx(jsonReader, ulVar, iNextInt);
                break;
            case 11:
                syaVarYcx = oby.ycx(jsonReader, ulVar);
                break;
            case '\f':
                syaVarYcx = nji.ycx(jsonReader, ulVar);
                break;
            case '\r':
                syaVarYcx = sya.ycx(jsonReader, ulVar);
                break;
        }
        while (jsonReader.hasNext()) {
            jsonReader.skipValue();
        }
        jsonReader.endObject();
        return syaVarYcx;
    }
}
