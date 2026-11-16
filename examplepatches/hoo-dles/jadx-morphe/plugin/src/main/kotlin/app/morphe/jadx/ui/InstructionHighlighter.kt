package app.morphe.jadx.ui

import app.morphe.jadx.Log
import app.morphe.jadx.eval.FingerprintMatch
import app.morphe.jadx.eval.findInstructionPositions
import jadx.core.dex.nodes.ClassNode
import jadx.gui.treemodel.JClass
import jadx.gui.ui.MainWindow
import jadx.gui.ui.codearea.ClassCodeContentPanel
import jadx.gui.ui.codearea.SmaliArea
import java.awt.Color
import java.awt.Component
import java.awt.Container
import java.awt.Rectangle
import java.awt.event.ContainerAdapter
import java.awt.event.ContainerEvent
import java.awt.event.HierarchyEvent
import java.awt.event.HierarchyListener
import javax.swing.SwingUtilities
import javax.swing.Timer
import javax.swing.event.DocumentEvent
import javax.swing.event.DocumentListener

/**
 * Highlights matched instructions in the smali views of a class tab.
 *
 * The view the user has selected is never changed. All the smali views of the class are
 * highlighted, and a view that is not showing scrolls to the match once it is shown.
 *
 * This uses jadx GUI internals, so it may need updating when jadx changes.
 */
object InstructionHighlighter {
    private const val POLL_INTERVAL_MS = 100
    private const val TIMEOUT_MS = 10_000

    private var pollTimer: Timer? = null
    private var classHighlight: ClassHighlight? = null

    /**
     * Must be called on the Swing event thread, after the method was opened.
     */
    fun highlight(mainWindow: MainWindow, topClass: ClassNode, match: FingerprintMatch) {
        pollTimer?.stop()
        classHighlight?.dispose()
        classHighlight = null
        if (match.matchedInstructions.isEmpty()) return

        // The class tab is opened in the background, so wait for it.
        val startTime = System.currentTimeMillis()
        pollTimer = Timer(POLL_INTERVAL_MS) {
            try {
                val classPanel = findClassPanel(mainWindow, topClass)
                if (classPanel != null) {
                    pollTimer?.stop()
                    classHighlight = ClassHighlight(classPanel, match).apply { start() }
                } else if (System.currentTimeMillis() - startTime > TIMEOUT_MS) {
                    pollTimer?.stop()
                    Log.warn { "Timed out waiting for class tab of ${match.definingClass}" }
                }
            } catch (ex: Exception) {
                pollTimer?.stop()
                Log.error(ex) { "Failed to highlight matched instructions" }
            }
        }.apply { start() }
    }

    private fun findClassPanel(mainWindow: MainWindow, topClass: ClassNode) =
        mainWindow.tabbedPane.tabs
            .filterIsInstance<ClassCodeContentPanel>()
            .firstOrNull { (it.node as? JClass)?.cls?.classNode == topClass }
}

/**
 * Keeps the smali views of a class tab highlighted, including the views
 * created when split view is turned on.
 */
private class ClassHighlight(
    private val classPanel: ClassCodeContentPanel,
    private val match: FingerprintMatch,
) {
    private val areaHighlights = mutableMapOf<SmaliArea, AreaHighlight>()
    private var disposed = false

    // Changing split view replaces the content of the class tab, after the event is handled.
    private val splitViewListener = object : ContainerAdapter() {
        override fun componentAdded(e: ContainerEvent) {
            SwingUtilities.invokeLater {
                try {
                    if (!disposed) updateAreas()
                } catch (ex: Exception) {
                    Log.error(ex) { "Failed to highlight matched instructions after view change" }
                }
            }
        }
    }

    fun start() {
        classPanel.addContainerListener(splitViewListener)
        updateAreas()
    }

    fun dispose() {
        disposed = true
        classPanel.removeContainerListener(splitViewListener)
        areaHighlights.values.forEach { it.dispose() }
        areaHighlights.clear()
    }

    private fun updateAreas() {
        // Skip the "Smali bytecode" tabs, which also use a SmaliArea.
        val areas = classPanel.descendants()
            .filterIsInstance<SmaliArea>()
            .filter { !it.isShowingDalvikBytecode }
            .toSet()

        (areaHighlights.keys - areas).forEach { areaHighlights.remove(it)?.dispose() }
        (areas - areaHighlights.keys).forEach { area ->
            areaHighlights[area] = AreaHighlight(area, match).apply { start() }
        }
    }

    private fun Component.descendants(): Sequence<Component> = sequence {
        yield(this@descendants)
        if (this@descendants is Container) {
            components.forEach { yieldAll(it.descendants()) }
        }
    }
}

/**
 * Highlights the matched instructions of a single smali view.
 */
private class AreaHighlight(
    private val area: SmaliArea,
    private val match: FingerprintMatch,
) {
    companion object {
        // Semi-transparent so the text stays readable with light and dark themes.
        private val HIGHLIGHT_COLOR = Color(255, 210, 0, 70)
        private const val SCROLL_RETRY_DELAY_MS = 50
        private const val SCROLL_RETRIES = 20
    }

    private val highlightTags = mutableListOf<Any>()
    private var firstPosition: Int? = null
    private var scrollPending = false
    private var applyQueued = false
    private var disposed = false

    // jadx can load the smali text again right after a class tab is opened. Loading replaces
    // the text and moves the caret to the top, so highlight and scroll again when that happens.
    private val reloadListener = object : DocumentListener {
        override fun insertUpdate(e: DocumentEvent) = queueApply()
        override fun removeUpdate(e: DocumentEvent) = queueApply()
        override fun changedUpdate(e: DocumentEvent) {}
    }

    private val showingListener = HierarchyListener { event ->
        val showingChanged = event.changeFlags and HierarchyEvent.SHOWING_CHANGED.toLong() != 0L
        if (showingChanged && area.isShowing && scrollPending) scrollToMatch()
    }

    fun start() {
        area.document.addDocumentListener(reloadListener)
        area.addHierarchyListener(showingListener)
        if (area.isLoaded) apply()
    }

    fun dispose() {
        disposed = true
        area.removeHierarchyListener(showingListener)
        if (!area.isDisposed) {
            area.document.removeDocumentListener(reloadListener)
            removeHighlights()
        }
    }

    private fun queueApply() {
        if (applyQueued) return
        applyQueued = true
        SwingUtilities.invokeLater {
            applyQueued = false
            try {
                if (!disposed && area.isLoaded) apply()
            } catch (ex: Exception) {
                Log.error(ex) { "Failed to highlight matched instructions after reload" }
            }
        }
    }

    private fun apply() {
        val text = area.text
        val positions = findInstructionPositions(text, match)
        if (positions == null) {
            if (text.isNotEmpty()) {
                Log.warn { "Could not find ${match.definingClass}->${match.methodShortId} in smali view" }
            }
            return
        }

        removeHighlights()
        positions.forEach { position ->
            highlightTags.add(area.addLineHighlight(area.getLineOfOffset(position), HIGHLIGHT_COLOR))
        }
        firstPosition = positions.firstOrNull()
        scrollPending = firstPosition != null

        // Must run after the scroll to the top that jadx queues when it loads the text.
        SwingUtilities.invokeLater {
            try {
                if (scrollPending) scrollToMatch()
            } catch (ex: Exception) {
                Log.error(ex) { "Failed to scroll to matched instructions" }
            }
        }
    }

    private fun removeHighlights() {
        highlightTags.forEach { area.removeLineHighlight(it) }
        highlightTags.clear()
    }

    /**
     * Scrolls without moving the caret, as the current line highlight hides the match highlight.
     * A view that was just shown may not have been laid out yet, so this retries for a short time.
     */
    private fun scrollToMatch(retries: Int = SCROLL_RETRIES) {
        val position = firstPosition
        if (disposed || position == null || !area.isShowing) return

        val visibleRect = area.visibleRect
        val matchRect = if (visibleRect.height > 0) area.modelToView2D(position)?.bounds else null
        if (matchRect != null) {
            scrollPending = false
            area.scrollRectToVisible(
                Rectangle(
                    visibleRect.x,
                    matchRect.y - visibleRect.height / 3,
                    visibleRect.width,
                    visibleRect.height
                )
            )
        } else if (retries > 0) {
            Timer(SCROLL_RETRY_DELAY_MS) {
                try {
                    scrollToMatch(retries - 1)
                } catch (ex: Exception) {
                    Log.error(ex) { "Failed to scroll to matched instructions" }
                }
            }.apply {
                isRepeats = false
                start()
            }
        }
    }
}
