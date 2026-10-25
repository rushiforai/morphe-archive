package app.template.patches.firefox.misc.tabs

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.returnEarly
import app.template.patches.firefox.shared.concreteMethod
import app.template.patches.firefox.shared.firefoxClass
import app.template.patches.firefox.shared.readClass
import app.template.patches.firefox.shared.settingsGetter
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val INSTANCE_INFO = "Lorg/mozilla/gecko/process/ServiceAllocator\$InstanceInfo;"
internal const val PRIORITY_LEVEL = "Lorg/mozilla/gecko/process/ServiceAllocator\$PriorityLevel;"
internal const val GECKO_PROCESS_TYPE = "Lorg/mozilla/gecko/process/GeckoProcessType;"
internal val CONTENT_PROCESS_TYPES = listOf("CONTENT", "CONTENT_ISOLATED", "CONTENT_ISOLATED_WITH_ZYGOTE")
internal const val KEEP_LOADED_HELPER = "morpheKeepContentProcessPriority"

@Suppress("unused")
val keepBackgroundTabsLoadedPatch = bytecodePatch(
    name = "Keep background tabs loaded",
    description = "Experimental: keeps background tabs loaded so they reload less often. Uses more memory.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        // ── 1. Content processes never drop below BACKGROUND ────────────────────────────────
        //  GeckoView binds each child process service with its PriorityLevel's flag; IDLE is
        //  BIND_WAIVE_PRIORITY, which lets Android kill a background tab's process first. Every
        //  priority change goes through InstanceInfo.setPriorityLevel(PriorityLevel, I) (the
        //  1-argument overload was inlined into it). setPriorityLevel has no locals, so a new
        //  static helper maps IDLE to BACKGROUND for the content process types and is called at
        //  entry: p1 = helper(this, p1).
        val geckoProcessType = readClass(GECKO_PROCESS_TYPE)
        val priorityLevel = readClass(PRIORITY_LEVEL)
        CONTENT_PROCESS_TYPES.forEach { name ->
            if (geckoProcessType.fields.none { it.name == name && it.type == GECKO_PROCESS_TYPE }) {
                throw PatchException("$GECKO_PROCESS_TYPE has no $name")
            }
        }
        listOf("IDLE", "BACKGROUND").forEach { name ->
            if (priorityLevel.fields.none { it.name == name && it.type == PRIORITY_LEVEL }) {
                throw PatchException("$PRIORITY_LEVEL has no $name")
            }
        }
        val instanceInfo = firefoxClass(INSTANCE_INFO)
        if (instanceInfo.fields.none { it.name == "mType" && it.type == GECKO_PROCESS_TYPE }) {
            throw PatchException("$INSTANCE_INFO has no mType")
        }

        // v0 = process type / IDLE, v1 = scratch, p0 (v2) = the InstanceInfo, p1 (v3) = the level.
        val contentChecks = CONTENT_PROCESS_TYPES.joinToString("\n") { name ->
            """
                sget-object v1, $GECKO_PROCESS_TYPE->$name:$GECKO_PROCESS_TYPE
                if-eq v0, v1, :content
            """.trimIndent()
        }
        val helper = ImmutableMethod(
            INSTANCE_INFO,
            KEEP_LOADED_HELPER,
            listOf(ImmutableMethodParameter(INSTANCE_INFO, null, null), ImmutableMethodParameter(PRIORITY_LEVEL, null, null)),
            PRIORITY_LEVEL,
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable().apply {
            addInstructionsWithLabelsChecked(
                0,
                """
                    iget-object v0, p0, $INSTANCE_INFO->mType:$GECKO_PROCESS_TYPE
                    $contentChecks
                    return-object p1
                    :content
                    sget-object v0, $PRIORITY_LEVEL->IDLE:$PRIORITY_LEVEL
                    if-ne p1, v0, :keep
                    sget-object p1, $PRIORITY_LEVEL->BACKGROUND:$PRIORITY_LEVEL
                    :keep
                    return-object p1
                """.trimIndent(),
            )
        }
        instanceInfo.methods.add(helper)

        concreteMethod(INSTANCE_INFO, "setPriorityLevel", listOf(PRIORITY_LEVEL, "I")).addInstructionsChecked(
            0,
            """
                invoke-static {p0, p1}, $INSTANCE_INFO->$KEEP_LOADED_HELPER($INSTANCE_INFO$PRIORITY_LEVEL)$PRIORITY_LEVEL
                move-result-object p1
            """,
        )

        // ── 2. A reloading tab shows its last screenshot until the page paints ──────────────
        settingsGetter("getTabReloadCoverEnabled").returnEarly(true)
    }
}
