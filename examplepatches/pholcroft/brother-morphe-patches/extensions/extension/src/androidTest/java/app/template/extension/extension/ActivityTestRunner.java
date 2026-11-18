package app.template.extension.extension;

import android.app.Instrumentation;
import android.os.Bundle;

/** Small dependency-free instrumentation runner for the SQLite contract. */
public final class ActivityTestRunner extends Instrumentation {
    private Bundle args;
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); args=arguments; start(); }
    @Override public void onStart() {
        Bundle result=new Bundle();
        try { ActivityStoreTest.testClearRejectsStalePublicationAndSurvivesRestart(getTargetContext());
            ReplayKeyTest.run();
            HistoryRuntimeTest.run(getTargetContext());
            HistoryUiTest.run(this,getTargetContext());
            HistoryExportTest.run(getTargetContext());
            String apkPath=args==null?null:args.getString("patched_apk");
            if(apkPath!=null){PatchedSdkTest.run(apkPath,getTargetContext());ServiceCacheIntegrationTest.run(apkPath,getTargetContext());}
            result.putString("result", "ActivityStoreTest, ReplayKeyTest, HistoryRuntimeTest and HistoryUiTest passed"+(apkPath==null?"":"; patched SDK and service cache tests passed")); finish(0,result);
        } catch (Throwable t) { result.putString("error",android.util.Log.getStackTraceString(t)); finish(1,result); }
    }
}
