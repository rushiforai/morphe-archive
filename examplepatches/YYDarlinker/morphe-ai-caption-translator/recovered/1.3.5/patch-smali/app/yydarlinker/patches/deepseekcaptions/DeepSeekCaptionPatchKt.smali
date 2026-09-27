.class public final Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt;
.super Ljava/lang/Object;
.source "DeepSeekCaptionPatch.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDeepSeekCaptionPatch.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DeepSeekCaptionPatch.kt\napp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,120:1\n296#2:121\n1739#2:122\n1814#2,3:123\n1739#2:126\n1814#2,3:127\n297#2:130\n*S KotlinDebug\n*F\n+ 1 DeepSeekCaptionPatch.kt\napp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt\n*L\n59#1:121\n62#1:122\n62#1:123,3\n63#1:126\n63#1:127,3\n59#1:130\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u0017\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0004\u0010\u0005\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "EXTENSION_CLASS",
        "",
        "deepSeekChineseCaptionsPatch",
        "Lapp/morphe/patcher/patch/BytecodePatch;",
        "getDeepSeekChineseCaptionsPatch$annotations",
        "()V",
        "getDeepSeekChineseCaptionsPatch",
        "()Lapp/morphe/patcher/patch/BytecodePatch;",
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
.field private static final EXTENSION_CLASS:Ljava/lang/String; = "Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;"

.field private static final deepSeekChineseCaptionsPatch:Lapp/morphe/patcher/patch/BytecodePatch;


# direct methods
.method public static synthetic $r8$lambda$1XFJeKCHzlYJji-zAqME1GhoIB4(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt;->deepSeekChineseCaptionsPatch$lambda$0$0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 4

    .line 22
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt$0;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt$0;-><init>()V

    const-string v1, "AI caption translator"

    const-string v2, "Translates every YouTube Auto-translate language in real time through your OpenAI-compatible API."

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v0}, Lapp/morphe/patcher/patch/PatchKt;->bytecodePatch(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lapp/morphe/patcher/patch/BytecodePatch;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt;->deepSeekChineseCaptionsPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    return-void
.end method

.method static final deepSeekChineseCaptionsPatch$lambda$0(Lapp/morphe/patcher/patch/BytecodePatchBuilder;)Lkotlin/Unit;
    .registers 5

    const-string v0, "$this$bytecodePatch"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 27
    new-array v1, v0, [Lapp/morphe/patcher/patch/Compatibility;

    sget-object v2, Lapp/yydarlinker/patches/shared/Constants;->INSTANCE:Lapp/yydarlinker/patches/shared/Constants;

    invoke-virtual {v2}, Lapp/yydarlinker/patches/shared/Constants;->getYOUTUBE()Lapp/morphe/patcher/patch/Compatibility;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p0, v1}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->compatibleWith([Lapp/morphe/patcher/patch/Compatibility;)V

    const/4 v1, 0x3

    .line 28
    new-array v1, v1, [Lapp/morphe/patcher/patch/Patch;

    invoke-static {}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;->getCaptionSupportPatch()Lapp/morphe/patcher/patch/BytecodePatch;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->getDeepSeekCaptionResourcePatch()Lapp/morphe/patcher/patch/ResourcePatch;

    move-result-object v2

    aput-object v2, v1, v0

    const/4 v0, 0x2

    invoke-static {}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->getCaptionResourceMappingPatch()Lapp/morphe/patcher/patch/ResourcePatch;

    move-result-object v2

    aput-object v2, v1, v0

    invoke-virtual {p0, v1}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->dependsOn([Lapp/morphe/patcher/patch/Patch;)V

    .line 30
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt$1;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt$1;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/BytecodePatchBuilder;->execute(Lkotlin/jvm/functions/Function1;)V

    .line 119
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final deepSeekChineseCaptionsPatch$lambda$0$0(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lkotlin/Unit;
    .registers 18

    move-object/from16 v0, p0

    const-string v1, "$this$execute"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    sget-object v1, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->setAi(Z)V

    .line 34
    sget-object v1, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    sget-object v3, Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;

    invoke-virtual {v3, v0}, Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;->getMethod(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    move-result-object v3

    .line 36
    const-string v4, "invoke-static/range { p0 .. p0 }, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->setMainActivity(Landroid/app/Activity;)V"

    const/4 v5, 0x0

    .line 34
    invoke-virtual {v1, v3, v5, v4}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 43
    sget-object v1, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    new-instance v6, Lapp/morphe/patcher/Fingerprint;

    const/4 v3, 0x2

    .line 45
    new-array v4, v3, [Lcom/android/tools/smali/dexlib2/AccessFlags;

    sget-object v7, Lcom/android/tools/smali/dexlib2/AccessFlags;->PUBLIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    aput-object v7, v4, v5

    sget-object v7, Lcom/android/tools/smali/dexlib2/AccessFlags;->FINAL:Lcom/android/tools/smali/dexlib2/AccessFlags;

    aput-object v7, v4, v2

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    .line 47
    sget-object v4, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;

    invoke-virtual {v4, v0}, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;->getOriginalClassDef(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lcom/android/tools/smali/dexlib2/iface/ClassDef;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/tools/smali/dexlib2/iface/ClassDef;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const/16 v15, 0xe2

    const/16 v16, 0x0

    .line 43
    const-string v7, "/YouTubePlayerOverlaysLayout;"

    const/4 v8, 0x0

    const-string v10, "V"

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v6 .. v16}, Lapp/morphe/patcher/Fingerprint;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 48
    invoke-virtual {v6, v0}, Lapp/morphe/patcher/Fingerprint;->getMethod(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    move-result-object v4

    .line 50
    const-string v6, "invoke-static { p1 }, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->onPlayerType(Ljava/lang/Enum;)V"

    .line 48
    invoke-virtual {v1, v4, v5, v6}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 57
    sget-object v1, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;

    invoke-virtual {v1, v0}, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;->getInstructionMatches(Lapp/morphe/patcher/patch/BytecodePatchContext;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/morphe/patcher/Match$InstructionMatch;

    invoke-virtual {v1}, Lapp/morphe/patcher/Match$InstructionMatch;->getInstruction()Lcom/android/tools/smali/dexlib2/iface/instruction/Instruction;

    move-result-object v1

    const-string v4, "null cannot be cast to non-null type com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Lcom/android/tools/smali/dexlib2/iface/instruction/ReferenceInstruction;

    .line 58
    invoke-interface {v1}, Lcom/android/tools/smali/dexlib2/iface/instruction/ReferenceInstruction;->getReference()Lcom/android/tools/smali/dexlib2/iface/reference/Reference;

    move-result-object v1

    .line 57
    const-string v4, "null cannot be cast to non-null type com.android.tools.smali.dexlib2.iface.reference.MethodReference"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Lcom/android/tools/smali/dexlib2/iface/reference/MethodReference;

    .line 59
    invoke-interface {v1}, Lcom/android/tools/smali/dexlib2/iface/reference/MethodReference;->getDefiningClass()Ljava/lang/String;

    move-result-object v4

    const-string v5, "getDefiningClass(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lapp/morphe/patcher/patch/BytecodePatchContext;->mutableClassDefBy(Ljava/lang/String;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;

    move-result-object v4

    invoke-virtual {v4}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .line 121
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_8d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_122

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 60
    invoke-virtual {v6}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1}, Lcom/android/tools/smali/dexlib2/iface/reference/MethodReference;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8d

    .line 61
    invoke-virtual {v6}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getReturnType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1}, Lcom/android/tools/smali/dexlib2/iface/reference/MethodReference;->getReturnType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8d

    .line 62
    invoke-virtual {v6}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getParameterTypes()Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    .line 122
    new-instance v7, Ljava/util/ArrayList;

    const/16 v8, 0xa

    invoke-static {v6, v8}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v7, v9}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v7, Ljava/util/Collection;

    .line 123
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_d5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_e9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 124
    check-cast v9, Ljava/lang/CharSequence;

    .line 62
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 124
    invoke-interface {v7, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_d5

    .line 125
    :cond_e9
    check-cast v7, Ljava/util/List;

    .line 63
    invoke-interface {v1}, Lcom/android/tools/smali/dexlib2/iface/reference/MethodReference;->getParameterTypes()Ljava/util/List;

    move-result-object v6

    const-string v9, "getParameterTypes(...)"

    invoke-static {v6, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v6, Ljava/lang/Iterable;

    .line 126
    new-instance v9, Ljava/util/ArrayList;

    invoke-static {v6, v8}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v9, v8}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v9, Ljava/util/Collection;

    .line 127
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_105
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_119

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 128
    check-cast v8, Ljava/lang/CharSequence;

    .line 63
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .line 128
    invoke-interface {v9, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_105

    .line 129
    :cond_119
    check-cast v9, Ljava/util/List;

    .line 62
    invoke-static {v7, v9}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8d

    goto :goto_123

    :cond_122
    const/4 v5, 0x0

    .line 59
    :goto_123
    check-cast v5, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    if-eqz v5, :cond_1f1

    .line 65
    sget-object v1, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    .line 67
    const-string v4, "invoke-static { p1, p2 }, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->onVideoTime(J)V"

    .line 65
    invoke-virtual {v1, v5, v3, v4}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 73
    sget-object v1, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;

    invoke-virtual {v1, v0}, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;->getMethod(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    move-result-object v1

    .line 74
    sget-object v3, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;

    invoke-virtual {v3, v0}, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;->getInstructionMatches(Lapp/morphe/patcher/patch/BytecodePatchContext;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/morphe/patcher/Match$InstructionMatch;

    invoke-virtual {v3}, Lapp/morphe/patcher/Match$InstructionMatch;->getIndex()I

    move-result v3

    .line 75
    sget-object v4, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    invoke-virtual {v4, v1, v3}, Lapp/morphe/patcher/extensions/InstructionExtensions;->getInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/tools/smali/dexlib2/iface/instruction/OneRegisterInstruction;

    invoke-interface {v4}, Lcom/android/tools/smali/dexlib2/iface/instruction/OneRegisterInstruction;->getRegisterA()I

    move-result v4

    .line 76
    sget-object v5, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    add-int/2addr v3, v2

    .line 78
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "invoke-static { v"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " }, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->onVideoId(Ljava/lang/String;)V"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 76
    invoke-virtual {v5, v1, v3, v4}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 87
    sget-object v1, Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;

    .line 88
    invoke-virtual {v1, v0}, Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;->getMethod(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    move-result-object v3

    .line 89
    invoke-virtual {v1, v0}, Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;->getInstructionMatches(Lapp/morphe/patcher/patch/BytecodePatchContext;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/morphe/patcher/Match$InstructionMatch;

    invoke-virtual {v1}, Lapp/morphe/patcher/Match$InstructionMatch;->getIndex()I

    move-result v1

    .line 90
    sget-object v4, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    invoke-virtual {v4, v3, v1}, Lapp/morphe/patcher/extensions/InstructionExtensions;->getInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/tools/smali/dexlib2/iface/instruction/TwoRegisterInstruction;

    invoke-interface {v4}, Lcom/android/tools/smali/dexlib2/iface/instruction/TwoRegisterInstruction;->getRegisterA()I

    move-result v4

    .line 91
    sget-object v5, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    add-int/2addr v1, v2

    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " }, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->onNativeCaptionButtonController(Landroid/widget/ImageView;)V"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 91
    invoke-virtual {v5, v3, v1, v2}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 103
    sget-object v1, Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;

    invoke-virtual {v1, v0}, Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;->getMethod(Lapp/morphe/patcher/patch/BytecodePatchContext;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    move-result-object v1

    .line 104
    sget-object v2, Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;

    invoke-virtual {v2, v0}, Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;->getInstructionMatches(Lapp/morphe/patcher/patch/BytecodePatchContext;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/morphe/patcher/Match$InstructionMatch;

    invoke-virtual {v0}, Lapp/morphe/patcher/Match$InstructionMatch;->getIndex()I

    move-result v0

    .line 105
    sget-object v2, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    invoke-virtual {v2, v1, v0}, Lapp/morphe/patcher/extensions/InstructionExtensions;->getInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/tools/smali/dexlib2/iface/instruction/FiveRegisterInstruction;

    .line 106
    invoke-interface {v2}, Lcom/android/tools/smali/dexlib2/iface/instruction/FiveRegisterInstruction;->getRegisterC()I

    move-result v3

    .line 107
    invoke-interface {v2}, Lcom/android/tools/smali/dexlib2/iface/instruction/FiveRegisterInstruction;->getRegisterD()I

    move-result v2

    .line 108
    sget-object v4, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    .line 112
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\n                    invoke-static { v"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", v"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " }, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->rewriteUrl(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;\n                    move-result-object v"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\n                "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 108
    invoke-virtual {v4, v1, v0, v2}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstructions(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 116
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 64
    :cond_1f1
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    const-string v1, "Could not resolve YouTube player time callback"

    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final getDeepSeekChineseCaptionsPatch()Lapp/morphe/patcher/patch/BytecodePatch;
    .registers 1

    .line 22
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatchKt;->deepSeekChineseCaptionsPatch:Lapp/morphe/patcher/patch/BytecodePatch;

    return-object v0
.end method

.method public static synthetic getDeepSeekChineseCaptionsPatch$annotations()V
    .registers 0

    return-void
.end method
