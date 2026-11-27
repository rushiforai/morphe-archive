package app.template.extension.zalo.buglog;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.Test;

public class AttributionTest {
    private static final String REGISTRY = String.join("\n",
        "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;->E(Lmu3;)Z=keep-recalled-messages",
        "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;->p2(Lvv3;Lmu3;)V=keep-recalled-messages",
        "Lcom/zing/zalo/ui/chat/ChatView;->a(I)V=view-online-status-privately",
        "Lcom/zing/zalo/ui/chat/ChatView;->b()V=hide-read-receipts",
        "Lcom/zing/zalo/ui/chat/ChatView;->b()V=view-online-status-privately",
        "not a registry line",
        "Lbroken;=x");

    private static Attribution.Frame frame(String className, String method) {
        return new Attribution.Frame(className, method);
    }

    @Test
    public void exactMethodMatchWins() {
        Attribution attribution = Attribution.parse(REGISTRY);
        List<Attribution.Frame> frames = Arrays.asList(
            frame("com.zing.zalo.ui.chat.ChatView", "other"),
            frame("com.zing.zalo.ui.chat.chatrow.ChatRow", "E"));
        // ChatView is only a class match, so it is left out once a method matches.
        assertEquals(Collections.singletonList("keep-recalled-messages"), attribution.patchedBy(frames));
    }

    @Test
    public void sharedMethodNamesEveryPatch() {
        Attribution attribution = Attribution.parse(REGISTRY);
        assertEquals(Arrays.asList("hide-read-receipts", "view-online-status-privately"),
            attribution.patchedBy(Collections.singletonList(frame("com.zing.zalo.ui.chat.ChatView", "b"))));
    }

    @Test
    public void fallsBackToClassAndOuterClass() {
        Attribution attribution = Attribution.parse(REGISTRY);
        assertEquals(Collections.singletonList("keep-recalled-messages"),
            attribution.patchedBy(Collections.singletonList(frame("com.zing.zalo.ui.chat.chatrow.ChatRow$1", "run"))));
        assertTrue(attribution.patchedBy(Collections.singletonList(frame("com.zing.zalo.Other", "x"))).isEmpty());
    }

    @Test
    public void emptyRegistryMatchesNothing() {
        Attribution attribution = Attribution.parse("");
        assertTrue(attribution.isEmpty());
        assertTrue(attribution.patchedBy(Collections.singletonList(frame("com.zing.zalo.ui.chat.ChatView", "b"))).isEmpty());
    }

    @Test
    public void extensionFramesNameTheirPatch() {
        List<Attribution.Frame> frames = Arrays.asList(
            frame("app.template.extension.zalo.chat.RecalledMessages", "formatRecallTime"),
            frame("app.template.extension.zalo.chat.ChatOptions", "isTypingHidden"),
            frame("app.template.extension.zalo.shared.ZaloEnv", "appContext"),
            frame("app.template.extension.zalo.media.PostPhotoSave$1", "run"),
            frame("com.zing.zalo.Other", "x"));
        assertEquals(Arrays.asList("keep-recalled-messages", "hide-text-typing", "core", "save-media"),
            Attribution.nezumiOwners(frames));
    }

    @Test
    public void labelsCombineBoth() {
        Attribution attribution = Attribution.parse(REGISTRY);
        List<Attribution.Frame> frames = Arrays.asList(
            frame("app.template.extension.zalo.chat.RecalledMessages", "hasRecallLabel"),
            frame("com.zing.zalo.ui.chat.chatrow.ChatRow", "E"));
        assertEquals(" [patched-by: keep-recalled-messages] [nezumi: keep-recalled-messages]", attribution.labels(frames));
        assertEquals("", attribution.labels(Collections.singletonList(frame("java.lang.Thread", "run"))));
    }

    @Test
    public void framesOfThrowableIncludeCauses() {
        Exception cause = new IllegalStateException("inner");
        cause.setStackTrace(new StackTraceElement[] {
            new StackTraceElement("com.zing.zalo.ui.chat.ChatView", "b", "ChatView.java", 1) });
        Exception outer = new RuntimeException("outer", cause);
        outer.setStackTrace(new StackTraceElement[] {
            new StackTraceElement("android.os.Handler", "dispatchMessage", "Handler.java", 1) });
        List<Attribution.Frame> frames = Attribution.framesOf(outer);
        assertEquals(2, frames.size());
        assertEquals("com.zing.zalo.ui.chat.ChatView", frames.get(1).className);
    }

    @Test
    public void framesOfAnrAndTombstoneText() {
        String trace = "\"main\" prio=5 tid=1 Native\n"
            + "  at com.zing.zalo.ui.chat.chatrow.ChatRow.E(SourceFile:12)\n"
            + "  at app.template.extension.zalo.chat.RecalledMessages.hasRecallLabel(SourceFile:3)\n"
            + "\n"
            + "\"Thread-2\" prio=5 tid=9 Waiting\n"
            + "  at com.zing.zalo.ui.chat.ChatView.b(SourceFile:1)\n";
        String main = Attribution.mainThreadSection(trace);
        assertTrue(main.contains("ChatRow.E"));
        assertTrue(!main.contains("ChatView.b"));
        List<Attribution.Frame> frames = Attribution.framesOf(main);
        assertEquals(2, frames.size());
        assertEquals("E", frames.get(0).methodName);
        assertEquals(" [patched-by: keep-recalled-messages] [nezumi: keep-recalled-messages]",
            Attribution.parse(REGISTRY).labels(frames));

        List<Attribution.Frame> native_ = Attribution.framesOf(
            "  #05 pc 0000000000123456  /data/app/base.odex (com.zing.zalo.ui.chat.ChatView.b+120)");
        assertEquals(1, native_.size());
        assertEquals("com.zing.zalo.ui.chat.ChatView", native_.get(0).className);
    }

    @Test
    public void mainThreadSectionWithoutMainIsWholeText() {
        assertEquals("no threads here", Attribution.mainThreadSection("no threads here"));
    }
}
