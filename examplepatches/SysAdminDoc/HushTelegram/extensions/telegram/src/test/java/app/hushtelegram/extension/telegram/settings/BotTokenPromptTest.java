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
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
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
public class BotTokenPromptTest {
    /** A made-up token with a real one's shape. No bot has it. */
    private static final String TOKEN = "123456:AAFakeTokenForTestsOnly_0123456789-";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private ActivityController<Activity> controller;
    private final List<String> typed = new ArrayList<>();
    private final List<BotTokenPrompt.Answer> answers = new ArrayList<>();
    private String refusal;

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
        assertEquals("Sign in with a bot token", String.valueOf(shadowOf(prompt).getTitle()));
        assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                prompt.getWindow().getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
        EditText field = field(prompt);
        assertEquals("Bot token", String.valueOf(field.getHint()));
        int input = field.getInputType();
        assertEquals(InputType.TYPE_CLASS_TEXT, input & InputType.TYPE_MASK_CLASS);
        assertEquals("letters show as typed, so a pasted token can be checked",
                InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD, input & InputType.TYPE_MASK_VARIATION);
        assertTrue("the keyboard learns nothing from it", (input & InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS) != 0);
        assertTrue((field.getImeOptions() & EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING) != 0);
        assertFalse("no saved state holds it", field.isSaveEnabled());
        assertEquals(View.IMPORTANT_FOR_AUTOFILL_NO, field.getImportantForAutofill());
        assertEquals("Sign in", prompt.getButton(AlertDialog.BUTTON_POSITIVE).getText().toString());
        assertEquals("Cancel", prompt.getButton(AlertDialog.BUTTON_NEGATIVE).getText().toString());
        assertEquals(View.GONE, waiting(prompt).getVisibility());
    }

    @Test public void aRefusedTokenKeepsTheBoxAndWhatWasTyped() {
        refusal = "That isn't a bot token.";
        AlertDialog prompt = ask();
        field(prompt).setText("123:short");
        prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(Collections.singletonList("123:short"), typed);
        assertTrue(prompt.isShowing());
        assertEquals("123:short", field(prompt).getText().toString());
        assertEquals("That isn't a bot token.", ShadowToast.getTextOfLatestToast());
        assertTrue(prompt.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertEquals(View.GONE, waiting(prompt).getVisibility());
    }

    @Test public void aSentTokenWaitsForTelegramAndAnAnswerSettlesIt() {
        AlertDialog prompt = ask();
        EditText field = field(prompt);
        Button signIn = prompt.getButton(AlertDialog.BUTTON_POSITIVE);
        field.setText(TOKEN);
        signIn.performClick();
        assertEquals(Collections.singletonList(TOKEN), typed);
        assertFalse("one sign-in at a time", signIn.isEnabled());
        assertEquals(View.VISIBLE, waiting(prompt).getVisibility());
        assertEquals("Waiting for Telegram.", waiting(prompt).getText().toString());
        assertNull(ShadowToast.getTextOfLatestToast());

        answers.get(0).refused("That bot token isn't valid.");
        ShadowLooper.idleMainLooper();
        assertTrue("a refusal keeps the box", prompt.isShowing());
        assertTrue(signIn.isEnabled());
        assertEquals(View.GONE, waiting(prompt).getVisibility());
        assertEquals(TOKEN, field.getText().toString());
        assertEquals("That bot token isn't valid.", ShadowToast.getTextOfLatestToast());

        signIn.performClick();
        assertEquals(2, typed.size());
        answers.get(1).signedIn();
        assertFalse("a sign-in closes it", prompt.isShowing());
    }

    @Test public void doneOnTheKeyboardSignsInOnce() {
        AlertDialog prompt = ask();
        EditText field = field(prompt);
        field.setText(TOKEN);
        field.onEditorAction(EditorInfo.IME_ACTION_DONE);
        assertEquals(1, typed.size());
        field.onEditorAction(EditorInfo.IME_ACTION_DONE);
        assertEquals("nothing goes out again while Telegram is answering", 1, typed.size());
    }

    @Test public void anAnswerAfterTheBoxClosedShowsNothing() {
        AlertDialog prompt = ask();
        field(prompt).setText(TOKEN);
        prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        prompt.dismiss();
        answers.get(0).refused("That bot token was revoked.");
        ShadowLooper.idleMainLooper();
        assertNull(ShadowToast.getTextOfLatestToast());
        answers.get(0).signedIn();
        assertFalse(prompt.isShowing());
    }

    private AlertDialog ask() {
        AlertDialog prompt = BotTokenPrompt.ask(controller.get(), (token, answer) -> {
            typed.add(token);
            answers.add(answer);
            return refusal;
        });
        ShadowLooper.idleMainLooper();
        return prompt;
    }

    private static EditText field(AlertDialog prompt) {
        return prompt.findViewById(android.R.id.edit);
    }

    private static TextView waiting(AlertDialog prompt) {
        return prompt.getWindow().getDecorView().findViewWithTag(EditorForm.ANSWER);
    }
}
