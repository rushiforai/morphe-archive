package santodan.patches

import software.santodan.extension.pilloweight.PilloWeightImport
import software.santodan.extension.pilloweight.WeightBackup
import xyz.rtrvr.pillo.data.persistence.database.AppDatabaseManager
import java.io.File
import java.lang.reflect.InvocationTargetException
import kotlin.math.abs

fun main(args: Array<String>) {
    val save = PilloWeightImport::class.java.getDeclaredMethod("importEntries", List::class.java, String::class.java).apply { isAccessible = true }
    fun import(json: String, profile: String = "owner", kg: Boolean = true): Int =
        save.invoke(null, WeightBackup.parse(json, kg), profile) as Int
    fun rejected(json: String) {
        try { WeightBackup.parse(json, true); error("Accepted invalid backup: $json") }
        catch (expected: Exception) { check(expected !is IllegalStateException) }
    }
    val json = """{"weights":[{"date":1751583600000,"weight":147.5},{"date":1747782000000,"weight":153.0},{"date":1751583600000,"weight":147.5}]}"""
    val entries = WeightBackup.parse(json, true)
    check(entries.size == 2 && entries[0].seconds == 1747782000L)
    check(abs(entries[0].pounds * 0.45359237 - 153.0) < 0.00002)
    check(WeightBackup.parse(json, false)[0].pounds == 153f)
    listOf("{}", """{"weights":[]} """, """{"weights":[{"date":1751583600000}]}""",
        """{"weights":[{"date":1751583600,"weight":1}]}""",
        """{"weights":[{"date":1751583600000.5,"weight":1}]}""",
        """{"weights":[{"date":"1751583600000","weight":1}]}""",
        """{"weights":[{"date":1751583600000,"weight":-1}]}""",
        """{"weights":[{"date":1751583600000,"weight":"153"}]}""").forEach(::rejected)
    check(import(json) == 2)
    val repo = AppDatabaseManager.getInstance().trackerEventRepository
    check(repo.records.map { it.recordedAtEpochSec } == listOf(1747782000L, 1751583600L))
    check(repo.records.all { it.weightRecord?.note == "" && it.userProfileId == "owner" })
    check(import(json) == 0 && repo.writes == 2)
    check(import(json, "family") == 2 && repo.records.size == 4)
    check(import("""{"weights":[{"date":1751583600000,"weight":150}]}""") == 1)
    repo.failWrite = true
    try { import("""{"weights":[{"date":1752188400000,"weight":146.9}]}"""); error("Write failure swallowed") }
    catch (expected: InvocationTargetException) { check(generateSequence(expected as Throwable) { it.cause }.last().message == "Simulated database failure") }
    check(repo.records.size == 5)
    repo.failWrite = false
    val partial = """{"weights":[{"date":1752288400000,"weight":145},{"date":1752388400000,"weight":144}]}"""
    repo.failAfterWrites = repo.writes + 1
    try { import(partial); error("Partial failure swallowed") }
    catch (expected: InvocationTargetException) { check(expected.cause?.message?.contains("Saved 1 of 2") == true) }
    check(repo.records.size == 6)
    repo.failAfterWrites = Int.MAX_VALUE
    check(import(partial) == 1 && repo.records.size == 7)
    check(import(partial) == 0)
    repo.rejectWrite = true
    try { import("""{"weights":[{"date":1752488400000,"weight":143}]}"""); error("Missing confirmation swallowed") }
    catch (expected: InvocationTargetException) { check(expected.cause?.message?.contains("Saved 0 of 1") == true) }
    check(repo.records.size == 7)
    repo.rejectWrite = false
    if (args.isNotEmpty()) {
        val backup = File(args[0]).readText()
        val actual = WeightBackup.parse(backup, true)
        check(actual.size == 68)
        check(actual.first().seconds == 1747782000L && actual.last().seconds == 1791500400L)
        check(abs(actual.last().pounds * 0.45359237 - 105.0) < 0.00002)
        check(import(backup, "backup-test") == 68)
        check(import(backup, "backup-test") == 0)
        println("PASS: supplied SWT backup imports all 68 kilogram weights with original timestamps and reimport skips all 68")
    }
    println("PASS: sorting, unit conversion, validation, profile isolation, duplicate handling, asynchronous Flow/suspend completion and failure propagation")
}
