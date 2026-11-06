import suchi.morphe.patches.shared.microg.main as checkMicroGRouting
import org.junit.Test

class ResearchChecksTest {
    @Test
    fun preservesUnrelatedProState() = ProStateChecks.main(emptyArray())

    @Test
    fun preservesInternalGoogleProtocols() = checkMicroGRouting()
}
