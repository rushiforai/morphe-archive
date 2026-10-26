/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.tasks

import android.content.Context
import kotlinx.coroutines.CoroutineScope

/** Bound to the guarded shipped APK by ParentNavigationPatch; no app stubs/runtime libraries. */
object TasksHooks {
    private fun missing(): Nothing = error("Unsupported Tasks.org binding")
    @JvmStatic fun vm(fragment: Any): Any = missing()
    @JvmStatic fun context(fragment: Any): Context = missing()
    @JvmStatic fun active(fragment: Any): Boolean = missing()
    @JvmStatic fun current(vm: Any): Any = missing()
    @JvmStatic fun task(state: Any): Any = missing()
    @JvmStatic fun id(task: Any): Long = missing()
    @JvmStatic fun parent(task: Any): Long = missing()
    @JvmStatic fun deleted(task: Any): Boolean = missing()
    @JvmStatic fun hasChanges(vm: Any): Boolean = missing()
    @JvmStatic suspend fun fetch(vm: Any, id: Long): Any? = missing()
    @JvmStatic suspend fun save(vm: Any): Boolean = missing()
    @JvmStatic suspend fun discard(vm: Any): Unit = missing()
    @JvmStatic fun open(fragment: Any, task: Any): Unit = missing()
    @JvmStatic fun draw(composer: Any, click: (() -> Unit)?, icon: (Any, Int) -> Unit): Unit = missing()
    @JvmStatic fun icon(composer: Any, flags: Int, description: String): Unit = missing()
    @JvmStatic fun launch(block: suspend CoroutineScope.() -> Unit): Unit = missing()
    @JvmStatic fun suspended(): Any = missing()
    @JvmStatic fun clearSpill(value: Any?): Any? = null
}
