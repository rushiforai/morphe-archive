.class public final Liz;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb59;

.field public final b:Lt9f;

.field public final c:Ljava/lang/String;

.field public final d:Landroid/net/Uri;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/util/ArrayList;

.field public final g:Lhz;

.field public final h:Lig;


# direct methods
.method public constructor <init>(Lb59;Lt9f;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0x64

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, v0, Liz;->f:Ljava/util/ArrayList;

    new-instance v2, Lhz;

    const/4 v4, 0x0

    invoke-direct {v2, v0, v4}, Lhz;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v0, Liz;->g:Lhz;

    new-instance v2, Lig;

    const/4 v5, 0x1

    invoke-direct {v2, v0, v5}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v0, Liz;->h:Lig;

    move-object/from16 v2, p1

    iput-object v2, v0, Liz;->a:Lb59;

    move-object/from16 v6, p2

    iput-object v6, v0, Liz;->b:Lt9f;

    iput-object v1, v0, Liz;->c:Ljava/lang/String;

    move-object/from16 v6, p4

    iput-object v6, v0, Liz;->d:Landroid/net/Uri;

    move-object/from16 v6, p5

    iput-object v6, v0, Liz;->e:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const/4 v6, 0x0

    invoke-interface {v2, v1, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_e1

    const-string v2, "\n"

    invoke-static {v1, v2}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    invoke-direct {v3, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_67
    :goto_67
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_cf

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string v8, "1:"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    const/4 v9, 0x5

    const/4 v10, 0x6

    const-string v11, "\t"

    const/4 v12, 0x2

    if-nez v8, :cond_a5

    const-string v8, "0:"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c8

    invoke-virtual {v7, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v11}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    add-int/2addr v8, v5

    if-eq v8, v10, :cond_96

    move-object v8, v6

    goto :goto_a2

    :cond_96
    array-length v8, v7

    add-int/2addr v8, v5

    new-array v8, v8, [Ljava/lang/String;

    array-length v11, v7

    invoke-static {v7, v4, v8, v4, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const-string v7, "Unknown"

    aput-object v7, v8, v9

    :goto_a2
    if-nez v8, :cond_ad

    goto :goto_c8

    :cond_a5
    invoke-virtual {v7, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v11}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    :cond_ad
    array-length v7, v8

    if-ne v7, v10, :cond_c8

    const/4 v7, 0x4

    :try_start_b1
    aget-object v7, v8, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17
    :try_end_b7
    .catch Ljava/lang/NumberFormatException; {:try_start_b1 .. :try_end_b7} :catch_c8

    new-instance v13, Lfz;

    aget-object v14, v8, v4

    aget-object v15, v8, v5

    aget-object v16, v8, v12

    const/4 v7, 0x3

    aget-object v18, v8, v7

    aget-object v19, v8, v9

    invoke-direct/range {v13 .. v19}, Lfz;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_c9

    :catch_c8
    :cond_c8
    :goto_c8
    move-object v13, v6

    :goto_c9
    if-eqz v13, :cond_67

    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_67

    :cond_cf
    iget-object v2, v0, Liz;->f:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v2, v1, :cond_e1

    invoke-virtual {v0}, Liz;->a()V

    :cond_e1
    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Liz;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0x64

    if-le v1, v2, :cond_17

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    :cond_17
    iget-object v1, p0, Liz;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2b

    const/4 v0, 0x0

    goto :goto_31

    :cond_2b
    const-string v2, "\n"

    invoke-static {v2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    :goto_31
    iget-object p0, p0, Liz;->c:Ljava/lang/String;

    invoke-interface {v1, p0, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
