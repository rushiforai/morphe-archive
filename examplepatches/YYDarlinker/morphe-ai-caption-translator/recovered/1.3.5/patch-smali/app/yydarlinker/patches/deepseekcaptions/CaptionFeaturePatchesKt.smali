.class public final Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;
.super Ljava/lang/Object;
.source "CaptionFeaturePatches.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCaptionFeaturePatches.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CaptionFeaturePatches.kt\napp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt\n+ 2 Patch.kt\napp/morphe/patcher/patch/BytecodePatchBuilder\n*L\n1#1,41:1\n627#2,10:42\n*S KotlinDebug\n*F\n+ 1 CaptionFeaturePatches.kt\napp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt\n*L\n11#1:42,10\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0003\"\u0017\u0010\u0004\u001a\u00020\u0001\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0003\"\u0017\u0010\u0008\u001a\u00020\u0001\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\t\u0010\u0006\u001a\u0004\u0008\n\u0010\u0003\u00a8\u0006\u000b"
    }
    d2 = {
        "captionSupportPatch",
        "Lapp/morphe/patcher/patch/BytecodePatch;",
        "getCaptionSupportPatch",
        "()Lapp/morphe/patcher/patch/BytecodePatch;",
        "simplifiedCaptionLanguagePatch",
        "getSimplifiedCaptionLanguagePatch$annotations",
        "()V",
        "getSimplifiedCaptionLanguagePatch",
        "rememberCaptionSelectionPatch",
        "getRememberCaptionSelectionPatch$annotations",
        "getRememberCaptionSelectionPatch",
        "app.yydarlinker:patches"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final captionSupportPatch:Lapp/morphe/patcher/patch/BytecodePatch;

.field private static final rememberCaptionSelectionPatch:Lapp/morphe/patcher/patch/BytecodePatch;

.field private static final simplifiedCaptionLanguagePatch:Lapp/morphe/patcher/patch/BytecodePatch;


# direct methods
.method public static synthetic $r8$lambda$7qBC1mQPzPyYODmxBnv-ipwdhIc(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->simplifiedCaptionLanguagePatch$lambda$0$0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$USANNr3wGCqqhyjqbJJcnEBorHs(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->captionSupportPatch$lambda$0$1(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$WW8PMZrp50C9x8GjsjISP8nATO0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->rememberCaptionSelectionPatch$lambda$0$0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$hN7QvVyh63eVEMRyhogcPGdSj0E(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->captionSupportPatch$lambda$0$0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 6

    .line 9
    new-instance v3, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$3;

    invoke-direct {v3}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$3;-><init>()V

    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static/range {v0 .. v5}, Lapp/morphe/patcher/patch/PatchKt;->bytecodePatch$default(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lapp/morphe/patcher/patch/BytecodePatch;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->captionSupportPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    .line 21
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$4;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$4;-><init>()V

    const-string v1, "Add Simplified Chinese to auto-translate"

    const-string v2, "Adds Simplified Chinese using the app\'s localized language ordering. Works with native YouTube captions without AI."

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v0}, Lapp/morphe/patcher/patch/PatchKt;->bytecodePatch(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lapp/morphe/patcher/patch/BytecodePatch;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->simplifiedCaptionLanguagePatch:Lapp/morphe/patcher/patch/BytecodePatch;

    .line 32
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$5;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$5;-><init>()V

    const-string v1, "Remember caption selection"

    const-string v2, "Remembers caption language, source/translation mode and on/off selection across videos for this app session, with or without AI."

    invoke-static {v1, v2, v3, v0}, Lapp/morphe/patcher/patch/PatchKt;->bytecodePatch(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lapp/morphe/patcher/patch/BytecodePatch;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->rememberCaptionSelectionPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    return-void
.end method

.method static final captionSupportPatch$lambda$0(Lapp/morphe/patcher/patch/BytecodePatchBuilder;)Lkotlin/Unit;
    .registers 4

    const-string v0, "$this$bytecodePatch"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 10
    new-array v0, v0, [Lapp/morphe/patcher/patch/Patch;

    const/4 v1, 0x0

    invoke-static {}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->getCaptionLocalizationPatch()Lapp/morphe/patcher/patch/ResourcePatch;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->dependsOn([Lapp/morphe/patcher/patch/Patch;)V

    .line 43
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$1;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$1;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 47
    new-instance v1, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;

    const-string v2, "extensions/extension.mpe"

    invoke-direct {v1, v0, v2}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;-><init>(Ljava/lang/ClassLoader;Ljava/lang/String;)V

    check-cast v1, Ljava/util/function/Supplier;

    invoke-virtual {p0, v1}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->setExtensionInputStream(Ljava/util/function/Supplier;)V

    .line 12
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$0;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$0;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->execute(Lkotlin/jvm/functions/Function1;)V

    .line 17
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$1;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$1;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->finalize(Lkotlin/jvm/functions/Function1;)V

    .line 18
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final captionSupportPatch$lambda$0$0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 4

    const-string v0, "$this$execute"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->setAi(Z)V

    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    invoke-virtual {v0, v1}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->setSimplified(Z)V

    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    invoke-virtual {v0, v1}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->setMemory(Z)V

    .line 14
    sget-object v0, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    sget-object v2, Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;

    invoke-virtual {v2, p0}, Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;->getMethod(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    move-result-object p0

    .line 15
    const-string v2, "invoke-static/range {p0 .. p0}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->initialize(Landroid/app/Activity;)V"

    .line 14
    invoke-virtual {v0, p0, v1, v2}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 16
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final captionSupportPatch$lambda$0$1(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 4

    const-string v0, "$this$finalize"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    invoke-virtual {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->getAi()Z

    move-result v0

    sget-object v1, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    invoke-virtual {v1}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->getSimplified()Z

    move-result v1

    sget-object v2, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    invoke-virtual {v2}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->getMemory()Z

    move-result v2

    invoke-static {p0, v0, v1, v2}, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt;->installNativeCaptionBridge(Lapp/morphe/patcher/patch/BytecodePatchContext;ZZZ)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public static final getCaptionSupportPatch()Lapp/morphe/patcher/patch/BytecodePatch;
    .registers 1

    .line 9
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->captionSupportPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    return-object v0
.end method

.method public static final getRememberCaptionSelectionPatch()Lapp/morphe/patcher/patch/BytecodePatch;
    .registers 1

    .line 32
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->rememberCaptionSelectionPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    return-object v0
.end method

.method public static synthetic getRememberCaptionSelectionPatch$annotations()V
    .registers 0

    return-void
.end method

.method public static final getSimplifiedCaptionLanguagePatch()Lapp/morphe/patcher/patch/BytecodePatch;
    .registers 1

    .line 21
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->simplifiedCaptionLanguagePatch:Lapp/morphe/patcher/patch/BytecodePatch;

    return-object v0
.end method

.method public static synthetic getSimplifiedCaptionLanguagePatch$annotations()V
    .registers 0

    return-void
.end method

.method static final rememberCaptionSelectionPatch$lambda$0(Lapp/morphe/patcher/patch/BytecodePatchBuilder;)Lkotlin/Unit;
    .registers 5

    const-string v0, "$this$bytecodePatch"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 37
    new-array v1, v0, [Lapp/morphe/patcher/patch/Compatibility;

    sget-object v2, Lapp/yydarlinker/patches/shared/Constants;->INSTANCE:Lapp/yydarlinker/patches/shared/Constants;

    invoke-virtual {v2}, Lapp/yydarlinker/patches/shared/Constants;->getYOUTUBE()Lapp/morphe/patcher/patch/Compatibility;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p0, v1}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->compatibleWith([Lapp/morphe/patcher/patch/Compatibility;)V

    .line 38
    new-array v0, v0, [Lapp/morphe/patcher/patch/Patch;

    sget-object v1, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->captionSupportPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->dependsOn([Lapp/morphe/patcher/patch/Patch;)V

    .line 39
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$2;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$2;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->execute(Lkotlin/jvm/functions/Function1;)V

    .line 40
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final rememberCaptionSelectionPatch$lambda$0$0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 2

    const-string v0, "$this$execute"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    sget-object p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->setMemory(Z)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final simplifiedCaptionLanguagePatch$lambda$0(Lapp/morphe/patcher/patch/BytecodePatchBuilder;)Lkotlin/Unit;
    .registers 5

    const-string v0, "$this$bytecodePatch"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 26
    new-array v1, v0, [Lapp/morphe/patcher/patch/Compatibility;

    sget-object v2, Lapp/yydarlinker/patches/shared/Constants;->INSTANCE:Lapp/yydarlinker/patches/shared/Constants;

    invoke-virtual {v2}, Lapp/yydarlinker/patches/shared/Constants;->getYOUTUBE()Lapp/morphe/patcher/patch/Compatibility;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p0, v1}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->compatibleWith([Lapp/morphe/patcher/patch/Compatibility;)V

    .line 27
    new-array v0, v0, [Lapp/morphe/patcher/patch/Patch;

    sget-object v1, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->captionSupportPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->dependsOn([Lapp/morphe/patcher/patch/Patch;)V

    .line 28
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$6;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$6;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->execute(Lkotlin/jvm/functions/Function1;)V

    .line 29
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final simplifiedCaptionLanguagePatch$lambda$0$0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 2

    const-string v0, "$this$execute"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    sget-object p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->setSimplified(Z)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
