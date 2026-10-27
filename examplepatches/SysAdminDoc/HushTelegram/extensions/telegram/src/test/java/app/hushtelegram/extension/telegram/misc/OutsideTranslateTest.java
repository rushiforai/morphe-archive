/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowLooper;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = OutsideTranslateTest.HeaderHost.class)
public class OutsideTranslateTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The user IDs of two signed-in accounts. */
    private static final long OWNER = 7;
    private static final long OTHER = 8;

    private final AtomicInteger fetches = new AtomicInteger();
    private OutsideTranslate.Fetcher originalFetcher;
    private java.util.concurrent.Executor originalExecutor;

    /** A message the tests can read and change without Telegram's classes. */
    private static final class Fake implements OutsideTranslate.Message {
        long owner = OWNER;
        long dialog = 10;
        int id = 1;
        boolean eligible = true;
        String original = "Привет, мир";
        boolean translated;
        int applied;
        int refreshed;
        String shown;
        String language;
        /** What Telegram's translate bar shows for the chat; null is a stock app with nothing to read. */
        String telegramTarget;
        /** Runs once, the next time the account is read. */
        Runnable onOwnerRead;
        /** Runs each time the chat is told to draw the message again. */
        Runnable onRefresh;

        @Override public long owner() {
            Runnable once = onOwnerRead;
            onOwnerRead = null;
            if (once != null) once.run();
            return owner;
        }
        @Override public long dialog() { return dialog; }
        @Override public int id() { return id; }
        @Override public boolean eligible() { return eligible; }
        @Override public String original() { return original; }
        @Override public boolean translated() { return translated; }
        @Override public String telegramTarget() { return telegramTarget; }
        @Override public void apply(String text, String language) { applied++; shown = text; this.language = language; translated = true; }
        @Override public void refresh() {
            refreshed++;
            if (onRefresh != null) onRefresh.run();
        }
    }

    @Before public void reset() {
        restore();
        originalFetcher = OutsideTranslate.fetcher;
        originalExecutor = OutsideTranslate.executor;
        OutsideTranslate.executor = Runnable::run;
        OutsideTranslate.fetcher = (service, target, text) -> {
            fetches.incrementAndGet();
            return new GoogleTranslate.Result("Hello, world", "ru");
        };
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.OUTSIDE_TRANSLATE);
        Settings.OUTSIDE_TRANSLATE.resetToDefault();
        HookStatus.clear();
        OutsideTranslate.resetForTests();
        HeaderHost.refreshed = 0;
        app.hushtelegram.extension.shared.Utils.getContext().getSharedPreferences("hushtelegram_outside_translate", 0).edit().clear().commit();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.OUTSIDE_TRANSLATE);
        Settings.OUTSIDE_TRANSLATE.resetToDefault();
        HookStatus.clear();
        if (originalFetcher != null) OutsideTranslate.fetcher = originalFetcher;
        if (originalExecutor != null) OutsideTranslate.executor = originalExecutor;
        OutsideTranslate.clock = System::currentTimeMillis;
    }

    @Test public void offByDefaultChangesNothingAndSendsNothing() {
        assertFalse(Settings.OUTSIDE_TRANSLATE.get());
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake message = new Fake();
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(0, fetches.get());
        assertEquals(0, message.applied);
    }

    @Test public void aChatThatIsOnAsksOnceThenShowsTheTranslation() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake message = new Fake();
        // The original stays until the answer lands.
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(1, fetches.get());
        ShadowLooper.idleMainLooper();
        assertEquals("The chat is told to draw the message again", 1, message.refreshed);
        assertTrue(OutsideTranslate.showMessage(message, message));
        assertEquals(1, message.applied);
        assertTrue(message.shown.startsWith("Hello, world\n\n"));
        assertTrue(message.shown.endsWith("(Translated. Open the message menu for the original.)"));
        // A message already showing it isn't laid out again, and its answer still skips Telegram's own check.
        assertTrue(OutsideTranslate.showMessage(message, message));
        assertEquals(1, message.applied);
        assertEquals(1, fetches.get());
    }

    @Test public void theSameTextInTwoMessagesIsAskedOnce() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake first = new Fake();
        Fake second = new Fake();
        second.id = 2;
        OutsideTranslate.showMessage(first, first);
        OutsideTranslate.showMessage(second, second);
        assertEquals(1, fetches.get());
        assertTrue(OutsideTranslate.showMessage(second, second));
    }

    @Test public void turningTheChatOffClearsTheChoicesMadeMessageByMessage() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        assertTrue(OutsideTranslate.wanted(OWNER, 10, 1));
        OutsideTranslate.toggleChat(OWNER, 10);
        assertFalse(OutsideTranslate.wanted(OWNER, 10, 1));
        assertFalse(OutsideTranslate.wanted(OWNER, 11, 1));
    }

    @Test public void textAlreadyInTheAppLanguageIsLeftAlone() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.fetcher = (service, target, text) -> new GoogleTranslate.Result("same", target);
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        ShadowLooper.idleMainLooper();
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(0, message.applied);
    }

    @Test public void aPickedChineseScriptIsWrittenEvenFromTheOtherOne() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        Settings.TRANSLATE_TARGET.save("zh-TW");
        try {
            OutsideTranslate.toggleChat(OWNER, 10);
            List<String> asked = new ArrayList<>();
            OutsideTranslate.fetcher = (service, target, text) -> {
                asked.add(target);
                return new GoogleTranslate.Result("你好，世界", "zh-CN");
            };
            Fake message = new Fake();
            message.original = "你好，世界";
            OutsideTranslate.showMessage(message, message);
            ShadowLooper.idleMainLooper();
            assertTrue("Simplified Chinese is written out in Traditional", OutsideTranslate.showMessage(message, message));
            assertEquals(1, message.applied);
            assertEquals(Collections.singletonList("zh-TW"), asked);
        } finally {
            Settings.TRANSLATE_TARGET.resetToDefault();
        }
    }

    @Test public void theLanguagePickedInTelegramsTranslateBarIsWrittenUnlessTranslateIntoHasAPick() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        try {
            OutsideTranslate.toggleChat(OWNER, 10);
            List<String> asked = new ArrayList<>();
            OutsideTranslate.fetcher = (service, target, text) -> {
                asked.add(target);
                return new GoogleTranslate.Result("你好，世界", "zh-CN");
            };
            Fake message = new Fake();
            message.original = "你好，世界";
            message.telegramTarget = "zh-tw";
            OutsideTranslate.showMessage(message, message);
            ShadowLooper.idleMainLooper();
            assertTrue("the bar's Traditional is written out from Simplified", OutsideTranslate.showMessage(message, message));
            assertEquals("zh-TW", message.language);
            // Telegram's own language as a bare code is what it answers with nothing picked, so the old target stays.
            Fake fallback = new Fake();
            fallback.id = 2;
            fallback.original = "Привет";
            fallback.telegramTarget = Locale.getDefault().getLanguage();
            OutsideTranslate.showMessage(fallback, fallback);
            Settings.TRANSLATE_TARGET.save("fa");
            Fake chosen = new Fake();
            chosen.id = 3;
            chosen.original = "Пока";
            chosen.telegramTarget = "de";
            OutsideTranslate.showMessage(chosen, chosen);
            assertEquals(Arrays.asList("zh-TW", OutsideTranslate.tagOf(Locale.getDefault()), "fa"), asked);
        } finally {
            Settings.TRANSLATE_TARGET.resetToDefault();
        }
    }

    @Test public void aFailedRequestIsNotRepeatedAtOnceAndNothingIsShown() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.fetcher = (service, target, text) -> {
            fetches.incrementAndGet();
            throw new java.io.IOException("offline");
        };
        Fake message = new Fake();
        assertFalse(OutsideTranslate.showMessage(message, message));
        ShadowLooper.idleMainLooper();
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(1, fetches.get());
        assertEquals(0, message.applied);
        assertEquals(0, message.refreshed);
    }

    @Test public void aFailureWhoseWaitIsOverIsForgottenWhenTheNextOneLands() {
        long[] now = {1_000_000L};
        OutsideTranslate.clock = () -> now[0];
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.fetcher = (service, target, text) -> {
            fetches.incrementAndGet();
            throw new java.io.IOException("offline");
        };
        Fake first = new Fake();
        OutsideTranslate.showMessage(first, first);
        now[0] += 59_999L;
        Fake second = new Fake();
        second.id = 2;
        second.original = "Пока, мир";
        OutsideTranslate.showMessage(second, second);
        assertEquals("both still wait", 2, OutsideTranslate.failuresForTests());
        now[0] += 1L;
        Fake third = new Fake();
        third.id = 3;
        third.original = "Доброе утро";
        OutsideTranslate.showMessage(third, third);
        assertEquals("the first one's minute is up, so only the newer two are kept", 2, OutsideTranslate.failuresForTests());
        // The forgotten text is asked again, as it would have been anyway.
        OutsideTranslate.showMessage(first, first);
        assertEquals(4, fetches.get());
    }

    @Test public void aMessageThatIsNotEligibleIsNeverSent() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake message = new Fake();
        message.eligible = false;
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(0, fetches.get());
    }

    @Test public void telegramsOwnTranslationOfAMessageIsLeftAlone() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake message = new Fake();
        message.translated = true;
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(0, fetches.get());
    }

    @Test public void pausedTakesTelegramsPathAndSendsNothing() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        Fake message = new Fake();
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(0, fetches.get());
    }

    @Test public void aTurnedOffSwitchSendsTelegramsCodeOnToPutTheOriginalBack() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        ShadowLooper.idleMainLooper();
        assertTrue(OutsideTranslate.showMessage(message, message));
        Settings.OUTSIDE_TRANSLATE.save(false);
        assertFalse(OutsideTranslate.showMessage(message, message));
    }

    /** The settings row promises nothing is sent until a chat or message is turned on, so switching off starts over. */
    @Test public void turningTheSwitchOffForgetsTheChatsSoTurningItBackOnSendsNothing() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Settings.OUTSIDE_TRANSLATE.save(false);
        assertFalse(OutsideTranslate.active());
        Settings.OUTSIDE_TRANSLATE.save(true);
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
        OutsideTranslate.resetForTests();
        assertFalse("the saved list kept the chat", OutsideTranslate.chatOn(OWNER, 10));
        Fake message = new Fake();
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(0, fetches.get());
    }

    @Test public void theSwitchRowForgetsTheChatsAsItGoesOff() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.forgetChats();
        OutsideTranslate.resetForTests();
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
    }

    /** Pause is a break, not a choice, so the chats turned on come back with Resume. */
    @Test public void pausingKeepsTheChatsTurnedOn() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(OutsideTranslate.active());
        PauseForTests.resume();
        assertTrue(OutsideTranslate.chatOn(OWNER, 10));
    }

    @Test public void aFailureThatLandsAfterTheSwitchWentOffSaysNothing() {
        List<Runnable> queued = new ArrayList<>();
        OutsideTranslate.executor = queued::add;
        OutsideTranslate.fetcher = (service, target, text) -> { throw new java.io.IOException("offline"); };
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake message = new Fake();
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(1, queued.size());
        Settings.OUTSIDE_TRANSLATE.save(false);
        queued.get(0).run();
        ShadowLooper.idleMainLooper();
        assertNull(org.robolectric.shadows.ShadowToast.getLatestToast());
        assertEquals(0, message.refreshed);
    }

    @Test public void googleIsTheServiceUntilAKeyIsSavedAndUseGoogleForgetsTheKey() {
        assertFalse(OutsideTranslate.service().enabled());
        assertTrue(OutsideTranslate.saveService(" https://openrouter.ai/api/v1 ", "deepseek/deepseek-chat", " sk-1 "));
        OutsideTranslate.resetForTests();
        // Read back from the phone, trimmed.
        AiTranslate.Service saved = OutsideTranslate.service();
        assertTrue(saved.enabled());
        assertEquals("https://openrouter.ai/api/v1", saved.address);
        assertEquals("deepseek/deepseek-chat", saved.model);
        assertEquals("sk-1", saved.key);
        assertTrue(OutsideTranslate.saveService(saved.address, saved.model, ""));
        OutsideTranslate.resetForTests();
        assertFalse(OutsideTranslate.service().enabled());
        assertEquals("the address is kept for next time", "https://openrouter.ai/api/v1", OutsideTranslate.service().address);
        assertFalse(app.hushtelegram.extension.shared.Utils.getContext()
                .getSharedPreferences("hushtelegram_outside_translate", 0).contains("ai_key"));
    }

    @Test public void instructionsAreSavedWithTheServiceAndOutliveATripToGoogle() {
        assertEquals("", OutsideTranslate.service().style);
        assertTrue(OutsideTranslate.saveService("https://openrouter.ai/api/v1", "m", "sk-1", "  Keep it casual.\nNo notes.  "));
        OutsideTranslate.resetForTests();
        assertEquals("Keep it casual.\nNo notes.", OutsideTranslate.service().style);

        assertTrue("a save without them keeps them", OutsideTranslate.saveService("https://openrouter.ai/api/v1", "m2", "sk-1"));
        OutsideTranslate.resetForTests();
        assertEquals("Keep it casual.\nNo notes.", OutsideTranslate.service().style);

        assertTrue(OutsideTranslate.saveService("https://openrouter.ai/api/v1", "m2", "", "ignored by Google"));
        OutsideTranslate.resetForTests();
        assertFalse(OutsideTranslate.service().enabled());
        assertEquals("Google leaves them saved for next time", "Keep it casual.\nNo notes.", OutsideTranslate.service().style);

        assertTrue(OutsideTranslate.saveService("https://openrouter.ai/api/v1", "m2", "sk-1", " "));
        OutsideTranslate.resetForTests();
        assertEquals("emptied, they're gone", "", OutsideTranslate.service().style);
        assertFalse(app.hushtelegram.extension.shared.Utils.getContext()
                .getSharedPreferences("hushtelegram_outside_translate", 0).contains("ai_style"));
    }

    @Test public void aNewServiceDropsTheOldTranslationsAndAnAnswerStillOut() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        ShadowLooper.idleMainLooper();
        assertTrue(OutsideTranslate.showMessage(message, message));
        assertEquals(1, fetches.get());

        List<Runnable> queued = new ArrayList<>();
        OutsideTranslate.executor = queued::add;
        assertTrue(OutsideTranslate.saveService("https://api.openai.com/v1", "gpt-4o-mini", "sk-1"));
        // The translation from Google is gone, so the next look asks the new service.
        Fake again = new Fake();
        assertFalse(OutsideTranslate.showMessage(again, again));
        assertEquals(1, queued.size());
        // The service changes again before that request goes out: it's dropped unsent.
        assertTrue(OutsideTranslate.saveService("https://api.openai.com/v1", "gpt-4o", "sk-1"));
        queued.get(0).run();
        ShadowLooper.idleMainLooper();
        assertEquals("the queued text went to a service it wasn't queued for", 1, fetches.get());
        assertEquals(0, again.refreshed);
        assertNull(OutsideTranslate.cached(OWNER, OutsideTranslate.target(), again.original));
    }

    @Test public void aKeyTheServiceTurnsDownSaysSo() {
        org.robolectric.shadows.ShadowToast.reset();
        OutsideTranslate.fetcher = (service, target, text) -> { throw new AiTranslate.KeyRefused(401); };
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        ShadowLooper.idleMainLooper();
        assertEquals("Your AI service didn't accept the key", org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        // What the diagnostic report keeps of the failure is its status, never the key.
        assertFalse(String.join("\n", HookStatus.report()).contains("sk-"));
        // A turned-down key is counted, and the family's hooks still read as working.
        assertTrue(String.join("\n", HookStatus.report()).contains("translate key refused"));
        assertTrue(HookStatus.missing(FamilyNames.OUTSIDE_TRANSLATE).isEmpty());
    }

    @Test public void onlyAnUnexpectedFailureReadsAsABrokenHook() {
        OutsideTranslate.fetcher = (service, target, text) -> { throw new java.io.IOException("no route"); };
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        Fake offline = new Fake();
        OutsideTranslate.showMessage(offline, offline);
        ShadowLooper.idleMainLooper();
        assertTrue(String.join("\n", HookStatus.report()).contains("translate request failed"));
        assertTrue(HookStatus.missing(FamilyNames.OUTSIDE_TRANSLATE).isEmpty());

        OutsideTranslate.fetcher = (service, target, text) -> { throw new IllegalStateException("parser bug"); };
        Fake broken = new Fake();
        broken.original = "Другой текст";
        OutsideTranslate.showMessage(broken, broken);
        ShadowLooper.idleMainLooper();
        assertFalse(HookStatus.missing(FamilyNames.OUTSIDE_TRANSLATE).isEmpty());
    }

    /** Telegram doesn't know the chat item's number, so a tap on one left in an open menu stays ours. */
    @Test public void theChatItemIsOursEvenAfterTheSwitchWentOff() {
        assertFalse(Settings.OUTSIDE_TRANSLATE.get());
        assertTrue(OutsideTranslate.headerClick(new Object(), OutsideTranslate.HEADER_ITEM));
        assertFalse(OutsideTranslate.chatOn(OWNER, 0));
        assertFalse(OutsideTranslate.headerClick(new Object(), OutsideTranslate.HEADER_ITEM + 1));
    }

    @Test public void theChatMenuLabelFollowsSavedStateWithoutAddingDuplicates() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 42);
        OutsideTranslate.resetForTests();
        Chat chat = new Chat(42);
        OutsideTranslate.headerMenu(chat);
        OutsideTranslate.headerMenu(chat);
        assertEquals(1, chat.items.size());
        HeaderItem item = chat.items.get(0);
        assertEquals("Stop translating this chat", item.text);
        assertEquals(OutsideTranslate.HEADER_ITEM, item.id);
        OutsideTranslate.toggleChat(OWNER, 42);
        OutsideTranslate.headerMenu(chat);
        assertEquals("Translate this chat", item.text);
        assertEquals(1, chat.items.size());
        assertEquals(0, fetches.get());
    }

    @Test public void clickingTheChatActionUpdatesItsLabelAndRefreshesMessages() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        Chat chat = new Chat(42);
        OutsideTranslate.headerMenu(chat);
        assertEquals("Translate this chat", chat.items.get(0).text);
        assertTrue(OutsideTranslate.headerClick(chat, OutsideTranslate.HEADER_ITEM));
        assertTrue(OutsideTranslate.chatOn(OWNER, 42));
        assertEquals("Stop translating this chat", chat.items.get(0).text);
        assertTrue(OutsideTranslate.headerClick(chat, OutsideTranslate.HEADER_ITEM));
        assertFalse(OutsideTranslate.chatOn(OWNER, 42));
        assertEquals("Translate this chat", chat.items.get(0).text);
        assertEquals(1, chat.items.size());
        assertEquals(2, HeaderHost.refreshed);
        assertEquals(0, fetches.get());
    }

    @Test public void aMissingNativeItemAndADisabledSwitchDoNotAddChatActions() {
        Chat chat = new Chat(42);
        OutsideTranslate.headerMenu(chat);
        assertTrue(chat.items.isEmpty());
        Settings.OUTSIDE_TRANSLATE.save(true);
        chat.hasTranslateItem = false;
        OutsideTranslate.headerMenu(chat);
        assertTrue(chat.items.isEmpty());
        assertEquals(0, fetches.get());
    }

    @Test public void nativeLabelFailureDoesNotInterruptAToggleAndFailedInsertionCanRetry() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        Chat chat = new Chat(42);
        chat.failAdd = true;
        OutsideTranslate.headerMenu(chat);
        assertTrue(chat.items.isEmpty());
        chat.failAdd = false;
        OutsideTranslate.headerMenu(chat);
        assertEquals(1, chat.items.size());
        chat.items.get(0).failText = true;
        assertTrue(OutsideTranslate.headerClick(chat, OutsideTranslate.HEADER_ITEM));
        assertTrue(OutsideTranslate.chatOn(OWNER, 42));
        assertEquals(1, HeaderHost.refreshed);
        chat.items.get(0).failText = false;
        OutsideTranslate.headerMenu(chat);
        assertEquals("Stop translating this chat", chat.items.get(0).text);
        assertEquals(1, chat.items.size());
        assertEquals(0, fetches.get());
    }

    @Test public void rememberingANativeItemCannotKeepItsOwningChatAlive() throws Exception {
        Settings.OUTSIDE_TRANSLATE.save(true);
        Chat chat = new Chat(42);
        OutsideTranslate.headerMenu(chat);
        java.lang.reflect.Field field = OutsideTranslate.class.getDeclaredField("HEADERS");
        field.setAccessible(true);
        Object remembered = ((Map<?, ?>) field.get(null)).get(chat);
        assertTrue("The native item owns its chat and must only be referenced weakly", remembered instanceof WeakReference);
        assertSame(chat, ((HeaderItem) ((WeakReference<?>) remembered).get()).owner);
        ((WeakReference<?>) remembered).clear();
        OutsideTranslate.headerMenu(chat);
        assertTrue(OutsideTranslate.headerClick(chat, OutsideTranslate.HEADER_ITEM));
        assertEquals(1, chat.items.size());
        assertEquals(1, HeaderHost.refreshed);
    }

    @Test public void theChatsThatAreOnAreRememberedOnThePhone() {
        assertTrue(OutsideTranslate.toggleChat(OWNER, 42));
        OutsideTranslate.resetForTests();
        assertTrue(OutsideTranslate.chatOn(OWNER, 42));
        assertFalse(OutsideTranslate.chatOn(OWNER, 43));
        assertFalse(OutsideTranslate.toggleChat(OWNER, 42));
        OutsideTranslate.resetForTests();
        assertFalse(OutsideTranslate.chatOn(OWNER, 42));
    }

    @Test public void theCacheKeepsEachLanguageAndAccountApart() {
        OutsideTranslate.resetForTests();
        assertNull(OutsideTranslate.cached(OWNER, "de", "x"));
        assertNotEquals(OutsideTranslate.cacheKey(OWNER, "de", "x"), OutsideTranslate.cacheKey(OWNER, "en", "x"));
        assertNotEquals(OutsideTranslate.cacheKey(OWNER, "de", "x"), OutsideTranslate.cacheKey(OTHER, "de", "x"));
    }

    // Each account's own choices.

    @Test public void aChatTurnedOnInOneAccountSendsNothingFromTheSameChatInAnother() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        assertTrue(OutsideTranslate.toggleChat(OWNER, 10));
        Fake theirs = new Fake();
        theirs.owner = OTHER;
        assertFalse(OutsideTranslate.wanted(OTHER, 10, 1));
        assertFalse(OutsideTranslate.showMessage(theirs, theirs));
        assertEquals("another account's chat with the same ID sent its text", 0, fetches.get());
        Fake mine = new Fake();
        assertFalse(OutsideTranslate.showMessage(mine, mine));
        assertEquals(1, fetches.get());
    }

    @Test public void theSameChatIdInTwoAccountsIsTurnedOnAndOffApart() {
        assertTrue(OutsideTranslate.toggleChat(OWNER, 10));
        assertFalse(OutsideTranslate.chatOn(OTHER, 10));
        assertTrue(OutsideTranslate.toggleChat(OTHER, 10));
        assertFalse(OutsideTranslate.toggleChat(OWNER, 10));
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
        assertTrue(OutsideTranslate.chatOn(OTHER, 10));
        OutsideTranslate.resetForTests();
        assertFalse("read back from the phone", OutsideTranslate.chatOn(OWNER, 10));
        assertTrue(OutsideTranslate.chatOn(OTHER, 10));
        assertEquals(Collections.singleton(OTHER + ":10"), prefs().getStringSet("owner_chats", null));
    }

    @Test public void aMessageOrChatWhoseAccountCantBeReadIsNeverSentOrTurnedOn() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        for (long unknown : new long[] {0, -1}) {
            assertFalse(OutsideTranslate.toggleChat(unknown, 10));
            assertFalse(OutsideTranslate.chatOn(unknown, 10));
            assertFalse(OutsideTranslate.wanted(unknown, 10, 1));
            Fake message = new Fake();
            message.owner = unknown;
            assertFalse(OutsideTranslate.showMessage(message, message));
        }
        assertEquals(0, fetches.get());
        assertFalse(prefs().contains("owner_chats"));
    }

    @Test public void aChatItemWhoseAccountCantBeReadIsNotAddedAndATapDoesNothing() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        Chat chat = new Chat(42);
        chat.owner = 0;
        OutsideTranslate.headerMenu(chat);
        assertTrue(chat.items.isEmpty());
        assertTrue("the item number is still ours", OutsideTranslate.headerClick(chat, OutsideTranslate.HEADER_ITEM));
        assertFalse(OutsideTranslate.chatOn(OWNER, 42));
        assertEquals(0, HeaderHost.refreshed);
        assertTrue(String.join("\n", HookStatus.report()).contains("chat account unknown"));
    }

    @Test public void theChatItemTurnsTheChatOnInTheAccountItsScreenIsIn() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        Chat chat = new Chat(42);
        chat.owner = OTHER;
        OutsideTranslate.headerMenu(chat);
        assertTrue(OutsideTranslate.headerClick(chat, OutsideTranslate.HEADER_ITEM));
        assertTrue(OutsideTranslate.chatOn(OTHER, 42));
        assertFalse(OutsideTranslate.chatOn(OWNER, 42));
        Chat same = new Chat(42);
        OutsideTranslate.headerMenu(same);
        assertEquals("the other account's choice shows in its own label only", "Translate this chat", same.items.get(0).text);
    }

    @Test public void translationsAreNotSharedBetweenAccounts() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.toggleChat(OTHER, 10);
        Fake mine = new Fake();
        OutsideTranslate.showMessage(mine, mine);
        ShadowLooper.idleMainLooper();
        assertTrue(OutsideTranslate.showMessage(mine, mine));
        Fake theirs = new Fake();
        theirs.owner = OTHER;
        assertFalse("one account's translation showed in another's chat", OutsideTranslate.showMessage(theirs, theirs));
        assertEquals("the other account asks for its own", 2, fetches.get());
    }

    /** Chats saved before choices had an account can't be given one, so they're cleared once, with a word. */
    @Test public void chatsSavedWithoutAnAccountAreClearedAndThePersonIsToldOnce() {
        prefs().edit().putStringSet("chats", new java.util.HashSet<>(Arrays.asList("10", "42"))).commit();
        OutsideTranslate.resetForTests();
        org.robolectric.shadows.ShadowToast.reset();
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
        assertFalse(OutsideTranslate.chatOn(OWNER, 42));
        ShadowLooper.idleMainLooper();
        assertEquals("Turn chat translation on again. It's now set per account.",
                org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        assertEquals(1, org.robolectric.shadows.ShadowToast.shownToastCount());
        assertFalse(prefs().contains("chats"));
        assertTrue(String.join("\n", HookStatus.report()).contains("chats without an account cleared 1"));

        OutsideTranslate.resetForTests();
        org.robolectric.shadows.ShadowToast.reset();
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
        ShadowLooper.idleMainLooper();
        assertNull("told again", org.robolectric.shadows.ShadowToast.getLatestToast());
    }

    @Test public void anEmptyListFromBeforeIsDroppedWithoutAWord() {
        prefs().edit().putStringSet("chats", Collections.emptySet()).commit();
        OutsideTranslate.resetForTests();
        org.robolectric.shadows.ShadowToast.reset();
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
        ShadowLooper.idleMainLooper();
        assertNull(org.robolectric.shadows.ShadowToast.getLatestToast());
        assertFalse(prefs().contains("chats"));
    }

    @Test public void onlySavedChatsWithAKnownAccountAreRead() {
        prefs().edit().putStringSet("owner_chats", new java.util.HashSet<>(Arrays.asList(
                OWNER + ":10", "0:11", "-3:12", "x:13", "14", OWNER + ":y", ":15", OTHER + ":-100123"))).commit();
        OutsideTranslate.resetForTests();
        assertTrue(OutsideTranslate.chatOn(OWNER, 10));
        assertTrue("a group's negative ID is still a chat", OutsideTranslate.chatOn(OTHER, -100123));
        assertFalse(OutsideTranslate.chatOn(OWNER, 11));
        assertFalse(OutsideTranslate.chatOn(OWNER, 13));
        assertFalse(OutsideTranslate.chatOn(OWNER, 14));
        assertFalse(OutsideTranslate.chatOn(OWNER, 15));
        assertFalse(OutsideTranslate.ownedChat(null));
        assertFalse(OutsideTranslate.ownedChat("0:12"));
        assertTrue(OutsideTranslate.ownedChat("1:2"));
    }

    @Test public void turningTheSwitchOffForgetsEveryAccountsChats() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.toggleChat(OTHER, 11);
        prefs().edit().putStringSet("chats", Collections.singleton("12")).commit();
        Settings.OUTSIDE_TRANSLATE.save(false);
        assertFalse(OutsideTranslate.active());
        assertFalse(prefs().contains("owner_chats"));
        assertFalse(prefs().contains("chats"));
        OutsideTranslate.resetForTests();
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
        assertFalse(OutsideTranslate.chatOn(OTHER, 11));
    }

    // A queued request asks again just before it's sent.

    /** Holds the worker so a test can change things between the queue and the send. */
    private List<Runnable> holdTheWorker() {
        List<Runnable> queued = new ArrayList<>();
        OutsideTranslate.executor = queued::add;
        return queued;
    }

    private void runQueued(List<Runnable> queued) {
        for (Runnable task : new ArrayList<>(queued)) task.run();
        queued.clear();
        ShadowLooper.idleMainLooper();
    }

    private static boolean droppedUnsent() {
        return String.join("\n", HookStatus.report()).contains("translate request dropped before sending");
    }

    @Test public void aChatTurnedOffWhileItsRequestWaitsSendsNothingAndCanAskAgainLater() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        Fake message = new Fake();
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(1, queued.size());
        assertFalse(OutsideTranslate.toggleChat(OWNER, 10));
        runQueued(queued);
        assertEquals("text from a chat turned off went out", 0, fetches.get());
        assertTrue(droppedUnsent());
        assertEquals(0, message.refreshed);

        // The dropped request isn't left waiting, so turning the chat back on asks again.
        OutsideTranslate.toggleChat(OWNER, 10);
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertEquals(1, queued.size());
        runQueued(queued);
        assertEquals(1, fetches.get());
        assertTrue(OutsideTranslate.showMessage(message, message));
    }

    /** Pause is a break: what's queued doesn't go out, and the chats are still on after Resume. */
    @Test public void pauseStopsWhatsQueuedAndResumeKeepsTheChats() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        runQueued(queued);
        assertEquals(0, fetches.get());
        assertTrue(droppedUnsent());
        PauseForTests.resume();
        assertTrue(OutsideTranslate.chatOn(OWNER, 10));
        OutsideTranslate.showMessage(message, message);
        runQueued(queued);
        assertEquals(1, fetches.get());
    }

    @Test public void theSwitchGoingOffWhileARequestWaitsSendsNothing() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        Settings.OUTSIDE_TRANSLATE.save(false);
        runQueued(queued);
        assertEquals(0, fetches.get());
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
    }

    /** The settings row and a settings file both forget, so on again before the worker runs still sends nothing. */
    @Test public void offThenOnBeforeTheWorkerRunsSendsNothing() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        Settings.OUTSIDE_TRANSLATE.save(false);
        OutsideTranslate.forgetChats();
        Settings.OUTSIDE_TRANSLATE.save(true);
        runQueued(queued);
        assertEquals(0, fetches.get());
        assertFalse(OutsideTranslate.chatOn(OWNER, 10));
    }

    @Test public void anAccountSignedOutOrReplacedWhileARequestWaitsSendsNothing() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.toggleChat(OTHER, 10);
        for (long after : new long[] {0, OTHER}) {
            List<Runnable> queued = holdTheWorker();
            Fake message = new Fake();
            message.original = "Сообщение " + after;
            OutsideTranslate.showMessage(message, message);
            assertEquals(1, queued.size());
            // The slot the message was in now reads as signed out, or as another account.
            message.owner = after;
            runQueued(queued);
            assertEquals("sent after the account changed to " + after, 0, fetches.get());
            assertEquals(0, message.refreshed);
        }
        assertTrue(OutsideTranslate.chatOn(OWNER, 10));
    }

    @Test public void aRequestGoesToTheServiceItWasQueuedUnder() throws Exception {
        List<AiTranslate.Service> used = new ArrayList<>();
        OutsideTranslate.fetcher = (service, target, text) -> {
            used.add(service);
            return new GoogleTranslate.Result("Hello, world", "ru");
        };
        assertTrue(OutsideTranslate.saveService("https://api.openai.com/v1", "gpt-4o-mini", "sk-1"));
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        runQueued(queued);
        assertEquals(1, used.size());
        assertEquals("gpt-4o-mini", used.get(0).model);
        assertTrue(used.get(0).enabled());

        // Use Google again with a request waiting: it isn't sent anywhere.
        Fake next = new Fake();
        next.id = 2;
        next.original = "Пока, мир";
        OutsideTranslate.showMessage(next, next);
        assertTrue(OutsideTranslate.saveService("https://api.openai.com/v1", "gpt-4o-mini", ""));
        runQueued(queued);
        assertEquals("a queued request was sent after the service changed", 1, used.size());
    }

    @Test public void oneMessageStillTurnedOnIsEnoughToSendTheTextTheyShare() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.toggleChat(OWNER, 11);
        List<Runnable> queued = holdTheWorker();
        Fake first = new Fake();
        Fake second = new Fake();
        second.dialog = 11;
        OutsideTranslate.showMessage(first, first);
        OutsideTranslate.showMessage(second, second);
        assertEquals("the same text is asked once", 1, queued.size());
        OutsideTranslate.toggleChat(OWNER, 10);
        runQueued(queued);
        assertEquals(1, fetches.get());
        assertEquals("the chat turned off isn't drawn again", 0, first.refreshed);
        assertEquals(1, second.refreshed);
    }

    @Test public void aFailureThatLandsWhileTheSwitchIsOffSaysNothing() {
        org.robolectric.shadows.ShadowToast.reset();
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.fetcher = (service, target, text) -> {
            fetches.incrementAndGet();
            // Switched off while the request was out.
            Settings.OUTSIDE_TRANSLATE.save(false);
            throw new java.io.IOException("offline");
        };
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        ShadowLooper.idleMainLooper();
        assertEquals(1, fetches.get());
        assertNull(org.robolectric.shadows.ShadowToast.getLatestToast());
        assertEquals(0, message.refreshed);
    }

    @Test public void aFailureForAChatTurnedOffWhileItWasOutSaysNothing() {
        org.robolectric.shadows.ShadowToast.reset();
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.fetcher = (service, target, text) -> {
            fetches.incrementAndGet();
            OutsideTranslate.toggleChat(OWNER, 10);
            throw new AiTranslate.KeyRefused(401);
        };
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        ShadowLooper.idleMainLooper();
        assertEquals(1, fetches.get());
        assertNull(org.robolectric.shadows.ShadowToast.getLatestToast());
    }

    /** A message that joins while the worker reads the accounts still needs its chat on when the check ends. */
    @Test public void aMessageThatJoinsDuringTheCheckDoesntSendForAChatTurnedOff() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.toggleChat(OWNER, 11);
        List<Runnable> queued = holdTheWorker();
        Fake first = new Fake();
        Fake joiner = new Fake();
        joiner.dialog = 11;
        OutsideTranslate.showMessage(first, first);
        assertEquals(1, queued.size());
        first.onOwnerRead = () -> {
            OutsideTranslate.showMessage(joiner, joiner);
            OutsideTranslate.toggleChat(OWNER, 10);
            OutsideTranslate.toggleChat(OWNER, 11);
        };
        runQueued(queued);
        assertEquals("a message that joined late carried the text out of a chat turned off", 0, fetches.get());
        assertTrue(droppedUnsent());
    }

    @Test public void aPauseWhileTheAccountsAreReadSendsNothing() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        Fake message = new Fake();
        OutsideTranslate.showMessage(message, message);
        message.onOwnerRead = () -> PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        runQueued(queued);
        assertEquals(0, fetches.get());
        assertTrue(droppedUnsent());
    }

    @Test public void aWorkerThatTurnsTheRequestAwayDoesntLeaveItWaiting() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.executor = task -> { throw new java.util.concurrent.RejectedExecutionException("shut down"); };
        Fake message = new Fake();
        assertFalse(OutsideTranslate.showMessage(message, message));
        assertTrue(String.join("\n", HookStatus.report()).contains("translate request"));
        // Nothing is stuck under that text, so the next look asks again.
        OutsideTranslate.executor = Runnable::run;
        OutsideTranslate.showMessage(message, message);
        assertEquals(1, fetches.get());
    }

    @Test public void aRequestTheWorkerTurnsAwayGivesItsPlaceToAHeldMessage() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        for (int n = 1; n <= OutsideTranslate.MAX_PENDING; n++) {
            Fake message = text(n);
            OutsideTranslate.showMessage(message, message);
        }
        Fake older = text(1001);
        Fake newer = text(1002);
        OutsideTranslate.showMessage(older, older);
        OutsideTranslate.showMessage(newer, newer);
        assertEquals(2, OutsideTranslate.heldForTests());
        // An answer lands and its place goes to the newest held message.
        queued.remove(0).run();
        ShadowLooper.idleMainLooper();
        assertEquals(1, newer.refreshed);
        assertEquals(0, older.refreshed);
        // A request the worker turns away frees its place the same way.
        OutsideTranslate.executor = task -> { throw new java.util.concurrent.RejectedExecutionException("shut down"); };
        Fake turnedAway = text(2000);
        OutsideTranslate.showMessage(turnedAway, turnedAway);
        ShadowLooper.idleMainLooper();
        assertEquals(1, older.refreshed);
        assertEquals(0, OutsideTranslate.heldForTests());
    }

    // Rapid scrolling stays within bounds.

    private static Fake text(int n) {
        Fake message = new Fake();
        message.id = n;
        message.original = "Сообщение номер " + n;
        return message;
    }

    @Test public void aFastScrollAsksForNoMoreThanTheLimitAndSaysSoOnce() {
        long[] now = {1_000_000L};
        OutsideTranslate.clock = () -> now[0];
        org.robolectric.shadows.ShadowToast.reset();
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        for (int n = 1; n <= 100; n++) OutsideTranslate.showMessage(text(n), text(n));
        ShadowLooper.idleMainLooper();
        assertEquals(OutsideTranslate.MAX_PENDING, OutsideTranslate.pendingForTests());
        assertEquals(OutsideTranslate.MAX_PENDING, queued.size());
        assertTrue(String.join("\n", HookStatus.report()).contains("translate request held back, too many waiting"));
        assertEquals("the busy notice repeated while scrolling", 1, org.robolectric.shadows.ShadowToast.shownToastCount());
        assertEquals("Lots to translate at once. The rest will follow.",
                org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        assertEquals(OutsideTranslate.MAX_HELD, OutsideTranslate.heldForTests());

        // Nothing was noted against the ones held back, so scrolling back to them asks once there's room.
        runQueued(queued);
        assertEquals(OutsideTranslate.MAX_PENDING, fetches.get());
        assertEquals(0, OutsideTranslate.pendingForTests());
        Fake later = text(OutsideTranslate.MAX_PENDING + 1);
        OutsideTranslate.showMessage(later, later);
        assertEquals(1, queued.size());
        runQueued(queued);
        assertTrue(OutsideTranslate.showMessage(later, later));

        // A minute on, a new crowd is told again.
        now[0] += 60_000L;
        for (int n = 200; n < 200 + OutsideTranslate.MAX_PENDING + 1; n++) OutsideTranslate.showMessage(text(n), text(n));
        ShadowLooper.idleMainLooper();
        assertEquals(2, org.robolectric.shadows.ShadowToast.shownToastCount());
    }

    @Test public void aMessageDrawnAgainWhileItWaitsKeepsOnePlaceAndTheWaitersAreCapped() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        Fake message = new Fake();
        for (int i = 0; i < 50; i++) OutsideTranslate.showMessage(message, message);
        assertEquals(1, OutsideTranslate.waitersForTests(OWNER, message.original));
        // The same text in many messages, a forwarded post or a repeated greeting.
        List<Fake> copies = new ArrayList<>();
        for (int id = 2; id < 100; id++) {
            Fake copy = new Fake();
            copy.id = id;
            copies.add(copy);
            OutsideTranslate.showMessage(copy, copy);
        }
        assertEquals(OutsideTranslate.MAX_WAITERS, OutsideTranslate.waitersForTests(OWNER, message.original));
        assertEquals("one text is asked once", 1, queued.size());
        runQueued(queued);
        assertEquals(1, message.refreshed);
        // Past the cap they were held, and the newest are drawn again once the answer is in.
        Fake lastWaiting = copies.get(OutsideTranslate.MAX_WAITERS - 2);
        assertEquals(OutsideTranslate.MAX_WAITERS, lastWaiting.id);
        assertEquals(1, lastWaiting.refreshed);
        for (int i = copies.size() - OutsideTranslate.MAX_HELD; i < copies.size(); i++) {
            assertEquals("message " + copies.get(i).id, 1, copies.get(i).refreshed);
        }
        assertEquals(0, copies.get(copies.size() - OutsideTranslate.MAX_HELD - 1).refreshed);
        assertEquals(0, OutsideTranslate.heldForTests());
        // An older one let go still finds the answer the next time it's drawn.
        Fake past = copies.get(copies.size() - OutsideTranslate.MAX_HELD - 1);
        assertTrue(OutsideTranslate.showMessage(past, past));
        assertEquals(1, fetches.get());
    }

    /** Where a fast scroll stops, the messages on screen were drawn last and held back. */
    @Test public void heldBackMessagesAreAskedAsPlacesFreeUpNewestFirst() {
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        List<Runnable> queued = holdTheWorker();
        List<Fake> drawn = new ArrayList<>();
        for (int n = 1; n <= 100; n++) {
            Fake message = text(n);
            // Telegram draws a message again when it's told the message changed.
            message.onRefresh = () -> OutsideTranslate.showMessage(message, message);
            drawn.add(message);
            OutsideTranslate.showMessage(message, message);
        }
        ShadowLooper.idleMainLooper();
        assertEquals(OutsideTranslate.MAX_PENDING, queued.size());
        assertEquals(OutsideTranslate.MAX_HELD, OutsideTranslate.heldForTests());

        // Two answers land, and their places go to the two messages drawn last.
        queued.remove(0).run();
        queued.remove(0).run();
        ShadowLooper.idleMainLooper();
        assertEquals(OutsideTranslate.MAX_PENDING, OutsideTranslate.pendingForTests());
        assertEquals(OutsideTranslate.MAX_PENDING, queued.size());
        assertEquals(1, drawn.get(99).refreshed);
        assertEquals(1, drawn.get(98).refreshed);
        assertEquals(0, drawn.get(97).refreshed);

        // Once everything lands, every held message shows its translation.
        while (!queued.isEmpty()) {
            queued.remove(0).run();
            ShadowLooper.idleMainLooper();
        }
        assertEquals(0, OutsideTranslate.heldForTests());
        assertEquals(OutsideTranslate.MAX_PENDING + OutsideTranslate.MAX_HELD, fetches.get());
        int firstHeld = 100 - OutsideTranslate.MAX_HELD + 1;
        for (int n = firstHeld; n <= 100; n++) assertTrue("message " + n, drawn.get(n - 1).translated);
        // One held back but let go, past the limit, asks the next time it's drawn.
        assertFalse(drawn.get(firstHeld - 2).translated);
    }

    @Test public void failuresWhileOfflineStayWithinTheirLimit() {
        // A millisecond a read, so the oldest failure is plain; a minute is far off.
        long[] now = {1_000_000L};
        OutsideTranslate.clock = () -> now[0]++;
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        OutsideTranslate.fetcher = (service, target, text) -> {
            fetches.incrementAndGet();
            throw new java.io.IOException("offline");
        };
        for (int n = 1; n <= OutsideTranslate.MAX_FAILED + 50; n++) OutsideTranslate.showMessage(text(n), text(n));
        assertEquals(OutsideTranslate.MAX_FAILED + 50, fetches.get());
        assertEquals(OutsideTranslate.MAX_FAILED, OutsideTranslate.failuresForTests());
        // The oldest went early, so it's asked again; the newest still waits out its minute.
        OutsideTranslate.showMessage(text(1), text(1));
        assertEquals(OutsideTranslate.MAX_FAILED + 51, fetches.get());
        OutsideTranslate.showMessage(text(OutsideTranslate.MAX_FAILED + 50), text(OutsideTranslate.MAX_FAILED + 50));
        assertEquals(OutsideTranslate.MAX_FAILED + 51, fetches.get());
    }

    /** A new service makes everything waiting for a worker obsolete, so it leaves the queue at once. */
    @Test public void aNewServiceEmptiesTheWorkersQueue() throws Exception {
        java.util.concurrent.CountDownLatch release = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch busy = new java.util.concurrent.CountDownLatch(3);
        OutsideTranslate.fetcher = (service, target, text) -> {
            busy.countDown();
            release.await();
            return new GoogleTranslate.Result("Hello", "ru");
        };
        OutsideTranslate.executor = originalExecutor;
        Settings.OUTSIDE_TRANSLATE.save(true);
        OutsideTranslate.toggleChat(OWNER, 10);
        try {
            for (int n = 1; n <= 8; n++) OutsideTranslate.showMessage(text(n), text(n));
            assertTrue("the three workers didn't start", busy.await(5, java.util.concurrent.TimeUnit.SECONDS));
            java.util.concurrent.ThreadPoolExecutor pool = OutsideTranslate.poolForTests();
            assertEquals(5, pool.getQueue().size());
            assertTrue(OutsideTranslate.saveService("https://api.openai.com/v1", "gpt-4o-mini", "sk-1"));
            assertEquals(0, pool.getQueue().size());
            assertEquals(0, OutsideTranslate.pendingForTests());
        } finally {
            release.countDown();
        }
        java.util.concurrent.ThreadPoolExecutor pool = OutsideTranslate.poolForTests();
        for (int wait = 0; wait < 500 && pool.getActiveCount() > 0; wait++) Thread.sleep(10);
        assertEquals(0, pool.getActiveCount());
    }

    private static android.content.SharedPreferences prefs() {
        return app.hushtelegram.extension.shared.Utils.getContext().getSharedPreferences("hushtelegram_outside_translate", 0);
    }

    @Test public void googlesCodesForJavasLanguages() {
        assertEquals("id", OutsideTranslate.tagOf(new Locale("in", "ID")));
        assertEquals("he", OutsideTranslate.tagOf(new Locale("iw")));
        assertEquals("zh-TW", OutsideTranslate.tagOf(new Locale("zh", "TW")));
        assertEquals("zh-CN", OutsideTranslate.tagOf(new Locale("zh", "CN")));
        assertEquals("pt", OutsideTranslate.tagOf(new Locale("pt", "BR")));
        assertEquals("en", OutsideTranslate.tagOf(null));
    }

    @Test public void codeBlocksAreLeftAsWritten() {
        class TL_messageEntityPre {}
        class TL_messageEntityBold {}
        assertTrue(OutsideTranslate.hasCode(Arrays.asList(new TL_messageEntityBold(), new TL_messageEntityPre())));
        assertFalse(OutsideTranslate.hasCode(Collections.singletonList(new TL_messageEntityBold())));
        assertFalse(OutsideTranslate.hasCode(null));
    }

    @Test public void theMenuEntryGoesAfterTelegramsOwnTranslateAndKeepsTheListsInStep() {
        List<Object> icons = new ArrayList<>(Arrays.asList(1, 2, 3));
        List<Object> items = new ArrayList<>(Arrays.asList("Reply", "Translate", "Delete"));
        List<Object> options = new ArrayList<>(Arrays.asList(8, 29, 1));
        OutsideTranslate.offer(icons, items, options, false);
        assertEquals(Arrays.asList(8, 29, OutsideTranslate.MENU_OPTION, 1), options);
        assertEquals("Translate here", items.get(2));
        assertEquals(4, icons.size());

        List<Object> bare = new ArrayList<>(Arrays.asList("Reply"));
        List<Object> bareOptions = new ArrayList<>(Arrays.asList(8));
        OutsideTranslate.offer(new ArrayList<>(Arrays.asList(1)), bare, bareOptions, true);
        assertEquals("Show original", bare.get(1));
        assertEquals(Arrays.asList(8, OutsideTranslate.MENU_OPTION), bareOptions);

        // Lists already out of step are left alone.
        List<Object> odd = new ArrayList<>(Arrays.asList(1));
        OutsideTranslate.offer(odd, new ArrayList<>(Arrays.asList("a", "b")), new ArrayList<>(Arrays.asList(8, 9)), false);
        assertEquals(1, odd.size());
    }

    @Test public void theNumbersStayPastTelegramsAndTheMessageMenuFamily() {
        assertTrue(OutsideTranslate.MENU_OPTION > 0x48544d04);
        assertNotEquals(OutsideTranslate.MENU_OPTION, OutsideTranslate.HEADER_ITEM);
        assertFalse(OutsideTranslate.headerClick(new Object(), 5));
        OutsideTranslate.chosen(new Object(), 5);
    }

    @Test public void theTargetIsTheAppLanguageOrThePhones() {
        assertFalse(OutsideTranslate.target().isEmpty());
    }

    private static final class Chat {
        final long dialog;
        long owner = OWNER;
        final List<HeaderItem> items = new ArrayList<>();
        boolean hasTranslateItem = true;
        boolean failAdd;
        Chat(long dialog) { this.dialog = dialog; }
    }

    private static final class HeaderItem {
        final Chat owner;
        final int id;
        String text;
        boolean failText;
        HeaderItem(Chat owner, int id, String text) { this.owner = owner; this.id = id; this.text = text; }
    }

    @Implements(value = OutsideTranslate.class, isInAndroidSdk = false)
    public static class HeaderHost {
        static int refreshed;
        @Implementation protected static boolean hasTranslateItem(Object chat) { return ((Chat) chat).hasTranslateItem; }
        @Implementation protected static long chatDialog(Object chat) { return ((Chat) chat).dialog; }
        @Implementation protected static long chatOwner(Object chat) { return ((Chat) chat).owner; }
        @Implementation protected static Object chatOf(Object delegate) { return delegate; }
        @Implementation protected static Object addHeaderItem(Object chat, int id, int icon, String text) {
            Chat owner = (Chat) chat;
            if (owner.failAdd) throw new IllegalStateException("native menu unavailable");
            HeaderItem item = new HeaderItem(owner, id, text);
            owner.items.add(item);
            return item;
        }
        @Implementation protected static void setHeaderText(Object item, String text) {
            HeaderItem nativeItem = (HeaderItem) item;
            if (nativeItem.failText) throw new IllegalStateException("native label unavailable");
            nativeItem.text = text;
        }
        @Implementation protected static void notifyDialog(long dialog) { refreshed++; }
    }
}
