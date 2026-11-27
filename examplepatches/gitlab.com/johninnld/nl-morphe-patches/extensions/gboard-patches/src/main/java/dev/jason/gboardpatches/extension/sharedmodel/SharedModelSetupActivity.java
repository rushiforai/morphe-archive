package dev.jason.gboardpatches.extension.sharedmodel;

import android.app.Activity;
import android.content.*;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;
import app.johninnl.modelhost.api.*;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsActivity;
import java.util.ArrayList;
import java.util.Arrays;

/** Invisible handoff to Android's picker/installer. All setup controls live in Patches settings. */
public final class SharedModelSetupActivity extends Activity {
    private static final int PICK_APK=7401,APPROVE_SOURCE=7402,INSTALL_APK=7403;
    private static final String ACTION="setupAction";
    private static final int VERIFYING=7404;
    private static java.lang.ref.WeakReference<SharedModelSetupActivity> active=new java.lang.ref.WeakReference<>(null);
    private int stage;
    public static void open(Context context){openSettings(context,false);}
    static void openContextSettings(Context context){openSettings(context,true);}
    private static void openSettings(Context context,boolean writing){
        ArrayList<String> path=new ArrayList<>(Arrays.asList("dev.jason.gboardpatches.extension.keyboard.GboardAiVoiceSettingsGroupFeature",SharedLocalAiSettingsFeature.class.getName()));
        if(writing)path.add(SharedLocalAiSettingsFeature.WritingOptions.class.getName());
        context.startActivity(new Intent(context,GboardPatchesSettingsActivity.class).putStringArrayListExtra(GboardPatchesSettingsActivity.EXTRA_NAVIGATION_PATH,path).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TOP|Intent.FLAG_ACTIVITY_SINGLE_TOP));
    }
    static void choose(Context context){launch(context,"choose");}
    static void install(Context context){launch(context,"install");}
    private static void launch(Context context,String action){context.startActivity(new Intent(context,SharedModelSetupActivity.class).putExtra(ACTION,action).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));}
    @Override public void onCreate(Bundle state){
        setTheme(android.R.style.Theme_Translucent_NoTitleBar);super.onCreate(state);active=new java.lang.ref.WeakReference<>(this);
        if(!getIntent().hasExtra(ACTION)){open(this);finish();return;}
        if(state!=null){stage=state.getInt("stage");if(stage==VERIFYING && !SharedProviderSetup.busy())getWindow().getDecorView().post(()->{if(SharedProviderSetup.pending()!=null)continueInstallation();else finish();});return;}
        if("choose".equals(getIntent().getStringExtra(ACTION))){
            try{stage=PICK_APK;startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("application/vnd.android.package-archive").addCategory(Intent.CATEGORY_OPENABLE),PICK_APK);}
            catch(RuntimeException failure){SharedProviderSetup.finished("Could not open the APK picker.");finish();}
        }else continueInstallation();
    }
    private void continueInstallation(){
        VerifiedApk pending=SharedProviderSetup.pending();if(pending==null){finish();return;}
        if(!getPackageManager().canRequestPackageInstalls()){stage=APPROVE_SOURCE;startActivityForResult(new Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,Uri.parse("package:"+getPackageName())),APPROVE_SOURCE);return;}
        try{stage=INSTALL_APK;startActivityForResult(ProviderInstallIntent.create(this,pending),INSTALL_APK);}
        catch(RuntimeException failure){SharedProviderSetup.finished("Could not open Android’s installer.");finish();}
    }
    @Override protected void onSaveInstanceState(Bundle state){state.putInt("stage",stage);super.onSaveInstanceState(state);}
    @Override protected void onDestroy(){if(active.get()==this)active.clear();super.onDestroy();}
    @Override protected void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);
        if(request==PICK_APK && stage==PICK_APK){
            if(result!=RESULT_OK || data==null || data.getData()==null){finish();return;}
            stage=VERIFYING;SharedProviderSetup.verifySelected(this,data.getData(),verified->{SharedModelSetupActivity current=active.get();if(current==null || current.isDestroyed() || current.isFinishing() || current.stage!=VERIFYING)return;if(verified)current.continueInstallation();else current.finish();});
        }else if(request==APPROVE_SOURCE && stage==APPROVE_SOURCE){
            if(getPackageManager().canRequestPackageInstalls())continueInstallation();else{SharedProviderSetup.finished("Allow installation from Gboard to finish setup.");finish();}
        }else if(request==INSTALL_APK && stage==INSTALL_APK){SharedProviderSetup.finished(SharedProviderSetup.installedMatchesReview(this)?"":"Installation did not finish. Try again when you are ready.");finish();}
    }
}
