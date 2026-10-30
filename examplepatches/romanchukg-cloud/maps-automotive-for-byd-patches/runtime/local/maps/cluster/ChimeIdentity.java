// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** "Send to car" needs the car registered in Google's notification service (Chime). MicroG-RE issues
 * Maps' sign-in tokens as SPOOFED_PACKAGE_NAME (phone Maps), while GnpSdk puts the installed package
 * into its registration and device-info requests; Google rejects that mismatch (INVALID_ARGUMENT),
 * as it did for re-signed YouTube (Morphe Patches #3481). Replaces only this app's own package name;
 * anything else, a missing value or an error keeps the original. Never throws. */
public final class ChimeIdentity {
    static final String TAG="MapsSendToCar";
    static final String SPOOFED_PACKAGE_NAME="app.revanced.android.gms.SPOOFED_PACKAGE_NAME";
    private static volatile String identity;
    private static boolean announced;

    public static String chimePackage(String real){
        try{
            android.content.Context c=MicrogProvider.context();
            if(real==null||c==null||!real.equals(c.getPackageName()))return real;
            String spoofed=identity;
            if(spoofed==null){
                android.os.Bundle meta=c.getPackageManager().getApplicationInfo(real,android.content.pm.PackageManager.GET_META_DATA).metaData;
                String value=meta==null?null:meta.getString(SPOOFED_PACKAGE_NAME);
                identity=spoofed=value==null?"":value;
            }
            if(spoofed.isEmpty()||spoofed.equals(real))return real;
            synchronized(ChimeIdentity.class){if(!announced){announced=true;android.util.Log.i(TAG,"notification registration uses the sign-in package "+spoofed);}}
            return spoofed;
        }catch(Throwable ignored){return real;}
    }
    private ChimeIdentity(){}
}
