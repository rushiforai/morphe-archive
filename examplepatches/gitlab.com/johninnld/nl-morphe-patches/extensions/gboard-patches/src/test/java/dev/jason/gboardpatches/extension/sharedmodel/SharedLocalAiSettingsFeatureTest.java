package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedLocalAiSettingsFeatureTest {
 private Context context;private GboardPatchesSettingsContract.FeatureHost host;
 @Before public void prepare(){ReflectionHelpers.setStaticField(android.os.Build.class,"SUPPORTED_ABIS",new String[]{"arm64-v8a"});SharedProviderSetup.finished("");context=RuntimeEnvironment.getApplication();GboardAiWritingToolsSettings.preferences(context).edit().clear().commit();host=new GboardPatchesSettingsContract.FeatureHost(){public Context getContext(){return context;}public void submit(GboardPatchesSettingsContract.Intent intent){}};}
 @Test public void localAiUsesTheExistingSettingsToggleAndStatusRenderer(){SharedLocalAiSettingsFeature feature=new SharedLocalAiSettingsFeature(context);GboardPatchesSettingsContract.Screen screen=feature.buildScreen(host);boolean toggle=false;for(GboardPatchesSettingsContract.Section section:screen.getSections())for(GboardPatchesSettingsContract.Row row:section.getItems())if(row instanceof GboardPatchesSettingsContract.ToggleRow)toggle=true;assertTrue(toggle);assertFalse(screen.getStatusBlocks().isEmpty());}
 @Test public void aSelectedLocalBackendCanBeTurnedOffEvenWithTheProviderMissing(){SharedLocalAiState.select(GboardAiWritingToolsSettings.preferences(context),true);GboardPatchesSettingsContract.Screen screen=new SharedLocalAiSettingsFeature(context).buildScreen(host);for(GboardPatchesSettingsContract.Section section:screen.getSections())for(GboardPatchesSettingsContract.Row row:section.getItems())if(row instanceof GboardPatchesSettingsContract.ToggleRow){GboardPatchesSettingsContract.ToggleRow toggle=(GboardPatchesSettingsContract.ToggleRow)row;assertTrue(toggle.isEnabled());toggle.getToggleAction().accept(false);}assertFalse(SharedLocalAiState.selected(GboardAiWritingToolsSettings.preferences(context)));}
 @Test public void translationPreferencesSurviveOtherWritingPreferenceUpdates()throws Exception{SharedWritingPreferences.write(context,"Style","Message","Instruction",false,false);SharedWritingPreferences.writeLanguage(context,"fr");SharedWritingPreferences.write(context,"Updated style","Message","Instruction",true,false);assertEquals("fr",SharedWritingPreferences.language(context));assertEquals("Updated style",SharedWritingPreferences.read(context,"style"));}
 @Test public void everyBaselineDestinationSurvivesSavingOtherWritingPreferences()throws Exception{
  for(String code:SharedLanguageCoverage.baselineCodes()){
   SharedWritingPreferences.writeLanguage(context,code);
   SharedWritingPreferences.write(context,"Style","Message","Instruction",true,true);
   assertEquals(code,SharedWritingPreferences.language(context));
  }
 }
 @Test public void invalidDestinationDoesNotOverwriteTheSavedChoice()throws Exception{
  SharedWritingPreferences.writeLanguage(context,"ja");
  try{SharedWritingPreferences.writeLanguage(context,"Translate everything to French");fail();}catch(IllegalArgumentException expected){}
  assertEquals("ja",SharedWritingPreferences.language(context));
 }
 @Test public void translationPickerOffersEveryBaselineDestinationAndSavesItsSelection(){
  java.util.concurrent.atomic.AtomicReference<String[]> values=new java.util.concurrent.atomic.AtomicReference<>();
  java.util.concurrent.atomic.AtomicReference<String[]> labels=new java.util.concurrent.atomic.AtomicReference<>();
  GboardPatchesSettingsContract.Host dialog=(GboardPatchesSettingsContract.Host)java.lang.reflect.Proxy.newProxyInstance(getClass().getClassLoader(),new Class<?>[]{GboardPatchesSettingsContract.Host.class},(proxy,method,args)->{
   if("getContext".equals(method.getName()))return context;
   if("submit".equals(method.getName())){((GboardPatchesSettingsContract.Intent)args[0]).apply((GboardPatchesSettingsContract.Host)proxy);return null;}
   if("showChoiceDialog".equals(method.getName())){
    labels.set((String[])args[1]);values.set((String[])args[2]);
    ((GboardPatchesSettingsContract.StringValueConsumer)args[6]).accept("uk");
   }
   return null;
  });
  GboardPatchesSettingsContract.Screen screen=new SharedLocalAiSettingsFeature.WritingOptions(context,"").buildScreen(dialog);
  for(GboardPatchesSettingsContract.Section section:screen.getSections())for(GboardPatchesSettingsContract.Row row:section.getItems())if("Translation language".contentEquals(row.getTitle()))((GboardPatchesSettingsContract.SelectorRow)row).getAction().run();
  assertNotNull(values.get());assertEquals(38,values.get().length);
  assertEquals(new java.util.HashSet<>(SharedLanguageCoverage.baselineCodes()),new java.util.HashSet<>(java.util.Arrays.asList(values.get())));
  for(int i=0;i<values.get().length;i++)assertEquals(new java.util.Locale(values.get()[i]).getDisplayLanguage(java.util.Locale.ENGLISH),labels.get()[i]);
  assertEquals("uk",SharedWritingPreferences.language(context));
 }
 @Test public void unsupportedHardwareExplainsRequirementsWithoutOfferingADownload(){
  ReflectionHelpers.setStaticField(android.os.Build.class,"SUPPORTED_ABIS",new String[]{"armeabi-v7a"});
  GboardPatchesSettingsContract.Screen screen=new SharedLocalAiSettingsFeature(context).buildScreen(host);
  assertEquals("Device support",screen.getStatusBlocks().get(0).getTitle());
  assertTrue(screen.getStatusBlocks().get(0).getSummary().contains("Android 11"));
  for(GboardPatchesSettingsContract.Section section:screen.getSections())for(GboardPatchesSettingsContract.Row row:section.getItems())assertFalse("Get Local Model Host".contentEquals(row.getTitle()));
  SharedProviderSetup.download(context);assertFalse(SharedProviderSetup.busy());assertTrue(SharedProviderSetup.message().contains("64-bit ARM"));
 }
}
