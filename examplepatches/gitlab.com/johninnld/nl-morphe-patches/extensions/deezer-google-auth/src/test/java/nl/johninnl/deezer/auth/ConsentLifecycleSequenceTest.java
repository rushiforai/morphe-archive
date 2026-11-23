package nl.johninnl.deezer.auth;

import org.junit.Test;
import static org.junit.Assert.*;
import static nl.johninnl.deezer.auth.DeferredConsentDelivery.Kind.*;

/** Exercises the actual generation/mailbox/decision policies used by the Android Request. */
public final class ConsentLifecycleSequenceTest {
    @Test public void chooserAThenEmailThenBRejectsLateAInsteadOfMakingItCurrent() {
        ConsentGeneration a = new ConsentGeneration(); // Issued before chooser A starts.
        Object lateCredentialA = new Object();
        a.retire(); // Leaving Google retires even a still-pending chooser.
        ConsentGeneration b = new ConsentGeneration(); // Issued before chooser B starts.
        Object credentialB = new Object();
        assertFalse(a.isCurrentFor(b, true));
        assertFalse(a.bindCredential(lateCredentialA));
        assertTrue(b.bindCredential(credentialB));
        assertFalse(b.matchesCredential(lateCredentialA));
        assertTrue(b.matchesCredential(credentialB));
        DeferredConsentDelivery deliveryB = new DeferredConsentDelivery(b);
        assertFalse(deliveryB.offer(a, NATIVE_RESULT, new Object(), 0, 0));
        assertNull(deliveryB.take(true));
        assertTrue(b.isCurrentFor(b, true));
    }

    @Test public void capturedGenerationSurvivesACloneAfterAnotherChooserBecomesCurrent() {
        ConsentGeneration capturedByOriginalCoroutine = new ConsentGeneration();
        capturedByOriginalCoroutine.retire();
        ConsentGeneration currentAtCloneConstruction = new ConsentGeneration();
        // Native create() is wrapped to copy this original captured identity into the clone.
        ConsentGeneration copiedIntoClone = capturedByOriginalCoroutine;
        assertFalse(copiedIntoClone.isCurrentFor(currentAtCloneConstruction, true));
        assertFalse(copiedIntoClone.bindCredential(new Object()));
    }

    @Test public void matchedResolutionDuringDetachWaitsAndStillNeedsTheUserButton() {
        ConsentGeneration generation = new ConsentGeneration();
        assertTrue(generation.bindCredential(new Object()));
        DeferredConsentDelivery delivery = new DeferredConsentDelivery(generation);
        ConsentAttempt attempt = new ConsentAttempt();
        Object genuineResolutionReference = new Object();
        assertTrue(delivery.offer(generation, RESOLUTION, genuineResolutionReference, 0, 0));
        assertNull(delivery.take(false)); // Old Activity destroyed, retained fragment detached.
        assertNull(delivery.take(false));
        DeferredConsentDelivery.Event reattached = delivery.take(true);
        assertSame(genuineResolutionReference, reattached.payload);
        assertEquals(RESOLUTION, reattached.kind);
        assertTrue(attempt.offerResolution());
        assertTrue(attempt.needsDecision());
        assertFalse(attempt.matchesResult(0x4000));
        // Only the explicit confirmation button performs the launch transition.
        assertTrue(attempt.beginLaunch(0x4000));
        assertFalse(attempt.beginLaunch(0x4000)); // No launch on a later resume.
        assertNull(delivery.take(true));
    }

    @Test public void matchedSilentResultDuringRotationIsDeliveredOnceAfterReattachment() {
        ConsentGeneration generation = new ConsentGeneration();
        Object originalCredential = new Object();
        assertTrue(generation.bindCredential(originalCredential));
        DeferredConsentDelivery delivery = new DeferredConsentDelivery(generation);
        Object nativeResult = new Object();
        assertTrue(delivery.offer(generation, NATIVE_RESULT, nativeResult, 0, 0));
        assertNull(delivery.take(false));
        assertTrue(generation.matchesCredential(originalCredential));
        DeferredConsentDelivery.Event event = delivery.take(true);
        assertSame(nativeResult, event.payload);
        ConsentAttempt attempt = new ConsentAttempt();
        assertTrue(attempt.finish());
        generation.retire();
        assertNull(generation.credential());
        assertNull(delivery.take(true));
        assertFalse(attempt.finish());
    }

    @Test public void activitySuccessOrCancelArrivingDuringRecreationKeepsItsMatchedRequest() {
        for (int resultCode : new int[] { -1, 0 }) {
            ConsentGeneration generation = new ConsentGeneration();
            assertTrue(generation.bindCredential(new Object()));
            DeferredConsentDelivery delivery = new DeferredConsentDelivery(generation);
            ConsentAttempt attempt = new ConsentAttempt();
            assertTrue(attempt.offerResolution());
            assertTrue(attempt.beginLaunch(0x4042));
            Object actualResultIntent = new Object();
            assertTrue(delivery.offer(generation, ACTIVITY_RESULT, actualResultIntent, 0x4042, resultCode));
            assertNull(delivery.take(false));
            DeferredConsentDelivery.Event event = delivery.take(true);
            assertTrue(attempt.matchesResult(event.requestCode));
            assertEquals(resultCode, event.resultCode);
            assertSame(actualResultIntent, event.payload);
            assertTrue(attempt.finish());
            generation.retire();
            assertFalse(delivery.offer(generation, ACTIVITY_RESULT, actualResultIntent, 0x4042, resultCode));
            assertFalse(attempt.matchesResult(0x4042));
        }
    }

    @Test public void vmClearDropsDeferredResultAndRejectsLateCallbacksInANewGoogleVm() {
        ConsentGeneration oldVm = new ConsentGeneration();
        assertTrue(oldVm.bindCredential(new Object()));
        DeferredConsentDelivery delivery = new DeferredConsentDelivery(oldVm);
        assertTrue(delivery.offer(oldVm, NATIVE_RESULT, new Object(), 0, 0));
        oldVm.retire();
        ConsentGeneration newVm = new ConsentGeneration();
        assertNull(delivery.take(true));
        assertFalse(oldVm.isCurrentFor(newVm, true));
        assertNull(oldVm.credential());
    }

    @Test public void postedPrepareCancelCannotResetANewerRouteEvenWithNoRequestField() {
        ConsentGeneration capturedByPostedCancel = new ConsentGeneration();
        assertTrue(capturedByPostedCancel.isCurrentFor(capturedByPostedCancel, true));
        capturedByPostedCancel.retire(); // Google -> email; no Request may ever have been installed.
        assertFalse(capturedByPostedCancel.isCurrentFor(null, false));
        assertFalse(capturedByPostedCancel.isCurrentFor(null, true)); // Route returned to Google.
        ConsentGeneration b = new ConsentGeneration();
        assertFalse(capturedByPostedCancel.isCurrentFor(b, true)); // B chooser now pending.
        assertTrue(b.isCurrentFor(b, true));
    }

    @Test public void duplicateDeferredEventCannotReplaceTheFirstGenuineMatchedResult() {
        ConsentGeneration generation = new ConsentGeneration();
        DeferredConsentDelivery delivery = new DeferredConsentDelivery(generation);
        Object first = new Object();
        assertTrue(delivery.offer(generation, NATIVE_RESULT, first, 0, 0));
        assertFalse(delivery.offer(generation, NATIVE_RESULT, new Object(), 0, 0));
        assertSame(first, delivery.take(true).payload);
        assertNull(delivery.take(true));
    }
}
