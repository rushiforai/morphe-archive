package app.geminipatch.contractprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import java.lang.reflect.Method;

/** Calls the real installed APK's optional universal extension, not a copy. */
public final class UniversalVersionProbe extends Instrumentation {
    private Bundle args;
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); args = arguments; start(); }
    @Override public void onStart() {
        Bundle report = new Bundle();
        try {
            String target = args.getString("target", "com.google.android.apps.bard.morphe");
            String other = target.contains("bard") ? "com.google.android.googlequicksearchbox.morphe"
                    : "com.google.android.apps.bard.morphe";
            int original = Integer.parseInt(args.getString("original", "345"));
            boolean broken = "broken".equals(args.getString("expected"));
            Context context = getTargetContext();
            Context code = context.createPackageContext(target, Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);
            Class<?> extension = code.getClassLoader().loadClass("app.morphe.extension.all.versioncode.DisablePlayStoreUpdatesPatch");
            Method intCode = extension.getMethod("getVersionCode", PackageInfo.class);
            Method longCode = extension.getMethod("getVersionCodeLong", PackageInfo.class);
            PackageInfo own = context.getPackageManager().getPackageInfo(target, 0);
            PackageInfo foreign = context.getPackageManager().getPackageInfo(other, 0);
            require(own.getLongVersionCode() == Integer.MAX_VALUE, "Target APK must have maximum version code");
            int ownInt = (Integer) intCode.invoke(null, own);
            long ownLong = (Long) longCode.invoke(null, own);
            int otherInt = (Integer) intCode.invoke(null, foreign);
            long otherLong = (Long) longCode.invoke(null, foreign);
            report.putInt("ownReadInt", ownInt); report.putLong("ownReadLong", ownLong);
            report.putInt("otherReadInt", otherInt); report.putLong("otherReadLong", otherLong);
            require(ownInt == original && ownLong == original, "Own version restoration failed");
            int expectedOtherInt = broken && foreign.versionCode == Integer.MAX_VALUE ? original : foreign.versionCode;
            long expectedOtherLong = broken && foreign.versionCode == Integer.MAX_VALUE ? original : foreign.getLongVersionCode();
            require(otherInt == expectedOtherInt && otherLong == expectedOtherLong, "Foreign package version was changed");
            // Additional synthetic inputs check the same real implementation's edge cases.
            PackageInfo major = new PackageInfo(); major.packageName = target;
            major.setLongVersionCode((7L << 32) | Integer.MAX_VALUE);
            require((Long) longCode.invoke(null, major) == ((7L << 32) | original), "Own major version was lost");
            major.packageName = "app.geminipatch.foreign";
            require((Long) longCode.invoke(null, major) == ((7L << 32) | (broken ? original : Integer.MAX_VALUE)),
                    "Foreign major version was changed");
            major.setLongVersionCode(42);
            require((Integer) intCode.invoke(null, major) == 42 && (Long) longCode.invoke(null, major) == 42,
                    "A normal version was changed");
            report.putString("result", "PASS"); finish(Activity.RESULT_OK, report);
        } catch (Throwable error) {
            report.putString("error", error.toString()); report.putString("result", "FAIL");
            finish(Activity.RESULT_CANCELED, report);
        }
    }
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
