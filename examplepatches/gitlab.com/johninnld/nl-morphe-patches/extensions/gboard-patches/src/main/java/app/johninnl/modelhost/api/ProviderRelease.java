package app.johninnl.modelhost.api;

import org.json.JSONObject;
import java.io.*;
import java.net.*;
import java.util.concurrent.TimeUnit;

/** Immutable APK metadata validated against the official provider package, signer and registry. */
public final class ProviderRelease {
    public final String packageName,apkSha256,signerSha256;
    public final long versionCode,apkBytes;
    public final int protocolMajor, protocolMinor, minimumAndroidApi;
    public final URI download;
    private static final long MAX_BYTES=app.johninnl.modelhost.api.VerifiedApk.MAX_APK_BYTES;
    public ProviderRelease(JSONObject value)throws Exception {
        packageName=value.getString("packageName");apkSha256=value.getString("apkSha256");signerSha256=value.getString("signerSha256");
        versionCode=value.getLong("versionCode");apkBytes=value.optLong("apkBytes",0);
        protocolMajor=value.optInt("protocolMajor",-1);protocolMinor=value.optInt("protocolMinor",-1);
        minimumAndroidApi=value.optInt("minimumAndroidApi",ProviderDiscovery.MIN_OFFICIAL_PROVIDER_API);
        if(!app.johninnl.modelhost.api.ModelHostClient.DEFAULT_PACKAGE.equals(packageName)
                || !apkSha256.matches("[0-9a-f]{64}") || !ProviderUpdates.OFFICIAL_SIGNER_SHA256.equals(signerSha256)
                || versionCode<1 || apkBytes<0 || apkBytes>MAX_BYTES)throw new IOException("Invalid provider release");
        String url=value.optString("downloadUrl","");download=url.isEmpty()?null:new URI(url);
        if(download!=null){
            requireHttps(download);
            String path=download.getRawPath();
            String source=value.optString("sourceCommit","");
            boolean tagged=path.matches("/johninnld/(?:local-model-host|nl-morphe-patches)/-/releases/[^/]+/downloads/[^/]+\\.apk");
            boolean review=source.matches("[0-9a-f]{40}") && path.matches("/api/v4/projects/89371837/packages/generic/local-model-host-review/"+source+"/[^/]+\\.apk");
            if(!"gitlab.com".equalsIgnoreCase(download.getHost()) || download.getPort()!=-1
                    || download.getRawQuery()!=null || !(tagged || review)
                    || path.contains("%") || path.contains("/latest/"))throw new IOException("Invalid pinned GitLab release");
        }
    }
    static void requireHttps(URI uri)throws IOException {
        if(!"https".equalsIgnoreCase(uri.getScheme()) || uri.getHost()==null || uri.getRawUserInfo()!=null
                || uri.getRawFragment()!=null)throw new IOException("HTTPS release required");
    }
    public interface Progress { void update(long done,long total); }
    /** HTTPS redirects may reach GitLab object storage; exact bytes and APK signer are checked before installation. */
    public void downloadTo(File target,Progress progress)throws Exception {
        if(download==null)throw new IOException("Release download unavailable");
        URI next=download;long deadline=System.nanoTime()+TimeUnit.MINUTES.toNanos(3);boolean completed=false;
        try {
            for(int redirects=0;redirects<=5;redirects++){
                requireHttps(next);HttpURLConnection connection=(HttpURLConnection)next.toURL().openConnection();
                connection.setInstanceFollowRedirects(false);connection.setConnectTimeout(20000);connection.setReadTimeout(20000);
                connection.setRequestProperty("Accept-Encoding","identity");
                try {
                    int response=connection.getResponseCode();
                    if(response==301 || response==302 || response==303 || response==307 || response==308){
                        String location=connection.getHeaderField("Location");if(location==null)throw new IOException("Missing redirect");next=next.resolve(location);continue;
                    }
                    if(response!=200)throw new IOException("Release download failed");
                    long length=connection.getContentLengthLong();
                    if(length>MAX_BYTES || (apkBytes>0 && length>=0 && length!=apkBytes))throw new IOException("APK size mismatch");
                    long count=0,lastProgress=0,limit=apkBytes>0?apkBytes:MAX_BYTES;
                    try(InputStream input=connection.getInputStream();FileOutputStream output=new FileOutputStream(target)){
                        byte[] buffer=new byte[65536];int n;
                        while((n=input.read(buffer))!=-1){
                            if(Thread.currentThread().isInterrupted() || System.nanoTime()>deadline)throw new InterruptedIOException("Download interrupted");
                            count+=n;if(count>limit)throw new IOException("APK size limit exceeded");output.write(buffer,0,n);
                            long now=System.nanoTime();if(now-lastProgress>TimeUnit.MILLISECONDS.toNanos(300)){lastProgress=now;progress.update(count,apkBytes>0?apkBytes:length);}
                        }
                        if(count==0 || (apkBytes>0 && count!=apkBytes))throw new IOException("Incomplete APK");output.getFD().sync();
                    }
                    completed=true;return;
                }finally{connection.disconnect();}
            }
            throw new IOException("Too many release redirects");
        }finally{if(!completed)target.delete();}
    }
}
