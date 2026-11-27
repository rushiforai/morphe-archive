// SPDX-License-Identifier: AGPL-3.0-or-later

@file:JvmName("MarkdownLinks")

package app.edbfi.extension.rifisfun.reading

import android.text.Spannable
import android.text.Spanned
import android.text.style.TypefaceSpan
import android.text.style.URLSpan
import app.reseam.runtime.Export

private val relativeLink = Regex("""(?<!\\)\[([^\[\]\n]+)]\((/?(?:u|user|r)/[A-Za-z0-9_-]+/?)\)""")

@Export
fun linkify(text: Spannable?) {
    val editable = text as? android.text.SpannableStringBuilder ?: return
    for (match in relativeLink.findAll(editable.toString()).toList().asReversed()) {
        val start = match.range.first
        val end = match.range.last + 1
        if (editable.getSpans(start, end, URLSpan::class.java).isNotEmpty()) continue
        if (editable.getSpans(start, end, TypefaceSpan::class.java).any { it.family == "monospace" }) continue
        val label = match.groups[1] ?: continue
        val target = match.groupValues[2].trimStart('/')
        editable.delete(label.range.last + 1, end)
        editable.delete(start, label.range.first)
        editable.setSpan(URLSpan("https://www.reddit.com/" + target), start, start + label.value.length, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
    }
}
