package app.morphe.patches.eksi.timestamps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.eksi.shared.Constants.COMPATIBILITY_EKSI
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

// Entry date binder: sets "created", "created~HH:mm" or "created~dd.MM.yyyy HH:mm" on the date TextView.
private val entryDateFingerprint = Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("Landroid/widget/TextView;", "Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        string("Europe/Istanbul"),
        string("HH:mm"),
        methodCall(
            definingClass = "Landroid/widget/TextView;",
            name = "setText",
            parameters = listOf("Ljava/lang/CharSequence;"),
        ),
    ),
)

// Entries older than this show only the date. 48 hours covers gündem, which includes yesterday.
private const val MAX_AGE_MINUTES = 48 * 60

@Suppress("unused")
val relativeTimestampsPatch = bytecodePatch(
    name = "Relative entry timestamps",
    description = "Shows the age of entries younger than 48 hours next to the entry date, for example \"12 sa 3 dk\".",
) {
    compatibleWith(COMPATIBILITY_EKSI)

    execute {
        val match = entryDateFingerprint.match()
        val setTextMatch = match.instructionMatches[2]
        val setText = setTextMatch.getInstruction<FiveRegisterInstruction>()

        val viewRegister = setText.registerC
        val textRegister = setText.registerD

        // v1 to v6 are scratch registers here: the method only reads the view and the text after this point.
        require(match.method.implementation!!.registerCount - match.method.parameterTypes.size >= 7) {
            "Unexpected entry date binder registers"
        }
        require(viewRegister !in 1..6 && textRegister !in 1..6) { "Unexpected entry date binder registers" }

        match.method.apply {
            // Branches jump to setText, so keep its labels on a nop and run the new code after it.
            replaceInstruction(setTextMatch.index, "nop")
            addInstructionsWithLabels(
                setTextMatch.index + 1,
                """
                    if-eqz v$textRegister, :done

                    # The text starts with the creation date in Istanbul time.
                    new-instance v1, Ljava/text/SimpleDateFormat;
                    const-string v2, "dd.MM.yyyy HH:mm"
                    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
                    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
                    const-string v2, "Europe/Istanbul"
                    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;
                    move-result-object v2
                    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V
                    new-instance v2, Ljava/text/ParsePosition;
                    const/4 v3, 0x0
                    invoke-direct {v2, v3}, Ljava/text/ParsePosition;-><init>(I)V
                    # This parse overload returns null instead of throwing.
                    invoke-virtual {v1, v$textRegister, v2}, Ljava/text/DateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;
                    move-result-object v1
                    if-eqz v1, :done

                    # Age in minutes. Skip future dates and entries older than the limit.
                    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
                    move-result-wide v2
                    invoke-virtual {v1}, Ljava/util/Date;->getTime()J
                    move-result-wide v4
                    sub-long/2addr v2, v4
                    const-wide/32 v4, 0xea60
                    div-long/2addr v2, v4
                    const-wide/16 v4, 0x0
                    cmp-long v1, v2, v4
                    if-ltz v1, :done
                    const-wide/16 v4, $MAX_AGE_MINUTES
                    cmp-long v1, v2, v4
                    if-gez v1, :done

                    # "<text> · 12 sa 3 dk", hours only if at least one.
                    long-to-int v2, v2
                    const/16 v3, 0x3c
                    div-int v4, v2, v3
                    rem-int v5, v2, v3
                    new-instance v1, Ljava/lang/StringBuilder;
                    invoke-direct {v1, v$textRegister}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
                    const-string v6, " \u00b7 "
                    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                    if-eqz v4, :minutes
                    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
                    const-string v6, " sa "
                    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                    :minutes
                    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
                    const-string v6, " dk"
                    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                    move-result-object v$textRegister

                    :done
                    invoke-virtual {v$viewRegister, v$textRegister}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
                """,
            )
        }
    }
}
