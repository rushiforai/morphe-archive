package local.maps.cluster;

import org.json.*;
import java.net.URI;
import java.util.*;

/** Strict public update-feed contract; APK identity is verified independently. */
final class UpdateInfo {
    static final long MAX_SIZE=512L*1024*1024;
    final int build,minSdk;final long versionCode,size;
    final String version,url,sha,notes,notesUrl;
    final JSONObject json;
    UpdateInfo(JSONObject value) throws Exception {
        Set<String> keys=new HashSet<>(Arrays.asList("schema_version","project_id","build","version","version_code","package_name","apk_url","sha256","size","notes","notes_url","min_sdk"));
        Set<String> actual=new HashSet<>();Iterator<String> it=value.keys();while(it.hasNext())actual.add(it.next());
        if(!actual.equals(keys)||number(value,"schema_version")!=1||!BuildInfo.PROJECT.equals(value.getString("project_id"))||!BuildInfo.PACKAGE.equals(value.getString("package_name")))throw new IllegalArgumentException("Invalid update feed");
        long sequence=number(value,"build");if(sequence<1||sequence>1000000)throw new IllegalArgumentException();build=(int)sequence;
        version=value.getString("version");versionCode=number(value,"version_code");size=number(value,"size");
        if(!version.equals("automotive."+build)||versionCode!=BuildInfo.VERSION_CODE_BASE+build||versionCode>Integer.MAX_VALUE||size<1||size>MAX_SIZE)throw new IllegalArgumentException();
        url=value.getString("apk_url");sha=value.getString("sha256");notes=value.getString("notes");notesUrl=value.getString("notes_url");
        String root="https://github.com/romanchukg-cloud/google-maps-for-byd/releases/";
        if(!url.equals(root+"download/"+version+"/Google-Maps-Automotive-for-BYD-"+version+".apk")||!notesUrl.equals(root+"tag/"+version)||!sha.matches("[0-9a-f]{64}")||notes.length()>2000)throw new IllegalArgumentException();
        long minimum=number(value,"min_sdk");if(minimum<30||minimum>100)throw new IllegalArgumentException();minSdk=(int)minimum;
        json=new JSONObject(value.toString());
    }
    private static long number(JSONObject value,String key) throws Exception {
        Object n=value.get(key);if(!(n instanceof Integer)&&!(n instanceof Long))throw new IllegalArgumentException();return ((Number)n).longValue();
    }
    boolean newer(long installedCode,int installedBuild,int api){return build>installedBuild&&versionCode>installedCode&&minSdk<=api;}
    static boolean downloadOrigin(String url) {
        try {
            URI u=new URI(url);String host=u.getHost();
            return "https".equals(u.getScheme())&&u.getRawUserInfo()==null&&(u.getPort()==-1||u.getPort()==443)&&u.getFragment()==null
                &&Arrays.asList("github.com","release-assets.githubusercontent.com","objects.githubusercontent.com").contains(host);
        }catch(Exception e){return false;}
    }
}
