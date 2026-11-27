// SPDX-License-Identifier: AGPL-3.0-or-later

@file:JvmName("ReplyEditor")

package app.edbfi.extension.rifisfun.reading

import android.graphics.Rect
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.view.ViewTreeObserver
import android.widget.EditText
import android.widget.ScrollView
import app.reseam.runtime.Export

@Export
fun watch(root: View?, editorId: Int) {
    val editor = root?.findViewById<View>(editorId) as? EditText ?: return
    var parent = editor.parent
    while (parent != null && parent !is ScrollView) {
        parent = parent.parent
    }
    val scrollView = parent ?: return
    val revealCaret = object : Runnable, ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
        private var observer: ViewTreeObserver? = null

        override fun run() {
            if (observer != null || !editor.hasFocus() || !editor.isAttachedToWindow) return
            // Let TextView lay out the edit and make its own scroll request first.
            val current = editor.viewTreeObserver
            observer = current
            current.addOnPreDrawListener(this)
            editor.invalidate()
        }

        private fun cancelPreDraw() {
            val registered = observer
            observer = null
            if (registered != null && registered.isAlive) registered.removeOnPreDrawListener(this)
        }

        override fun onPreDraw(): Boolean {
            cancelPreDraw()
            if (editor.isAttachedToWindow && editor.hasFocus()) revealLine(editor, scrollView)
            return true
        }

        override fun onViewAttachedToWindow(view: View) = Unit

        override fun onViewDetachedFromWindow(view: View) {
            editor.removeCallbacks(this)
            cancelPreDraw()
        }
    }
    editor.addOnAttachStateChangeListener(revealCaret)
    editor.addTextChangedListener(object : TextWatcher {
        override fun beforeTextChanged(text: CharSequence?, start: Int, count: Int, after: Int) = Unit

        override fun onTextChanged(text: CharSequence?, start: Int, before: Int, count: Int) = Unit

        override fun afterTextChanged(text: Editable?) {
            if (!editor.hasFocus() || !editor.isAttachedToWindow) return
            editor.removeCallbacks(revealCaret)
            editor.post(revealCaret)
        }
    })
}

private fun revealLine(editor: EditText, scrollView: ScrollView) {
    val layout = editor.layout ?: return
    val caret = editor.selectionEnd
    if (caret !in 0..layout.text.length) return
    val line = layout.getLineForOffset(caret)
    val top = editor.totalPaddingTop + layout.getLineTop(line)
    val bottom = editor.totalPaddingTop + layout.getLineBottom(line)
    // ScrollView's rectangle request uses its full height, including the clipped padding.
    editor.requestRectangleOnScreen(
        Rect(0, top - scrollView.paddingTop, editor.width, bottom + scrollView.paddingBottom),
    )
}
