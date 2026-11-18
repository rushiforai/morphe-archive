package patches.rollerbank

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableBooleanEncodedValue
import patches.shared.uniqueMatch

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Removes banner and native advertising and their list placements. Stops the app's Google Mobile Ads initialization and requests. Preserves reports, maps, location and purchases.",
) {
    dependsOn(originalInput, googleCompatibility)
    compatibleWith(rollerbank)
    execute {
        // These are the seven flags changed by the original ad-removal callback.
        // ActivityRoute.j is a separate premium-access flag and remains unchanged.
        mapOf("Lhh1;" to "d", "Lbh1;" to "d", "Lsh1;" to "f",
            "${APP}ActivityMelding;" to "j", "${APP}ActivityMeldingNew;" to "n",
            "${APP}ActivityMeldingNewRoute;" to "k", "${APP}ActivityRoute;" to "i").forEach { (owner, name) ->
            val cls = Fingerprint(definingClass = owner, name = "<init>", returnType = "V", parameters = emptyList()).uniqueMatch().classDef
            val field = cls.fields.single { it.name == name && it.type == "Z" }
            val value = field.initialValue as? MutableBooleanEncodedValue ?: error("Missing Rollerbank ad flag: $owner->$name")
            check(field.accessFlags == 9 && value.value) { "Rollerbank ad flag changed: $owner->$name" }
            value.value = false
        }
        guarded("Lrn2;", "a(Landroid/app/Activity;)V", 9, 16, 136).addInstructions(0, "return-void")
        guarded("Lrn2;", "b(Landroid/app/Activity;Lcom/google/android/libraries/ads/mobile/sdk/banner/AdView;Ljava/lang/String;)V", 9, 25, 90)
            .addInstructions(0, """
                move-object/from16 v0, p1
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent())
        guarded("Lrn2;", "c(Lyu2;ILjava/lang/String;)V", 9, 30, 190).addInstructions(0, "return-void")
    }
}
