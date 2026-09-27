.class public final Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;
.super Ljava/lang/Object;
.source "CaptionLocalizationPatch.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCaptionLocalizationPatch.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CaptionLocalizationPatch.kt\napp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,30:1\n1#2:31\n296#3,2:32\n*S KotlinDebug\n*F\n+ 1 CaptionLocalizationPatch.kt\napp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt\n*L\n27#1:32,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u001a\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005H\u0000\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0007"
    }
    d2 = {
        "captionLocalizationPatch",
        "Lapp/morphe/patcher/patch/ResourcePatch;",
        "getCaptionLocalizationPatch",
        "()Lapp/morphe/patcher/patch/ResourcePatch;",
        "captionResourceTitle",
        "",
        "value",
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
.field private static final captionLocalizationPatch:Lapp/morphe/patcher/patch/ResourcePatch;


# direct methods
.method public static synthetic $r8$lambda$XTS_ev7RF70W6SpDiP36L3DIMMs(Ljava/lang/String;)Z
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionLocalizationPatch$lambda$0$0$1(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$y3Tod4Aub9mTdrXZYX-k8nCk7V8(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionLocalizationPatch$lambda$0$0(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 6

    .line 5
    new-instance v3, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt$2;

    invoke-direct {v3}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt$2;-><init>()V

    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static/range {v0 .. v5}, Lapp/morphe/patcher/patch/PatchKt;->resourcePatch$default(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lapp/morphe/patcher/patch/ResourcePatch;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionLocalizationPatch:Lapp/morphe/patcher/patch/ResourcePatch;

    return-void
.end method

.method static final captionLocalizationPatch$lambda$0(Lapp/morphe/patcher/patch/ResourcePatchBuilder;)Lkotlin/Unit;
    .registers 2

    const-string v0, "$this$resourcePatch"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt$1;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt$1;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/ResourcePatchBuilder;->execute(Lkotlin/jvm/functions/Function1;)V

    .line 22
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final captionLocalizationPatch$lambda$0$0(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .registers 13

    const-string v0, "$this$execute"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 10
    const-string v1, "index.txt"

    invoke-static {v0, v1}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionLocalizationPatch$lambda$0$0$read(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->lineSequence(Ljava/lang/CharSequence;)Lkotlin/sequences/Sequence;

    move-result-object v1

    new-instance v2, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt$0;

    invoke-direct {v2}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt$0;-><init>()V

    invoke-static {v1, v2}, Lkotlin/sequences/SequencesKt;->filter(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v1

    invoke-interface {v1}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "res/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/strings.xml"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-static {p0, v3, v6, v7, v8}, Lapp/morphe/patcher/patch/ResourcePatchContext;->get$default(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;ZILjava/lang/Object;)Ljava/io/File;

    move-result-object v3

    .line 12
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    .line 13
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_60

    const-string v9, "<resources/>"

    invoke-static {v3, v9, v8, v7, v8}, Lkotlin/io/FilesKt;->writeText$default(Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;ILjava/lang/Object;)V

    .line 14
    :cond_60
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lapp/morphe/patcher/patch/ResourcePatchContext;->document(Ljava/lang/String;)Lapp/morphe/patcher/util/Document;

    move-result-object v3

    check-cast v3, Ljava/io/Closeable;

    :try_start_75
    move-object v4, v3

    check-cast v4, Lapp/morphe/patcher/util/Document;

    .line 15
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/caption_addon_strings.xml"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionLocalizationPatch$lambda$0$0$read(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v5, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v2, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    const-string v5, "getBytes(...)"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v7, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    check-cast v7, Ljava/io/InputStream;

    invoke-virtual {p0, v7}, Lapp/morphe/patcher/patch/ResourcePatchContext;->document(Ljava/io/InputStream;)Lapp/morphe/patcher/util/Document;

    move-result-object v2

    check-cast v2, Ljava/io/Closeable;
    :try_end_a5
    .catchall {:try_start_75 .. :try_end_a5} :catchall_da

    :try_start_a5
    move-object v5, v2

    check-cast v5, Lapp/morphe/patcher/util/Document;

    .line 16
    const-string v7, "string"

    invoke-virtual {v5, v7}, Lapp/morphe/patcher/util/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 17
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    :goto_b2
    if-ge v6, v7, :cond_c7

    invoke-virtual {v4}, Lapp/morphe/patcher/util/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v9

    invoke-interface {v5, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {v4, v10, v11}, Lapp/morphe/patcher/util/Document;->importNode(Lorg/w3c/dom/Node;Z)Lorg/w3c/dom/Node;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    add-int/lit8 v6, v6, 0x1

    goto :goto_b2

    .line 18
    :cond_c7
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_c9
    .catchall {:try_start_a5 .. :try_end_c9} :catchall_d3

    .line 15
    :try_start_c9
    invoke-static {v2, v8}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 19
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_ce
    .catchall {:try_start_c9 .. :try_end_ce} :catchall_da

    .line 14
    invoke-static {v3, v8}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    goto/16 :goto_28

    :catchall_d3
    move-exception p0

    .line 15
    :try_start_d4
    throw p0
    :try_end_d5
    .catchall {:try_start_d4 .. :try_end_d5} :catchall_d5

    :catchall_d5
    move-exception v0

    :try_start_d6
    invoke-static {v2, p0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_da
    .catchall {:try_start_d6 .. :try_end_da} :catchall_da

    :catchall_da
    move-exception p0

    .line 14
    :try_start_db
    throw p0
    :try_end_dc
    .catchall {:try_start_db .. :try_end_dc} :catchall_dc

    :catchall_dc
    move-exception v0

    invoke-static {v3, p0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    .line 21
    :cond_e1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final captionLocalizationPatch$lambda$0$0$1(Ljava/lang/String;)Z
    .registers 2

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    check-cast p0, Ljava/lang/CharSequence;

    invoke-static {p0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private static final captionLocalizationPatch$lambda$0$0$read(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "captionlocales/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    if-eqz p0, :cond_45

    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p0, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    check-cast v1, Ljava/io/Reader;

    instance-of p0, v1, Ljava/io/BufferedReader;

    if-eqz p0, :cond_24

    check-cast v1, Ljava/io/BufferedReader;

    goto :goto_2c

    :cond_24
    new-instance p0, Ljava/io/BufferedReader;

    const/16 v0, 0x2000

    invoke-direct {p0, v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    move-object v1, p0

    :goto_2c
    check-cast v1, Ljava/io/Closeable;

    :try_start_2e
    move-object p0, v1

    check-cast p0, Ljava/io/BufferedReader;

    check-cast p0, Ljava/io/Reader;

    invoke-static {p0}, Lkotlin/io/TextStreamsKt;->readText(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object p0
    :try_end_37
    .catchall {:try_start_2e .. :try_end_37} :catchall_3e

    const/4 v0, 0x0

    invoke-static {v1, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    if-eqz p0, :cond_45

    return-object p0

    :catchall_3e
    move-exception p0

    :try_start_3f
    throw p0
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_40

    :catchall_40
    move-exception p1

    invoke-static {v1, p0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p1

    :cond_45
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Caption locale resource missing: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final captionResourceTitle(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    const-string v0, "value"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const-string v1, "captionlocales/source-keys.tsv"

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_83

    .line 26
    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    check-cast v2, Ljava/io/Reader;

    instance-of v0, v2, Ljava/io/BufferedReader;

    if-eqz v0, :cond_27

    check-cast v2, Ljava/io/BufferedReader;

    goto :goto_2f

    :cond_27
    new-instance v0, Ljava/io/BufferedReader;

    const/16 v1, 0x2000

    invoke-direct {v0, v2, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    move-object v2, v0

    .line 25
    :goto_2f
    check-cast v2, Ljava/io/Closeable;

    .line 26
    :try_start_31
    move-object v0, v2

    check-cast v0, Ljava/io/BufferedReader;

    check-cast v0, Ljava/io/Reader;

    invoke-static {v0}, Lkotlin/io/TextStreamsKt;->readLines(Ljava/io/Reader;)Ljava/util/List;

    move-result-object v0
    :try_end_3a
    .catchall {:try_start_31 .. :try_end_3a} :catchall_7c

    const/4 v1, 0x0

    invoke-static {v2, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    if-eqz v0, :cond_83

    .line 27
    check-cast v0, Ljava/lang/Iterable;

    .line 32
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_46
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x2

    const/16 v4, 0x9

    if-eqz v2, :cond_61

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    .line 27
    invoke-static {v5, v4, v1, v3, v1}, Lkotlin/text/StringsKt;->substringBefore$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_46

    goto :goto_62

    :cond_61
    move-object v2, v1

    :goto_62
    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_83

    invoke-static {v2, v4, v1, v3, v1}, Lkotlin/text/StringsKt;->substringAfter$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_6d

    goto :goto_83

    .line 28
    :cond_6d
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "@string/"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catchall_7c
    move-exception p0

    .line 26
    :try_start_7d
    throw p0
    :try_end_7e
    .catchall {:try_start_7d .. :try_end_7e} :catchall_7e

    :catchall_7e
    move-exception v0

    invoke-static {v2, p0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :cond_83
    :goto_83
    return-object p0
.end method

.method public static final getCaptionLocalizationPatch()Lapp/morphe/patcher/patch/ResourcePatch;
    .registers 1

    .line 5
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionLocalizationPatch:Lapp/morphe/patcher/patch/ResourcePatch;

    return-object v0
.end method
