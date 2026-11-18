package app.template.extension.extension;

import android.content.Context;
import java.util.Collections;

/** Runs against Android SQLite, including a close/reopen cycle. */
public final class ActivityStoreTest {
    private static void assertTrue(boolean value) { if (!value) throw new AssertionError(); }
    private static void assertFalse(boolean value) { assertTrue(!value); }
    public static void testClearRejectsStalePublicationAndSurvivesRestart(Context context) {
        context.deleteDatabase(ActivityStore.DATABASE_NAME);
        ActivityStore store = new ActivityStore(context);
        long generation = store.registerPrinter("printer");
        long firstSequence = store.reserveSequences(5);
        RequestRecord.Details details = new RequestRecord.Details("192.0.2.1",161,1,3,1000,2,"opaque","integer","success",45);
        RequestRecord request = new RequestRecord("token",0,"1.2.3",0,4,true,new byte[]{42},details);
        ActivityBurst burst = new ActivityBurst(new ActivityBurst.Ref("printer", "burst", 1),
                123, 4, Collections.singletonList(request),"192.0.2.1",new ActivityBurst.Coverage(true,true,1,1));
        assertTrue(store.publish(burst, generation));
        ReplayRun replay=new ReplayRun("replay",burst.ref,"192.0.2.1",1200,
                Collections.singletonList(new ReplayRun.RequestResult("token",new byte[]{43})));
        assertTrue(store.saveReplay(replay));
        RequestRecord duplicate = new RequestRecord("other",0,"1.2.4",0,4,false,null);
        ActivityBurst invalid = new ActivityBurst(new ActivityBurst.Ref("printer", "invalid", 2),123,4,
                java.util.Arrays.asList(request,duplicate));
        boolean rejected=false;
        try { store.publish(invalid,generation); } catch (android.database.sqlite.SQLiteConstraintException expected) { rejected=true; }
        assertTrue(rejected && !store.hasBurst("printer","invalid"));
        ActivityBurst newer = new ActivityBurst(new ActivityBurst.Ref("printer", "newer", 5), 99, 4, Collections.singletonList(request));
        ActivityBurst older = new ActivityBurst(new ActivityBurst.Ref("printer", "older", 3), 999, 4, Collections.singletonList(request));
        assertTrue(store.publish(newer,generation));
        assertTrue(store.publish(older,generation));
        assertTrue(store.latestBurst("printer").ref.burstId.equals("newer"));
        java.util.List<ActivityBurst> history=store.listBursts("printer");
        assertTrue(history.size()==3 && history.get(0).ref.sequence==5 && history.get(1).ref.sequence==3 && history.get(2).ref.sequence==1);
        store.close();
        store = new ActivityStore(context);
        assertTrue(store.reserveSequences(1) == firstSequence + 5);
        assertTrue(store.hasBurst("printer", "burst"));
        ActivityBurst saved = store.loadBurst("printer", "burst");
        assertTrue(saved != null && saved.ref.sequence == 1 && saved.startedWallMillis == 123);
        assertTrue(saved.requests().size()==1 && saved.requests().get(0).response()[0]==42
                && saved.requests().get(0).details.requestId==3 && saved.coverage.requestsComplete);
        ReplayRun savedReplay=store.latestReplay(saved.ref);
        assertTrue(savedReplay!=null && savedReplay.source.sequence==1 && savedReplay.results().get(0).response()[0]==43);
        store.putCached("printer","ctx","1.2.9","integer:1",generation);
        store.clearBurstHistory("printer");
        assertTrue(store.listBursts("printer").isEmpty() && store.latestReplay(burst.ref)==null);
        assertTrue("integer:1".equals(store.getCached("printer","ctx","1.2.9")));
        assertFalse(store.saveReplay(replay));
        assertTrue(store.publish(newer,generation));
        store.clearPrinter("printer");
        assertFalse(store.hasBurst("printer", "burst"));
        assertTrue(store.latestReplay(burst.ref)==null && !store.saveReplay(replay));
        assertFalse(store.publish(burst, generation));
        store.close();
        store = new ActivityStore(context);
        assertFalse(store.hasBurst("printer", "burst"));
        assertFalse(store.publish(burst, generation));
        store.close();
        getContextPrinterIdentity(context);
        preferredCardBurst(context);
    }
    private static void preferredCardBurst(Context context) {
        try (ActivityStore store = new ActivityStore(context)) {
            String printerId = "card-test";
            long generation = store.registerPrinter(printerId);
            String basic = "1.3.6.1.2.1.1.1.0";
            saveBurst(store, printerId, generation, 1, basic, basic, basic);
            saveBurst(store, printerId, generation, 2, basic, basic);
            saveBurst(store, printerId, generation, 3, basic);
            assertTrue(store.preferredCardBurst(printerId).ref.sequence == 2);
            saveBurst(store, printerId, generation, 4, basic, "1.3.6.1.4.1.2435.2.3.9.4.2.1.5.1.2.71.12.1.2.1");
            saveBurst(store, printerId, generation, 5, basic, basic, basic);
            saveBurst(store, printerId, generation, 6, basic);
            assertTrue(store.preferredCardBurst(printerId).ref.sequence == 4);
            saveBurst(store, printerId, generation, 7, "1.3.6.1.2.1.43.8.2.1.13.1.1", "1.3.6.1.2.1.43.9.2.1.7.1.1");
            assertTrue(store.preferredCardBurst(printerId).ref.sequence == 7);
            store.clearPrinter(printerId);
            assertTrue(store.preferredCardBurst(printerId) == null);
        }
    }

    private static void saveBurst(ActivityStore store, String printerId, long generation, long sequence, String... oids) {
        java.util.ArrayList<RequestRecord> requests = new java.util.ArrayList<>();
        for (String oid : oids) {
            int ordinal = requests.size();
            requests.add(new RequestRecord("row-" + ordinal, ordinal, oid, 0, 4, false, null));
        }
        ActivityBurst.Ref ref = new ActivityBurst.Ref(printerId, "card-" + sequence, sequence);
        assertTrue(store.publish(new ActivityBurst(ref, sequence, 4, requests), generation));
    }

    private static void getContextPrinterIdentity(Context context) {
        context.deleteDatabase(ActivityStore.DATABASE_NAME);
        ActivityStore store=new ActivityStore(context);
        PrinterRecord first=store.resolveVerified("192.0.2.1","00:11:22:33:44:55","Example");
        CacheCoordinator coordinated=new CacheCoordinator(store,Runnable::run);
        coordinated.learn(first.id,"ctx","1.2.5","integer:10",0);
        assertTrue("integer:10".equals(coordinated.get(first.id,"ctx","1.2.5")));
        assertTrue(store.putCached(first.id,"ctx","1.2.3","integer:7",0));
        assertTrue(store.putCached(first.id,"ctx","1.2.4","integer:8",0));
        assertTrue(store.putCached(first.id,"other","1.2.3","integer:9",0));
        store.close();store=new ActivityStore(context);
        PrinterRecord moved=store.resolveVerified("192.0.2.2","00:11:22:33:44:55","Example");
        assertTrue(first.id.equals(store.findPrinterIdByMac("00:11:22:33:44:55")));
        assertTrue(store.findPrinter(first.id).lastAddress.equals("192.0.2.2"));
        assertTrue("Example".equals(store.resolveVerified("192.0.2.2","00:11:22:33:44:55",null).name));
        assertTrue(first.id.equals(moved.id) && moved.addressChanged && moved.addressHistory().size()==2);
        assertTrue("integer:7".equals(store.getCached(moved.id,"ctx","1.2.3")));
        assertTrue(store.loadCache(moved.id,"ctx").size()==3);
        assertTrue("integer:9".equals(store.loadCache(moved.id,"other").get("1.2.3")));
        PrinterRecord other=store.resolveVerified("192.0.2.2","00:11:22:33:44:66","Example");
        assertFalse(first.id.equals(other.id));
        store.clearPrinter(first.id);
        assertTrue(store.loadCache(first.id,"ctx").isEmpty());
        assertFalse(store.putCached(first.id,"ctx","1.2.3","stale",0));
        PrinterRecord again=store.resolveVerified("192.0.2.1","00:11:22:33:44:55","Example");
        assertFalse(first.id.equals(again.id));
        assertTrue(store.getCached(again.id,"ctx","1.2.3")==null);
        long next=store.reserveSequences(2);
        store.clearAllPrinters();
        assertFalse(store.putCached(other.id,"ctx","1.2.3","stale",0));
        assertTrue(store.reserveSequences(1)==next+2);
        PrinterRecord recreated=store.resolveVerified("192.0.2.2","00:11:22:33:44:66","Example");
        assertFalse(recreated.id.equals(other.id));
        store.close();
    }
}
