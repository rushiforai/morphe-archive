package app.morphe.jadx.ui

import app.morphe.jadx.Log
import app.morphe.jadx.Plugin
import com.formdev.flatlaf.extras.FlatSVGIcon
import java.lang.reflect.Field
import javax.swing.JFrame
import javax.swing.JPanel

fun loadSvg(path: String): FlatSVGIcon {
    val stream = Plugin.Companion::class.java.classLoader.getResourceAsStream(path)
    return FlatSVGIcon(stream)
}

val JFrame.mainPanel: JPanel?
    get() {
        return try {
            val field: Field = this::class.java.getDeclaredField("mainPanel")
            field.isAccessible = true
            field.get(this) as? JPanel
        } catch (e: Exception) {
            Log.error(e) { "Failed to get mainPanel field via reflection" }
            null
        }
    }

fun JPanel.clearAndRepaint() {
    removeAll()
    revalidate()
    repaint()
}
