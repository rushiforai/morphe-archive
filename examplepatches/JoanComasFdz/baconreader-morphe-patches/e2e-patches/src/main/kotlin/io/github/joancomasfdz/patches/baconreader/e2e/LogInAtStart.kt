// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.e2e

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.writer.builder.DexBuilder
import com.android.tools.smali.smali.smaliFlexLexer
import com.android.tools.smali.smali.smaliParser
import com.android.tools.smali.smali.smaliTreeWalker
import java.io.StringReader
import org.antlr.runtime.CommonTokenStream
import org.antlr.runtime.tree.CommonTreeNodeStream

// BaconReader.onCreate's first step: it keeps the app, which Preferences and the database read.
internal object ApplicationSetFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/BaconReader\$Companion;",
    name = "setApplication",
    returnType = "V",
    parameters = listOf("Lcom/onelouder/baconreader/BaconReader;"),
)

private const val LOG_IN_AT_START = "e2eLogInAtStart"

// How long the app waits at its start for the fake's answer, in ms.
private const val TIMEOUT_MS = 10_000

/**
 * A LoggedIn scenario starts logged in, as the fake hands the app the login: logging in through the screens took ~11 s
 * of each scenario. Adds a method to BaconReader's companion that asks the fake (`GET <baseUrl>/_e2e/login`), and writes
 * the login it answers as SessionManager.createSession does: the session (DBManager.putSession) and the current user
 * name (Preferences.setUsername). It is called right after setApplication, before SessionManager reads the sessions.
 * The fake answers 204 unless the test asked for it. These patches add no extension code to the app, so the method is
 * smali: on the main thread, with StrictMode's network check lifted for the one call, and any error leaves the app
 * logged out.
 */
internal fun BytecodePatchContext.addLogInAtStart(baseUrl: String) {
    val companion = ApplicationSetFingerprint.classDef
    val compiled = compileMethod(logInAtStartSmali("$baseUrl/_e2e/login"))
    val implementation = compiled.implementation!!
    companion.methods.add(
        ImmutableMethod(
            companion.type,
            LOG_IN_AT_START,
            emptyList(),
            "V",
            compiled.accessFlags,
            null,
            null,
            ImmutableMethodImplementation(
                implementation.registerCount,
                implementation.instructions,
                implementation.tryBlocks,
                null,
            ),
        ).toMutable(),
    )

    ApplicationSetFingerprint.method.apply {
        val end = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (end < 0) throw PatchException("setApplication has no return-void")
        addInstruction(end, "invoke-static {}, ${companion.type}->$LOG_IN_AT_START()V")
    }
}

// The method in a class of its own, compiled whole: the patcher's inline smali leaves out a method's try blocks.
private fun compileMethod(method: String): com.android.tools.smali.dexlib2.iface.Method {
    val source = ".class public LE2ELogInAtStart;\n.super Ljava/lang/Object;\n$method"
    val lexer = smaliFlexLexer(StringReader(source), Opcodes.getDefault().api)
    val tokens = CommonTokenStream(lexer)
    val parser = smaliParser(tokens)
    val file = parser.smali_file()
    if (parser.numberOfSyntaxErrors > 0 || lexer.numberOfSyntaxErrors > 0) {
        throw PatchException("The login at start's smali doesn't parse")
    }
    val nodes = CommonTreeNodeStream(file.tree).apply { tokenStream = tokens }
    val walker = smaliTreeWalker(nodes).apply { setDexBuilder(DexBuilder(Opcodes.getDefault())) }
    return walker.smali_file().methods.single()
}

private fun logInAtStartSmali(url: String): String {
    val policy = "Landroid/os/StrictMode\$ThreadPolicy;"
    val builder = "Landroid/os/StrictMode\$ThreadPolicy\$Builder;"
    val connection = "Ljava/net/HttpURLConnection;"
    val session = "Lcom/onelouder/baconreader/data/Session;"
    val json = "Lorg/json/JSONObject;"
    return """
        .method public static $LOG_IN_AT_START()V
            .registers 10
            invoke-static {}, Landroid/os/StrictMode;->getThreadPolicy()$policy
            move-result-object v9
            :try_start
            new-instance v0, $builder
            invoke-direct {v0}, $builder-><init>()V
            invoke-virtual {v0}, $builder->permitAll()$builder
            move-result-object v0
            invoke-virtual {v0}, $builder->build()$policy
            move-result-object v0
            invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy($policy)V

            new-instance v0, Ljava/net/URL;
            const-string v1, "$url"
            invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
            invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;
            move-result-object v0
            check-cast v0, $connection
            const v1, $TIMEOUT_MS
            invoke-virtual {v0, v1}, $connection->setConnectTimeout(I)V
            invoke-virtual {v0, v1}, $connection->setReadTimeout(I)V
            invoke-virtual {v0}, $connection->getResponseCode()I
            move-result v1
            const/16 v2, 0xc8
            if-ne v1, v2, :done

            # The whole body: a Scanner up to the input's start, \A, which it never meets again.
            invoke-virtual {v0}, $connection->getInputStream()Ljava/io/InputStream;
            move-result-object v1
            new-instance v2, Ljava/util/Scanner;
            invoke-direct {v2, v1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V
            const-string v1, "\\A"
            invoke-virtual {v2, v1}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;
            move-result-object v2
            invoke-virtual {v2}, Ljava/util/Scanner;->next()Ljava/lang/String;
            move-result-object v1
            new-instance v2, $json
            invoke-direct {v2, v1}, $json-><init>(Ljava/lang/String;)V

            new-instance v3, $session
            invoke-direct {v3}, $session-><init>()V
            const-string v1, "name"
            invoke-virtual {v2, v1}, $json->getString(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            iput-object v1, v3, $session->name:Ljava/lang/String;
            const-string v1, "access_token"
            invoke-virtual {v2, v1}, $json->getString(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            iput-object v1, v3, $session->accessToken:Ljava/lang/String;
            const-string v1, "refresh_token"
            invoke-virtual {v2, v1}, $json->getString(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            iput-object v1, v3, $session->refreshToken:Ljava/lang/String;
            const-string v1, "user_id"
            invoke-virtual {v2, v1}, $json->getString(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            iput-object v1, v3, $session->userId:Ljava/lang/String;
            const-string v1, "created_utc"
            invoke-virtual {v2, v1}, $json->getLong(Ljava/lang/String;)J
            move-result-wide v4
            iput-wide v4, v3, $session->createdUtc:J

            # As SessionManager.getExpires(): now + (expires_in - 15) s.
            const-string v1, "expires_in"
            invoke-virtual {v2, v1}, $json->getLong(Ljava/lang/String;)J
            move-result-wide v4
            const-wide/16 v6, 0xf
            sub-long/2addr v4, v6
            const-wide/16 v6, 0x3e8
            mul-long/2addr v4, v6
            invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
            move-result-wide v6
            add-long/2addr v4, v6
            iput-wide v4, v3, $session->expires:J

            invoke-static {v3}, Lcom/onelouder/baconreader/data/DBManager;->putSession($session)V
            iget-object v1, v3, $session->name:Ljava/lang/String;
            invoke-static {v1}, Lcom/onelouder/baconreader/Preferences;->setUsername(Ljava/lang/String;)V

            :done
            invoke-virtual {v0}, $connection->disconnect()V
            :try_end
            .catch Ljava/lang/Exception; {:try_start .. :try_end} :failed
            :restore
            invoke-static {v9}, Landroid/os/StrictMode;->setThreadPolicy($policy)V
            return-void
            :failed
            move-exception v0
            goto :restore
        .end method
    """.trimIndent()
}
