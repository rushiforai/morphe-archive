package app.morphe.jadx.ui.components

import java.awt.Font
import javax.swing.BorderFactory
import javax.swing.JTextArea

class TextArea(text: String, wrap: Boolean = false, bold: Boolean = false, topPadding: Int = 4, bottomPadding: Int = 4) : JTextArea(text) {
    init {
        lineWrap = wrap
        wrapStyleWord = true
        isEditable = false
        alignmentX = LEFT_ALIGNMENT
        alignmentY = TOP_ALIGNMENT
        setBorder(BorderFactory.createEmptyBorder(topPadding, 2, bottomPadding, 2))
        if (bold) setFont(font.deriveFont(Font.BOLD))
    }
}