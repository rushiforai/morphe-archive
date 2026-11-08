package app.polishapps.patches.orange.dashboard

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.cloneMutable
import app.polishapps.patches.shared.Constants.COMPATIBILITY_MOJ_ORANGE
import app.polishapps.patches.shared.replaceBody

internal const val EXTENSION_CLASS = "Lapp/polishapps/extension/orange/DashboardItemsPatch;"
private const val RAW_TYPE_SOURCE = "Lapp/polishapps/extension/orange/DashboardItemsPatch\$RawItemViewTypeSource;"
private const val RAW_TYPE_METHOD = "polishappsRawItemViewType"
private const val MVX_RECYCLER_ADAPTER = "Lmvvmcross/droidx/recyclerview/MvxRecyclerAdapter;"

internal fun BytecodePatchContext.setExtensionConstant(method: String, value: Int) {
    val extension = mutableClassDefBy(EXTENSION_CLASS)
    val target = extension.methods.singleOrNull { it.name == method && it.parameters.isEmpty() }
        ?: throw PatchException("$EXTENSION_CLASS->$method not found")
    target.replaceBody(
        """
            const v0, $value
            return v0
        """,
    )
}

internal fun BytecodePatchContext.setLayoutId(method: String, layout: String) =
    setExtensionConstant(method, resourceId(ResourceType.LAYOUT, layout).toInt())

internal val dashboardItemsHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_MOJ_ORANGE)

    extendWith("extensions/extension.mpe")

    execute {
        val adapter = mutableClassDefBy(MVX_RECYCLER_ADAPTER)
        val getItemViewType = adapter.methods.singleOrNull { method ->
            method.name == "getItemViewType" &&
                method.parameterTypes.map { it.toString() } == listOf("I") &&
                method.returnType == "I"
        } ?: throw PatchException("$MVX_RECYCLER_ADAPTER->getItemViewType(I)I not found")

        adapter.methods.add(getItemViewType.cloneMutable(name = RAW_TYPE_METHOD))
        adapter.interfaces.add(RAW_TYPE_SOURCE)

        getItemViewType.replaceBody(
            """
                invoke-static {p0, p1}, $EXTENSION_CLASS->getItemViewType(Ljava/lang/Object;I)I
                move-result p1
                return p1
            """,
        )

        setLayoutId("invisibleLayout", "template_invisible")
    }
}
