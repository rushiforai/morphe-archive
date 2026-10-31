package software.santodan.extension.pillosummary

import android.content.Context
import androidx.compose.runtime.DisposableEffectResult
import java.util.concurrent.CancellationException

private class TestJob {
    var cancelled = 0
    fun cancel(cause: CancellationException?) { check(cause == null); cancelled++ }
}

private class TestModel {
    val jobs = mutableListOf<TestJob>()
    var fail = false
    fun initialize(host: Context?, id: String, metric: Any): TestJob {
        check(host == null && id.isEmpty() && metric == "WEIGHT")
        check(!fail) { "Initialization failed" }
        return TestJob().also { jobs += it }
    }
}

private class TestProfile(private val id: String?) {
    fun getUserProfileId(): String? = id
}

fun verifyProgressWeightObserver() {
    check(PilloProgressWeight.chartProfileId(null) == null)
    check(PilloProgressWeight.chartProfileId(TestProfile("profile-a")) == "profile-a")
    check(PilloProgressWeight.chartProfileId(TestProfile("profile-b")) == "profile-b")
    check(runCatching { PilloProgressWeight.chartProfileId(TestProfile("")) }.isFailure)
    check(runCatching { PilloProgressWeight.chartProfileId(TestProfile(null)) }.isFailure)
    println("PASS: pending chart profile deferred; real profile IDs preserved; empty sentinel rejected")
    val model = TestModel()
    @Suppress("UNCHECKED_CAST")
    val effect = PilloProgressWeight.observer(model, null, "WEIGHT") as (Any?) -> DisposableEffectResult
    check(model.jobs.isEmpty()) // Constructing the composable effect performs no I/O/initialization.
    val first = effect(null)
    check(model.jobs.size == 1 && model.jobs[0].cancelled == 0)
    first.dispose()
    first.dispose()
    check(model.jobs[0].cancelled == 1)
    val reopened = effect(null)
    check(model.jobs.size == 2 && model.jobs[1].cancelled == 0)
    reopened.dispose()
    check(model.jobs[1].cancelled == 1)
    model.fail = true
    check(runCatching { effect(null) }.isFailure)
    check(model.jobs.size == 2)
    println("PASS: deferred observer start, idempotent cancellation, reopen without duplicate job, initialization failure")
}
