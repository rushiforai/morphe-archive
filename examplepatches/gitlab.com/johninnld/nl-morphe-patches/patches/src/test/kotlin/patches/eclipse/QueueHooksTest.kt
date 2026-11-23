package patches.eclipse

import org.junit.Assert.assertEquals
import org.junit.Test

class QueueHooksTest {
    @Test fun theTwelveMutatorsMatchTheDesignMapExactly() {
        assertEquals(
            listOf(
                "Lle8;->a(Lcom/eclipse/android/data/models/Song;)V",
                "Lle8;->B(Lcom/eclipse/android/data/models/Song;)V",
                "Lle8;->D(I)V",
                "Lle8;->E(I)V",
                "Lle8;->A(I)V",
                "Lle8;->L(Ljava/util/List;ILke8;)V",
                "Lle8;->f()V",
                "Lle8;->g()V",
                "Lle8;->e()V",
                "Lle8;->t(II)V",
                "Lle8;->u(II)V",
                "Lle8;->v(II)V",
            ),
            QUEUE_HOOKS.map { it.descriptor },
        )
    }

    @Test fun everyHookIsDistinctAndReturnsVoid() {
        assertEquals(QUEUE_HOOKS.size, QUEUE_HOOKS.map { it.descriptor }.toSet().size)
        for (hook in QUEUE_HOOKS) {
            assertEquals("Lle8;", hook.owner)
            assertEquals("V", hook.returnType)
        }
    }

    @Test fun theInjectedCallTakesNoRegistersAndTouchesNoResult() {
        assertEquals("invoke-static {}, Lnl/johninnl/eclipse/auto/app/Signals;->queueChanged()V", SIGNAL_CALL)
    }
}
