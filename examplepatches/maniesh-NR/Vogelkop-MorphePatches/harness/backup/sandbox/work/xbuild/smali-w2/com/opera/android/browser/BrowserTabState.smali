.class public final Lcom/opera/android/browser/BrowserTabState;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La9l;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ljava/util/ArrayList;

.field public final d:Lcom/opera/android/browser/TabInfo;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;IILcom/opera/android/browser/TabInfo;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    iput p2, p0, Lcom/opera/android/browser/BrowserTabState;->b:I

    iput p3, p0, Lcom/opera/android/browser/BrowserTabState;->a:I

    iput-object p4, p0, Lcom/opera/android/browser/BrowserTabState;->d:Lcom/opera/android/browser/TabInfo;

    return-void
.end method

.method public static b(Ljava/io/DataInputStream;Ld5o;Lc5o;)Lcom/opera/android/browser/BrowserTabState;
    .registers 31

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    const/4 v5, 0x1

    if-lt v3, v5, :cond_2bb

    const/16 v6, 0xd

    if-gt v3, v6, :cond_2bb

    const/4 v7, 0x7

    if-lt v3, v7, :cond_19

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v8

    goto :goto_1b

    :cond_19
    const/high16 v8, -0x80000000

    :goto_1b
    new-instance v9, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    const-wide/16 v14, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v9 .. v15}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v10

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v11

    add-int/lit8 v12, v11, -0x1

    invoke-static {v10, v12}, Ljava/lang/Math;->min(II)I

    move-result v10

    const/4 v12, 0x0

    invoke-static {v10, v12}, Ljava/lang/Math;->max(II)I

    move-result v10

    if-lez v11, :cond_2af

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    move v15, v10

    move v14, v12

    const/16 v16, 0x0

    :goto_46
    const/16 v4, 0x8

    if-ge v14, v11, :cond_295

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v5

    const-string v12, "opera://"

    invoke-virtual {v5, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    const-string v6, "chrome://"

    if-eqz v18, :cond_60

    invoke-virtual {v5, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_60
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_72

    invoke-virtual {v7, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :cond_72
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v6

    const/16 v12, 0xc

    if-lt v3, v12, :cond_83

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v12

    if-eqz v12, :cond_83

    const/16 v25, 0x1

    goto :goto_85

    :cond_83
    const/16 v25, 0x0

    :goto_85
    if-lt v3, v4, :cond_a3

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    const v12, 0x8000

    move-object/from16 v20, v6

    if-le v4, v12, :cond_99

    move-object v12, v7

    int-to-long v6, v4

    invoke-static {v0, v6, v7}, Llcp;->D(Ljava/io/DataInputStream;J)V

    goto/16 :goto_111

    :cond_99
    move-object v12, v7

    if-lez v4, :cond_111

    new-array v4, v4, [B

    invoke-virtual {v0, v4}, Ljava/io/DataInputStream;->readFully([B)V

    goto/16 :goto_113

    :cond_a3
    move-object/from16 v20, v6

    move-object v12, v7

    const/4 v6, 0x7

    if-lt v3, v6, :cond_d7

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readShort()S

    move-result v4

    move-object/from16 v7, v16

    const/4 v6, 0x0

    :goto_b0
    if-ge v6, v4, :cond_d2

    move/from16 v21, v4

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    move/from16 v23, v6

    move-object/from16 v22, v7

    if-eqz v6, :cond_c3

    int-to-long v6, v4

    invoke-static {v0, v6, v7}, Llcp;->D(Ljava/io/DataInputStream;J)V

    goto :goto_cb

    :cond_c3
    if-lez v4, :cond_cb

    new-array v7, v4, [B

    invoke-virtual {v0, v7}, Ljava/io/DataInputStream;->readFully([B)V

    goto :goto_cd

    :cond_cb
    :goto_cb
    move-object/from16 v7, v22

    :goto_cd
    add-int/lit8 v6, v23, 0x1

    move/from16 v4, v21

    goto :goto_b0

    :cond_d2
    move-object/from16 v22, v7

    move-object/from16 v4, v22

    goto :goto_113

    :cond_d7
    const/4 v4, 0x3

    if-lt v3, v4, :cond_111

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    if-lez v4, :cond_111

    const/4 v6, 0x6

    if-ge v3, v6, :cond_10b

    new-array v4, v4, [B

    invoke-virtual {v0, v4}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v6, Ljava/lang/String;

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_16:Ljava/nio/charset/Charset;

    invoke-direct {v6, v4, v7}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    new-array v4, v4, [B

    move-object/from16 v21, v4

    const/4 v7, 0x0

    :goto_f8
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v7, v4, :cond_108

    invoke-virtual {v6, v7}, Ljava/lang/String;->codePointAt(I)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v21, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_f8

    :cond_108
    move-object/from16 v4, v21

    goto :goto_113

    :cond_10b
    new-array v4, v4, [B

    invoke-virtual {v0, v4}, Ljava/io/DataInputStream;->readFully([B)V

    goto :goto_113

    :cond_111
    :goto_111
    move-object/from16 v4, v16

    :goto_113
    const/4 v6, 0x4

    if-lt v3, v6, :cond_14b

    const/16 v6, 0xb

    if-ge v3, v6, :cond_14b

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v6

    if-eqz v6, :cond_14b

    const/16 v6, 0x9

    if-ge v3, v6, :cond_129

    const-wide/16 v6, 0x4

    invoke-static {v0, v6, v7}, Llcp;->D(Ljava/io/DataInputStream;J)V

    :cond_129
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v7

    new-instance v12, Lcom/opera/android/browser/UrlMangler$Builder;

    move-object/from16 v21, v4

    const-string v4, "search"

    invoke-direct {v12, v4, v5}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v12, v7}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object v4, v12, Lcom/opera/android/browser/UrlMangler$Builder;->c:Ljava/util/HashMap;

    const-string v7, "search_template"

    invoke-virtual {v4, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v12}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object v7

    :goto_148
    const/16 v6, 0xd

    goto :goto_14f

    :cond_14b
    move-object/from16 v21, v4

    move-object v7, v12

    goto :goto_148

    :goto_14f
    if-lt v3, v6, :cond_15f

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    if-lez v4, :cond_15f

    new-array v4, v4, [B

    invoke-virtual {v0, v4}, Ljava/io/DataInputStream;->readFully([B)V

    move-object/from16 v27, v4

    goto :goto_161

    :cond_15f
    move-object/from16 v27, v16

    :goto_161
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    sget-object v12, Lwqm;->a:[Ljava/lang/String;

    const-string v12, ""

    if-eqz v4, :cond_20e

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_20e

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v22, v4

    const-string v4, "operaui"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_20b

    iget-object v4, v1, Ld5o;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/Set;

    iget-object v6, v1, Ld5o;->a:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    check-cast v4, Ljava/lang/Iterable;

    move-object/from16 v23, v5

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1eb

    const-string v4, "favorite"

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1b0

    const-string v4, "dashboard"

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1b0

    move-object/from16 v4, v16

    goto :goto_1d0

    :cond_1b0
    new-instance v4, Lpq4;

    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v5, v1, Ld5o;->c:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v5

    invoke-virtual {v5}, Lfue;->d()V

    iget-object v5, v5, Lfue;->a:Lcue;

    const-string v7, "topnews"

    invoke-static {v5, v7}, Ld5k;->b(Lcue;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v6}, Lpq4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1d0
    if-nez v4, :cond_1dd

    if-gt v14, v10, :cond_28f

    add-int/lit8 v15, v15, -0x1

    const/4 v5, 0x0

    invoke-static {v15, v5}, Ljava/lang/Math;->max(II)I

    move-result v15

    goto/16 :goto_28f

    :cond_1dd
    iget-object v6, v4, Lpq4;->a:Ljava/lang/String;

    iget-object v4, v4, Lpq4;->b:Ljava/lang/String;

    move-object/from16 v24, v4

    move-object/from16 v22, v6

    move-object/from16 v23, v12

    move-object/from16 v26, v16

    goto/16 :goto_283

    :cond_1eb
    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v4

    const-string v12, "startpage"

    invoke-virtual {v12, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_201

    move-object/from16 v6, v20

    :cond_201
    move-object/from16 v24, v6

    :goto_203
    move-object/from16 v26, v21

    move-object/from16 v22, v23

    move-object/from16 v23, v7

    goto/16 :goto_283

    :cond_20b
    :goto_20b
    move-object/from16 v23, v5

    goto :goto_211

    :cond_20e
    move-object/from16 v22, v4

    goto :goto_20b

    :goto_211
    if-eqz v2, :cond_280

    invoke-static {v7}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_280

    const-string v4, "file"

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_280

    invoke-virtual/range {v22 .. v22}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    iget-object v6, v2, Lc5o;->b:Ljava/lang/Object;

    check-cast v6, Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_237
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_266

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v5, v17

    check-cast v5, Lilh;

    iget-object v1, v5, Lilh;->f:Ljava/lang/String;

    invoke-static {v4, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_237

    iget-object v1, v2, Lc5o;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const v4, 0x7f140bb4

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Lolh;->b(Lilh;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljee;

    invoke-direct {v5, v4, v1}, Ljee;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_268

    :cond_266
    move-object/from16 v5, v16

    :goto_268
    if-eqz v5, :cond_271

    iget-object v1, v5, Ljee;->b:Ljava/lang/String;

    iget-object v4, v5, Ljee;->c:Ljava/lang/String;

    move-object v7, v4

    :goto_26f
    move-object v5, v1

    goto :goto_277

    :cond_271
    invoke-static {v7}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v7, v12

    goto :goto_26f

    :goto_277
    move-object/from16 v22, v5

    move-object/from16 v23, v7

    move-object/from16 v26, v16

    move-object/from16 v24, v20

    goto :goto_283

    :cond_280
    move-object/from16 v24, v20

    goto :goto_203

    :goto_283
    new-instance v20, Lzy3;

    sub-int v21, v14, v11

    invoke-direct/range {v20 .. v27}, Lzy3;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[B)V

    move-object/from16 v1, v20

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_28f
    :goto_28f
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v1, p1

    goto/16 :goto_46

    :cond_295
    const/4 v1, 0x2

    if-lt v3, v1, :cond_2a2

    if-ge v3, v4, :cond_2a2

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    shl-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/io/DataInputStream;->skipBytes(I)I

    :cond_2a2
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2a9

    return-object v16

    :cond_2a9
    new-instance v0, Lcom/opera/android/browser/BrowserTabState;

    invoke-direct {v0, v13, v15, v8, v9}, Lcom/opera/android/browser/BrowserTabState;-><init>(Ljava/util/ArrayList;IILcom/opera/android/browser/TabInfo;)V

    return-object v0

    :cond_2af
    const/16 v16, 0x0

    const-string v0, "Invalid history entry count: "

    invoke-static {v11, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ls49;->m(Ljava/lang/String;)V

    return-object v16

    :cond_2bb
    const/16 v16, 0x0

    const-string v0, "Unhandled version "

    const-string v1, ", expected <= 13"

    invoke-static {v3, v0, v1}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ls49;->m(Ljava/lang/String;)V

    return-object v16
.end method


# virtual methods
.method public final a()Lcom/opera/android/browser/TabInfo;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/BrowserTabState;->d:Lcom/opera/android/browser/TabInfo;

    return-object p0
.end method

.method public final d()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final i()Ljke;
    .registers 6

    new-instance v0, Like;

    iget v1, p0, Lcom/opera/android/browser/BrowserTabState;->b:I

    invoke-direct {v0, v1}, Like;-><init>(I)V

    const/4 v1, 0x0

    move v2, v1

    :goto_9
    iget-object v3, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_22

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzy3;

    new-instance v4, Lyy3;

    invoke-direct {v4, p0, v3}, Lyy3;-><init>(Lcom/opera/android/browser/BrowserTabState;Lzy3;)V

    invoke-virtual {v0, v4, v1}, Like;->X(Lcom/opera/android/browser/NavigationEntry;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_22
    return-object v0
.end method

.method public final j()I
    .registers 1

    iget p0, p0, Lcom/opera/android/browser/BrowserTabState;->b:I

    return p0
.end method

.method public final k()Lz8l;
    .registers 2

    iget-object v0, p0, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    iget p0, p0, Lcom/opera/android/browser/BrowserTabState;->b:I

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzy3;

    return-object p0
.end method

.method public final l(Lxbf;)Ld7l;
    .registers 2

    invoke-virtual {p1, p0}, Lxbf;->r(La9l;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final m()I
    .registers 1

    iget p0, p0, Lcom/opera/android/browser/BrowserTabState;->a:I

    return p0
.end method
