package dev.jason.gboardpatches.extension.japaneseqwertyglide;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

@RunWith(RobolectricTestRunner.class)
public final class GboardJapaneseQwertyGlideSpacingTest {
    @After
    public void cleanSession() {
        GboardJapaneseQwertyGlideSpacing.reset();
    }

    @Test
    public void selectedAlternativeCommitsOnceWithoutChangingCandidatesOrOriginalProto() {
        Fixture fixture = new Fixture();
        fixture.deliver("hello");
        Command command = new Command("help");
        Command spaced = (Command) GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, command, fixture.editor);
        Assert.assertNotSame(command, spaced);
        Assert.assertNotSame(command.e, spaced.e);
        Assert.assertEquals("help ", spaced.e.c);
        Assert.assertEquals("help", command.e.c);
        Assert.assertSame(command.f, spaced.f);
        Assert.assertSame(command, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, command, fixture.editor));
        Command normal = new Command("typed");
        Assert.assertSame(normal, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, normal, fixture.editor));
    }

    @Test
    public void queuedGlidesConsumeDistinctTokensAndDuplicateCallbacksDoNotStealNextToken() {
        Fixture fixture = new Fixture();
        fixture.deliver("first");
        fixture.deliver("second");
        Command first = new Command("first");
        Assert.assertEquals("first ", ((Command) GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, first, fixture.editor)).e.c);
        Assert.assertSame(first, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, first, fixture.editor));
        Command second = new Command("second  ");
        Assert.assertEquals("second ", ((Command) GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, second, fixture.editor)).e.c);
    }

    @Test
    public void emptyComposingOutputDoesNotConsumePendingGlide() {
        Fixture fixture = new Fixture();
        fixture.deliver("hello");
        Command preview = new Command("");
        Assert.assertSame(preview, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, preview, fixture.editor));
        Command commit = new Command("hello");
        Assert.assertEquals("hello ", ((Command) GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, commit, fixture.editor)).e.c);
    }

    @Test
    public void editorSwitchRendererMismatchCancelAndResetLeaveStockOutput() {
        Fixture fixture = new Fixture();
        fixture.deliver("hello");
        Command commit = new Command("hello");
        fixture.ime.H = new Object();
        Assert.assertSame(commit, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, commit, fixture.editor));
        fixture.ime.H = fixture.editor;
        Assert.assertSame(commit, GboardJapaneseQwertyGlideSpacing.appendCommit(
                new Renderer(fixture.ime.E), commit, fixture.editor));
        GboardJapaneseQwertyGlideSpacing.cancel(fixture.manager);
        Assert.assertSame(commit, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, commit, fixture.editor));
        fixture.deliver("hello");
        GboardJapaneseQwertyGlideSpacing.reset();
        Assert.assertSame(commit, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, commit, fixture.editor));
    }

    @Test
    public void unsupportedCursorRewriteDisarmsGlideAndKeepsNativeResult() {
        Fixture fixture = new Fixture();
        fixture.deliver("hello");
        Command replacement = new Command("hello");
        replacement.e.e = -1;
        Assert.assertSame(replacement, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, replacement, fixture.editor));
        Command later = new Command("later");
        Assert.assertSame(later, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, later, fixture.editor));
    }

    @Test
    public void separatorAcceptsAlphabetApostrophesHyphensAndRejectsOtherEdits() {
        Assert.assertEquals("don't ", GboardJapaneseQwertyGlideSpacing.normalizedWord("don't"));
        Assert.assertEquals("well-known ", GboardJapaneseQwertyGlideSpacing.normalizedWord("well-known  "));
        Assert.assertNull(GboardJapaneseQwertyGlideSpacing.normalizedWord("two words"));
        Assert.assertNull(GboardJapaneseQwertyGlideSpacing.normalizedWord("word\n"));
        Assert.assertNull(GboardJapaneseQwertyGlideSpacing.normalizedWord("日本語"));
        Assert.assertNull(GboardJapaneseQwertyGlideSpacing.normalizedWord(""));
    }

    @Test
    public void unrelatedPlainTextOutsideDeliveryIsNotTracked() {
        Fixture fixture = new Fixture();
        GboardJapaneseQwertyGlideSpacing.observeIme(fixture.ime, new Event("typed"));
        Command command = new Command("typed");
        Assert.assertSame(command, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, command, fixture.editor));
    }

    @Test
    public void fastFinalDeliveriesRetainIndependentSelectionTokensInOrder() {
        Fixture fixture = new Fixture();
        fixture.deliver("one");
        fixture.deliver("two");
        fixture.deliver("three");
        for (String selected : new String[] {"One", "too", "three"}) {
            Command result = new Command(selected);
            Assert.assertEquals(selected + " ", ((Command) GboardJapaneseQwertyGlideSpacing.appendCommit(
                    fixture.ime.d.c, result, fixture.editor)).e.c);
        }
        Command ordinary = new Command("four");
        Assert.assertSame(ordinary, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, ordinary, fixture.editor));
    }

    @Test
    public void inactiveManagerKeyboardOrChangedConnectionCannotAddSpace() {
        Fixture fixture = new Fixture();
        fixture.deliver("hello");
        Command command = new Command("hello");
        fixture.manager.m = false;
        Assert.assertSame(command, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, command, fixture.editor));
        fixture.manager.m = true;
        fixture.keyboard.G = false;
        Assert.assertSame(command, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, command, fixture.editor));
        fixture.keyboard.G = true;
        fixture.ime.d.c.h = new Object();
        Assert.assertSame(command, GboardJapaneseQwertyGlideSpacing.appendCommit(
                fixture.ime.d.c, command, fixture.editor));
    }

    private static final class Fixture {
        final Object editor = new Object();
        final Keyboard keyboard = new Keyboard(editor);
        final Manager manager = new Manager();
        final Ime ime = new Ime(editor);

        void deliver(String word) {
            GboardJapaneseQwertyGlideSpacing.beginDelivery(manager, keyboard, editor, 1);
            try { GboardJapaneseQwertyGlideSpacing.observeIme(ime, new Event(word)); }
            finally { GboardJapaneseQwertyGlideSpacing.endDelivery(); }
        }
    }

    public static final class Keyboard {
        public Object H;
        public boolean G = true;
        Keyboard(Object editor) { H = editor; }
    }

    public static final class Manager {
        public Object j = new Object();
        public boolean m = true;
    }

    public static final class Ime {
        public Object b = new Object();
        public Object h = new Object();
        public Object H;
        public Object E = new Object();
        public State d;
        Ime(Object editor) { H = editor; d = new State(new Renderer(E)); }
    }

    public static final class State {
        public Renderer c;
        State(Renderer renderer) { c = renderer; }
    }

    public static final class Renderer {
        public Object h;
        Renderer(Object connection) { h = connection; }
    }

    public static final class Event {
        public Action[] b;
        Event(String word) { b = new Action[] {new Action(word)}; }
    }

    public static final class Action {
        public int c = -10009;
        public Object e;
        Action(String word) { e = word; }
    }

    public static final class Command {
        public int b = 8;
        public Result e;
        public Object f = new Object();
        Command(String text) { e = new Result(text); }
        public CommandBuilder G() {
            Command copy = new Command(e.c);
            copy.e = e;
            copy.f = f;
            copy.b = b;
            return new CommandBuilder(copy);
        }
    }

    public static final class Result {
        public String c;
        public int e;
        Result(String text) { c = text; }
        public ResultBuilder G() {
            Result copy = new Result(c);
            copy.e = e;
            return new ResultBuilder(copy);
        }
    }

    public static final class CommandBuilder {
        public Command b;
        CommandBuilder(Command command) { b = command; }
        public void t() { }
        public Command q() { return b; }
    }

    public static final class ResultBuilder {
        public Result b;
        ResultBuilder(Result result) { b = result; }
        public void t() { }
        public Result q() { return b; }
    }
}
