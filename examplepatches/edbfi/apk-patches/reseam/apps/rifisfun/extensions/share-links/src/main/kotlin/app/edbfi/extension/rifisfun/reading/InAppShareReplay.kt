// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.rifisfun.reading

import java.net.URI

internal class InAppShareReplay {
    private class Replay(val url: URI, var enteredRouter: Boolean = false, var markedIntent: Boolean = false)

    private val current = ThreadLocal<Replay>()

    fun withStockRouter(url: URI, route: () -> Unit) {
        val previous = current.get()
        current.set(Replay(url))
        try {
            route()
        } finally {
            if (previous == null) current.remove() else current.set(previous)
        }
    }

    fun skipResolverOnce(url: URI): Boolean {
        val replay = current.get() ?: return false
        if (replay.url != url || replay.enteredRouter) return false
        replay.enteredRouter = true
        return true
    }

    fun markStockIntentOnce(url: URI): Boolean {
        val replay = current.get() ?: return false
        if (replay.url != url || !replay.enteredRouter || replay.markedIntent) return false
        replay.markedIntent = true
        return true
    }
}
