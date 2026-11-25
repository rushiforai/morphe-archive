/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.BooleanSupplier;
import java.util.function.Predicate;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsStatus;

/**
 * A chat in another language shows a "Translate to" bar at the top when Telegram can translate it,
 * which means Premium or a channel with automatic translation on. The chat screen asks whether the
 * bar is hidden in two places: the top bar itself, and the menu, which offers Translate exactly when
 * the bar is hidden. Both ask here instead. Message translation asks Telegram directly, so a chat
 * being translated stays translated, and it keeps its bar so the original is one tap away.
 *
 * <p>The same screen decides on its pinned message bar in one place, and every reason it has to keep
 * the bar away (no chat info yet, nothing pinned, a pin the person closed) takes one path, which
 * hides the bar and lays the chat out again. {@link #pinnedBarHidden()} sends it down that path first.
 * Nothing is unpinned or marked as read, and the bar is back the next time the screen decides with
 * the switch off. A chat that comes back to the front after the answer changed decides again
 * ({@link #pinnedBarChanged(Object)}). The settings are a dialog, so a chat under them never leaves
 * the front, and it decides again when they close ({@link #settingsClosed()}).
 *
 * <p>Always show translate bar goes the other way, for chats whose language Telegram doesn't spot,
 * such as Hindi typed in Latin letters. When Telegram decides against the bar the top panel asks
 * {@link #alwaysShown(Object)}. Telegram's own translation needs no detected language, so where it's
 * available (Premium, or a channel with automatic translation) the bar simply works. Where it isn't,
 * the bar's tap, close and label go to Translate with an outside service, if that's on. With neither,
 * a bar could do nothing, so none shows. Secret chats and Saved Messages never get one, a bar closed
 * in a chat stays closed until the chat menu's Translate brings it back, and Hide translate bar wins
 * when both are on.
 */
public final class TranslateBar {
    private TranslateBar() {}

    /**
     * Answers the chat screen's question in place of Telegram's own.
     *
     * @param controller Telegram's translate controller for the account
     * @param dialogId the chat on screen
     * @return whether the bar is hidden
     */
    public static boolean hidden(Object controller, long dialogId) {
        // Telegram's answer comes first and throws the way it always did.
        return hide(stockHidden(controller, dialogId), () -> translating(controller, dialogId));
    }

    /** Telegram's answer, or hidden when the switch is on and the chat isn't being translated. */
    static boolean hide(boolean stock, BooleanSupplier translating) {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            if (stock || !Utils.settingsReady() || !Settings.HIDE_TRANSLATE_BAR.get()) return stock;
            if (translating.getAsBoolean()) return false;
            HookStatus.counted(FamilyNames.HIDE_TRANSLATE_BAR, "translate bar hidden");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "translate bar", failure);
            return stock;
        }
    }

    /**
     * Asked before the chat screen's own checks each time it decides on its pinned message bar.
     *
     * @return whether the bar is hidden: the switch, and never while paused or before settings load
     */
    public static boolean pinnedBarHidden() {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            if (!pinnedSwitch()) return false;
            HookStatus.counted(FamilyNames.HIDE_TRANSLATE_BAR, "pinned bar hidden");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "pinned bar", failure);
            return false;
        }
    }

    /**
     * Asked each time a chat screen comes back to the front. The screen decides on its pinned bar
     * only when something about the chat changes, so a chat left open behind the settings would
     * keep the bar it had until it was opened again.
     *
     * @param screen the chat screen
     * @return whether the answer changed since this screen last came back, so it decides again
     */
    public static boolean pinnedBarChanged(Object screen) {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            front = new WeakReference<>(screen);
            boolean hidden = pinnedSwitch();
            Boolean before = RETURNED.put(screen, hidden);
            if (before == null || before == hidden) return false;
            HookStatus.counted(FamilyNames.HIDE_TRANSLATE_BAR, "pinned bar decided again");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "pinned bar on return", failure);
            return false;
        }
    }

    /**
     * The settings dialog closed. The chat screen under it stayed at the front the whole time, so it
     * won't come back to it, and this is its turn to decide. If the build can't, the answer stays
     * unrecorded and the chat decides the next time it does come back.
     */
    public static void settingsClosed() {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            Object screen = front.get();
            if (screen == null) return;
            boolean hidden = pinnedSwitch();
            Boolean before = RETURNED.get(screen);
            if (before == null || before == hidden || !decider.test(screen)) return;
            RETURNED.put(screen, hidden);
            HookStatus.counted(FamilyNames.HIDE_TRANSLATE_BAR, "pinned bar decided again");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "pinned bar after the settings", failure);
        }
    }

    /** What each chat screen still open answered when it last came back. */
    private static final Map<Object, Boolean> RETURNED = Collections.synchronizedMap(new WeakHashMap<>());

    /** The chat screen that last came to the front. */
    static WeakReference<Object> front = new WeakReference<>(null);

    /** Has a chat screen decide on its bar. A field so a test can stand in for the patched stub. */
    static Predicate<Object> decider = TranslateBar::decidePinnedBar;

    private static boolean pinnedSwitch() {
        return Utils.settingsReady() && Settings.HIDE_PINNED_BAR.get();
    }

    /**
     * Asked by the chat screen's top panel when Telegram decided against the bar.
     *
     * @param chat the chat screen
     * @return whether the bar shows anyway
     */
    public static boolean alwaysShown(Object chat) {
        // With the switch off, neither answer is asked for and nothing of Telegram's runs.
        return show(() -> eligible(chatController(chat), chatDialog(chat)),
                () -> stockHidden(chatController(chat), chatDialog(chat)));
    }

    /**
     * Answers the translate item's question in place of Telegram's own, so a bar closed in a chat
     * Telegram passed over can come back from the chat's menu.
     *
     * @param controller Telegram's translate controller for the account
     * @param dialogId the chat on screen
     * @return whether the chat is offered translation
     */
    public static boolean offered(Object controller, long dialogId) {
        // Telegram's answer comes first and throws the way it always did.
        return offer(stockOffered(controller, dialogId), () -> eligible(controller, dialogId));
    }

    /**
     * Asked first when the bar is tapped.
     *
     * @param chat the chat screen
     * @return true when the outside service took the tap, so Telegram's own is skipped
     */
    public static boolean barTapped(Object chat) {
        return tap(() -> outsideHandles(chatController(chat), chatDialog(chat)), () -> OutsideTranslate.flipChat(chat));
    }

    /**
     * Asked first when the bar is closed. Telegram's own close only rests the bar for a while, which
     * is no use to a bar that shows regardless, so a chat the outside service handles gets Telegram's
     * Hide as well, the same one its bar menu has.
     *
     * @param chat the chat screen
     */
    public static void barClosed(Object chat) {
        close(() -> outsideHandles(chatController(chat), chatDialog(chat)),
                () -> hideDialog(chatController(chat), chatDialog(chat)));
    }

    /**
     * Answers the bar's label in place of Telegram's own, so it reads Show original when the outside
     * service is translating the chat.
     *
     * @param controller Telegram's translate controller for the account
     * @param dialogId the chat on screen
     * @return whether the chat reads as being translated
     */
    public static boolean barTranslating(Object controller, long dialogId) {
        // Telegram's answer comes first and throws the way it always did.
        return label(translating(controller, dialogId), () -> outsideHandles(controller, dialogId), () -> {
            long owner = controllerOwner(controller);
            return OutsideTranslate.known(owner) && OutsideTranslate.chatOn(owner, dialogId);
        });
    }

    /** Whether the bar shows in a chat Telegram passed over: the switch, a chat that can use it, not closed there. */
    static boolean show(BooleanSupplier eligible, BooleanSupplier closed) {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            if (!alwaysSwitch() || !eligible.getAsBoolean() || closed.getAsBoolean()) return false;
            HookStatus.counted(FamilyNames.HIDE_TRANSLATE_BAR, "translate bar always shown");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "always shown translate bar", failure);
            return false;
        }
    }

    /** Telegram's offer, or one of ours when the switch is on and the chat can use it. */
    static boolean offer(boolean stock, BooleanSupplier eligible) {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            return stock || (alwaysSwitch() && eligible.getAsBoolean());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "always shown translate offer", failure);
            return stock;
        }
    }

    /** A chat with something to translate it and something to translate: never a secret chat or Saved Messages. */
    static boolean offers(long dialog, long self, boolean encrypted, boolean telegramCan, boolean outside) {
        return dialog != 0 && dialog != self && !encrypted && (telegramCan || outside);
    }

    /** Runs {@code flip} and answers true when the tap belongs to the outside service. */
    static boolean tap(BooleanSupplier outsideHandles, Runnable flip) {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            if (!alwaysSwitch() || !outsideHandles.getAsBoolean()) return false;
            flip.run();
            HookStatus.counted(FamilyNames.HIDE_TRANSLATE_BAR, "translate bar tap sent outside");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "always shown translate bar tap", failure);
            return false;
        }
    }

    /** Runs {@code hide} when the close belongs to a chat the outside service handles. */
    static void close(BooleanSupplier outsideHandles, Runnable hide) {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            if (alwaysSwitch() && outsideHandles.getAsBoolean()) hide.run();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "always shown translate bar close", failure);
        }
    }

    /** Telegram's answer, or the outside service's choice for a chat only that service handles. */
    static boolean label(boolean stock, BooleanSupplier outsideHandles, BooleanSupplier chatOn) {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            if (stock || !alwaysSwitch() || !outsideHandles.getAsBoolean()) return stock;
            return chatOn.getAsBoolean();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "always shown translate bar label", failure);
            return stock;
        }
    }

    /** The switch, which Hide translate bar overrules, and never while paused or before settings load. */
    private static boolean alwaysSwitch() {
        return Utils.settingsReady() && Settings.ALWAYS_SHOW_TRANSLATE_BAR.get() && !Settings.HIDE_TRANSLATE_BAR.get();
    }

    private static boolean outsideOn() {
        return SettingsStatus.outsideTranslate() && OutsideTranslate.active();
    }

    private static boolean eligible(Object controller, long dialogId) {
        return offers(dialogId, controllerOwner(controller), encrypted(dialogId), available(controller, dialogId), outsideOn());
    }

    /** Telegram's own translation comes first wherever it can work, so the outside service only gets the rest. */
    private static boolean outsideHandles(Object controller, long dialogId) {
        return !available(controller, dialogId) && outsideOn();
    }

    /** Telegram's own answer. Replaced with TranslateController.isTranslateDialogHidden when patching. */
    public static boolean stockHidden(Object controller, long dialogId) { return false; }

    /** Whether the chat is being translated. Replaced with TranslateController.isTranslatingDialog when patching. */
    public static boolean translating(Object controller, long dialogId) { return false; }

    /** Runs the chat screen's decision on its pinned bar and answers true. Replaced when patching. */
    public static boolean decidePinnedBar(Object screen) { return false; }

    /** Whether Telegram offers the chat. Replaced with TranslateController.isDialogTranslatable when patching. */
    public static boolean stockOffered(Object controller, long dialogId) { return false; }

    /** Whether Telegram can translate the chat itself. Replaced with TranslateController.isFeatureAvailable when patching. */
    public static boolean available(Object controller, long dialogId) { return false; }

    /** Telegram's Hide for this chat's bar. Replaced with TranslateController.setHideTranslateDialog when patching. */
    public static void hideDialog(Object controller, long dialogId) { }

    /** The chat screen's translate controller. Replaced when patching. */
    public static Object chatController(Object chat) { return null; }

    /** The chat on a chat screen. Replaced when patching. */
    public static long chatDialog(Object chat) { return 0L; }

    /** The account a translate controller belongs to. Replaced when patching. */
    public static long controllerOwner(Object controller) { return 0L; }

    /** Whether the chat is a secret chat. Replaced with DialogObject.isEncryptedDialog when patching. */
    public static boolean encrypted(long dialogId) { return false; }
}
