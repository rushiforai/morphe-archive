package dev.jason.gboardpatches.extension.sharedmodel;

import android.inputmethodservice.InputMethodService;
import android.os.Looper;
import android.view.View;
import android.view.inputmethod.*;
import java.time.Duration;
import java.util.concurrent.CompletableFuture;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedWritingActivationTest {
    static final class Connection extends BaseInputConnection {
        String text="This are a test.";
        int selection=-1;
        Connection(){super(new View(RuntimeEnvironment.getApplication()),true);}
        @Override public ExtractedText getExtractedText(ExtractedTextRequest r,int flags){ExtractedText e=new ExtractedText();e.text=text;e.selectionStart=e.selectionEnd=selection<0?text.length():selection;return e;}
    }
    static final class Ime extends InputMethodService {
        Connection connection=new Connection();final EditorInfo info=new EditorInfo();
        @Override public InputConnection getCurrentInputConnection(){return connection;}
        @Override public EditorInfo getCurrentInputEditorInfo(){return info;}
    }
    static final class Entry implements SharedWritingActivation.Entry {
        boolean ready;int opens;
        public boolean available(){return ready;}
        public void open(){opens++;}
    }
    @After public void cleanup(){SharedWritingActivation.cancel();Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private EditorSnapshot snapshot(Ime ime){return EditorSnapshot.capture(ime,GboardSharedWritingRuntime.currentRevision());}
    @Test public void existingNativeSessionDoesNotToggleTheKeyboardOff(){Entry entry=new Entry();entry.ready=true;assertTrue(SharedWritingActivation.start(snapshot(new Ime()),entry).isDone());assertEquals(0,entry.opens);}
    @Test public void actionsWaitForActualNativeActivation(){Entry entry=new Entry();CompletableFuture<Void> result=SharedWritingActivation.start(snapshot(new Ime()),entry);assertEquals(1,entry.opens);assertFalse(result.isDone());entry.ready=true;SharedWritingActivation.nativeReady();Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(result.isDone());assertFalse(result.isCompletedExceptionally());}
    @Test public void cachedViewBecomingVisibleAfterTheActivationCallbackStillCompletes(){
        Entry entry=new Entry();CompletableFuture<Void> result=SharedWritingActivation.start(snapshot(new Ime()),entry);
        Shadows.shadowOf(Looper.getMainLooper()).idle();assertFalse(result.isDone());
        entry.ready=true;Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(100));
        assertTrue(result.isDone());assertFalse(result.isCompletedExceptionally());assertEquals(1,entry.opens);
    }
    @Test public void unavailableNativeSessionTimesOutWithoutRepeatingTheEvent(){Entry entry=new Entry();CompletableFuture<Void> result=SharedWritingActivation.start(snapshot(new Ime()),entry);Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(3));assertTrue(result.isCompletedExceptionally());assertEquals(1,entry.opens);}
    @Test public void changedDraftDiscardsALateNativeActivation(){Ime ime=new Ime();Entry entry=new Entry();CompletableFuture<Void> result=SharedWritingActivation.start(snapshot(ime),entry);ime.connection.text="A different draft";entry.ready=true;SharedWritingActivation.nativeReady();Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(result.isCancelled());}
    @Test public void hiddenInputCannotOpenALateMenu(){Entry entry=new Entry();CompletableFuture<Void> result=SharedWritingActivation.start(snapshot(new Ime()),entry);SharedWritingActivation.cancel();entry.ready=true;SharedWritingActivation.nativeReady();Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(result.isCancelled());}
    @Test public void missingEditorNeverActivatesNativeWriting(){Entry entry=new Entry();assertTrue(SharedWritingActivation.start(null,entry).isCompletedExceptionally());assertEquals(0,entry.opens);}

    @Test public void readyActionKeepsTheInitiatingEditorUntilItRuns(){
        Ime ime=new Ime();
        EditorSnapshot snapshot=snapshot(ime);
        Entry entry=new Entry();entry.ready=true;
        int[] actions={0};
        SharedWritingActivation.whenReady(RuntimeEnvironment.getApplication(),snapshot,
            SharedWritingActivation.start(snapshot,entry),()->actions[0]++);
        ime.connection=new Connection();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(0,actions[0]);
    }

    @Test public void readyActionRechecksSelectionAfterPosting(){
        Ime ime=new Ime();
        EditorSnapshot snapshot=snapshot(ime);
        Entry entry=new Entry();entry.ready=true;
        int[] actions={0};
        SharedWritingActivation.whenReady(RuntimeEnvironment.getApplication(),snapshot,
            SharedWritingActivation.start(snapshot,entry),()->actions[0]++);
        ime.connection.selection=0;
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(0,actions[0]);
    }

    @Test public void readyActionRunsForTheUnchangedEditor(){
        Ime ime=new Ime();
        EditorSnapshot snapshot=snapshot(ime);
        Entry entry=new Entry();entry.ready=true;
        int[] actions={0};
        SharedWritingActivation.whenReady(RuntimeEnvironment.getApplication(),snapshot,
            SharedWritingActivation.start(snapshot,entry),()->actions[0]++);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(1,actions[0]);
    }
}
