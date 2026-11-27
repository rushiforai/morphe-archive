package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;
import java.util.*;
import static org.junit.Assert.*;

public class SharedLanguageCoverageTest {
 @Test public void baselineHasExactlyTheRequested38Languages(){Set<String> expected=new HashSet<>(Arrays.asList("da","nl","en","fi","fr","de","it","no","pt","es","sv","bg","hr","cs","et","el","hu","lv","lt","pl","ro","ru","sr","sk","sl","uk","bn","zh","hi","id","ja","ko","th","vi","ar","he","sw","tr"));assertEquals(38,SharedLanguageCoverage.baselineCodes().size());assertEquals(expected,new HashSet<>(SharedLanguageCoverage.baselineCodes()));}
 @Test public void regionScriptAndLegacyVariantsDoNotFallOutOfTheBaseline(){for(String language:Arrays.asList("en-US","pt_BR","zh-Hant-TW","zh-Hans-CN","sr-Latn","nb-NO","nn-NO","iw-IL","in-ID"))assertTrue(language,SharedLanguageCoverage.isBaseline(language));}
 @Test public void additionalLanguagesAreClassifiedWithoutInventingVerifiedStatus(){assertFalse(SharedLanguageCoverage.isBaseline("ca"));assertFalse(SharedLanguageCoverage.isBaseline("fa"));assertFalse(SharedLanguageCoverage.isBaseline(null));assertTrue(SharedLanguageCoverage.qualityNotice().contains("remain available as experimental"));assertTrue(SharedLanguageCoverage.qualityNotice().contains("not a guarantee"));}
 @Test public void callersCannotMutateTheBaseline(){try{SharedLanguageCoverage.baselineCodes().clear();fail();}catch(UnsupportedOperationException expected){}}
}
