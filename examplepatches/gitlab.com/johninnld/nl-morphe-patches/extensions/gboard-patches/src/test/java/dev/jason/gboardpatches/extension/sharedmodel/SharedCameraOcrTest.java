package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;
import static org.junit.Assert.*;
@org.junit.runner.RunWith(org.robolectric.RobolectricTestRunner.class)
@org.robolectric.annotation.Config(sdk=34,manifest=org.robolectric.annotation.Config.NONE)
public class SharedCameraOcrTest {
 private static final class Editor extends android.inputmethodservice.InputMethodService {
  final android.view.inputmethod.EditorInfo info=new android.view.inputmethod.EditorInfo();
  final android.view.inputmethod.InputConnection input=new android.view.inputmethod.BaseInputConnection(new android.view.View(org.robolectric.RuntimeEnvironment.getApplication()),true){
   @Override public android.view.inputmethod.ExtractedText getExtractedText(android.view.inputmethod.ExtractedTextRequest request,int flags){android.view.inputmethod.ExtractedText value=new android.view.inputmethod.ExtractedText();value.text="Draft";value.selectionStart=value.selectionEnd=5;return value;}
  };
  Editor(){info.inputType=android.text.InputType.TYPE_CLASS_TEXT;}
  @Override public android.content.Context getApplicationContext(){return org.robolectric.RuntimeEnvironment.getApplication();}
  @Override public android.view.inputmethod.EditorInfo getCurrentInputEditorInfo(){return info;}
  @Override public android.view.inputmethod.InputConnection getCurrentInputConnection(){return input;}
 }
 private static final class Camera {
  final android.content.Context b;final android.widget.TextView f;final android.widget.ImageButton h;int x=2;
  Camera(android.content.Context context){b=context;f=new android.widget.TextView(context);h=new android.widget.ImageButton(context);}
 }
 private static final class PreviewOwner {
  final android.view.View c;boolean u=true;PreviewOwner(android.view.View view){c=view;}
 }
 @Test public void attachedButHiddenCameraCannotReceiveAnImagePickerResult(){
  android.app.Activity activity=org.robolectric.Robolectric.buildActivity(android.app.Activity.class).setup().get();android.widget.FrameLayout root=new android.widget.FrameLayout(activity);android.view.View preview=new android.view.View(activity);root.addView(preview);activity.setContentView(root);PreviewOwner owner=new PreviewOwner(preview);assertTrue(preview.isAttachedToWindow());assertTrue(SharedCameraOcr.shown(owner));root.setVisibility(android.view.View.GONE);assertFalse(SharedCameraOcr.shown(owner));root.setVisibility(android.view.View.VISIBLE);owner.u=false;assertFalse(SharedCameraOcr.shown(owner));activity.finish();
 }
 private static final class ResultControls {
  final android.view.View d,z;
  ResultControls(android.content.Context context){d=new android.view.View(context);z=new android.view.View(context);}
 }
 @Test public void resultNavigationStaysVisibleAboveTheFullSizeTextLayer(){
  android.content.Context app=org.robolectric.RuntimeEnvironment.getApplication();android.widget.FrameLayout root=new android.widget.FrameLayout(app),navigation=new android.widget.FrameLayout(app);ResultControls controls=new ResultControls(app);navigation.addView(controls.d);navigation.addView(controls.z);root.addView(navigation);root.addView(new android.widget.ScrollView(app));controls.d.setVisibility(android.view.View.GONE);controls.z.setAlpha(0f);controls.z.setEnabled(false);
  SharedCameraOcr.restoreResultControls(controls);assertEquals(android.view.View.VISIBLE,controls.d.getVisibility());assertEquals(1f,controls.z.getAlpha(),0f);assertTrue(controls.z.isEnabled());assertSame(navigation,root.getChildAt(root.getChildCount()-1));
 }
 @Test public void insertionUsesOnlyTheChosenTextRange(){assertEquals("12.34",SharedCameraOcr.selection("Total 12.34 EUR",6,11));}
 @Test public void absentOrCollapsedSelectionInsertsTheWholeText(){assertEquals("line one\nline two",SharedCameraOcr.selection("line one\nline two",-1,-1));assertEquals("abc",SharedCameraOcr.selection("abc",2,2));}
 @Test public void invalidRangesNeverInsertEverythingAndReverseSelectionsAreNormalized(){assertEquals("",SharedCameraOcr.selection("abc",0,4));assertEquals("b",SharedCameraOcr.selection("abc",2,1));}
 @Test public void memoryPauseIsNotMisreportedAsDisabledImageSupport(){String message=SharedCameraOcr.failureMessage("MEMORY_PAUSED");assertTrue(message.contains("memory"));assertTrue(message.contains("Model setup"));assertFalse(message.contains("Image support is OFF"));}
 @Test public void disabledVisionAndStoppedHostHaveDifferentRecoveryInstructions(){assertTrue(SharedCameraOcr.failureMessage("ENABLE_OCR_IN_PROVIDER").contains("Image support is OFF"));assertTrue(SharedCameraOcr.failureMessage("PROVIDER_STOPPED").contains("Provider OFF"));}
 @Test public void unknownFailureNeverExposesPrivateExceptionText(){assertFalse(SharedCameraOcr.failureMessage("private image text").contains("private image text"));}
 @Test public void localCaptureEntersTheNativeStateRequiredForRetry()throws Exception{Camera camera=new Camera(org.robolectric.RuntimeEnvironment.getApplication());assertEquals(2,camera.x);SharedCameraOcr.markCaptured(camera);assertEquals(3,camera.x);}
 @Test public void lateNativeCameraInitializationCannotReplaceALocalImageResult()throws Exception{
  Camera camera=new Camera(org.robolectric.RuntimeEnvironment.getApplication());Class<?> state=Class.forName(SharedCameraOcr.class.getName()+"$State");java.lang.reflect.Constructor<?> constructor=state.getDeclaredConstructor(Object.class,EditorSnapshot.class);constructor.setAccessible(true);Object local=constructor.newInstance(camera,null);
  org.robolectric.util.ReflectionHelpers.setStaticField(SharedCameraOcr.class,"active",local);assertTrue(SharedCameraOcr.keepLocalResult(camera));assertFalse(SharedCameraOcr.keepLocalResult(new Camera(camera.b)));SharedCameraOcr.clear(camera);assertFalse(SharedCameraOcr.keepLocalResult(camera));
 }
 @Test public void imageChoiceIsNotBlockedByAnUnreadyModel(){
  android.content.Context app=org.robolectric.RuntimeEnvironment.getApplication();
  dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings.preferences(app).edit().clear().commit();
  dev.jason.gboardpatches.extension.ocr.GboardOcrSettings.preferences(app).edit().putBoolean(dev.jason.gboardpatches.extension.ocr.GboardOcrSettings.PREF_KEY_SHARED_IMAGE_OCR,true).commit();
  final android.content.Intent[] opened={null};android.content.Context context=new android.content.ContextWrapper(app){@Override public void startActivity(android.content.Intent intent){opened[0]=intent;throw new android.content.ActivityNotFoundException();}};
  Editor editor=new Editor();GboardSharedWritingRuntime.onInputStarting(editor,editor.info);
  assertFalse(SharedModelClient.isReadyCached());Camera camera=new Camera(context);SharedCameraOcr.bind(camera);assertTrue(camera.f.performClick());assertNotNull(opened[0]);assertEquals(SharedImageInputActivity.class.getName(),opened[0].getComponent().getClassName());SharedCameraOcr.clear(camera);GboardSharedWritingRuntime.onInputHidden(editor);
 }
 @Test public void privateEditorStillCannotLaunchThePicker(){
  android.content.Context app=org.robolectric.RuntimeEnvironment.getApplication();
  dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings.preferences(app).edit().clear().commit();
  dev.jason.gboardpatches.extension.ocr.GboardOcrSettings.preferences(app).edit().putBoolean(dev.jason.gboardpatches.extension.ocr.GboardOcrSettings.PREF_KEY_SHARED_IMAGE_OCR,true).commit();
  final boolean[] opened={false};android.content.Context context=new android.content.ContextWrapper(app){@Override public void startActivity(android.content.Intent intent){opened[0]=true;}};
  Editor editor=new Editor();editor.info.inputType=android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_VARIATION_PASSWORD;GboardSharedWritingRuntime.onInputStarting(editor,editor.info);
  Camera camera=new Camera(context);SharedCameraOcr.bind(camera);camera.f.performClick();assertFalse(opened[0]);SharedCameraOcr.clear(camera);GboardSharedWritingRuntime.onInputHidden(editor);
 }
}
