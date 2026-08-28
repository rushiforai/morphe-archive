package app.danielthemaniel.patches.keyboarddesigner

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * Keyboard Designer 5.B8.8
 *
 * Adds the supplied PokeGenie/Pokemon Types design to Keyboard Designer's
 * starter-template transaction before the built-in designs are persisted.
 *
 * This intentionally hooks the starter-template builder instead of app startup:
 * existing installations are not silently modified on every launch. On a fresh
 * install (or when the app recreates its starter templates), this design is
 * inserted before the stock designs and should therefore become the first design.
 */

/**
 * 5.B8.8 mapping confirmed from the APK:
 *
 *   starter template builder: Lt1/U0;->j(ZZZZZZZZZ)LA1/I;
 *   begin DB transaction:     Lu1/H;->z()V
 *   import one design JSON:   Lu1/H;->P1(Lorg/json/JSONObject;ZZ)LA1/I;
 *   save stock design:        Lu1/H;->h3(LA1/I;ZZ)V
 *
 * We inject directly after H.z(), before the first H.h3() stock-design save.
 */
private object StarterTemplateBuilderFingerprint : Fingerprint(
    definingClass = "Lt1/U0;",
    name = "j",
    returnType = "LA1/I;",
    parameters = List(9) { "Z" },
    filters = listOf(
        methodCall(
            definingClass = "Lu1/H;",
            name = "z",
        ),
        methodCall(
            definingClass = "Lu1/H;",
            name = "h3",
        ),
        opcode(Opcode.RETURN_OBJECT),
    ),
)


private object LowercaseExamplePortraitTextFingerprint : Fingerprint(
    definingClass = "Lt1/U0;",
    name = "u",
    returnType = "LA1/I;",
    parameters = listOf("Ljava/lang/String;", "Z", "Z"),
    filters = listOf(
        methodCall(
            definingClass = "LA1/S;",
            name = "K",
        ),
    ),
)

// Exact first design from the supplied Keyboard Designer export.
// The design itself is named "Pokemon Types" in that export.
private const val POKEGENIE_DESIGN_JSON = """{"Name":"Pokemon Types","Type":0,"JDID":0,"Rows":4,"BSpa":91,"HiPo":25,"HiLa":35,"STPe":100,"STTi":250,"DHol":210,"FoSi":50,"KWPe":4,"ID":"975a084d-9f0e-49d0-84b4-161b533c747c","SySh":"|||||||||||||||||||||||||||||||","RCoP":23,"CoBa":"#FFFFFF","CoPo":"#FFFFFF","CoUn":"#F44336","KSKe":{"Back":"#D0D7DF","Fore":"#000000","SubF":"#B59184","BoBo":"#808080"},"KSPo":{"Back":"#D0D7DF","Fore":"#000000","SubF":"#B59184","BoBo":"#808080"},"KSMa":{"Back":"#36474F","Fore":"#FFFFFF","SubF":"#141432"},"Magn":{"Heig":100,"WiCh":100,"WiCu":50,"WiBo":8,"FoSi":100,"Usag":0,"TBRC":30,"CuCu":"#DC0A28","FChU":0,"FChD":0,"FCuU":0,"FCuD":0},"WoBa":{"Posi":0,"Heig":100,"FoSi":100,"SeWi":100,"LaSi":100,"TeNO":"#FF4444","TeMi":"#4444FF","LaOK":"#44FF44","LaNO":"#FF4444","LaTe":"#FFFFFF","AKLa":{"PRNO":{"Type":2},"HOOK":{"Type":9},"HONO":{"Type":9}},"AKSu":{"PROK":{"Type":5},"PRNO":{"Type":5},"HOOK":{"Type":3},"HONO":{"Type":3},"DOOK":{"Type":4},"DONO":{"Type":4}},"AKCu":{"Keys":[]},"Sett":"0|0|0|1|1|1|0|0|0|0||60|60|100|0"},"EmSe":{"CoCB":{"CoCo":"#FFFFFF32"},"AcWi":75,"FHSi":110,"SkSe":true,"SyDL":"232B"},"Modes":[{"Name":"Default","JMID":0,"PoTe":true}],"Keys":[{"ColN":0,"RowN":0,"Colo":{"Back":"#FFFFFF","Fore":"#91A3AA","SubF":"#B59184","BoTo":"#91A3AA|","BoRi":"#91A3AA","BoBo":"#91A3AA","BoLe":"#91A3AA"},"FuPr":[{"JMID":0,"FTyp":8,"Symb":"FFE9FFE9","Outp":"FFE9FFE9","OMov":8}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":1,"RowN":0,"FuPr":[{"JMID":0,"SyOu":"278D"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":2,"RowN":0,"FuPr":[{"JMID":0,"SyOu":"2605"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":3,"RowN":0,"FuPr":[{"JMID":0,"SyOu":"2606"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":4,"RowN":0,"Colo":{"Back":"#FFFFFF","Fore":"#91A3AA","SubF":"#B59184","BoTo":"#91A3AA","BoRi":"#91A3AA","BoBo":"#91A3AA","BoLe":"#91A3AA"},"FuPr":[{"JMID":0,"PopK":{"Rows":3,"Keys":[{"ColN":0,"RowN":0,"Func":{"JMID":-2,"SyOu":"2087"}},{"ColN":1,"RowN":0,"Func":{"JMID":-2,"SyOu":"208A"}},{"ColN":2,"RowN":0,"Func":{"JMID":-2,"SyOu":"002E"}},{"ColN":0,"RowN":1,"Func":{"JMID":-2,"SyOu":"2084"}},{"ColN":1,"RowN":1,"Func":{"JMID":-2,"SyOu":"2085"}},{"ColN":2,"RowN":1,"Func":{"JMID":-2,"SyOu":"2086"}},{"ColN":0,"RowN":2,"Func":{"JMID":-2,"SyOu":"2081"}},{"ColN":1,"RowN":2,"Func":{"JMID":-2,"SyOu":"2082"}},{"ColN":2,"RowN":2,"Func":{"JMID":-2,"SyOu":"2083"}}]},"FTyp":5,"Symb":"5#10121","Outp":"5#10121"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":5,"RowN":0,"FuPr":[{"JMID":0,"FTyp":4,"Symb":"232B","Outp":"232B","ODel":0}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":0,"RowN":1,"Colo":{"Back":"#9D9F9E","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"2609"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":1,"RowN":1,"Colo":{"Back":"#B763CD","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"1E8D"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":2,"RowN":1,"Colo":{"Back":"#FC8A8A","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"0ED1"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":3,"RowN":1,"Colo":{"Back":"#CDC18D","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"2617"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":4,"RowN":1,"Colo":{"Back":"#5499A4","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"25A8"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":5,"RowN":1,"Colo":{"Back":"#62AADC","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"2F2E"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":0,"RowN":2,"Colo":{"Back":"#FFA44F","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"098C"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":1,"RowN":2,"Colo":{"Back":"#9AB5E5","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"0C6F"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":2,"RowN":2,"Colo":{"Back":"#666DC1","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"2020"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":3,"RowN":2,"Colo":{"Back":"#5DC06A","Fore":"#FFFFFF","SubF":"#009184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"273F"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":4,"RowN":2,"Colo":{"Back":"#D58957","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"23DA"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":5,"RowN":2,"Colo":{"Back":"#82D4CA","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"2042"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":0,"RowN":3,"Colo":{"Back":"#9EC431","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"0C25"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":1,"RowN":3,"Colo":{"Back":"#666676","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"25D0"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":2,"RowN":3,"Colo":{"Back":"#0675BD","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"BFC5"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":3,"RowN":3,"Colo":{"Back":"#F6D85A","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"03DF"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":4,"RowN":3,"Colo":{"Back":"#ED9CE6","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"2661"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]},{"ColN":5,"RowN":3,"Colo":{"Back":"#D4435B","Fore":"#FFFFFF","SubF":"#B59184","BoBo":"#808080"},"FuPr":[{"JMID":0,"SyOu":"30E1"}],"FuHo":[],"FuUp":[],"FuRi":[],"FuDo":[],"FuLe":[],"FuUR":[],"FuDR":[],"FuDL":[],"FuUL":[],"FuTo":[],"FuCC":[],"FuCW":[],"FuLK":[],"FuLO":[]}]}"""

private fun String.toSmaliStringLiteral(): String =
    replace("\\", "\\\\")
        .replace("\"", "\\\"")
        .replace("\n", "\\n")
        .replace("\r", "\\r")

@Suppress("unused")
val startWithPokeGenieKeyboardPatch = bytecodePatch(
    name = "Start with PokeGenie keyboard",
    description = "Adds my PokeGenie-inspired keyboard design on fresh setup and makes it the portrait text-input default.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_KEYBOARD_DESIGNER)

    execute {
        val fingerprint = StarterTemplateBuilderFingerprint
        val method = fingerprint.method
        val matches = fingerprint.instructionMatches

        if (matches.size < 3) {
            throw PatchException(
                "Could not locate the Keyboard Designer starter-template transaction. " +
                    "Refusing to patch an unexpected build."
            )
        }

        val beginTransactionIndex = matches[0].index
        val firstStockSaveIndex = matches[1].index
        val returnIndex = matches[2].index

        if (beginTransactionIndex >= firstStockSaveIndex || firstStockSaveIndex >= returnIndex) {
            throw PatchException(
                "Unexpected starter-template instruction order; refusing to patch."
            )
        }

        val json = POKEGENIE_DESIGN_JSON.toSmaliStringLiteral()
        val helperName = "patch_addPokeGenieKeyboard"
        val helperDescriptor = "${fingerprint.classDef.type}->$helperName()V"

        // Keep all temporary values out of U0.j(). The first draft reused v0/v1
        // in that method, but v1 participates in later Boolean control flow and
        // Android's verifier correctly rejected the resulting register merge.
        if (fingerprint.classDef.methods.any { it.name == helperName && it.parameterTypes.isEmpty() }) {
            throw PatchException("PokeGenie helper method already exists; refusing to patch twice.")
        }

        fingerprint.classDef.methods.add(
            ImmutableMethod(
                fingerprint.classDef.type,
                helperName,
                listOf(),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        const-string v0, "$json"
                        new-instance v1, Lorg/json/JSONObject;
                        invoke-direct { v1, v0 }, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
                        const/4 v2, 0x0
                        invoke-static { v1, v2, v2 }, Lu1/H;->P1(Lorg/json/JSONObject;ZZ)LA1/I;
                        move-result-object v1

                        # P1() does not reliably preserve the imported portrait-text
                        # usage assignment during starter seeding, so set it explicitly
                        # on the imported design's first/default mode and persist it.
                        invoke-virtual { v1 }, LA1/I;->R()LA1/S;
                        move-result-object v0
                        const/4 v2, 0x1
                        invoke-virtual { v0, v2 }, LA1/S;->K(Z)V
                        invoke-static { v0, v2 }, Lu1/H;->k3(LA1/S;Z)V
                        return-void
                    """.trimIndent(),
                )
            },
        )

        // One register-free call inside the original starter builder. This does
        // not change the builder's register types, locals, return value, or
        // existing control flow.
        method.addInstructions(
            beginTransactionIndex + 1,
            "invoke-static {}, $helperDescriptor",
        )

        // The stock index-0 template (Example - Lowercase letters) is built by
        // U0.u(String, boolean, boolean). Its single S.K(Z) call sets the field
        // later persisted by H.k3() as Mode.isPortraitText. Disable that one
        // assignment so the stock example cannot overwrite Pokemon Types.
        val lowercaseFingerprint = LowercaseExamplePortraitTextFingerprint
        val portraitSetterMatches = lowercaseFingerprint.instructionMatches
        if (portraitSetterMatches.size != 1) {
            throw PatchException(
                "Expected exactly one portrait-text assignment in the lowercase starter template, " +
                    "found ${portraitSetterMatches.size}. Refusing to patch an unexpected build."
            )
        }

        lowercaseFingerprint.method.replaceInstruction(
            portraitSetterMatches.single().index,
            "nop",
        )
    }
}
