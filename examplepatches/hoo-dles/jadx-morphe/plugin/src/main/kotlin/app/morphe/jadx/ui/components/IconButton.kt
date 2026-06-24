package app.morphe.jadx.ui.components

import java.awt.Dimension
import java.awt.Insets
import javax.swing.BorderFactory
import javax.swing.Icon
import javax.swing.JButton

class IconButton(icon: Icon, tooltipText: String) : JButton(null, icon) {
    init {
        toolTipText = tooltipText
        margin = Insets(3, 3, 3, 3)
        preferredSize = Dimension(icon.iconWidth, icon.iconHeight)
        maximumSize = preferredSize
        border = BorderFactory.createEmptyBorder(3, 3, 3, 3)
    }
}