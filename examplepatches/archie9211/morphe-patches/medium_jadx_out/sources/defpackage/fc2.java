package defpackage;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.imaging.avi.hzjl.bPUi;
import java.io.File;
import java.io.FilenameFilter;
import java.util.Arrays;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class fc2 implements FilenameFilter {
    public final /* synthetic */ int a;

    @Override // java.io.FilenameFilter
    public final boolean accept(File file, String str) {
        switch (this.a) {
            case 0:
                return str.startsWith("aqs.");
            case 1:
                return str.startsWith(".ae");
            case 2:
                return str.startsWith("event");
            case 3:
                return str.startsWith("event") && !str.endsWith("_");
            case 4:
                str.getClass();
                Pattern patternCompile = Pattern.compile(String.format("^%s[0-9]+.json$", Arrays.copyOf(new Object[]{"error_log_"}, 1)));
                patternCompile.getClass();
                return patternCompile.matcher(str).matches();
            case 5:
                str.getClass();
                Pattern patternCompile2 = Pattern.compile(String.format(PqkdNGCEoxOKZk.oDOxi, Arrays.copyOf(new Object[]{"crash_log_", bPUi.wDVARhMGltVQPT, "thread_check_log_"}, 3)));
                patternCompile2.getClass();
                return patternCompile2.matcher(str).matches();
            case 6:
                str.getClass();
                Pattern patternCompile3 = Pattern.compile(String.format("^%s[0-9]+.json$", Arrays.copyOf(new Object[]{"anr_log_"}, 1)));
                patternCompile3.getClass();
                return patternCompile3.matcher(str).matches();
            case 7:
                str.getClass();
                Pattern patternCompile4 = Pattern.compile(String.format("^%s[0-9]+.json$", Arrays.copyOf(new Object[]{"analysis_log_"}, 1)));
                patternCompile4.getClass();
                return patternCompile4.matcher(str).matches();
            default:
                return Pattern.matches("cpu[0-9]+", str);
        }
    }
}
