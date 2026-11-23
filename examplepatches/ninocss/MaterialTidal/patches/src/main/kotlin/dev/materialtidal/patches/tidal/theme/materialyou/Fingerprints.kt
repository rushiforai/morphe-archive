package dev.materialtidal.patches.tidal.theme.materialyou

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object ComposeColorIntFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/graphics/ColorKt;",
    name = "Color",
    parameters = listOf("I"),
    returnType = "J",
)

internal object ComposeColorLongFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/graphics/ColorKt;",
    name = "Color",
    parameters = listOf("J"),
    returnType = "J",
)

internal object ComposeBackgroundColorFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/foundation/BackgroundKt;",
    name = "background-bw27NRU",
    parameters = listOf(
        "Landroidx/compose/ui/Modifier;",
        "J",
        "Landroidx/compose/ui/graphics/Shape;",
    ),
    returnType = "Landroidx/compose/ui/Modifier;",
)

internal object ComposeBackgroundNodeDrawRectFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/foundation/BackgroundNode;",
    name = "drawRect",
    parameters = listOf("Landroidx/compose/ui/graphics/drawscope/ContentDrawScope;"),
    returnType = "V",
)

internal object ComposeBackgroundNodeDrawOutlineFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/foundation/BackgroundNode;",
    name = "drawOutline",
    parameters = listOf("Landroidx/compose/ui/graphics/drawscope/ContentDrawScope;"),
    returnType = "V",
)

internal object AndroidComposeViewDispatchDrawFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/platform/AndroidComposeView;",
    name = "dispatchDraw",
    parameters = listOf("Landroid/graphics/Canvas;"),
    returnType = "V",
)

internal object Material3ScaffoldFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/ScaffoldKt;",
    name = "Scaffold-TvnljyQ",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/compose/material3/SurfaceKt;",
            name = "Surface-T9BRK9s",
            returnType = "V",
        ),
    ),
)

internal object MyCollectionScreenScaffoldFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("com.aspiro.wamp.mycollectionscreen.presentation.MyCollectionScreen.<anonymous> (MyCollectionScreen.kt:115)"),
    ),
)

internal object MyCollectionTopBarFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/mycollectionscreen/presentation/MyCollectionScreenKt;",
    returnType = "V",
    filters = listOf(
        string("com.aspiro.wamp.mycollectionscreen.presentation.MyCollectionTopBar (MyCollectionScreen.kt:410)"),
    ),
)

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

internal object MainFragmentPresenterReplaceFingerprint : Fingerprint(
    parameters = listOf("Landroid/os/Bundle;", "Landroid/content/Intent;", "Z"),
    returnType = "V",
    filters = listOf(
        string("key:enterAnimation"),
        string("key:exitAnimation"),
        string("key:popEnterAnimation"),
        string("key:popExitAnimation"),
        methodCall(
            definingClass = "Landroidx/fragment/app/FragmentTransaction;",
            name = "setCustomAnimations",
            parameters = listOf("I", "I", "I", "I"),
            returnType = "Landroidx/fragment/app/FragmentTransaction;",
        ),
    ),
)

internal object GraphicsLayerV29InitFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/graphics/layer/GraphicsLayerV29;",
    name = "<init>",
    parameters = listOf(
        "J",
        "Landroidx/compose/ui/graphics/CanvasHolder;",
        "Landroidx/compose/ui/graphics/drawscope/CanvasDrawScope;",
    ),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/graphics/RenderNode;",
            name = "setClipToBounds",
            parameters = listOf("Z"),
            returnType = "Z",
        ),
    ),
)

internal object HomeScreenFragmentOnCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/features/home/HomeScreenFragment;",
    name = "onCreateView",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;",
    ),
    returnType = "Landroid/view/View;",
)

internal object HomeScreenFragmentOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/features/home/HomeScreenFragment;",
    name = "onResume",
    parameters = emptyList(),
    returnType = "V",
)

internal object HomeScreenFragmentCurrentClickedFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/features/home/HomeScreenFragment;",
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/aspiro/wamp/features/home/HomeScreenFragment\$currentClicked\$1;",
            name = "<init>",
        ),
    ),
)

internal object MyCollectionScreenFragmentOnCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/mycollectionscreen/presentation/MyCollectionScreenFragment;",
    name = "onCreateView",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;",
    ),
    returnType = "Landroid/view/View;",
)

internal object MyCollectionScreenFragmentOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/mycollectionscreen/presentation/MyCollectionScreenFragment;",
    name = "onResume",
    parameters = emptyList(),
    returnType = "V",
)

internal object MyCollectionContentFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/mycollectionscreen/presentation/MyCollectionScreenKt;",
    returnType = "V",
    filters = listOf(
        string("com.aspiro.wamp.mycollectionscreen.presentation.MyCollectionContent (MyCollectionScreen.kt:159)"),
        methodCall(
            definingClass = "Landroidx/compose/foundation/ScrollKt;",
            name = "verticalScroll\$default",
        ),
    ),
)

internal object MarketColorToStringFingerprint : Fingerprint(
    name = "toString",
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("MarketColor(hex="),
    ),
)

internal object MarketBorderRadiiBuilderFingerprint : Fingerprint(
    parameters = listOf("Lcom/squareup/ui/market/core/theme/MarketStylesheet;"),
    returnType = "Lcom/squareup/ui/market/core/theme/MarketStylesheet\$b;",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/squareup/ui/model/resources/a;",
            name = "b",
            parameters = listOf("I"),
            returnType = "Lcom/squareup/ui/model/resources/FixedDimen;",
        ),
    ),
)

internal object Wave2CornerRadiusesInitFingerprint : Fingerprint(
    name = "<init>",
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/compose/ui/unit/Dp;",
            name = "constructor-impl",
            parameters = listOf("F"),
            returnType = "F",
        ),
    ),
    custom = { method, classDef ->
        if (classDef.fields.count { it.type == "F" } != 8) {
            false
        } else {
            val insns = method.implementation?.instructions ?: emptyList()
            insns.count { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/ui/unit/Dp;" &&
                            it.name == "constructor-impl" &&
                            it.parameterTypes == listOf("F")
                    } == true
            } == 8
        }
    },
)

internal object Wave1RadiusClinitFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/wave/designtokens/WaveRadius;",
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/compose/ui/unit/Dp;",
            name = "constructor-impl",
            parameters = listOf("F"),
            returnType = "F",
        ),
    ),
)
