package io.github.sabopura.morphe.extension.twitch.chat;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class HistoryColorTest {
    @Test
    public void readsTheSendersColourFromTheTags() {
        assertEquals(0xFF1E90FF, ChatHistory.nameColor(
                "@badge-info=;color=#1E90FF;display-name=Ann;id=a1 :ann!ann@ann PRIVMSG #chan :hi"));
    }

    @Test
    public void noColourWhenTheTagIsEmptyMissingOrMalformed() {
        assertEquals(0, ChatHistory.nameColor("@color=;display-name=Ann :ann!ann@ann PRIVMSG #chan :hi"));
        assertEquals(0, ChatHistory.nameColor("@display-name=Ann :ann!ann@ann PRIVMSG #chan :hi"));
        assertEquals(0, ChatHistory.nameColor("@color=#-12345;id=a :ann!ann@ann PRIVMSG #chan :hi"));
        assertEquals(0, ChatHistory.nameColor(":ann!ann@ann PRIVMSG #chan :color=#FF0000"));
        assertEquals(0, ChatHistory.nameColor(null));
    }
}
