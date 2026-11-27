package dev.jason.gboardpatches.extension.sharedmodel;

import java.util.*;

/** Product baseline, not an admission list or a claim of validated writing quality. */
public final class SharedLanguageCoverage {
    private static final List<String> BASELINE=Collections.unmodifiableList(Arrays.asList(
            "ar","bn","bg","zh","hr","cs","da","nl","en","et","fi","fr","de","el","he","hi","hu","id","it",
            "ja","ko","lv","lt","no","pl","pt","ro","ru","sr","sk","sl","es","sw","sv","th","tr","uk","vi"));
    private SharedLanguageCoverage(){}
    public static List<String> baselineCodes(){return BASELINE;}
    public static boolean isBaseline(String languageTag){return BASELINE.contains(baseLanguage(languageTag));}
    private static String baseLanguage(String tag){
        if(tag==null)return "";
        String language=Locale.forLanguageTag(tag.trim().replace('_','-')).getLanguage();
        if("nb".equals(language)||"nn".equals(language))return "no";
        if("iw".equals(language))return "he";
        if("in".equals(language))return "id";
        return language;
    }
    public static String baselineNames(){
        List<String> names=new ArrayList<>();
        for(String code:BASELINE)names.add("zh".equals(code)?"Chinese (Simplified and Traditional)":new Locale(code).getDisplayLanguage(Locale.ENGLISH));
        Collections.sort(names);return String.join(", ",names);
    }
    public static String qualityNotice(){return "Quality and speed vary by language and task. The 38-language baseline is not a guarantee of proofreading, rewriting or reply quality. Additional languages remain available as experimental. Review suggestions before applying them.";}
}
