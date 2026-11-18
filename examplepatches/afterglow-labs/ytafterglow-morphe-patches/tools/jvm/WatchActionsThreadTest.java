import android.os.Handler;
import java.util.concurrent.CountDownLatch;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.litho.LithoContext;
import app.afterglow.extension.playback.WatchActions;
import app.afterglow.extension.playback.WatchActionsController;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

public final class WatchActionsThreadTest {
    static int checks;
    static Thread main;
    static void check(String label, boolean result) {
        checks++;
        if (!result) throw new AssertionError(label);
    }
    static void await(CountDownLatch latch) {
        try { latch.await(); } catch (InterruptedException e) { throw new AssertionError(e); }
    }
    static final LithoContext CONTEXT = new LithoContext() {
        public String afterglow_getIdentifier() { return "video_action_bar.eml"; }
        public StringBuilder afterglow_getPathBuilder() { return new StringBuilder(); }
        public Integer afterglow_getHeightConstraint() { return null; }
        public Object afterglow_getSwipeProtector() { return null; }
    };
    static final class Owner implements WatchActionsController {
        int remembers, refreshes;
        boolean active = true, replay;
        Object lastModel;
        public synchronized void afterglow_rememberActions(Object model, Object context) {
            check("owner recording runs after callback on main", Thread.currentThread() == main);
            remembers++;
            if (active) lastModel = model;
        }
        public synchronized boolean afterglow_refreshActions() {
            check("refresh stays on main", Thread.currentThread() == main);
            refreshes++;
            if (active && replay) WatchActions.observe(this, lastModel, null, CONTEXT);
            return active;
        }
    }
    public static void main(String[] args) throws Exception {
        main = Thread.currentThread();
        Object store = new Object(), model = new Object();
        Owner owner = new Owner();
        CountDownLatch ownerHeld = new CountDownLatch(1), storeHeld = new CountDownLatch(1);
        Thread layout = new Thread(() -> {
            synchronized (owner) {
                ownerHeld.countDown(); await(storeHeld);
                synchronized (store) { /* Native subscription. */ }
            }
        });
        Thread callback = new Thread(() -> {
            synchronized (store) {
                storeHeld.countDown(); await(ownerHeld);
                WatchActions.observe(owner, model, null, CONTEXT);
            }
        });
        layout.setDaemon(true); callback.setDaemon(true);
        layout.start(); await(ownerHeld); callback.start();
        layout.join(1000); callback.join(1000);
        check("native layout and conversion callback cannot deadlock", !layout.isAlive() && !callback.isAlive());
        check("callback never enters native owner", owner.remembers == 0);
        Handler.drain();
        check("queued observation records model", owner.remembers == 1 && owner.lastModel == model);
        WatchActions.observe(owner, model, null, CONTEXT);
        check("main-thread callbacks also defer", owner.remembers == 1);
        Handler.drain();
        int before = owner.refreshes;
        AfterglowPrefs.changed("unrelated"); Handler.drain();
        check("unrelated preference does not refresh", owner.refreshes == before);
        owner.replay = true; LiteMode.hidden = true;
        AfterglowPrefs.changed("noPlayerShareButton"); Handler.drain();
        check("live change and reentrant conversion settle once", owner.refreshes == before + 1);
        Owner late = new Owner(); LiteMode.hidden = false;
        WatchActions.observe(late, model, null, CONTEXT);
        LiteMode.hidden = true;
        Handler.drain();
        check("setting changed before queued record is reapplied", late.refreshes == 1);
        owner.active = false; late.active = false; LiteMode.hidden = false;
        AfterglowPrefs.changed(null); Handler.drain();
        before = owner.refreshes + late.refreshes;
        LiteMode.hidden = true; AfterglowPrefs.changed(null); Handler.drain();
        check("disposed owners leave refresh targets", owner.refreshes + late.refreshes == before);
        InstalledTweaks.enabled = false;
        before = late.remembers;
        WatchActions.observe(late, model, null, CONTEXT); Handler.drain();
        check("unselected tweak does not observe", late.remembers == before);
        System.out.println(checks + " watch-action thread checks passed");
    }
}
