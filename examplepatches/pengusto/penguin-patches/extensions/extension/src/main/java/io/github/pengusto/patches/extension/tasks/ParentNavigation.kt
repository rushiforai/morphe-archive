/* SPDX-License-Identifier: GPL-3.0-only
 * Uses the native Tasks.org editor, DAO, save/discard transaction and navigation.
 * Tasks.org 15.13 by Alex Baker and contributors, GPL-3.0. See NOTICE.
 */
package io.github.pengusto.patches.extension.tasks

import android.app.AlertDialog
import android.content.Context
import android.util.Log
import android.widget.Toast
import java.lang.ref.WeakReference
import java.util.WeakHashMap
import kotlinx.coroutines.CancellationException

object ParentNavigation {
    // All access is on the main thread. Weak values avoid retaining a VM through
    // its own StateFlow values and weak keys avoid retaining disposed compositions.
    private val fragments = WeakHashMap<Any, WeakReference<Any>>()
    private val states = WeakHashMap<Any, WeakReference<Any>>()
    private val busy = WeakHashMap<Any, Boolean>()
    private val dialogs = WeakHashMap<Any, WeakReference<AlertDialog>>()

    @JvmStatic fun bind(fragment: Any) { fragments[TasksHooks.vm(fragment)] = WeakReference(fragment) }
    @JvmStatic fun bindState(vm: Any, state: Any) { states[state] = WeakReference(vm) }
    @JvmStatic fun unbind(fragment: Any) {
        val keys = fragments.filterValues { it.get() === fragment }.keys.toList()
        keys.forEach { vm ->
            dialogs.remove(vm)?.get()?.dismiss()
            fragments.remove(vm)
        }
    }

    private fun text(context: Context, english: String, german: String): String =
        if (context.resources.configuration.locales[0].language == "de") german else english

    private fun active(vm: Any, fragment: Any, id: Long): Boolean =
        fragments[vm]?.get() === fragment && TasksHooks.active(fragment) &&
            TasksHooks.id(TasksHooks.current(vm)) == id

    private fun report(context: Context) = Toast.makeText(context,
        text(context, "Parent task is unavailable. The editor stays open.",
            "Elternaufgabe nicht verfügbar. Der Editor bleibt geöffnet."), Toast.LENGTH_LONG).show()

    /** Called inside the native TopAppBar actions; the native icon/button do all rendering. */
    @JvmStatic fun action(state: Any, composer: Any) {
        val vm = states[state]?.get()
        val fragment = vm?.let { fragments[it]?.get() }
        val task = TasksHooks.task(state)
        val id = TasksHooks.id(task)
        val parent = TasksHooks.parent(task)
        val eligible = vm != null && fragment != null && id > 0 && parent > 0 && parent != id
        val label = if (fragment == null) "Go to parent task" else text(TasksHooks.context(fragment),
            "Go to parent task", "Zur Elternaufgabe")
        TasksHooks.draw(composer, if (eligible) ({ request(vm) }) else null) { c, flags ->
            TasksHooks.icon(c, flags, label)
        }
    }

    private suspend fun destination(vm: Any, id: Long): Any? {
        val current = TasksHooks.current(vm)
        if (TasksHooks.id(current) != id || id <= 0 || TasksHooks.deleted(current)) return null
        val child = TasksHooks.fetch(vm, id) ?: return null
        if (TasksHooks.deleted(child)) return null
        val parent = TasksHooks.parent(child)
        if (parent <= 0 || parent == id) return null
        return TasksHooks.fetch(vm, parent)?.takeIf {
            TasksHooks.id(it) == parent && !TasksHooks.deleted(it)
        }
    }

    @JvmStatic fun request(vm: Any) {
        val fragment = fragments[vm]?.get() ?: return
        val id = TasksHooks.id(TasksHooks.current(vm))
        if (busy[vm] == true || !active(vm, fragment, id)) return
        val context = TasksHooks.context(fragment)
        busy[vm] = true
        TasksHooks.launch {
            var dialogOwnsRequest = false
            try {
                val parent = destination(vm, id)
                if (!active(vm, fragment, id)) return@launch
                if (parent == null) { report(context); return@launch }
                if (!TasksHooks.hasChanges(vm)) {
                    move(vm, fragment, id, save = false)
                    return@launch
                }
                val chosen = booleanArrayOf(false)
                val dialog = AlertDialog.Builder(context)
                    .setTitle(text(context, "Open parent task", "Elternaufgabe öffnen"))
                    .setMessage(text(context, "Save changes before opening the parent task?",
                        "Änderungen vor dem Öffnen der Elternaufgabe speichern?"))
                    .setPositiveButton(text(context, "Save", "Speichern")) { _, _ ->
                        chosen[0] = true; perform(vm, fragment, id, save = true)
                    }
                    .setNegativeButton(text(context, "Discard", "Verwerfen")) { _, _ ->
                        chosen[0] = true; perform(vm, fragment, id, save = false)
                    }
                    .setNeutralButton(android.R.string.cancel, null)
                    .create()
                dialog.setOnDismissListener {
                    dialogs.remove(vm)
                    if (!chosen[0]) busy.remove(vm)
                }
                dialogs[vm] = WeakReference(dialog)
                dialog.show()
                dialogOwnsRequest = true
            } catch (e: CancellationException) {
                throw e
            } catch (e: Exception) {
                Log.e("PenguinParentNavigation", "Parent navigation failed", e)
                if (active(vm, fragment, id)) report(context)
            } finally {
                if (!dialogOwnsRequest) busy.remove(vm)
            }
        }
    }

    private fun perform(vm: Any, fragment: Any, id: Long, save: Boolean) = TasksHooks.launch {
        try {
            move(vm, fragment, id, save)
        } catch (e: CancellationException) {
            throw e
        } catch (e: Exception) {
            Log.e("PenguinParentNavigation", "Parent navigation failed", e)
            if (active(vm, fragment, id)) report(TasksHooks.context(fragment))
        } finally { busy.remove(vm) }
    }

    private suspend fun move(vm: Any, fragment: Any, id: Long, save: Boolean) {
        val parent = destination(vm, id)
        if (!active(vm, fragment, id)) return
        if (parent == null) { report(TasksHooks.context(fragment)); return }
        if (save && TasksHooks.hasChanges(vm)) {
            if (!TasksHooks.save(vm)) {
                if (active(vm, fragment, id)) report(TasksHooks.context(fragment))
                return
            }
        } else {
            // Existing tasks only: native discard prevents onCleared autosaving
            // a draft the user explicitly chose to discard.
            TasksHooks.discard(vm)
        }
        if (active(vm, fragment, id)) TasksHooks.open(fragment, parent)
    }
}
