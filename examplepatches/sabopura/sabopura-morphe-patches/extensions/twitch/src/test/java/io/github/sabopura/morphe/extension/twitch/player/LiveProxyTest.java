package io.github.sabopura.morphe.extension.twitch.player;
import org.junit.Test;
import static org.junit.Assert.*;
public class LiveProxyTest {
    @Test public void acceptsOnlyHttpsBaseWithoutEmbeddedCredentialsOrParameters(){
        assertTrue(LiveProxy.validBase("https://lb-as.cdn-perfprod.com/live/"));
        for(String value:new String[]{"http://proxy.example/live/","https://user:password@proxy.example/live/","https://proxy.example/live/?token=secret","https://proxy.example/live/#fragment","https://proxy.example/live","https://proxy.example:80/live/","file:///tmp/"})
            assertFalse(value,LiveProxy.validBase(value));
    }

    @Test public void backupProxyUrlCarriesOnlyTheChannelAndPublicOptions(){
        assertEquals("https://lb-as.cdn-perfprod.com/live/abc_1?allow_source=true&allow_audio_only=true&fast_bread=true&type=any&player=twitchweb",
                LiveProxy.proxyUrl("https://lb-as.cdn-perfprod.com/live/","abc_1"));
        assertNull(LiveProxy.proxyUrl("","abc"));
        assertNull(LiveProxy.proxyUrl("http://proxy.example/live/","abc"));
        assertNull(LiveProxy.proxyUrl("https://proxy.example/live/","a/../b"));
    }
    @org.junit.Test public void aFailingProxyIsSkippedForAWhileExceptWhenTheChannelIsOffline() {
        assertFalse(LiveProxy.proxyFailed(200));
        assertFalse(LiveProxy.proxyFailed(404));
        assertTrue(LiveProxy.proxyAvailable());
        assertTrue(LiveProxy.proxyFailed(503));
        assertFalse(LiveProxy.proxyAvailable());
    }
}
