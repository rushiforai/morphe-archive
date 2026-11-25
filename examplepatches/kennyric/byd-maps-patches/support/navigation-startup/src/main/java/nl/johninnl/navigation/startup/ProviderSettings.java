package nl.johninnl.navigation.startup;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;

/** Opens the selected provider's Android settings; permission decisions remain with the user. */
public final class ProviderSettings {
    private ProviderSettings() {}

    public static Intent locationIntent(String provider){
        if(StartupProtocol.controlClass(provider).isEmpty())return null;
        // The per-permission editor requires a system permission on stock Android.
        // App details is the public, portable entry point for another app's permissions.
        return new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,Uri.fromParts("package",provider,null));
    }

    public static boolean openLocation(Context context,String provider){
        Intent intent=locationIntent(provider);
        if(context==null||intent==null)return false;
        if(!(context instanceof Activity))intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try{context.startActivity(intent);return true;}
        catch(ActivityNotFoundException|SecurityException unavailable){return false;}
    }

    public static String locationTitle(boolean dutch){return dutch?"Locatietoegang instellen":"Set location access";}
    public static String locationHelp(String provider,boolean dutch){
        return provider+(dutch?" → Machtigingen → Locatie → Altijd toestaan":" → Permissions → Location → Allow all the time");
    }
}
