package app.morphe.extension.chmate;

import android.os.Build;

/** Three Dalvik templates; only the Android release changes between choices. */
final class BrowserUaTemplates {
    static final String ENABLED="viewingBrowserUserAgentEnabled";
    private static final String PREFIX="haiagaru-ua-android-";
    private static final String[] VERSIONS={"14","15","16"};
    private static final String FIXED_BUILD="XYZ0.123456.789";
    static final String DEFAULT=value(0);

    static String[] labels(){
        String[] result=new String[VERSIONS.length];
        for(int i=0;i<result.length;i++)result[i]="Android "+VERSIONS[i]+(i==0?"（標準）":"");
        return result;
    }

    /** Preference markers keep the selected Android release stable across device changes. */
    static String value(int index){
        if(index<0||index>=VERSIONS.length)index=0;
        return PREFIX+VERSIONS[index];
    }

    static int selectedIndex(String saved){
        if(saved==null)return 0;
        for(int i=0;i<VERSIONS.length;i++)if(value(i).equals(saved))return i;
        String legacy=legacyVersion(saved);
        if(legacy!=null){for(int i=0;i<VERSIONS.length;i++)if(VERSIONS[i].equals(legacy))return i;return 0;}
        return isRetiredBuiltIn(saved)?0:-1;
    }

    static String selectedLabel(String saved){
        int index=selectedIndex(saved);
        return index<0?"カスタムUA":labels()[index];
    }

    /** Resolve a template with this phone's model while holding every other UA field fixed. */
    static String resolve(String saved){
        if(saved==null)return null;
        int index=selectedIndex(saved);
        if(index>=0)return agent(VERSIONS[index]);
        return saved;
    }

    /** Migrate old shipped templates to stable Android-version markers, preserving custom UAs. */
    static String normalizeSetting(String saved){
        if(saved==null)return null;
        if(saved.startsWith(PREFIX))return value(indexForVersion(saved.substring(PREFIX.length())));
        String legacy=legacyVersion(saved);
        if(legacy!=null)return value(indexForVersion(legacy));
        return isRetiredBuiltIn(saved)?DEFAULT:saved;
    }

    private static int indexForVersion(String version){
        for(int i=0;i<VERSIONS.length;i++)if(VERSIONS[i].equals(version))return i;
        return 0;
    }

    /** Only recognize the old bundled HT-01 sample; imported custom agents remain untouched. */
    private static String legacyVersion(String value){
        java.util.regex.Matcher matcher=java.util.regex.Pattern.compile(
                "^Dalvik/2\\.1\\.0 \\(Linux; U; Android ([0-9]+(?:\\.[0-9]+)*); HT-01 Build/XYZ0\\.123456\\.789\\)$").matcher(value);
        return matcher.matches()?matcher.group(1):null;
    }

    private static boolean isRetiredBuiltIn(String value){
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36".equals(value)
                ||"Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Mobile Safari/537.36".equals(value)
                ||"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.8103.15 Safari/537.36".equals(value)
                ||"Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.8078.48 Mobile Safari/537.36".equals(value);
    }

    private static String agent(String androidVersion){
        String model=safeModel(Build.MODEL);
        return "Dalvik/2.1.0 (Linux; U; Android "+androidVersion+"; "+model+" Build/"+FIXED_BUILD+")";
    }

    private static String safeModel(String model){
        if(model==null||model.trim().isEmpty())return "AndroidDevice";
        String safe=model.trim().replaceAll("[\\x00-\\x20();\\x7f]","_");
        return safe.isEmpty()?"AndroidDevice":safe;
    }

    private BrowserUaTemplates(){}
}
