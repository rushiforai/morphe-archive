package dev.jason.gboardpatches.extension.sharedmodel;
import android.inputmethodservice.InputMethodService;
import android.view.inputmethod.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedInputLifecycleTest {
 private static final class Ime extends InputMethodService {
  final EditorInfo info=new EditorInfo();
  final InputConnection connection=new BaseInputConnection(new android.view.View(RuntimeEnvironment.getApplication()),true){@Override public ExtractedText getExtractedText(ExtractedTextRequest request,int flags){ExtractedText e=new ExtractedText();e.text="Draft";e.selectionStart=e.selectionEnd=5;return e;}};
  @Override public android.content.Context getApplicationContext(){return RuntimeEnvironment.getApplication();}
  @Override public EditorInfo getCurrentInputEditorInfo(){return info;}
  @Override public InputConnection getCurrentInputConnection(){return connection;}
 }
 @Before public void disableProvider(){dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings.preferences(RuntimeEnvironment.getApplication()).edit().clear().commit();}
 @After public void close(){GboardSharedWritingRuntime.onInputHidden(null);}
 @Test public void showingTheSameEditorRestoresCaptureWithoutAnotherStartInput(){Ime ime=new Ime();GboardSharedWritingRuntime.onInputStarting(ime,ime.info);GboardSharedWritingRuntime.onInputHidden(ime);assertNull(GboardSharedWritingRuntime.currentService());GboardSharedWritingRuntime.onInputShown(ime);assertSame(ime,GboardSharedWritingRuntime.currentService());assertNotNull(GboardSharedWritingRuntime.captureEditor());}
 @Test public void repeatedWindowShownDoesNotInvalidateAnActiveRequest(){Ime ime=new Ime();GboardSharedWritingRuntime.onInputStarting(ime,ime.info);EditorSnapshot snapshot=GboardSharedWritingRuntime.captureEditor();long revision=GboardSharedWritingRuntime.currentRevision();GboardSharedWritingRuntime.onInputShown(ime);assertEquals(revision,GboardSharedWritingRuntime.currentRevision());assertTrue(GboardSharedWritingRuntime.isCurrent(snapshot));}
 @Test public void restoringTheServiceDoesNotMakeAPasswordEditorEligible(){Ime ime=new Ime();ime.info.inputType=android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_VARIATION_PASSWORD;GboardSharedWritingRuntime.onInputHidden(ime);GboardSharedWritingRuntime.onInputShown(ime);assertNull(GboardSharedWritingRuntime.captureEditor());}
}
