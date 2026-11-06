package app.morphe.extension.chmate;

/** Historical Haiagaru Dalvik UA with selectable Android version text. */
final class BrowserUaTemplates {
    static final String ENABLED="viewingBrowserUserAgentEnabled";
    static final String DALVIK="Dalvik/2.1.0 (Linux; U; Android 14; HT-01 Build/XYZ0.123456.789)";
    static final String DEFAULT=DALVIK;
    private static final String[] VERSIONS={"14","15","16"};
    static String[] labels(){
        String[] result=new String[VERSIONS.length];
        for(int i=0;i<result.length;i++)result[i]="Android "+VERSIONS[i]+(i==0?"（標準）":"");
        return result;
    }
    static String value(int index){
        if(index<0||index>=VERSIONS.length)return DEFAULT;
        return "Dalvik/2.1.0 (Linux; U; Android "+VERSIONS[index]+"; HT-01 Build/XYZ0.123456.789)";
    }
    static int selectedIndex(String saved){
        String resolved=resolve(saved==null?DEFAULT:saved);
        for(int i=0;i<VERSIONS.length;i++)if(value(i).equals(resolved))return i;
        return -1;
    }
    static String selectedLabel(String saved){
        int index=selectedIndex(saved);
        return index<0?"カスタムUA":labels()[index];
    }
    static String resolve(String value){
        // Match only shipped templates; do not rewrite a custom UA from settings import.
        if("Dalvik/2.1.0 (Linux; U; Android 4.0.3; HT-01 Build/XYZ0.123456.789)".equals(value)
                ||"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36".equals(value)
                ||"Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Mobile Safari/537.36".equals(value)
                ||"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.8103.15 Safari/537.36".equals(value)
                ||"Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.8078.48 Mobile Safari/537.36".equals(value))return DEFAULT;
        return value;
    }
    private BrowserUaTemplates(){}
}
