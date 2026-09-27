.class public final Lapp/yydarlinker/patches/deepseekcaptions/CaptionQuickTogglePatchKt;
.super Ljava/lang/Object;
.source "CaptionQuickTogglePatch.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCaptionQuickTogglePatch.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CaptionQuickTogglePatch.kt\napp/yydarlinker/patches/deepseekcaptions/CaptionQuickTogglePatchKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,70:1\n672#2,4:71\n1739#2:75\n1814#2,3:76\n676#2,7:79\n672#2,4:86\n1739#2:90\n1814#2,3:91\n676#2,7:94\n2945#2,3:101\n2945#2,3:104\n363#2,7:107\n296#2,2:114\n629#2,12:116\n629#2,12:128\n1739#2:140\n1814#2,3:141\n629#2,12:144\n*S KotlinDebug\n*F\n+ 1 CaptionQuickTogglePatch.kt\napp/yydarlinker/patches/deepseekcaptions/CaptionQuickTogglePatchKt\n*L\n24#1:71,4\n24#1:75\n24#1:76,3\n24#1:79,7\n26#1:86,4\n26#1:90\n26#1:91,3\n26#1:94,7\n38#1:101,3\n41#1:104,3\n47#1:107,7\n51#1:114,2\n58#1:116,12\n64#1:128,12\n65#1:140\n65#1:141,3\n33#1:144,12\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u000c\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000\u00a8\u0006\u0003"
    }
    d2 = {
        "installCaptionQuickToggle",
        "",
        "Lapp/morphe/patcher/patch/BytecodePatchContext;",
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


# direct methods
.method public static final installCaptionQuickToggle(Lapp/morphe/patcher/patch/BytecodePatchContext;)V
    .registers 26

    move-object/from16 v0, p0

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    const-string v1, "Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;"

    invoke-virtual {v0, v1}, Lapp/morphe/patcher/patch/BytecodePatchContext;->mutableClassDefBy(Ljava/lang/String;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;

    move-result-object v1

    .line 21
    const-string v2, "Lapp/morphe/extension/youtube/patches/components/PlayerFlyoutMenuComponentsFilter;"

    invoke-virtual {v0, v2}, Lapp/morphe/patcher/patch/BytecodePatchContext;->mutableClassDefBy(Ljava/lang/String;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;

    move-result-object v2

    .line 22
    const-string v3, "Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;"

    invoke-virtual {v0, v3}, Lapp/morphe/patcher/patch/BytecodePatchContext;->mutableClassDefBy(Ljava/lang/String;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;

    move-result-object v3

    .line 24
    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .line 73
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v6, 0x0

    move v7, v6

    const/4 v8, 0x0

    :cond_26
    :goto_26
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    const-string v10, "Ljava/lang/String;"

    const/16 v11, 0xa

    const-string v13, "Ljava/lang/Object;"

    if-eqz v9, :cond_8a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 74
    move-object v14, v9

    check-cast v14, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 24
    invoke-virtual {v14}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v5, "addFlyoutButton"

    invoke-static {v15, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_26

    invoke-virtual {v14}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getParameterTypes()Ljava/util/List;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    .line 75
    new-instance v14, Ljava/util/ArrayList;

    invoke-static {v5, v11}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v14, Ljava/util/Collection;

    .line 76
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_6e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 77
    check-cast v15, Ljava/lang/CharSequence;

    .line 24
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    .line 77
    invoke-interface {v14, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_5a

    .line 78
    :cond_6e
    check-cast v14, Ljava/util/List;

    .line 24
    const-string v5, "Landroid/view/View$OnClickListener;"

    const-string v15, "I"

    const-string v12, "Landroid/graphics/drawable/Drawable;"

    filled-new-array {v13, v12, v10, v5, v15}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-static {v14, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_26

    if-eqz v7, :cond_87

    goto :goto_8c

    :cond_87
    move-object v8, v9

    const/4 v7, 0x1

    goto :goto_26

    :cond_8a
    if-nez v7, :cond_8d

    :goto_8c
    const/4 v8, 0x0

    :cond_8d
    check-cast v8, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    if-eqz v8, :cond_4a5

    .line 26
    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .line 88
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v5, v6

    const/4 v7, 0x0

    :cond_9d
    :goto_9d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_f1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 89
    move-object v12, v9

    check-cast v12, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 26
    invoke-virtual {v12}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "addFlyoutElements"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_9d

    invoke-virtual {v12}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getParameterTypes()Ljava/util/List;

    move-result-object v12

    check-cast v12, Ljava/lang/Iterable;

    .line 90
    new-instance v14, Ljava/util/ArrayList;

    invoke-static {v12, v11}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v14, Ljava/util/Collection;

    .line 91
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_cb
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_df

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 92
    check-cast v15, Ljava/lang/CharSequence;

    .line 26
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    .line 92
    invoke-interface {v14, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_cb

    .line 93
    :cond_df
    check-cast v14, Ljava/util/List;

    .line 26
    invoke-static {v13}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-static {v14, v12}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9d

    if-eqz v5, :cond_ee

    goto :goto_f3

    :cond_ee
    move-object v7, v9

    const/4 v5, 0x1

    goto :goto_9d

    :cond_f1
    if-nez v5, :cond_f4

    :goto_f3
    const/4 v7, 0x0

    :cond_f4
    check-cast v7, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    if-eqz v7, :cond_49d

    .line 29
    sget-object v4, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->Companion:Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod$Companion;

    new-instance v16, Lcom/android/tools/smali/dexlib2/immutable/ImmutableMethod;

    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v8}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getParameters()Ljava/util/List;

    move-result-object v5

    move-object/from16 v19, v5

    check-cast v19, Ljava/lang/Iterable;

    invoke-virtual {v8}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getReturnType()Ljava/lang/String;

    move-result-object v20

    sget-object v5, Lcom/android/tools/smali/dexlib2/AccessFlags;->PUBLIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    invoke-virtual {v5}, Lcom/android/tools/smali/dexlib2/AccessFlags;->getValue()I

    move-result v5

    sget-object v9, Lcom/android/tools/smali/dexlib2/AccessFlags;->STATIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    invoke-virtual {v9}, Lcom/android/tools/smali/dexlib2/AccessFlags;->getValue()I

    move-result v9

    or-int v21, v5, v9

    new-instance v5, Lcom/android/tools/smali/dexlib2/builder/MutableMethodImplementation;

    const/4 v9, 0x6

    invoke-direct {v5, v9}, Lcom/android/tools/smali/dexlib2/builder/MutableMethodImplementation;-><init>(I)V

    move-object/from16 v24, v5

    check-cast v24, Lcom/android/tools/smali/dexlib2/iface/MethodImplementation;

    const-string v18, "addonCaptionButton"

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-direct/range {v16 .. v24}, Lcom/android/tools/smali/dexlib2/immutable/ImmutableMethod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/String;ILjava/util/Set;Ljava/util/Set;Lcom/android/tools/smali/dexlib2/iface/MethodImplementation;)V

    move-object/from16 v5, v16

    check-cast v5, Lcom/android/tools/smali/dexlib2/iface/Method;

    invoke-virtual {v4, v5}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod$Companion;->toMutable(Lcom/android/tools/smali/dexlib2/iface/Method;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    move-result-object v4

    .line 30
    sget-object v5, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getName()Ljava/lang/String;

    move-result-object v8

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "invoke-static/range {p0 .. p4}, "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "->"

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;I)I\nmove-result v0\nreturn v0"

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v4, v6, v8}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstructions(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 31
    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 37
    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "->addonCaptionButton(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;I)I\nmove-result v0\nreturn v0"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "addNativeRow"

    invoke-static {v3, v5, v4, v9}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionQuickTogglePatchKt;->installCaptionQuickToggle$bind(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;Ljava/lang/String;Ljava/lang/String;I)V

    .line 38
    invoke-virtual {v2}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .line 101
    instance-of v5, v4, Ljava/util/Collection;

    if-eqz v5, :cond_191

    move-object v5, v4

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_495

    .line 102
    :cond_191
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_195
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_495

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 38
    invoke-virtual {v5}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v8, "getTopFlyoutMenuVisible"

    invoke-static {v5, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_195

    .line 39
    invoke-virtual {v2}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v8, "invoke-static {}, "

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "->getTopFlyoutMenuVisible()Z\nmove-result v0\nreturn v0"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "topMenu"

    const/4 v9, 0x1

    invoke-static {v3, v5, v4, v9}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionQuickTogglePatchKt;->installCaptionQuickToggle$bind(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;Ljava/lang/String;Ljava/lang/String;I)V

    .line 40
    const-string v4, "Lapp/morphe/extension/youtube/shared/ShortsPlayerState;"

    invoke-virtual {v0, v4}, Lapp/morphe/patcher/patch/BytecodePatchContext;->classDefBy(Ljava/lang/String;)Lcom/android/tools/smali/dexlib2/iface/ClassDef;

    move-result-object v0

    .line 41
    invoke-interface {v0}, Lcom/android/tools/smali/dexlib2/iface/ClassDef;->getMethods()Ljava/lang/Iterable;

    move-result-object v4

    const-string v5, "getMethods(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    instance-of v5, v4, Ljava/util/Collection;

    if-eqz v5, :cond_1e6

    move-object v5, v4

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_48d

    .line 105
    :cond_1e6
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1ea
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_48d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/tools/smali/dexlib2/iface/Method;

    .line 41
    invoke-interface {v5}, Lcom/android/tools/smali/dexlib2/iface/Method;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v12, "isOpen"

    invoke-static {v9, v12}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48a

    sget-object v9, Lcom/android/tools/smali/dexlib2/AccessFlags;->STATIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    invoke-interface {v5}, Lcom/android/tools/smali/dexlib2/iface/Method;->getAccessFlags()I

    move-result v5

    invoke-virtual {v9, v5}, Lcom/android/tools/smali/dexlib2/AccessFlags;->isSet(I)Z

    move-result v5

    if-eqz v5, :cond_48a

    .line 42
    invoke-interface {v0}, Lcom/android/tools/smali/dexlib2/iface/ClassDef;->getType()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "->isOpen()Z\nmove-result v0\nreturn v0"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "shortsOpen"

    const/4 v9, 0x1

    invoke-static {v3, v4, v0, v9}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionQuickTogglePatchKt;->installCaptionQuickToggle$bind(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;Ljava/lang/String;Ljava/lang/String;I)V

    .line 43
    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "->dismissFlyout()V\nreturn-void"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "dismissNative"

    invoke-static {v3, v4, v0, v6}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionQuickTogglePatchKt;->installCaptionQuickToggle$bind(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;Ljava/lang/String;Ljava/lang/String;I)V

    .line 46
    invoke-virtual {v7}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getImplementation()Lcom/android/tools/smali/dexlib2/builder/MutableMethodImplementation;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/android/tools/smali/dexlib2/builder/MutableMethodImplementation;->getInstructions()Ljava/util/List;

    move-result-object v0

    const-string v4, "getInstructions(...)"

    invoke-static {v0, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 108
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v5, v6

    :goto_258
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_290

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 109
    check-cast v8, Lcom/android/tools/smali/dexlib2/builder/BuilderInstruction;

    .line 48
    instance-of v9, v8, Lcom/android/tools/smali/dexlib2/iface/instruction/ReferenceInstruction;

    if-eqz v9, :cond_26b

    check-cast v8, Lcom/android/tools/smali/dexlib2/iface/instruction/ReferenceInstruction;

    goto :goto_26c

    :cond_26b
    const/4 v8, 0x0

    :goto_26c
    if-eqz v8, :cond_273

    invoke-interface {v8}, Lcom/android/tools/smali/dexlib2/iface/instruction/ReferenceInstruction;->getReference()Lcom/android/tools/smali/dexlib2/iface/reference/Reference;

    move-result-object v8

    goto :goto_274

    :cond_273
    const/4 v8, 0x0

    :goto_274
    instance-of v9, v8, Lcom/android/tools/smali/dexlib2/iface/reference/MethodReference;

    if-eqz v9, :cond_27b

    check-cast v8, Lcom/android/tools/smali/dexlib2/iface/reference/MethodReference;

    goto :goto_27c

    :cond_27b
    const/4 v8, 0x0

    :goto_27c
    if-eqz v8, :cond_283

    invoke-interface {v8}, Lcom/android/tools/smali/dexlib2/iface/reference/MethodReference;->getName()Ljava/lang/String;

    move-result-object v8

    goto :goto_284

    :cond_283
    const/4 v8, 0x0

    :goto_284
    const-string v9, "addDivider"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_28d

    goto :goto_291

    :cond_28d
    add-int/lit8 v5, v5, 0x1

    goto :goto_258

    :cond_290
    const/4 v5, -0x1

    :goto_291
    const/4 v9, 0x1

    if-lt v5, v9, :cond_482

    sub-int/2addr v5, v9

    .line 51
    invoke-static {v5, v6}, Lkotlin/ranges/RangesKt;->downTo(II)Lkotlin/ranges/IntProgression;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .line 114
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_29f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2bf

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    .line 51
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/tools/smali/dexlib2/builder/BuilderInstruction;

    invoke-virtual {v8}, Lcom/android/tools/smali/dexlib2/builder/BuilderInstruction;->getOpcode()Lcom/android/tools/smali/dexlib2/Opcode;

    move-result-object v8

    sget-object v9, Lcom/android/tools/smali/dexlib2/Opcode;->IF_LEZ:Lcom/android/tools/smali/dexlib2/Opcode;

    if-ne v8, v9, :cond_29f

    goto :goto_2c0

    :cond_2bf
    const/4 v5, 0x0

    :goto_2c0
    check-cast v5, Ljava/lang/Integer;

    if-eqz v5, :cond_47a

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 53
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    const-string v8, "null cannot be cast to non-null type com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction"

    invoke-static {v5, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v5, Lcom/android/tools/smali/dexlib2/iface/instruction/OneRegisterInstruction;

    invoke-interface {v5}, Lcom/android/tools/smali/dexlib2/iface/instruction/OneRegisterInstruction;->getRegisterA()I

    move-result v5

    .line 54
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    const-string v8, "null cannot be cast to non-null type com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction"

    invoke-static {v0, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/android/tools/smali/dexlib2/builder/BuilderOffsetInstruction;

    invoke-virtual {v0}, Lcom/android/tools/smali/dexlib2/builder/BuilderOffsetInstruction;->getTarget()Lcom/android/tools/smali/dexlib2/builder/Label;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/tools/smali/dexlib2/builder/Label;->getLocation()Lcom/android/tools/smali/dexlib2/builder/MethodLocation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/tools/smali/dexlib2/builder/MethodLocation;->getInstruction()Lcom/android/tools/smali/dexlib2/iface/instruction/Instruction;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 56
    sget-object v8, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    invoke-virtual {v3}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v9

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "invoke-static {p0, v"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, "}, "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "->onMenu(Ljava/lang/Object;I)I"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v7, v4, v9}, Lapp/morphe/patcher/extensions/InstructionExtensions;->replaceInstruction(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    .line 57
    sget-object v8, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    const/4 v9, 0x1

    add-int/2addr v4, v9

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v14, "move-result v"

    invoke-direct {v12, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, "\nif-lez v"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", :after_divider"

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v12, v9, [Lapp/morphe/patcher/util/smali/ExternalLabel;

    new-instance v9, Lapp/morphe/patcher/util/smali/ExternalLabel;

    const-string v14, "after_divider"

    invoke-direct {v9, v14, v0}, Lapp/morphe/patcher/util/smali/ExternalLabel;-><init>(Ljava/lang/String;Lcom/android/tools/smali/dexlib2/iface/instruction/Instruction;)V

    aput-object v9, v12, v6

    invoke-virtual {v8, v7, v4, v5, v12}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstructionsWithLabels(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;[Lapp/morphe/patcher/util/smali/ExternalLabel;)V

    .line 58
    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 118
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v9, v6

    const/4 v4, 0x0

    :cond_34e
    :goto_34e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const-string v7, "Collection contains more than one matching element."

    if-eqz v5, :cond_374

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 119
    move-object v8, v5

    check-cast v8, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 58
    invoke-virtual {v8}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v12, "getFlyoutMenuInfo"

    invoke-static {v8, v12}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_34e

    if-nez v9, :cond_36e

    move-object v4, v5

    const/4 v9, 0x1

    goto :goto_34e

    .line 120
    :cond_36e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_374
    const-string v0, "Collection contains no element matching the predicate."

    if-eqz v9, :cond_474

    .line 58
    check-cast v4, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 59
    invoke-virtual {v4}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getAccessFlags()I

    move-result v5

    sget-object v8, Lcom/android/tools/smali/dexlib2/AccessFlags;->PRIVATE:Lcom/android/tools/smali/dexlib2/AccessFlags;

    invoke-virtual {v8}, Lcom/android/tools/smali/dexlib2/AccessFlags;->getValue()I

    move-result v8

    not-int v8, v8

    and-int/2addr v5, v8

    sget-object v8, Lcom/android/tools/smali/dexlib2/AccessFlags;->PUBLIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    invoke-virtual {v8}, Lcom/android/tools/smali/dexlib2/AccessFlags;->getValue()I

    move-result v8

    or-int/2addr v5, v8

    invoke-virtual {v4, v5}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->setAccessFlags(I)V

    .line 63
    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getReturnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getReturnType()Ljava/lang/String;

    move-result-object v4

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "const/4 v0, 0x0\ninvoke-static {p0, v0}, "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "->getFlyoutMenuInfo(Ljava/lang/Object;I)"

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nmove-result-object v0\nif-nez v0, :container\nconst/4 v0, 0x0\nreturn-object v0\n:container\ninvoke-virtual {v0}, "

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "->menuContainer()Landroid/widget/LinearLayout;\nmove-result-object v0\nreturn-object v0"

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x2

    const-string v5, "nativeContainer"

    invoke-static {v3, v5, v1, v4}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionQuickTogglePatchKt;->installCaptionQuickToggle$bind(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;Ljava/lang/String;Ljava/lang/String;I)V

    .line 64
    invoke-virtual {v2}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .line 130
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v9, v6

    const/4 v5, 0x0

    :cond_3d1
    :goto_3d1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3f5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 131
    move-object v4, v2

    check-cast v4, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 64
    invoke-virtual {v4}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v8, "isFiltered"

    invoke-static {v4, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3d1

    if-nez v9, :cond_3ef

    move-object v5, v2

    const/4 v9, 0x1

    goto :goto_3d1

    .line 132
    :cond_3ef
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3f5
    if-eqz v9, :cond_46e

    .line 64
    check-cast v5, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 65
    invoke-virtual {v5}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getParameterTypes()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 140
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0, v11}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v1, Ljava/util/Collection;

    .line 141
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_40e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_422

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 142
    check-cast v2, Ljava/lang/CharSequence;

    .line 65
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 142
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_40e

    .line 143
    :cond_422
    check-cast v1, Ljava/util/List;

    .line 66
    const-string v0, "[B"

    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v9, 0x1

    if-lt v0, v9, :cond_466

    add-int/lit8 v2, v0, -0x1

    .line 67
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_466

    .line 68
    sget-object v1, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v3}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "invoke-static/range {p"

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " .. p"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "->observeMenuPath(Ljava/lang/String;[B)V"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5, v6, v0}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstructions(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    return-void

    .line 67
    :cond_466
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    const-string v1, "AI quick toggle: menu path signal unavailable"

    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_46e
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 125
    :cond_474
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 52
    :cond_47a
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    const-string v1, "AI quick toggle: shared divider guard unavailable"

    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_482
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    const-string v1, "AI quick toggle: shared divider boundary unavailable"

    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_48a
    const/4 v9, 0x1

    goto/16 :goto_1ea

    .line 41
    :cond_48d
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    const-string v1, "AI quick toggle: Shorts state unavailable"

    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_495
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    const-string v1, "AI quick toggle: top-level menu signal missing"

    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_49d
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    const-string v1, "AI quick toggle: official menu binding unavailable"

    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_4a5
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    const-string v1, "AI quick toggle: official flyout inflater signature unavailable"

    invoke-direct {v0, v1}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static final installCaptionQuickToggle$bind(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 16

    .line 33
    invoke-virtual {p0}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 146
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v2

    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_31

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 147
    move-object v5, v4

    check-cast v5, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 33
    invoke-virtual {v5}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    if-nez v3, :cond_29

    const/4 v3, 0x1

    move-object v1, v4

    goto :goto_d

    .line 148
    :cond_29
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Collection contains more than one matching element."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_31
    if-eqz v3, :cond_77

    .line 33
    check-cast v1, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    .line 34
    sget-object v0, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->Companion:Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod$Companion;

    new-instance v3, Lcom/android/tools/smali/dexlib2/immutable/ImmutableMethod;

    invoke-virtual {p0}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getParameters()Ljava/util/List;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/Iterable;

    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getReturnType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getAccessFlags()I

    move-result v8

    invoke-virtual {v1}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;->getAnnotations()Ljava/util/Set;

    move-result-object v9

    new-instance v5, Lcom/android/tools/smali/dexlib2/builder/MutableMethodImplementation;

    invoke-direct {v5, p3}, Lcom/android/tools/smali/dexlib2/builder/MutableMethodImplementation;-><init>(I)V

    move-object v11, v5

    check-cast v11, Lcom/android/tools/smali/dexlib2/iface/MethodImplementation;

    const/4 v10, 0x0

    move-object v5, p1

    invoke-direct/range {v3 .. v11}, Lcom/android/tools/smali/dexlib2/immutable/ImmutableMethod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/String;ILjava/util/Set;Ljava/util/Set;Lcom/android/tools/smali/dexlib2/iface/MethodImplementation;)V

    check-cast v3, Lcom/android/tools/smali/dexlib2/iface/Method;

    invoke-virtual {v0, v3}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod$Companion;->toMutable(Lcom/android/tools/smali/dexlib2/iface/Method;)Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;

    move-result-object p1

    .line 35
    sget-object p3, Lapp/morphe/patcher/extensions/InstructionExtensions;->INSTANCE:Lapp/morphe/patcher/extensions/InstructionExtensions;

    invoke-virtual {p3, p1, v2, p2}, Lapp/morphe/patcher/extensions/InstructionExtensions;->addInstructions(Lapp/morphe/patcher/util/proxy/mutableTypes/MutableMethod;ILjava/lang/String;)V

    invoke-virtual {p0}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lapp/morphe/patcher/util/proxy/mutableTypes/MutableClass;->getMethods()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    .line 153
    :cond_77
    new-instance p0, Ljava/util/NoSuchElementException;

    const-string p1, "Collection contains no element matching the predicate."

    invoke-direct {p0, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
