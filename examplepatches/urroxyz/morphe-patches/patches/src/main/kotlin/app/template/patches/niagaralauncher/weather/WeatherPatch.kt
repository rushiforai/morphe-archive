package app.template.patches.niagaralauncher.weather

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BRIDGE = "Lapp/template/extension/niagaralauncher/WeatherBridge;"
private const val UI = "Lapp/template/extension/niagaralauncher/WeatherUi;"
private val fetch = Fingerprint(
    definingClass = "Lb/WrrLXgzk3axe3mBBg2DwqCOQH6b9e;",
    name = "doHBdXEMpYkIEKA",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

@Suppress("unused")
val weatherPatch = bytecodePatch(
    name = "Custom weather sources",
    description = "Native weather settings, ordered/aggregated providers and customizable JSON mappings. Exact 1.16.31 build.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Niagara Launcher",
            packageName = "bitpit.launcher",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x333333,
            targets = listOf(AppTarget(version = "1.16.31", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 2147483647))),
        ),
    )
    extendWith("extensions/extension.mpe")

    execute {
        fun method(owner: String, name: String, returns: String, parameters: List<String>? = null) =
            Fingerprint(definingClass = owner, name = name, returnType = returns, parameters = parameters)
                .match(classDefBy(owner)).method

        val body = fetch.match(classDefBy("Lb/WrrLXgzk3axe3mBBg2DwqCOQH6b9e;")).method
        // Upgrade either previously released v1 namespace without leaving a hidden provider fallback.
        val instructions = body.implementation!!.instructions.toList()
        val reference = (instructions.firstOrNull() as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.name == "intercept" && reference.definingClass in setOf(
                "Lxyz/urro/weather/WeatherFallback;",
                "Lapp/template/extension/niagaralauncher/WeatherFallback;",
            )) {
            check(instructions.take(5).map { it.opcode }.drop(1) == listOf(
                Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.RETURN_OBJECT, Opcode.NOP,
            )) { "Unrecognized previous weather hook; refusing to stack controllers" }
            body.removeInstructions(0, 5)
        }
        check(body.implementation!!.registerCount >= 4)
        body.addInstructions(0, """
            invoke-static/range {p0 .. p0}, $BRIDGE->handles(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original_coroutine_case
            invoke-static/range {p0 .. p0}, $BRIDGE->fetch(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
            :original_coroutine_case
            nop
        """.trimIndent())

        val managerConstructor = method("Lb/i0kfSh06lAigj1s5Hvp6T3CCdkB;", "<init>", "V")
        for ((index, _) in managerConstructor.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.asReversed()) {
            managerConstructor.addInstructions(index, "invoke-static/range {p0 .. p0}, $BRIDGE->rememberManager(Ljava/lang/Object;)V")
        }
        val constructor = method("Lb/ECiCO2MjHbpJR21iITVcKsXsh;", "<init>", "V")
        for ((index, _) in constructor.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.asReversed()) {
            constructor.addInstructions(index, "invoke-static/range {p0 .. p0}, $UI->remember(Ljava/lang/Object;)V")
        }
        val open = method("Lb/ECiCO2MjHbpJR21iITVcKsXsh;", "UztznoJ3Uzs44xWBGv2j6WRw8Rs", "V", emptyList())
        check(open.implementation!!.registerCount >= 2)
        open.addInstructions(0, """
            invoke-static/range {p0 .. p0}, $UI->interceptOpen(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original_weather_options
            return-void
            :original_weather_options
            nop
        """.trimIndent())

        val preference = method("Lb/HNoJKpzTWNC68PLhE;", "aJjcCDwdQ7n", "V", listOf("Lb/jPpbnQHvdQGvrqmc;"))
        preference.addInstructions(0, """
            invoke-static/range {p0 .. p1}, $UI->preference(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
            check-cast p1, Lb/jPpbnQHvdQGvrqmc;
        """.trimIndent())
        method("Lb/RgvZIVX2a5f6sv9p19Jzru4gJ;", "aJjcCDwdQ7n", "Lb/oEhlkwunHRP1AMTbpEvxe;",
            listOf("Lbitpit/launcher/settings/SettingsActivity;", "Lb/HNoJKpzTWNC68PLhE;"))
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $UI->settings(Ljava/lang/Object;)V")

        val agenda = method("Lb/pOuJM1Q98Uur;", "QZzYk7GYe8gePBkQzv", "Ljava/lang/Object;", emptyList())
        check(agenda.implementation!!.registerCount >= 2)
        agenda.addInstructions(0, """
            invoke-static/range {p0 .. p0}, $BRIDGE->agenda(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """.trimIndent())

        // -1 marks a missing probability only at the native boundary; never show it as 0%.
        val probability = method("Lb/dIkLl9r3B4e;", "cileMK8iL9T", "Ljava/lang/String;", listOf("F", "Z"))
        check(probability.implementation!!.registerCount >= 3)
        probability.addInstructions(0, """
            const/4 v0, 0x0
            cmpg-float v0, p0, v0
            if-gez v0, :known_probability
            const/4 v0, 0x0
            return-object v0
            :known_probability
            nop
        """.trimIndent())
    }
}
