package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.view.inputmethod.EditorInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public final class NativeKeyboardTest {
    private ProjectedEditor fixture;

    @Before public void editor() {
        fixture = new ProjectedEditor("Amsterdam"); fixture.field.setSelection(2, 6);
    }

    @Test public void initialQueryIncludesTextBeforeInsideAndAfterTheSelection() throws Exception {
        NativeKeyboard keyboard = new NativeKeyboard(fixture, fixture.info);
        assertEquals("Amsterdam", keyboard.text());
        assertEquals("Find a destination", keyboard.hint());
    }

    @Test public void hostEditsReplaceTheWholeOriginalQueryWithoutAppendingOrLosingUnicode() throws Exception {
        NativeKeyboard keyboard = new NativeKeyboard(fixture, fixture.info);
        for (String query : new String[]{"A", "Am", "Amsterdam", "Amst", "", "München 🚗"}) {
            keyboard.replace(query);
            assertEquals(query, fixture.field.getText().toString());
        }
    }

    @Test public void submitInvokesTheOriginalEditorsRequestedActionWithTheRealQuery() throws Exception {
        fixture.info.imeOptions = EditorInfo.IME_FLAG_NO_EXTRACT_UI | EditorInfo.IME_ACTION_GO;
        NativeKeyboard keyboard = new NativeKeyboard(fixture, fixture.info);
        keyboard.submit("Utrecht Centraal");
        assertEquals("Utrecht Centraal", fixture.submitted);
        assertEquals(EditorInfo.IME_ACTION_GO, fixture.submittedAction);
    }

    @Test public void unspecifiedEditorActionFallsBackToSearch() throws Exception {
        fixture.info.imeOptions = EditorInfo.IME_ACTION_UNSPECIFIED;
        new NativeKeyboard(fixture, fixture.info).submit("Rotterdam");
        assertEquals("Rotterdam", fixture.submitted); assertEquals(EditorInfo.IME_ACTION_SEARCH, fixture.submittedAction);
    }

    @Test public void closingInputPreventsStaleHostCallbacksFromEditingTheOriginalField() throws Exception {
        NativeKeyboard keyboard = new NativeKeyboard(fixture, fixture.info); keyboard.close();
        try { keyboard.replace("wrong destination"); fail("Closed input accepted a query"); }
        catch (IllegalStateException expected) { assertEquals("Amsterdam", fixture.field.getText().toString()); }
    }

    @Test public void theNativeEndPinnedEditorReplacesEveryQueryInsteadOfAppending() throws Exception {
        ProjectedEditor nativeEditor = new ProjectedEditor("Amsterdam", true);
        NativeKeyboard keyboard = new NativeKeyboard(nativeEditor, nativeEditor.info);
        for (String query : new String[]{"Mr.", "Mr. V", "Mr. Visserplein"}) {
            keyboard.replace(query);
            assertEquals(query, nativeEditor.field.getText().toString());
        }
    }

}
