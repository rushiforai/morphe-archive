package io.github.sabopura.morphe.extension.twitch.chat;
import org.junit.Test;
import static org.junit.Assert.*;
public class HistoryMessageTest {
    @Test public void decodesIrcTagsAndActionWithoutLosingUnicode(){
        HistoryMessage m=HistoryMessage.parseIrc("@id=abc;display-name=User\\sName;user-id=12;tmi-sent-ts=1700000000000 :user!u@host PRIVMSG #channel :\u0001ACTION 日本語\u0001");
        assertNotNull(m);assertEquals("User Name",m.user);assertEquals("/me 日本語",m.text);assertEquals("channel",m.room);assertEquals(1700000000000L,m.time);
    }
    @Test public void readsAMessageWhoseTextIsSentWithoutTheColon(){
        // IRC drops the colon of a last parameter that has no space, which is most Japanese messages.
        HistoryMessage m=HistoryMessage.parseIrc("@id=a1;display-name=Ann :ann!ann@ann.tmi.twitch.tv PRIVMSG #chan 草生える");
        assertNotNull(m);assertEquals("草生える",m.text);assertEquals("ann",m.login);assertEquals("Ann",m.user);assertEquals("chan",m.room);
        assertEquals(":)",HistoryMessage.parseIrc("@id=a2 :ann!ann@ann PRIVMSG #chan ::)").text);
        assertEquals("two words",HistoryMessage.parseIrc("@id=a3 :ann!ann@ann PRIVMSG #chan :two words").text);
        assertEquals("",HistoryMessage.parseIrc("@id=a4 :ann!ann@ann PRIVMSG #chan :").text);
        assertNull(HistoryMessage.parseIrc("@id=a5 :ann!ann@ann PRIVMSG #chan"));
        assertEquals("ann",HistoryMessage.parseIrc(":ann!ann@ann PRIVMSG #chan :no tags").login);
    }
    @Test public void ignoresModerationAndMalformedChannel(){
        assertNull(HistoryMessage.parseIrc(":server CLEARCHAT #channel :user"));
        assertNull(HistoryMessage.parseIrc(":u!u@host PRIVMSG #channel/path :text"));
        assertNull(HistoryMessage.parseIrc("not irc"));
    }
    @Test public void trailingEscapeAndEmptyDisplayUseProtocolRules(){
        assertEquals("a;b c\\d\ne",HistoryMessage.unescape("a\\:b\\sc\\\\d\\ne\\"));
        assertEquals("user",HistoryMessage.parseIrc("@display-name= :user!u@h PRIVMSG #c :message").user);
    }
}
