package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;
import org.junit.*;import static org.junit.Assert.*;
import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;
import dev.jason.gboardpatches.extension.featureflags.GboardFeatureFlagsRuntime;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings;
import java.util.Map;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedInlinePolicyTest {
 private Context context;
 @Before public void prepare()throws Exception{
  context=RuntimeEnvironment.getApplication();java.lang.reflect.Field f=GboardFeatureFlagsRuntime.class.getDeclaredField("APPLICATION_CONTEXT");f.setAccessible(true);f.set(null,context);
  Map<?, ?> enabledFeatures = ReflectionHelpers.getStaticField(
          GboardFeatureFlagsRuntime.class, "FEATURE_ENABLED_CACHE");
  enabledFeatures.clear();
  GboardAiWritingToolsSettings.preferences(context).edit().clear().putString(GboardAiWritingToolsSettings.PREF_KEY_BACKEND_TYPE,GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL).commit();
  SharedInlineSettings.updated(true,true);
 }
 @Test public void sharedGrammarUsesManagerWithoutNanoOrLanguagePackGates(){assertEquals(Boolean.TRUE,GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue("enable_grammar_checker",false));assertEquals(Boolean.TRUE,GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue("grammar_checker_use_grammar_checker_manager",false));assertEquals(Boolean.FALSE,GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue("enable_llm_based_grammar_checker",true));assertEquals(Boolean.FALSE,GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue("grammar_checker_enable_language_detector",true));}
 @Test public void separateExperimentalSwitchesAreRespected(){SharedInlineSettings.updated(false,false);assertEquals(Boolean.FALSE,GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue("enable_grammar_checker",true));assertEquals(Boolean.FALSE,GboardFeatureFlagsRuntime.applyInlineSuggestionsFlagValue("enable_inline_suggestions_on_client_side",true));}
 @Test public void stockGrammarRemainsAvailableWithSharedGrammarOff() {
  ApplicationInfo appInfo = Shadows.shadowOf(context.getPackageManager())
          .getInternalMutablePackageInfo(context.getPackageName()).applicationInfo;
  appInfo.metaData = new Bundle();
  appInfo.metaData.putBoolean(GboardPatchesFeatureAvailability.FEATURE_GRAMMAR_CHECKER, true);
  SharedInlineSettings.updated(false, false);

  assertEquals(Boolean.TRUE, GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue(
          "enable_grammar_checker", false));
  assertEquals(Boolean.FALSE, GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue(
          "grammar_checker_use_grammar_checker_manager", false));
  assertEquals(Boolean.TRUE, GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue(
          "grammar_checker_enable_language_detector", true));
  assertEquals(Boolean.TRUE, GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue(
          "enable_llm_based_grammar_checker", true));
 }
 @Test public void otherBackendsKeepTheirOriginalGrammarModelPolicy(){GboardAiWritingToolsSettings.writeBackendType(GboardAiWritingToolsSettings.preferences(context),GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);assertEquals(Boolean.FALSE,GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue("grammar_checker_use_grammar_checker_manager",false));assertEquals(Boolean.TRUE,GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue("enable_llm_based_grammar_checker",true));}
}
