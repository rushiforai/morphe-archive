// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.layout.keeptypedtextinview

import app.edbfi.patches.rifisfun.RIF_IS_FUN
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

// Decoded layouts name the Android namespace "android".
private const val PADDING = "android:padding"
private const val MARGIN = "android:layout_margin"

/**
 * The reply box (also used to edit), the new message box and the two modmail boxes, which only exist in res/layout.
 * Each holds its whole form in a ScrollView, padded on all sides and placed in a FrameLayout that draws the box.
 */
private val LAYOUTS = listOf("comment_reply_dialog", "compose_message_dialog", "compose_modmail_dialog", "modmail_reply_dialog")

/**
 * Android's ScrollView ignores its own padding when it scrolls the cursor into view: once a reply is taller than the
 * space above the keyboard, the line being typed sits in the ScrollView's bottom padding, which clips it, so it is cut
 * off at the bottom edge of the box. As a margin instead, the space stays the same and the ScrollView's own area ends
 * where the box does, so the cursor's line stays whole.
 */
@Suppress("unused")
val keepTypedTextInViewPatch =
    patch(
        name = "Keep typed text in view",
        description = "Keeps the line being typed in view when writing a long reply.",
        default = true,
    ) {
        compatibleWith(RIF_IS_FUN)

        execute {
            val documents = LAYOUTS.map { document("res/layout/$it.xml") }
            try {
                // Check every layout before changing any.
                val scrollViews =
                    LAYOUTS.zip(documents).map { (name, document) ->
                        val found = document.getElementsByTagName("ScrollView")
                        if (found.length != 1) throw PatchException("Expected one ScrollView in $name, found ${found.length}")
                        val scrollView = found.item(0) as Element
                        if (!scrollView.hasAttribute(PADDING)) throw PatchException("The ScrollView in $name has no padding")
                        val margins = (0 until scrollView.attributes.length).map { scrollView.attributes.item(it).nodeName }.filter { it.startsWith(MARGIN) }
                        if (margins.isNotEmpty()) throw PatchException("The ScrollView in $name already has $margins")
                        // The margin keeps the box as it was only if the box is drawn by something else and the
                        // ScrollView's parent lays out margins.
                        if (scrollView.hasAttribute("android:background")) throw PatchException("The ScrollView in $name has a background of its own")
                        val parent = (scrollView.parentNode as? Element)?.tagName
                        if (parent != "FrameLayout") throw PatchException("The ScrollView in $name sits in $parent, not a FrameLayout")
                        scrollView
                    }
                for (scrollView in scrollViews) {
                    scrollView.setAttribute(MARGIN, scrollView.getAttribute(PADDING))
                    scrollView.removeAttribute(PADDING)
                }
            } finally {
                documents.forEach { it.close() }
            }
        }
    }
