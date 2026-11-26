package app.bin0culars.patches.reddit.layout.glassnav

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TAB_LABEL_EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/GlassTabLabel;"
private const val SHAPE_CORNER_RADIUS_LITERAL = 0x40000000

private fun findShapeFactoryRef(site: TabIndicatorSites): MethodReference? =
    site.classDef.methods.firstOrNull { m ->
        (m.accessFlags and AccessFlags.STATIC.value) != 0 &&
            m.implementation != null &&
            m.name == site.methodName &&
            m.returnType == "V" &&
            m.parameterTypes.map { it.toString() } == site.paramTypes
    }?.implementation?.instructions?.toList()?.let { instructions ->
        val twoDpIndex = instructions.indexOfFirst { inst ->
            inst is NarrowLiteralInstruction && inst.narrowLiteral == SHAPE_CORNER_RADIUS_LITERAL
        }
        val start = if (twoDpIndex >= 0) twoDpIndex + 1 else 0
        (start until instructions.size).firstNotNullOfOrNull { idx ->
            val inst = instructions[idx]
            val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
            (if (isStatic) (inst as? ReferenceInstruction)?.reference as? MethodReference else null)
                ?.takeIf { ref ->
                    ref.parameterTypes.singleOrNull()?.toString() == "F" && ref.returnType.startsWith("L")
                }
        }
    }

internal fun hookTopTabsShape(sites: TopTabsSites): Boolean {
    val ref = sites.indicatorSites?.let(::findShapeFactoryRef) ?: return false
    fillBridge(
        "roundedCornerShape",
        """
            invoke-static { p0 }, ${ref.toSmali()}
            move-result-object p0
            return-object p0
        """,
        extensionClass = TAB_LABEL_EXTENSION_CLASS,
    )
    return true
}
