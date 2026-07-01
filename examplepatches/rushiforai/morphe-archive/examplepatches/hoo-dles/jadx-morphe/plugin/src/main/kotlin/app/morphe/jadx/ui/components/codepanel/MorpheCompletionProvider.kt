package app.morphe.jadx.ui.components.codepanel

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import org.fife.ui.autocomplete.BasicCompletion
import org.fife.ui.autocomplete.DefaultCompletionProvider
import org.fife.ui.autocomplete.TemplateCompletion

object MorpheCompletionProvider: DefaultCompletionProvider() {
    init {
        this.setAutoActivationRules(true, null);

        val templates = listOf(
            TemplateCompletion(
                this,
                "Fingerprint",
                "Fingerprint (...)",
                "Fingerprint (\n\t\${cursor}\n)"
            ),
            TemplateCompletion(
                this,
                "accessFlags",
                "accessFlags = listOf()",
                "accessFlags = listOf(\${cursor})"
            ),
            TemplateCompletion(
                this,
                "definingClass",
                "definingClass = \"\"",
                "definingClass = \"\${cursor}\""
            ),
            TemplateCompletion(
                this,
                "name",
                "name = \"\"",
                "name = \"\${cursor}\""
            ),
            TemplateCompletion(
                this,
                "parameters",
                "parameters = listOf()",
                "parameters = listOf(\${cursor})"
            ),
            TemplateCompletion(
                this,
                "returnType",
                "returnType = \"\"",
                "returnType = \"\${cursor}\""
            ),
            TemplateCompletion(
                this,
                "strings",
                "strings = listOf()",
                "strings = listOf(\${cursor})"
            ),
            TemplateCompletion(
                this,
                "filters",
                "filters = listOf(...)",
                "filters = listOf(\n\t\${cursor}\n)"
            ),
            TemplateCompletion(
                this,
                "custom",
                "custom = {...}",
                "custom = { method, classDef ->\n\t\${cursor}\n}"
            ),
        )

        val accessFlags = AccessFlags.entries.map { flag -> "AccessFlags.${flag.name}"}
        val opcodes = Opcode.entries.map { op -> "Opcode.${op.name.replace('-', '_').uppercase()}"}
        val instrLocations =
            listOf("MatchFirst", "MatchAfterImmediately", "MatchAfterWithin", "MatchAfterAtLeast", "MatchAfterRange")
                .map { "${it}()" }

        val basics = (accessFlags + opcodes + instrLocations)
            .map { keyword -> BasicCompletion(this, keyword) }

        addCompletions(templates + basics)
    }
}