package app.morphe.jadx.ui.components.codepanel

import app.morphe.jadx.PluginOptions
import jadx.api.plugins.gui.JadxGuiContext
import jadx.gui.ui.MainWindow
import org.fife.ui.autocomplete.AutoCompletion
import org.fife.ui.rsyntaxtextarea.RSyntaxTextArea
import org.fife.ui.rtextarea.RTextScrollPane
import java.awt.BorderLayout
import java.awt.event.ActionEvent
import java.awt.event.InputEvent
import java.awt.event.KeyEvent
import javax.swing.AbstractAction
import javax.swing.JPanel
import javax.swing.KeyStroke
import javax.swing.border.EmptyBorder

private const val PLACEHOLDER_TEXT = "Fingerprint (\n\t\n)"
private const val PLACEHOLDER_CARET_POS = 15
private val CTRL_ENTER_KEY_STROKE = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, InputEvent.CTRL_DOWN_MASK)
private const val ON_TRIGGER_KEY = "onKeyboardTrigger"

class CodePanel(private val guiContext: JadxGuiContext, private val options: PluginOptions, private val onKeyboardTrigger: ((String) -> Unit )? = null) : JPanel() {
    private val codeArea: RSyntaxTextArea = RSyntaxTextArea()
    private val codeScrollPane: RTextScrollPane

    init {
        this.codeArea.syntaxEditingStyle = RSyntaxTextArea.SYNTAX_STYLE_KOTLIN
        RSyntaxTextArea.setTemplatesEnabled(true);
        this.codeArea.antiAliasingEnabled = true
        this.codeScrollPane = RTextScrollPane(codeArea)
        setLayout(BorderLayout())
        setBorder(EmptyBorder(0, 0, 0, 0))
        this.add(codeScrollPane, BorderLayout.CENTER)

        if (options.isAutocompleteEnabled) {
            val ac = AutoCompletion(MorpheCompletionProvider)
            ac.isAutoActivationEnabled = true
            ac.autoCompleteSingleChoices = false
            ac.isParameterAssistanceEnabled = true
            ac.install(codeArea)
        }

        codeScrollPane.gutter.lineNumberFormatter = SIMPLE_LINE_FORMATTER
        (guiContext.mainFrame as MainWindow).editorThemeManager.apply(codeArea)

        onKeyboardTrigger?.let { trigger ->
            codeArea.getInputMap(WHEN_FOCUSED).put(CTRL_ENTER_KEY_STROKE, ON_TRIGGER_KEY)
            val triggerAction = object : AbstractAction() {
                override fun actionPerformed(e: ActionEvent?) { trigger(text) }
            }
            codeArea.actionMap.put(ON_TRIGGER_KEY, triggerAction)
        }

        reset()
    }

    val text: String
        get() = codeArea.text

    fun reset() {
        codeArea.text = PLACEHOLDER_TEXT
        codeArea.caretPosition = PLACEHOLDER_CARET_POS
    }

    override fun requestFocus() {
        codeArea.requestFocus()
    }
}