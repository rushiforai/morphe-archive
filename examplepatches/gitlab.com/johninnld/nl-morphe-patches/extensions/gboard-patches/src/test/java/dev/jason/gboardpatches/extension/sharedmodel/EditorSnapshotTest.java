package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import android.inputmethodservice.InputMethodService;
import android.view.inputmethod.*;
import android.text.InputType;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=34,manifest=Config.NONE)
public class EditorSnapshotTest {
 private static final class Connection extends BaseInputConnection {
  CharSequence text="I have 12 messages.";int start=0,end=19;int commits;String inserted;
  @Override public boolean beginBatchEdit(){return true;}
  @Override public boolean endBatchEdit(){return true;}
  @Override public boolean finishComposingText(){return true;}
  @Override public boolean commitText(CharSequence value,int cursor){commits++;inserted=value.toString();return true;}
  Connection(){super(new android.view.View(org.robolectric.RuntimeEnvironment.getApplication()),true);}
  @Override public ExtractedText getExtractedText(ExtractedTextRequest request,int flags){ExtractedText e=new ExtractedText();e.text=text;e.selectionStart=start;e.selectionEnd=end;return e;}
 }
 private static final class Ime extends InputMethodService {
  Connection connection=new Connection();EditorInfo info=new EditorInfo();
  @Override public InputConnection getCurrentInputConnection(){return connection;}
  @Override public EditorInfo getCurrentInputEditorInfo(){return info;}
 }
 @Test public void changedEditorOrSelectionDropsResult(){Ime ime=new Ime();EditorSnapshot s=EditorSnapshot.capture(ime,4);assertNotNull(s);assertTrue(s.isCurrent(4));ime.connection.end=0;assertFalse(s.isCurrent(4));}
 @Test public void sameLengthTextChangeIsStillStale(){Ime ime=new Ime();EditorSnapshot s=EditorSnapshot.capture(ime,4);ime.connection.text="I have 13 messages.";assertFalse(s.isCurrent(4));}
 @Test public void newInputConnectionInvalidatesSnapshot(){Ime ime=new Ime();EditorSnapshot s=EditorSnapshot.capture(ime,4);ime.connection=new Connection();assertFalse(s.isCurrent(4));}
 @Test public void revisionChangeInvalidatesIdenticalText(){Ime ime=new Ime();EditorSnapshot s=EditorSnapshot.capture(ime,4);assertFalse(s.isCurrent(5));}
 @Test public void composingRangeChangeInvalidatesSnapshot(){Ime ime=new Ime();EditorSnapshot s=EditorSnapshot.capture(ime,4);android.text.SpannableStringBuilder composing=new android.text.SpannableStringBuilder(ime.connection.text);BaseInputConnection.setComposingSpans(composing);ime.connection.text=composing;assertFalse(s.isCurrent(4));}
 @Test public void passwordEditorIsNeverCaptured(){Ime ime=new Ime();ime.info.inputType=InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD;assertNull(EditorSnapshot.capture(ime,4));}
 @Test public void inlineAcceptanceCannotWriteIntoAChangedEditor(){Ime ime=new Ime();ime.connection.start=ime.connection.end=ime.connection.text.length();EditorSnapshot snapshot=EditorSnapshot.capture(ime,4);assertNotNull(snapshot.completionPrefix());ime.connection.text="I have 13 messages.";assertFalse(snapshot.appendSuffix(" now",4));assertEquals(0,ime.connection.commits);}
 @Test public void inlineAcceptanceAppendsOnlyTheSuffixInAnUnchangedEditor(){Ime ime=new Ime();ime.connection.start=ime.connection.end=ime.connection.text.length();EditorSnapshot snapshot=EditorSnapshot.capture(ime,4);assertTrue(snapshot.appendSuffix(" now",4));assertEquals(" now",ime.connection.inserted);assertEquals(1,ime.connection.commits);assertFalse(snapshot.appendSuffix(" later",5));assertEquals(1,ime.connection.commits);}

 @Test public void matchingResourceIdDoesNotIdentifyAnotherConversationAfterRestart(){Ime ime=new Ime();ime.info.packageName="test.chat";ime.info.fieldId=42;EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();ime.connection=new Connection();assertNull(handoff.resume(ime,5));}
 @Test public void handoffNeverUsesAnotherAppOrChangedDraft(){Ime ime=new Ime();ime.info.packageName="test.chat";ime.info.fieldId=42;EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();ime.info.packageName="other.chat";assertNull(handoff.resume(ime,5));ime.info.packageName="test.chat";ime.connection.text="I have 13 messages.";assertNull(handoff.resume(ime,5));}
 @Test public void unnamedEditorCannotBeGuessedAfterConnectionRestart(){Ime ime=new Ime();EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();ime.connection=new Connection();assertNull(handoff.resume(ime,5));}
 @Test public void handoffCannotResumeIntoAPasswordField(){Ime ime=new Ime();ime.info.fieldId=42;EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();ime.info.inputType=InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD;assertNull(handoff.resume(ime,5));}
 @Test public void handoffRequiresTheSameLiveConnectionEvenForViewNoId(){Ime ime=new Ime();ime.info.fieldId=-1;ime.info.fieldName="message";EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();ime.connection=new Connection();assertNull(handoff.resume(ime,5));}
 @Test public void unchangedLiveEditorCanResumeAcrossTheExplicitHandoffRevision(){Ime ime=new Ime();EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();assertNotNull(handoff.resume(ime,5));}
 @Test public void handoffRejectsAChangedComposingRange(){Ime ime=new Ime();EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();android.text.SpannableStringBuilder text=new android.text.SpannableStringBuilder(ime.connection.text);BaseInputConnection.setComposingSpans(text);ime.connection.text=text;assertNull(handoff.resume(ime,5));}
 @Test public void anApprovedImageCanResumeOnlyAFreshPreviewAfterAndroidRebindsTheEditor(){
  Ime ime=new Ime();ime.info.packageName="test.chat";ime.info.fieldId=42;
  EditorSnapshot old=EditorSnapshot.capture(ime,4);EditorSnapshot.Handoff handoff=old.handoff();
  ime.connection=new Connection();ime.info=new EditorInfo();ime.info.packageName="test.chat";ime.info.fieldId=42;
  assertNull(handoff.resume(ime,5));EditorSnapshot preview=handoff.resumeForPreview(ime,5);
  assertNotNull(preview);assertTrue(preview.isCurrent(5));assertFalse(old.isCurrent(5));
  ime.connection=new Connection();assertFalse(preview.isCurrent(5));
 }
 @Test public void previewHandoffStillRejectsAnotherAppFieldDraftOrPrivateInput(){
  Ime ime=new Ime();ime.info.packageName="test.chat";ime.info.fieldId=42;EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();
  ime.connection=new Connection();ime.info.packageName="other.chat";assertNull(handoff.resumeForPreview(ime,5));
  ime.info.packageName="test.chat";ime.info.fieldId=43;assertNull(handoff.resumeForPreview(ime,5));
  ime.info.fieldId=42;ime.connection.text="I have 13 messages.";assertNull(handoff.resumeForPreview(ime,5));
  ime.connection.text="I have 12 messages.";ime.info.inputType=InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD;assertNull(handoff.resumeForPreview(ime,5));
 }
 @Test public void previewAllowsOnlyFinalizingTheSameDraftComposition(){
  Ime ime=new Ime();ime.info.packageName="test.chat";android.text.SpannableStringBuilder text=new android.text.SpannableStringBuilder(ime.connection.text);BaseInputConnection.setComposingSpans(text);ime.connection.text=text;
  EditorSnapshot.Handoff handoff=EditorSnapshot.capture(ime,4).handoff();ime.connection=new Connection();assertNotNull(handoff.resumeForPreview(ime,5));
 }
}
