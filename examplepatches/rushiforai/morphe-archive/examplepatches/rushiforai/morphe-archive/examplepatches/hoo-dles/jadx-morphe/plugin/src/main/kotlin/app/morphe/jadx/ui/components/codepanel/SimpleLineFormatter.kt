package app.morphe.jadx.ui.components.codepanel

import org.fife.ui.rtextarea.LineNumberFormatter
import kotlin.math.log10

internal val SIMPLE_LINE_FORMATTER: LineNumberFormatter = object : LineNumberFormatter {
    override fun format(lineNumber: Int): String {
        return lineNumber.toString()
    }

    override fun getMaxLength(maxLineNumber: Int): Int {
        return if (maxLineNumber < 10) 1 else 1 + log10(maxLineNumber.toDouble()).toInt()
    }
}