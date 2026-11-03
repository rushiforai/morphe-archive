package app.morphe.extension.pinedrama.inbox;

import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Test;

public class InboxNativeRequestsTest {
    @After public void tearDown() { InboxNativeRequests.resetForTests(); }

    @Test public void returningFromTheLauncherDoesNotCompleteItsGenuineAsynchronousJob() {
        Object vm = new Object();
        NativeJob job = new NativeJob();
        assertTrue(InboxNativeRequests.begin(vm));
        assertTrue(InboxNativeRequests.busy(vm));
        InboxNativeRequests.launched(vm, job);
        InboxNativeRequests.returned(vm);
        assertTrue(InboxNativeRequests.busy(vm));
        job.completed = true;
        assertFalse(InboxNativeRequests.busy(vm));
    }

    @Test public void nestedEntriesAndEqualJobsKeepTheirIndependentCompletionLifetimes() {
        Object vm = new Object();
        NativeJob first = new NativeJob(), second = new NativeJob();
        assertTrue(InboxNativeRequests.begin(vm));
        assertTrue(InboxNativeRequests.begin(vm));
        InboxNativeRequests.launched(vm, first);
        InboxNativeRequests.launched(vm, second);
        InboxNativeRequests.returned(vm);
        first.completed = true;
        assertTrue(InboxNativeRequests.busy(vm));
        InboxNativeRequests.returned(vm);
        assertTrue(InboxNativeRequests.busy(vm));
        second.completed = true;
        assertFalse(InboxNativeRequests.busy(vm));
        InboxNativeRequests.returned(vm);
        assertFalse(InboxNativeRequests.busy(vm));
    }

    @Test public void unreadableCompletionRefusesActivationWithoutChangingTheNativeJob() {
        Object vm = new Object(), malformed = new Object();
        assertTrue(InboxNativeRequests.begin(vm));
        InboxNativeRequests.launched(vm, malformed);
        InboxNativeRequests.returned(vm);
        assertTrue(InboxNativeRequests.busy(vm));
        assertTrue("another owner keeps its ordinary request path", InboxNativeRequests.allowed(new Object()));
    }

    @Test public void viewModelJobsAreFoundByTypeWhateverR8NamesThem() {
        NotificationResultViewModel regular = new NotificationResultViewModel();
        NotificationCreatorResultViewModel creator = new NotificationCreatorResultViewModel();
        NotificationAllTabResultViewModel allTab = new NotificationAllTabResultViewModel();
        assertEquals(2, InboxNativeRequests.jobFields(NotificationResultViewModel.class).size());
        assertEquals(2, InboxNativeRequests.jobFields(NotificationCreatorResultViewModel.class).size());
        assertEquals("the all-tab model watches the jobs it inherits", 2,
                InboxNativeRequests.jobFields(NotificationAllTabResultViewModel.class).size());
        assertFalse(InboxNativeRequests.busy(regular));
        assertFalse(InboxNativeRequests.busy(creator));
        assertFalse(InboxNativeRequests.busy(allTab));

        regular.b = new RenamedCoroutine();
        creator.y = new RenamedCoroutine();
        allTab.a = new RenamedCoroutine();
        assertTrue(InboxNativeRequests.busy(regular));
        assertTrue(InboxNativeRequests.busy(creator));
        assertTrue(InboxNativeRequests.busy(allTab));
        regular.b.completed = true;
        creator.y.completed = true;
        allTab.a.completed = true;
        assertFalse(InboxNativeRequests.busy(regular));
        assertFalse(InboxNativeRequests.busy(creator));
        assertFalse(InboxNativeRequests.busy(allTab));
    }

    @Test public void aViewModelWithoutReadableJobsStaysBusy() {
        assertTrue(InboxNativeRequests.busy(new JoblessNotificationResultViewModel()));
    }

    public static class RenamedCoroutine extends kotlinx.coroutines.JobSupport {}
    public static class BaseNotificationResultViewModel { public RenamedCoroutine scope = new RenamedCoroutine(); }
    public static class NotificationResultViewModel extends BaseNotificationResultViewModel {
        public RenamedCoroutine a, b;
        public String c;
    }
    public static final class NotificationAllTabResultViewModel extends NotificationResultViewModel {
        public static final RenamedCoroutine IDLE = new RenamedCoroutine();
    }
    public static final class NotificationCreatorResultViewModel extends BaseNotificationResultViewModel {
        public RenamedCoroutine x, y;
        public Object lazy = new Object();
        public java.util.List<Object> rows = new java.util.ArrayList<>();
    }
    public static final class JoblessNotificationResultViewModel extends BaseNotificationResultViewModel {
        public Object lazy;
    }

    public static final class NativeJob {
        boolean completed;
        public boolean isCompleted() { return completed; }
        @Override public boolean equals(Object other) { return other instanceof NativeJob; }
        @Override public int hashCode() { return 1; }
    }
}
