package io.github.liongalahad.stremio.patches.addonreordering

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method

private fun Method.parameters() = parameterTypes.map(CharSequence::toString)

internal object AddonItemSelectedFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/stremio/tv/views/addons/AddonsFragment;" &&
            method.name == "onViewCreated\$lambda\$1" &&
            method.parameters() == listOf(
                "Lcom/stremio/tv/views/addons/AddonsFragment;",
                "Landroidx/leanback/widget/Presenter\$ViewHolder;",
                "Ljava/lang/Object;",
                "Landroidx/leanback/widget/RowPresenter\$ViewHolder;",
                "Landroidx/leanback/widget/Row;"
            )
    }
)

internal object AddonItemClickedFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/stremio/tv/views/addons/AddonsFragment;" &&
            method.name == "onViewCreated\$lambda\$2" &&
            method.parameters() == listOf(
                "Lcom/stremio/tv/views/addons/AddonsFragment;",
                "Landroidx/leanback/widget/Presenter\$ViewHolder;",
                "Ljava/lang/Object;",
                "Landroidx/leanback/widget/RowPresenter\$ViewHolder;",
                "Landroidx/leanback/widget/Row;"
            )
    }
)

internal object AddonBackPressedFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type ==
            "Lcom/stremio/tv/views/addons/AddonsFragment\$backPressedCallback\$1;" &&
            method.name == "handleOnBackPressed" && method.parameters().isEmpty()
    }
)
