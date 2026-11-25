/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.text.InputType;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;

import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ApiIdPromptTest {
    /** A made-up pair with a real one's shape. No app has it. */
    private static final String ID = "1234567";
    private static final String HASH = "0123456789abcdef0123456789abcdef";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private ActivityController<Activity> controller;
    private final List<String> saved = new ArrayList<>();
    private boolean hasSaved;
    private boolean writes = true;
    private int cleared;
    private int restarts;

    @Before public void open() {
        ShadowToast.reset();
        controller = Robolectric.buildActivity(Activity.class).setup();
    }

    @After public void close() {
        controller.close();
        ShadowToast.reset();
    }

    @Test public void theBoxMakesRoomForTheKeyboardAndKeepsNothing() {
        AlertDialog prompt = ask();
        assertTrue(prompt.isShowing());
        assertEquals("Enter your API ID", String.valueOf(shadowOf(prompt).getTitle()));
        assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                prompt.getWindow().getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
        EditText id = id(prompt);
        EditText hash = hash(prompt);
        assertEquals("App api_id", String.valueOf(id.getHint()));
        assertEquals("App api_hash", String.valueOf(hash.getHint()));
        assertEquals("the ID gets a number pad", InputType.TYPE_CLASS_NUMBER, id.getInputType() & InputType.TYPE_MASK_CLASS);
        assertEquals("Next moves on to the hash", EditorInfo.IME_ACTION_NEXT, id.getImeOptions() & EditorInfo.IME_MASK_ACTION);
        assertEquals(EditorInfo.IME_ACTION_DONE, hash.getImeOptions() & EditorInfo.IME_MASK_ACTION);
        assertEquals("letters show as typed, so a pasted hash can be checked",
                InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD, hash.getInputType() & InputType.TYPE_MASK_VARIATION);
        for (EditText field : new EditText[] {id, hash}) {
            assertTrue("the keyboard learns nothing from it", (field.getImeOptions() & EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING) != 0);
            assertFalse("no saved state holds it", field.isSaveEnabled());
            assertEquals(View.IMPORTANT_FOR_AUTOFILL_NO, field.getImportantForAutofill());
        }
        assertEquals("Save", prompt.getButton(AlertDialog.BUTTON_POSITIVE).getText().toString());
        assertEquals("Cancel", prompt.getButton(AlertDialog.BUTTON_NEGATIVE).getText().toString());
        assertNotEquals("nothing to remove yet", View.VISIBLE, visibility(prompt.getButton(AlertDialog.BUTTON_NEUTRAL)));
    }

    @Test public void aWrongIdIsRefusedUnderItsFieldAndKeepsWhatWasTyped() {
        AlertDialog prompt = ask();
        id(prompt).setText("12ab");
        hash(prompt).setText(HASH);
        prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertTrue(prompt.isShowing());
        assertEquals("12ab", id(prompt).getText().toString());
        assertEquals(EditorForm.INVALID, id(prompt).getTag());
        assertNull(hash(prompt).getTag());
        assertEquals("An API ID is only digits, like 1234567.", ShadowToast.getTextOfLatestToast());
        assertTrue(saved.isEmpty());
        assertEquals(0, restarts);
    }

    @Test public void aWrongHashIsRefusedUnderItsField() {
        AlertDialog prompt = ask();
        id(prompt).setText(ID);
        hash(prompt).setText(HASH.substring(2));
        prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertTrue(prompt.isShowing());
        assertEquals(EditorForm.INVALID, hash(prompt).getTag());
        assertEquals("An API hash is 32 letters and numbers.", ShadowToast.getTextOfLatestToast());
        assertTrue(saved.isEmpty());
    }

    @Test public void saveKeepsThePairAndRestartsTelegramOnce() {
        AlertDialog prompt = ask();
        id(prompt).setText(ID);
        hash(prompt).setText(HASH);
        hash(prompt).onEditorAction(EditorInfo.IME_ACTION_DONE);
        hash(prompt).onEditorAction(EditorInfo.IME_ACTION_DONE);
        ShadowLooper.idleMainLooper();
        assertEquals(List.of(ID + " " + HASH), saved);
        assertFalse(prompt.isShowing());
        assertEquals("Saved. Telegram restarts now.", ShadowToast.getTextOfLatestToast());
        assertEquals(1, restarts);
    }

    @Test public void aFailedWriteSaysSoAndStays() {
        writes = false;
        AlertDialog prompt = ask();
        id(prompt).setText(ID);
        hash(prompt).setText(HASH);
        prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertTrue(prompt.isShowing());
        assertEquals("Couldn't save that. Try again.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, restarts);
    }

    @Test public void withAPairSavedRemoveTakesItOut() {
        hasSaved = true;
        AlertDialog prompt = ask();
        Button remove = prompt.getButton(AlertDialog.BUTTON_NEUTRAL);
        assertEquals(View.VISIBLE, remove.getVisibility());
        assertEquals("Remove", remove.getText().toString());
        remove.performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(1, cleared);
        assertFalse(prompt.isShowing());
        assertEquals("Removed. Telegram restarts now.", ShadowToast.getTextOfLatestToast());
        assertEquals(1, restarts);
    }

    private AlertDialog ask() {
        AlertDialog prompt = ApiIdPrompt.ask(controller.get(), new ApiIdPrompt.Store() {
            @Override public boolean saved() { return hasSaved; }
            @Override public boolean save(String id, String hash) {
                if (!writes) return false;
                saved.add(id + " " + hash);
                return true;
            }
            @Override public boolean clear() {
                cleared++;
                return true;
            }
            @Override public void restart() { restarts++; }
        });
        ShadowLooper.idleMainLooper();
        return prompt;
    }

    private static int visibility(Button button) {
        return button == null ? View.GONE : button.getVisibility();
    }

    private static EditText id(AlertDialog prompt) {
        return prompt.findViewById(android.R.id.text1);
    }

    private static EditText hash(AlertDialog prompt) {
        return prompt.findViewById(android.R.id.text2);
    }
}
