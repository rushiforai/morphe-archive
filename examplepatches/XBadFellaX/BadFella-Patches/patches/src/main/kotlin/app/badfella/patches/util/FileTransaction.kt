package app.badfella.patches.util

import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.StandardCopyOption.ATOMIC_MOVE
import java.nio.file.StandardCopyOption.REPLACE_EXISTING

internal data class PendingFile(val target: File, val write: (File) -> Unit)

/** Stage every result and backup before replacing anything; restore earlier replacements on failure. */
internal fun commitFiles(
    updates: List<PendingFile>,
    move: (Path, Path) -> Unit = { source, target -> Files.move(source, target, ATOMIC_MOVE, REPLACE_EXISTING); Unit },
) {
    check(updates.map { it.target.canonicalFile }.distinct().size == updates.size) { "Duplicate transaction target" }
    val staged = mutableListOf<Triple<File, File, File>>()
    val replaced = mutableListOf<Triple<File, File, File>>()
    val retainedBackups = mutableSetOf<File>()
    try {
        updates.forEach { update ->
            val next = Files.createTempFile(update.target.parentFile.toPath(), ".patch-", ".next").toFile()
            val backup = try {
                Files.createTempFile(update.target.parentFile.toPath(), ".patch-", ".backup").toFile()
            } catch (failure: Throwable) {
                next.delete()
                throw failure
            }
            staged += Triple(update.target, next, backup)
            update.write(next)
            Files.copy(update.target.toPath(), backup.toPath(), REPLACE_EXISTING)
        }
        staged.forEach { entry ->
            replaced += entry
            move(entry.second.toPath(), entry.first.toPath())
        }
    } catch (failure: Throwable) {
        replaced.asReversed().forEach { entry ->
            try {
                Files.move(entry.third.toPath(), entry.first.toPath(), ATOMIC_MOVE, REPLACE_EXISTING)
            } catch (rollback: Throwable) {
                retainedBackups += entry.third
                failure.addSuppressed(IllegalStateException("Restore failed; original retained at ${entry.third}", rollback))
            }
        }
        throw failure
    } finally {
        staged.forEach { (_, next, backup) -> next.delete(); if (backup !in retainedBackups) backup.delete() }
    }
}
