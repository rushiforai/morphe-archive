.class public final Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;
.super Ljava/lang/Object;
.source "CaptionResourceMapping.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a\u0018\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0002H\u0002\u001a\u0018\u0010\t\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0002H\u0002\u001a\"\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u000c\u001a\u00020\rH\u0000\"*\u0010\u0000\u001a\u001e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001j\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003`\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u0014\u0010\u000e\u001a\u00020\u000fX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "captionResourceIds",
        "Ljava/util/HashMap;",
        "",
        "",
        "Lkotlin/collections/HashMap;",
        "key",
        "type",
        "Lapp/yydarlinker/patches/shared/CaptionResourceType;",
        "name",
        "captionResourceId",
        "captionResourceLiteral",
        "Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;",
        "location",
        "Lapp/morphe/patcher/InstructionLocation;",
        "captionResourceMappingPatch",
        "Lapp/morphe/patcher/patch/ResourcePatch;",
        "getCaptionResourceMappingPatch",
        "()Lapp/morphe/patcher/patch/ResourcePatch;",
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
.field private static final captionResourceIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final captionResourceMappingPatch:Lapp/morphe/patcher/patch/ResourcePatch;


# direct methods
.method public static synthetic $r8$lambda$pNf2VcSKIxOeJbGFh56CIf0xgAg(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceMappingPatch$lambda$0$0(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 7

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceIds:Ljava/util/HashMap;

    .line 85
    new-instance v4, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt$1;

    invoke-direct {v4}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt$1;-><init>()V

    const/4 v5, 0x7

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lapp/morphe/patcher/patch/PatchKt;->resourcePatch$default(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lapp/morphe/patcher/patch/ResourcePatch;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceMappingPatch:Lapp/morphe/patcher/patch/ResourcePatch;

    return-void
.end method

.method public static final synthetic access$captionResourceId(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceId(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final captionResourceId(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;)J
    .registers 5

    .line 63
    sget-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceIds:Ljava/util/HashMap;

    invoke-static {p0, p1}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->key(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    .line 64
    :cond_13
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not find resource type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " name: "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final captionResourceLiteral(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;Lapp/morphe/patcher/InstructionLocation;)Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;
    .registers 4

    const-string v0, "type"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "location"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    new-instance v0, Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;

    invoke-direct {v0, p0, p1, p2}, Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;-><init>(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;Lapp/morphe/patcher/InstructionLocation;)V

    return-object v0
.end method

.method public static synthetic captionResourceLiteral$default(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;
    .registers 5

    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_b

    .line 81
    new-instance p2, Lapp/morphe/patcher/InstructionLocation$MatchAfterAnywhere;

    invoke-direct {p2}, Lapp/morphe/patcher/InstructionLocation$MatchAfterAnywhere;-><init>()V

    check-cast p2, Lapp/morphe/patcher/InstructionLocation;

    .line 78
    :cond_b
    invoke-static {p0, p1, p2}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceLiteral(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;Lapp/morphe/patcher/InstructionLocation;)Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;

    move-result-object p0

    return-object p0
.end method

.method static final captionResourceMappingPatch$lambda$0(Lapp/morphe/patcher/patch/ResourcePatchBuilder;)Lkotlin/Unit;
    .registers 2

    const-string v0, "$this$resourcePatch"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    new-instance v0, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt$0;

    invoke-direct {v0}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt$0;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/ResourcePatchBuilder;->execute(Lkotlin/jvm/functions/Function1;)V

    .line 104
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final captionResourceMappingPatch$lambda$0$0(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .registers 12

    const-string v0, "$this$execute"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    sget-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceIds:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 88
    new-instance v0, Ljava/io/FileInputStream;

    const-string v1, "res/values/public.xml"

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {p0, v1, v2, v3, v4}, Lapp/morphe/patcher/patch/ResourcePatchContext;->get$default(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;ZILjava/lang/Object;)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    check-cast v0, Ljava/io/InputStream;

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/ResourcePatchContext;->document(Ljava/io/InputStream;)Lapp/morphe/patcher/util/Document;

    move-result-object p0

    check-cast p0, Ljava/io/Closeable;

    :try_start_20
    move-object v0, p0

    check-cast v0, Lapp/morphe/patcher/util/Document;

    .line 89
    invoke-virtual {v0}, Lapp/morphe/patcher/util/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 90
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    move v5, v2

    :goto_30
    if-ge v5, v1, :cond_a8

    .line 91
    invoke-interface {v0, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    instance-of v7, v6, Lorg/w3c/dom/Element;

    if-eqz v7, :cond_3d

    check-cast v6, Lorg/w3c/dom/Element;

    goto :goto_3e

    :cond_3d
    move-object v6, v4

    :goto_3e
    if-nez v6, :cond_41

    goto :goto_a5

    .line 92
    :cond_41
    invoke-interface {v6}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "public"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a5

    .line 93
    const-string v7, "type"

    invoke-interface {v6, v7}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 94
    sget-object v8, Lapp/yydarlinker/patches/shared/CaptionResourceType;->STRING:Lapp/yydarlinker/patches/shared/CaptionResourceType;

    invoke-virtual {v8}, Lapp/yydarlinker/patches/shared/CaptionResourceType;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a5

    .line 95
    const-string v7, "name"

    invoke-interface {v6, v7}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 96
    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v8, "APKTOOL"

    invoke-static {v7, v8, v2, v3, v4}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a5

    .line 97
    const-string v8, "id"

    invoke-interface {v6, v8}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 98
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v8, "0x"

    invoke-static {v6, v8, v2, v3, v4}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a5

    .line 99
    sget-object v8, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceIds:Ljava/util/HashMap;

    check-cast v8, Ljava/util/Map;

    sget-object v9, Lapp/yydarlinker/patches/shared/CaptionResourceType;->STRING:Lapp/yydarlinker/patches/shared/CaptionResourceType;

    invoke-static {v9, v7}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->key(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 100
    invoke-virtual {v6, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    const-string v9, "substring(...)"

    invoke-static {v6, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v9, 0x10

    invoke-static {v9}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v9

    invoke-static {v6, v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v8, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a5
    :goto_a5
    add-int/lit8 v5, v5, 0x1

    goto :goto_30

    .line 102
    :cond_a8
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_aa
    .catchall {:try_start_20 .. :try_end_aa} :catchall_b0

    .line 88
    invoke-static {p0, v4}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 103
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    :catchall_b0
    move-exception v0

    .line 88
    :try_start_b1
    throw v0
    :try_end_b2
    .catchall {:try_start_b1 .. :try_end_b2} :catchall_b2

    :catchall_b2
    move-exception v1

    invoke-static {p0, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static final getCaptionResourceMappingPatch()Lapp/morphe/patcher/patch/ResourcePatch;
    .registers 1

    .line 85
    sget-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceMappingPatch:Lapp/morphe/patcher/patch/ResourcePatch;

    return-object v0
.end method

.method private static final key(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 60
    invoke-virtual {p0}, Lapp/yydarlinker/patches/shared/CaptionResourceType;->getValue()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
