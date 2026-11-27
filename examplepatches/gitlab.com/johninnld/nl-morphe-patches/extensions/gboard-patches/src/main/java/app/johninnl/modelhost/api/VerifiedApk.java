package app.johninnl.modelhost.api;

import android.content.Context;
import android.content.pm.*;
import android.net.Uri;
import android.os.Build;
import java.io.*;
import java.security.MessageDigest;
import java.util.UUID;

/** Immutable private copy of one APK checked against trusted package, digest and signer metadata. */
public final class VerifiedApk {
    /** Upper bound for a companion APK, including the host's bundled native runtimes. */
    public static final long MAX_APK_BYTES=256L*1024*1024;
    final File file;
    public final String packageName,sha256,signerSha256;
    public final long versionCode;
    private VerifiedApk(File file,String name,String hash,String signer,long version){this.file=file;packageName=name;sha256=hash;signerSha256=signer;versionCode=version;}
    public static VerifiedApk verify(Context context,Uri selected,String expectedPackage,String expectedSha256,String expectedSigner)throws HostException {
        if(ModelHostClient.DEFAULT_PACKAGE.equals(expectedPackage)&&!ProviderDiscovery.isOfficialProviderSupported())throw new HostException("UNSUPPORTED_DEVICE");
        File directory=ProviderApkProvider.directory(context);File copy=new File(directory,UUID.randomUUID().toString()+".apk");boolean valid=false;
        try {
            String hash;
            try(InputStream input=context.getContentResolver().openInputStream(selected);FileOutputStream output=new FileOutputStream(copy)){
                if(input==null)throw new HostException("APK_UNREADABLE");hash=copyAndHash(input,output);output.getFD().sync();
            }
            int flags=Build.VERSION.SDK_INT>=28?PackageManager.GET_SIGNING_CERTIFICATES:PackageManager.GET_SIGNATURES;
            PackageInfo info=context.getPackageManager().getPackageArchiveInfo(copy.getPath(),flags);
            if(info==null)throw new HostException("INVALID_APK");
            Signature[] signers=Build.VERSION.SDK_INT>=28 && info.signingInfo!=null?info.signingInfo.getApkContentsSigners():info.signatures;
            int count=signers==null?0:signers.length;
            String signer=count==1?hex(MessageDigest.getInstance("SHA-256").digest(signers[0].toByteArray())):"";
            ApkIdentityVerifier.verify(expectedPackage,expectedSha256,expectedSigner,info.packageName,hash,signer,count);
            long version=Build.VERSION.SDK_INT>=28?info.getLongVersionCode():info.versionCode;
            if(version<1)throw new HostException("INVALID_APK_VERSION");
            if(!copy.setWritable(false,false))throw new HostException("APK_COPY_NOT_SEALED");valid=true;
            return new VerifiedApk(copy,info.packageName,hash,signer,version);
        }catch(HostException error){throw error;}catch(Exception error){throw new HostException("APK_VERIFICATION_FAILED",error);}finally{if(!valid)copy.delete();}
    }
    static String copyAndHash(InputStream input,OutputStream output)throws Exception {
        MessageDigest digest=MessageDigest.getInstance("SHA-256");long bytes=0;byte[] buffer=new byte[65536];int count;
        while((count=input.read(buffer))!=-1){
            bytes+=count;if(bytes>MAX_APK_BYTES)throw new HostException("APK_TOO_LARGE");
            digest.update(buffer,0,count);output.write(buffer,0,count);
        }
        return hex(digest.digest());
    }
    static String hex(byte[] value){StringBuilder b=new StringBuilder();for(byte v:value)b.append(String.format(java.util.Locale.ROOT,"%02x",v&255));return b.toString();}
}
