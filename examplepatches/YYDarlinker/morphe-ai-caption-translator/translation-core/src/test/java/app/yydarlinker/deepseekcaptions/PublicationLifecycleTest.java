package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.Context;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.util.concurrent.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Actual session retirement and disk publication; only physical transport is a controlled fake. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class PublicationLifecycleTest {
    final Context context=RuntimeEnvironment.getApplication();
    final String url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=zh-Hans";
    final CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
    @Before public void before(){RebuildController.stop();RebuildCache.clear(context);}
    @After public void after(){RebuildController.stop();RebuildCache.clear(context);}
    RebuildController.Session session(){
        return new RebuildController.Session(context,url,"abcdefghijk","fixture-scope","zh-Hans",
                new TranslationSettings(true,"https://fixture.invalid","fixture-model","faithful","fixture-key","stored_custom"),
                false,true,language);
    }
    @Test public void mainCancelRevokesImmediatelyWhileDisconnectAndAdmittedWorkAreHeldM3a() throws Exception {
        RebuildController.Session s=session();RebuildCache.Permit permit=s.publication.reserve();
        assertNotNull(permit);
        CountDownLatch disconnectEntered=new CountDownLatch(1),disconnectRelease=new CountDownLatch(1);
        HttpURLConnection connection=new HttpURLConnection(new URL("https://fixture.invalid")){
            public void connect(){} public boolean usingProxy(){return false;}
            public void disconnect(){
                disconnectEntered.countDown();
                try {if(!disconnectRelease.await(5,TimeUnit.SECONDS))throw new IllegalStateException("fixture_disconnect_timeout");}
                catch(InterruptedException e){Thread.currentThread().interrupt();throw new IllegalStateException(e);}
            }
        };
        s.connections.add(connection);ExecutorService waiter=Executors.newSingleThreadExecutor();
        try {
            int generation=s.generation;s.cancel(); // Runs on Robolectric's main thread.
            assertTrue(s.cancelled);assertTrue(s.generation>generation);assertFalse(s.publication.isOpen());
            assertNull("no late result can reserve after cancellation",s.publication.reserve());
            assertTrue(disconnectEntered.await(3,TimeUnit.SECONDS));
            try {s.awaitRetirement();fail("main thread must never wait for the physical barrier");}
            catch(IllegalStateException expected){assertEquals("retirement_barrier_on_main",expected.getMessage());}
            Future<?> drained=waiter.submit(s::awaitRetirement);
            disconnectRelease.countDown();
            try {drained.get(100,TimeUnit.MILLISECONDS);fail("the admitted permit still holds the barrier");}
            catch(TimeoutException expected){}
            permit.close();drained.get(3,TimeUnit.SECONDS);
            assertFalse(s.publication.finishSent());assertNull(s.publication.reserve());
        } finally {
            disconnectRelease.countDown();permit.close();waiter.shutdownNow();assertTrue(waiter.awaitTermination(3,TimeUnit.SECONDS));
        }
    }
    @Test public void retireAllowsOnlySentTransportAndCancelEscalatesItM3a() throws Exception {
        RebuildController.Session s=session();
        RebuildController.Job sent=new RebuildController.Job(s,0,true),unsent=new RebuildController.Job(s,1,false);
        sent.onRequestBodySent();s.retire();
        assertFalse(s.publication.isOpen());assertTrue(s.publication.finishSent());assertNull(s.publication.reserve());
        assertFalse("already sent transport may finish in its old scope",sent.isCancelled());
        assertTrue("unsent old transport has no permission",unsent.isCancelled());
        assertFalse("finish-sent never restores current/output authority",RebuildController.current(s));
        s.cancel();assertFalse(s.publication.finishSent());assertTrue(sent.isCancelled());
        ExecutorService waiter=Executors.newSingleThreadExecutor();
        try {waiter.submit(s::awaitRetirement).get(3,TimeUnit.SECONDS);}
        finally {waiter.shutdownNow();assertTrue(waiter.awaitTermination(3,TimeUnit.SECONDS));}
    }
    @Test public void admittedOldCacheWriteCanFinishButCannotReplaceANewerCommittedCandidateM3a() throws Exception {
        RebuildSource source=RebuildContractTest.source("Hello world.",500);
        RebuildPlanner.Block block=RebuildContractTest.block(source);
        RebuildProtocol.Plan plan=RebuildProtocol.parseBound(RebuildContractTest.reply(block,
                new org.json.JSONArray().put(RebuildContractTest.event(0,source.words.size()-1,"你好，世界。")
                        .put("source",source.text(0,source.words.size()-1)))),source,block,language);
        String oldKey=RebuildCache.identity(source,session().config,"zh-Hans",language);
        String newKey=RebuildCache.identity(source,new TranslationSettings(true,"https://fixture.invalid",
                "new-model","faithful","fixture-key","stored_custom"),"zh-Hans",language);
        assertNotEquals("model replacement changes the actual cache identity",oldKey,newKey);
        RebuildCache.Publication publication=new RebuildCache.Publication();
        try(RebuildCache.Prepared old=RebuildCache.prepare(context,oldKey,source,block,plan,language)){
            assertNotNull(old);
            try(RebuildCache.Permit admitted=publication.reserve()){
                assertNotNull(admitted);publication.revoke(true);assertNull(publication.reserve());
                assertTrue("already admitted disk work may finish after revoke",old.commit());
            }
            publication.drain(System.nanoTime()+TimeUnit.SECONDS.toNanos(1));
            assertNotNull(RebuildCache.read(context,oldKey,source,block,language));
            assertNull("old scope is not the new configuration's cache",RebuildCache.read(context,newKey,source,block,language));
            RebuildProtocol.Plan newerPlan=RebuildProtocol.parseBound(RebuildContractTest.reply(block,
                    new org.json.JSONArray().put(RebuildContractTest.event(0,source.words.size()-1,"世界，你好。")
                            .put("source",source.text(0,source.words.size()-1)))),source,block,language);
            try(RebuildCache.Prepared held=RebuildCache.prepare(context,oldKey,source,block,plan,language)){
                assertNotNull(held);
                try(RebuildCache.Prepared newer=RebuildCache.prepare(context,oldKey,source,block,newerPlan,language)){
                    assertNotNull(newer);assertTrue(newer.commit());
                }
                assertFalse("a still-prepared old candidate cannot overwrite a newer commit",held.commit());
                assertEquals(newerPlan.json,RebuildCache.read(context,oldKey,source,block,language).json);
            }
        }
        try(java.util.stream.Stream<java.nio.file.Path> files=Files.list(context.getCacheDir().toPath().resolve("caption-events-r2.12"))){
            assertEquals("no temporary candidates leak",0,files.filter(p->p.toString().endsWith(".tmp")).count());
        }
    }
}
