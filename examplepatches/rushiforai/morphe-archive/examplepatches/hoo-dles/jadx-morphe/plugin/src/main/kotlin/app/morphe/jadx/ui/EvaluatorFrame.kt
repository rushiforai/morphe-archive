package app.morphe.jadx.ui

import app.morphe.jadx.Log
import app.morphe.jadx.PluginOptions
import app.morphe.jadx.eval.MorpheResolver
import app.morphe.jadx.eval.ScriptingHost
import app.morphe.jadx.eval.getShortId
import app.morphe.jadx.ui.components.IconButton
import app.morphe.jadx.ui.components.TextArea
import app.morphe.jadx.ui.components.codepanel.CodePanel
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import com.android.tools.smali.dexlib2.analysis.reflection.util.ReflectionUtils
import com.android.tools.smali.dexlib2.iface.Method
import jadx.api.plugins.JadxPluginContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.swing.Swing
import kotlinx.coroutines.withContext
import java.awt.*
import javax.swing.*
import kotlin.script.experimental.api.EvaluationResult
import kotlin.script.experimental.api.ResultValue
import kotlin.script.experimental.api.ResultWithDiagnostics

private const val SEARCH_TEXT = "Evaluate"

class EvaluatorFrame(private val context: JadxPluginContext, options: PluginOptions) : JFrame(NAME) {
    companion object {
        const val NAME = "Morphe Fingerprint Evaluator"
    }

    private val guiContext = context.guiContext!!
    private val codePanel: CodePanel
    private val executeLabel: JLabel
    private val resultsLabel: JLabel
    private val runButton: JButton
    private val resultContentPanel: JPanel
    private val resultScrollPane: JScrollPane

    init {
        // Main frame and content panel
        setSize(900, 500)
        minimumSize = Dimension(600, 300)
        setLocationRelativeTo(guiContext.mainFrame)
        iconImage = loadSvg(MORPHE_ICON_PATH).image
        val splitPane = JSplitPane(JSplitPane.HORIZONTAL_SPLIT)
        splitPane.dividerLocation = 550
        splitPane.resizeWeight = 0.5
        splitPane.border = BorderFactory.createEmptyBorder(10, 4, 4, 4)

        // Code panel
        codePanel = CodePanel(guiContext, options) { onSearch() }
        splitPane.leftComponent = codePanel
        splitPane.leftComponent.minimumSize = Dimension(250, 300)

        // Right panel for actions results
        val rightPanel = JPanel(BorderLayout())

        // Upper section of right panel for run button and label
        val resultHeaderPanel = JPanel()
        resultHeaderPanel.layout = BoxLayout(resultHeaderPanel, BoxLayout.X_AXIS)
        resultHeaderPanel.border = BorderFactory.createEmptyBorder(0, 10, 10, 10)

        runButton = IconButton(loadSvg(PLAY_ARROW_PATH), "Run (Ctrl+Enter)")
        runButton.addActionListener { onSearch() }
        resultHeaderPanel.add(runButton)
        executeLabel = JLabel(SEARCH_TEXT)
        executeLabel.border = BorderFactory.createEmptyBorder(0, 6, 0, 0)
        resultHeaderPanel.add(executeLabel)

        resultHeaderPanel.add(Box.createHorizontalGlue());

        resultsLabel = JLabel()
        resultHeaderPanel.add(resultsLabel)

        rightPanel.add(resultHeaderPanel, BorderLayout.NORTH)

        // Evaluation result section
        resultContentPanel = JPanel(FlowLayout(FlowLayout.LEFT))
        resultScrollPane = JScrollPane(resultContentPanel)
        rightPanel.add(resultScrollPane)

        splitPane.rightComponent = rightPanel
        splitPane.rightComponent.minimumSize = Dimension(200, 200)
        contentPane = splitPane
    }

    override fun setVisible(visible: Boolean) {
        super.setVisible(visible)

        if (!visible) {
            codePanel.reset()
            codePanel.requestFocus()
            executeLabel.text = SEARCH_TEXT
            resultsLabel.text = ""
            resultContentPanel.removeAll()
        }
    }

    private fun onSearch() {
        runButton.isEnabled = false
        executeLabel.text = "Searching..."
        resultsLabel.text = ""
        resultContentPanel.clearAndRepaint()

        GlobalScope.launch(Dispatchers.IO) {
            lateinit var component: Component
            var matchedCount = 0
            try {
                val evalResult = ScriptingHost.evaluate(codePanel.text)
                resultAsFingerprint(evalResult)?.let {
                    val matches = MorpheResolver.matches(it)
                    component = matchesComponent(matches)
                    matchedCount = matches.size
                } ?: run {
                    component = messageComponent(evalResult)
                }
            } catch (t: Throwable) {
                Log.error(t) { "Exception while evaluating and matching fingerprint" }
                component = TextArea("Evaluation failed:\n    ${t.message}")
            }

            // Switch back to the Event Dispatch Thread (EDT) to update the UI
            withContext(Dispatchers.Swing) {
                resultContentPanel.add(component)
                resultsLabel.text = when (matchedCount) {
                    0 -> ""
                    1 -> "Found 1 match"
                    else -> "Found $matchedCount matches"
                }
                executeLabel.text = SEARCH_TEXT
                runButton.isEnabled = true
                // Scroll to top
                resultScrollPane.verticalScrollBar.value = resultScrollPane.verticalScrollBar.minimum
            }
        }
    }

    private fun resultAsFingerprint(result: ResultWithDiagnostics<EvaluationResult>) =
        ((result as? ResultWithDiagnostics.Success)
            ?.value
            ?.returnValue as? ResultValue.Value)
            ?.value as? Fingerprint

    private fun messageComponent(result: ResultWithDiagnostics<EvaluationResult>): Component {
        val text = when (result) {
            is ResultWithDiagnostics.Failure ->
                (listOf("Script parsing failed:") + result.reports.map { "    ${it.severity}: ${it.message}" })
                    .joinToString("\n")
            is ResultWithDiagnostics.Success -> completedComponentText(result.value.returnValue)
        }
        return TextArea(text)
    }

    private fun completedComponentText(result: ResultValue) =
        when (result) {
            is ResultValue.Error -> "Script execution returned an error:\n    ${result.error.message}"
            is ResultValue.NotEvaluated -> "Script was not evaluated."
            is ResultValue.Unit -> "Script execution did not produce a value."
            is ResultValue.Value -> "Script execution returned unexpected type:\n    ${result.type}"
        }

    private fun matchesComponent(matches: List<Match>): Component {
        if (matches.isNotEmpty()) {
            val resultsPanel = JPanel()
            resultsPanel.layout = BoxLayout(resultsPanel, BoxLayout.Y_AXIS)

            val matchBlocks = matches.map {
                val classFQN = ReflectionUtils.dexToJavaName(it.method.definingClass);
                // context.decompiler.searchJavaClassByOrigFullName is broken and searches aliases instead of the
                // original identifiers
                val javaKlass = context.decompiler.classesWithInners.firstOrNull {cls -> cls.rawName == classFQN } ?:
                    throw Exception("Could not find $classFQN in decompiled class list")

                val javaMethod = javaKlass.searchMethodByShortId(it.method.getShortId())
                javaMethod?.let { jMethod ->
                    val block = JPanel()
                    block.layout = BoxLayout(block, BoxLayout.Y_AXIS)
                    // jMethod.fullName does not format inner classes correctly
                    val fqn = "${jMethod.declaringClass.rawName}.${jMethod.name}"
                    val methodLabel = TextArea(fqn, bold = true)
                    methodLabel.alignmentX = LEFT_ALIGNMENT
                    block.add(methodLabel)

                    val inset = JPanel()
                    inset.layout = BoxLayout(inset, BoxLayout.X_AXIS)
                    inset.alignmentX = LEFT_ALIGNMENT
                    inset.add(Box.createHorizontalStrut(8))
                    block.add(inset)

                    val details = JPanel()
                    details.layout = BoxLayout(details, BoxLayout.Y_AXIS)
                    inset.add(details)

                    it.instructionMatchesOrNull?.apply {
                        details.add(TextArea("First instruction: ${first().index}"))
                        if (size > 1)
                            details.add(TextArea("Last instruction: ${last().index}", topPadding = 0))
                    }

                    val jumpButton = JButton("Jump to method")
                    jumpButton.addActionListener {
                        if (!guiContext.open(jMethod.codeNodeRef)) {
                            Log.error { "Failed to jump to method: ${jMethod.fullName}" }
                        }
                    }
                    details.add(jumpButton)

                    block
                }
            }

            matchBlocks.forEachIndexed { index, block ->
                resultsPanel.add(block)
                if (index < matchBlocks.size - 1)
                    resultsPanel.add(Box.createVerticalStrut(15))
            }

            return resultsPanel
        }

        return TextArea("No matches found.")
    }
}