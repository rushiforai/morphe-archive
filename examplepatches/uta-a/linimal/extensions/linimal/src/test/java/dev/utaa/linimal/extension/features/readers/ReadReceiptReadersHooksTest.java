package dev.utaa.linimal.extension.features.readers;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

public final class ReadReceiptReadersHooksTest {
    @After
    public void resetSelf() {
        ReadersSelf.resetForTesting();
    }

    @Test
    public void onlyGroupAndRoomChatsAreMultiMember() {
        assertTrue(ReadersChat.isMultiMemberChat("c1234"));
        assertTrue(ReadersChat.isMultiMemberChat("r1234"));
        assertFalse(ReadersChat.isMultiMemberChat("u1234"));
        assertFalse(ReadersChat.isMultiMemberChat("m1234"));
        assertFalse(ReadersChat.isMultiMemberChat("s1234"));
        assertFalse(ReadersChat.isMultiMemberChat("c"));
        assertFalse(ReadersChat.isMultiMemberChat(""));
        assertFalse(ReadersChat.isMultiMemberChat(null));
    }

    @Test
    public void rowsAreDecoratedOnlyForVisibleLabelsOfSentGroupMessagesWithAnOptionOn() {
        assertTrue(ReadReceiptReadersHooks.shouldDecorate(true, true, false, "c1", 10L));
        assertTrue(ReadReceiptReadersHooks.shouldDecorate(true, false, true, "r1", 10L));
        assertFalse(ReadReceiptReadersHooks.shouldDecorate(false, true, true, "c1", 10L));
        assertFalse(ReadReceiptReadersHooks.shouldDecorate(true, false, false, "c1", 10L));
        assertFalse(ReadReceiptReadersHooks.shouldDecorate(true, true, true, "u1", 10L));
        assertFalse(ReadReceiptReadersHooks.shouldDecorate(true, true, true, "c1", 0L));
        assertFalse(ReadReceiptReadersHooks.shouldDecorate(true, true, true, "c1", -1L));
    }

    @Test
    public void receivedRowsAreDecoratedOnlyForOthersMessagesWithEitherOptionOn() {
        assertTrue(ReadReceiptReadersHooks.shouldDecorateReceived(true, true, false, "c1", 10L));
        assertTrue(ReadReceiptReadersHooks.shouldDecorateReceived(true, false, true, "r1", 10L));
        assertTrue(ReadReceiptReadersHooks.shouldDecorateReceived(true, true, true, "c1", 10L));
        // 自分のメッセージは既読ラベル側が扱います。
        assertFalse(ReadReceiptReadersHooks.shouldDecorateReceived(false, true, true, "c1", 10L));
        assertFalse(ReadReceiptReadersHooks.shouldDecorateReceived(true, false, false, "c1", 10L));
        assertFalse(ReadReceiptReadersHooks.shouldDecorateReceived(true, true, true, "u1", 10L));
        assertFalse(ReadReceiptReadersHooks.shouldDecorateReceived(true, true, true, "c1", 0L));
    }

    @Test
    public void nullTimestampIsIgnored() {
        ReadReceiptReadersHooks.onMessageBound(null, "c1", 10L, "u_a", true);
    }

    @Test
    public void nullLabelIsIgnoredWithoutTouchingLine() {
        ReadReceiptReadersHooks.onReadCountBound(null, "c1", 10L, "u_self");

        assertNull(ReadersSelf.learnedMid());
    }

    @Test
    public void contextMenuHookIsFailOpenForUnexpectedArguments() {
        // 設定が未初期化でも、型の合わない引数でも例外を LINE へ投げません。
        ReadReceiptReadersHooks.onContextMenuBuilt(new Object(), null, "c1", 10L, "u_a");
        ReadReceiptReadersHooks.onContextMenuBuilt(null, null, null, 0L, null);
    }

    @Test
    public void selfMidIsOnlyRememberedFromPlausibleValues() {
        ReadersSelf.rememberFromOwnMessage(null);
        assertNull(ReadersSelf.learnedMid());
        ReadersSelf.rememberFromOwnMessage("u");
        assertNull(ReadersSelf.learnedMid());
        ReadersSelf.rememberFromOwnMessage("u_self");
        assertEquals("u_self", ReadersSelf.learnedMid());
    }

    @Test
    public void repositoryKeysSeparateChatsMessagesAndLabels() {
        String base = ReadersRepository.key("c1", 10L, "既読 2");
        assertFalse(base.equals(ReadersRepository.key("c1", 10L, "既読 3")));
        assertFalse(base.equals(ReadersRepository.key("c1", 11L, "既読 2")));
        assertFalse(base.equals(ReadersRepository.key("c2", 10L, "既読 2")));
        assertTrue(base.startsWith("c1\n"));
        assertEquals("c1\n10\n", ReadersRepository.key("c1", 10L, null));
    }
}
