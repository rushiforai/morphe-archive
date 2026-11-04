package util

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.writer.builder.DexBuilder
import com.android.tools.smali.smali.smaliFlexLexer
import com.android.tools.smali.smali.smaliParser
import com.android.tools.smali.smali.smaliTreeWalker
import org.antlr.runtime.CommonTokenStream
import org.antlr.runtime.tree.CommonTreeNodeStream
import java.io.ByteArrayInputStream
import java.io.InputStreamReader

/**
 * Assemble a full smali class definition and return its first method.
 *
 * Needed where an injected block cannot express what we want:
 *  - try/catch handlers (the inline compiler drops them), and
 *  - a method body needing more registers than the host method declares
 *    (`.locals` cannot be widened by an instruction block).
 * The assembled class's header (super/fields) is discarded — only the method
 * is added to the real class.
 */
fun assembleFirstMethod(smali: String, what: String): Method {
    val dexBuilder = DexBuilder(Opcodes.getDefault())
    val tokens = CommonTokenStream(
        smaliFlexLexer(InputStreamReader(ByteArrayInputStream(smali.toByteArray()), Charsets.UTF_8), 15)
    )
    val parser = smaliParser(tokens)
    val tree = parser.smali_file()
    if (parser.numberOfSyntaxErrors > 0) error("$what: ${parser.numberOfSyntaxErrors} syntax errors")
    val nodes = CommonTreeNodeStream(tree.tree)
    nodes.tokenStream = tokens
    val walker = smaliTreeWalker(nodes)
    walker.setDexBuilder(dexBuilder)
    return walker.smali_file().methods.first()
}
