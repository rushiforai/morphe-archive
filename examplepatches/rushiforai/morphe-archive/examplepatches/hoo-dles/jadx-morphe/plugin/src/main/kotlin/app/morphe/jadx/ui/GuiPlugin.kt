package app.morphe.jadx.ui

import app.morphe.jadx.Log
import app.morphe.jadx.Plugin
import app.morphe.jadx.PluginOptions
import jadx.api.plugins.JadxPluginContext
import jadx.api.plugins.gui.JadxGuiContext
import java.awt.*
import javax.swing.*

class GuiPlugin {
    private lateinit var context: JadxPluginContext
    private lateinit var guiContext: JadxGuiContext
    private lateinit var evaluatorFrame: EvaluatorFrame
    private lateinit var options: PluginOptions

    fun init(context: JadxPluginContext, options: PluginOptions) {
        this.context = context
        this.guiContext = context.guiContext!!
        this.options = options

        SwingUtilities.invokeLater {
            try {
                // Remove all existing frames with the fingerprint evaluator title
                JFrame.getFrames().filter {
                    it.title == EvaluatorFrame.NAME
                }.forEach { it.dispose() }

                evaluatorFrame = EvaluatorFrame(context, options)
                addToolbarButton()
            } catch (e: Exception) {
                Log.error(e) { "Failed to initialize UI" }
                JOptionPane.showMessageDialog(
                    guiContext.mainFrame,
                    "Failed to initialize Morphe Fingerprint Plugin UI: ${e.message}",
                    "Error",
                    JOptionPane.ERROR_MESSAGE
                )
            }
        }
    }

    private fun addToolbarButton() {
        try {
            val mainPanel = checkNotNull(guiContext.mainFrame?.mainPanel) { "Could not get main panel" }

            // Find the toolbar (assuming it's the component at index 2 in mainPanel's NORTH region).
            // NOTE: This is fragile and depends on JADX internal layout.
            val toolbar = run {
                // Try to find toolbar in BorderLayout.NORTH position
                val northPanel = mainPanel.components.find { comp ->
                    mainPanel.layout is BorderLayout &&
                            (mainPanel.layout as BorderLayout).getConstraints(comp) == BorderLayout.NORTH
                } as? JToolBar

                // Fallback: Try direct index approach
                northPanel ?: mainPanel.components.getOrNull(2) as? JToolBar
            } ?: error("Could not get toolbar component")


            val scriptButtonName = "${Plugin.ID}.button"
            // Re-initialize the plugin button since if not there are classpath shenanigans
            toolbar.components.find { it.name == scriptButtonName }?.let {
                toolbar.remove(it)
            }

            val button = JButton(null, loadSvg(MORPHE_ICON_PATH))
            button.name = scriptButtonName
            button.toolTipText = "Morphe Fingerprint Evaluator"

            button.addActionListener {
                evaluatorFrame.isVisible = true
                evaluatorFrame.toFront()
            }

            // Add plugin button to toolbar after preferences
            val preferencesIndex = when (val i = toolbar.components.indexOfFirst {
                it.name.orEmpty().contains("preferences")
            }) {
                -1 -> toolbar.componentCount - 2
                else -> i + 2
            }
            toolbar.add(button, preferencesIndex)
            toolbar.revalidate()
            toolbar.repaint()

        } catch (e: Exception) {
            Log.error(e) { "Failed to add button to toolbar" }
        }
    }
}