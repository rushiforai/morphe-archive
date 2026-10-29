/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.apppatches.patches.shared.misc.smali

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.writer.builder.DexBuilder
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.smali.LexerErrorInterface
import com.android.tools.smali.smali.smaliFlexLexer
import com.android.tools.smali.smali.smaliParser
import com.android.tools.smali.smali.smaliTreeWalker
import java.io.StringReader
import org.antlr.runtime.CommonTokenStream
import org.antlr.runtime.TokenSource
import org.antlr.runtime.tree.CommonTreeNodeStream

internal fun assembleDex(smaliClasses: List<String>): ByteArray {
    val dexBuilder = DexBuilder(Opcodes.getDefault())
    smaliClasses.forEach { source ->
        val lexer = smaliFlexLexer(StringReader(source), 15)
        val tokens = CommonTokenStream(lexer as TokenSource)
        val parser = smaliParser(tokens)
        val parsedFile = parser.smali_file()
        check(parser.numberOfSyntaxErrors == 0 && (lexer as LexerErrorInterface).numberOfSyntaxErrors == 0) {
            "Smali source has ${parser.numberOfSyntaxErrors + lexer.numberOfSyntaxErrors} syntax errors"
        }
        val treeStream = CommonTreeNodeStream(parsedFile.tree).apply { tokenStream = tokens }
        smaliTreeWalker(treeStream).apply { setDexBuilder(dexBuilder) }.smali_file()
    }
    return MemoryDataStore().also(dexBuilder::writeTo).data
}
