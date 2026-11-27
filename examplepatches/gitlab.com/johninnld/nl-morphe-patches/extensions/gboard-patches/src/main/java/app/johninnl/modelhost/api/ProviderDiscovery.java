package app.johninnl.modelhost.api;
import android.content.*;
import android.content.pm.*;
public final class ProviderDiscovery {
    public static final int MIN_OFFICIAL_PROVIDER_API=30;
    private ProviderDiscovery(){}
    /** Compatibility of the official APK's pinned native runtime, not a Binder client restriction. */
    public static boolean isOfficialProviderSupported(){return supportsOfficialProvider(android.os.Build.VERSION.SDK_INT,android.os.Build.SUPPORTED_ABIS);}
    static boolean supportsOfficialProvider(int api,String[] abis){
        if(api<MIN_OFFICIAL_PROVIDER_API || abis==null)return false;
        for(String abi:abis)if("arm64-v8a".equals(abi))return true;
        return false;
    }
    public static void verifySigner(Context context, ComponentName component, String expectedSigner) throws HostException {
        try {
            int flags=android.os.Build.VERSION.SDK_INT>=28?PackageManager.GET_SIGNING_CERTIFICATES:PackageManager.GET_SIGNATURES;
            PackageInfo info=context.getPackageManager().getPackageInfo(component.getPackageName(),flags);
            Signature[] signers=android.os.Build.VERSION.SDK_INT>=28 && info.signingInfo!=null?info.signingInfo.getApkContentsSigners():info.signatures;
            if(signers==null || signers.length!=1)throw new HostException("UNTRUSTED_PROVIDER");
            String actual=VerifiedApk.hex(java.security.MessageDigest.getInstance("SHA-256").digest(signers[0].toByteArray()));
            if(!ApkIdentityVerifier.digest(expectedSigner).equals(actual))throw new HostException("UNTRUSTED_PROVIDER");
        }catch(PackageManager.NameNotFoundException e){throw new HostException("PROVIDER_MISSING");}
        catch(HostException e){throw e;}catch(Exception e){throw new HostException("PROVIDER_IDENTITY_UNAVAILABLE",e);}
    }
    public static ProviderAvailability inspect(Context context){return inspect(context,new ComponentName(ModelHostClient.DEFAULT_PACKAGE,ModelHostClient.SERVICE_CLASS));}
    public static ProviderAvailability inspect(Context context,ComponentName component){
        try{ServiceInfo s=context.getPackageManager().getServiceInfo(component,0);boolean usable=s.exported && s.enabled && s.applicationInfo.enabled && s.permission==null;return new ProviderAvailability(true,usable,component,usable?"AVAILABLE":"PROVIDER_UNAVAILABLE");}
        catch(PackageManager.NameNotFoundException e){return new ProviderAvailability(false,false,component,"PROVIDER_MISSING");}
    }
}
