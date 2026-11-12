.class public final Like;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljke;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:I


# direct methods
.method public constructor <init>()V
    .registers 4

    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_1e

    const/4 v1, 0x7

    aget v1, v0, v1

    const/16 v2, 0x8

    aget v0, v0, v2

    rem-int/2addr v1, v0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Like;->a:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput v0, p0, Like;->b:I

    return-void

    nop

    :array_1e
    .array-data 4
        0x5a606509
        0x44202730
        0x1a9619a6
        0x44622612
        0x335b81c3
        -0x61f9e24e    # -7.100042E-21f
        0x1dd6d6f4
        0x73bbd7f8
        0x1876589d
    .end array-data
.end method

.method public constructor <init>(I)V
    .registers 3

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Like;->a:Ljava/util/ArrayList;

    .line 32
    iput p1, p0, Like;->b:I

    return-void
.end method

.method public constructor <init>(Liuh;)V
    .registers 7

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    iget-object v1, p1, Liuh;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v1}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v2

    .line 36
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Like;->a:Ljava/util/ArrayList;

    .line 37
    invoke-interface {v1}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v0

    .line 38
    iput v0, p0, Like;->b:I

    const/4 v0, 0x0

    move v2, v0

    .line 39
    :goto_1a
    invoke-interface {v1}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v3

    if-ge v2, v3, :cond_2f

    .line 40
    new-instance v3, Lhke;

    invoke-virtual {p1, v2}, Liuh;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v4

    invoke-direct {v3, v4}, Lhke;-><init>(Lcom/opera/android/browser/NavigationEntry;)V

    invoke-virtual {p0, v3, v0}, Like;->X(Lcom/opera/android/browser/NavigationEntry;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    :cond_2f
    return-void
.end method


# virtual methods
.method public final B(Lcom/opera/android/browser/chromium/ChromiumContent;ILjava/util/HashMap;)V
    .registers 4

    iget-object p2, p0, Like;->a:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-gtz p2, :cond_9

    return-void

    :cond_9
    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    invoke-static {p2, p0, p3}, LJ/N;->MwPSW0wv(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    return-void
.end method

.method public final X(Lcom/opera/android/browser/NavigationEntry;Z)V
    .registers 4

    iget-object v0, p0, Like;->a:Ljava/util/ArrayList;

    if-eqz p2, :cond_a

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    iput p2, p0, Like;->b:I

    :cond_a
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(J)I
    .registers 27

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    const/16 v3, 0x9

    new-array v4, v3, [I

    fill-array-data v4, :array_84

    const/4 v5, 0x0

    aget v6, v4, v5

    const/4 v7, 0x1

    aget v8, v4, v7

    const/4 v9, 0x2

    aget v10, v4, v9

    const/4 v11, 0x3

    aget v12, v4, v11

    const/4 v13, 0x4

    aget v14, v4, v13

    const/4 v15, 0x5

    move/from16 v16, v5

    aget v5, v4, v15

    const/16 v17, 0x6

    move/from16 v18, v7

    aget v7, v4, v17

    const/16 v19, 0x7

    aget v20, v4, v19

    const/16 v21, 0x8

    aget v4, v4, v21

    move/from16 v22, v9

    not-int v9, v6

    and-int/2addr v9, v8

    or-int/2addr v9, v10

    and-int/2addr v6, v12

    or-int/2addr v6, v14

    invoke-static {v9, v6, v5, v7}, Lu0h;->a(IIII)I

    move-result v5

    rem-int v20, v20, v4

    xor-int v5, v5, v20

    new-array v3, v3, [J

    fill-array-data v3, :array_9a

    aget-wide v6, v3, v16

    aget-wide v8, v3, v18

    aget-wide v22, v3, v22

    aget-wide v10, v3, v11

    aget-wide v12, v3, v13

    aget-wide v14, v3, v15

    aget-wide v16, v3, v17

    aget-wide v18, v3, v19

    aget-wide v3, v3, v21

    move-wide/from16 v20, v3

    not-long v3, v6

    and-long/2addr v3, v8

    or-long v3, v3, v22

    and-long/2addr v6, v10

    or-long/2addr v6, v12

    add-long/2addr v3, v6

    sub-long/2addr v3, v14

    add-long v3, v3, v16

    rem-long v18, v18, v20

    xor-long v3, v3, v18

    const-wide/16 v6, 0x0

    cmp-long v8, v1, v6

    if-ltz v8, :cond_6f

    iget v3, v0, Like;->b:I

    add-int/2addr v3, v5

    int-to-long v3, v3

    sub-long/2addr v3, v1

    goto :goto_71

    :cond_6f
    neg-long v1, v1

    add-long/2addr v3, v1

    :goto_71
    cmp-long v1, v3, v6

    if-ltz v1, :cond_7e

    iget v0, v0, Like;->b:I

    int-to-long v0, v0

    cmp-long v0, v3, v0

    if-gez v0, :cond_7e

    long-to-int v0, v3

    return v0

    :cond_7e
    new-instance v0, Ls3p;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0

    :array_84
    .array-data 4
        0x77465f01
        0x7f00424f
        0x863b9a1
        -0x8eebdb2
        -0x7766f770
        0xc103e9e
        0x164585d
        0x440badfc
        0x5072367
    .end array-data

    :array_9a
    .array-data 8
        0x100f59dc
        0x76db3a86
        0x96cdb2c
        -0x96cdf7d
        -0x76bfee8f
        0x212a72d4
        0x885e1b
        0x7fffca11
        0x1a27709e
    .end array-data
.end method

.method public final a()Lads_mobile_sdk/st3;
    .registers 11

    const/16 v0, 0x9

    .line 135
    new-array v0, v0, [I

    fill-array-data v0, :array_4e

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v2, v0, v2

    const/4 v3, 0x2

    aget v3, v0, v3

    const/4 v4, 0x3

    aget v4, v0, v4

    const/4 v5, 0x4

    aget v5, v0, v5

    const/4 v6, 0x5

    aget v6, v0, v6

    const/4 v7, 0x6

    aget v7, v0, v7

    const/4 v8, 0x7

    aget v8, v0, v8

    const/16 v9, 0x8

    aget v0, v0, v9

    not-int v9, v1

    and-int/2addr v9, v2

    or-int/2addr v9, v3

    and-int/2addr v1, v4

    or-int/2addr v1, v5

    invoke-static {v9, v1, v6, v7}, Lu0h;->a(IIII)I

    move-result v1

    rem-int/2addr v8, v0

    xor-int/2addr v1, v8

    iget v0, p0, Like;->b:I

    if-lez v0, :cond_48

    add-int/2addr v0, v1

    iget-object v2, p0, Like;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lads_mobile_sdk/st3;

    iget v3, p0, Like;->b:I

    add-int/2addr v3, v1

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget v2, p0, Like;->b:I

    add-int/2addr v2, v1

    iput v2, p0, Like;->b:I

    return-object v0

    :cond_48
    new-instance p0, Ls3p;

    .line 136
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 137
    throw p0

    :array_4e
    .array-data 4
        0x56e5e35
        0x5700e868
        0x22f18533
        -0xaea95b7
        -0x5d6aec7b
        0x36cbcad2
        0x8beda84
        0x2ee9fbe1
        0x1b640c94
    .end array-data
.end method

.method public final a(Lads_mobile_sdk/st3;)V
    .registers 13

    const/16 v0, 0x9

    .line 132
    new-array v0, v0, [I

    fill-array-data v0, :array_50

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v3, v0, v2

    const/4 v4, 0x2

    aget v4, v0, v4

    const/4 v5, 0x3

    aget v5, v0, v5

    const/4 v6, 0x4

    aget v6, v0, v6

    const/4 v7, 0x5

    aget v7, v0, v7

    const/4 v8, 0x6

    aget v8, v0, v8

    const/4 v9, 0x7

    aget v9, v0, v9

    const/16 v10, 0x8

    aget v0, v0, v10

    not-int v10, v1

    and-int/2addr v10, v3

    or-int/2addr v10, v4

    and-int/2addr v1, v5

    or-int/2addr v1, v6

    invoke-static {v10, v1, v7, v8}, Lu0h;->a(IIII)I

    move-result v1

    rem-int/2addr v9, v0

    xor-int/2addr v1, v9

    iget v0, p0, Like;->b:I

    if-ge v0, v1, :cond_49

    iget-object v1, p0, Like;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v0, v3, :cond_3e

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_43

    :cond_3e
    iget v0, p0, Like;->b:I

    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_43
    iget p1, p0, Like;->b:I

    add-int/2addr p1, v2

    iput p1, p0, Like;->b:I

    return-void

    :cond_49
    new-instance p0, Ll6p;

    .line 133
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 134
    throw p0

    nop

    :array_50
    .array-data 4
        0x1f3da4d5
        0x2c291419
        0x186028c7
        0x250fdc38
        0x176c9e5
        0x47f6d07d
        0x11bfcfe4
        0x3f8b0cbf
        0x37e203ab
    .end array-data
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Like;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_18

    iget v1, p0, Like;->b:I

    invoke-virtual {p0, v1}, Like;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput v0, p0, Like;->b:I

    :cond_18
    return-void
.end method

.method public final d()I
    .registers 1

    iget-object p0, p0, Like;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final i(I)Lcom/opera/android/browser/NavigationEntry;
    .registers 2

    iget-object p0, p0, Like;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/NavigationEntry;

    return-object p0
.end method

.method public final isDestroyed()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final j()I
    .registers 1

    iget p0, p0, Like;->b:I

    return p0
.end method

.method public final l(I)V
    .registers 2

    iput p1, p0, Like;->b:I

    return-void
.end method

.method public final u()V
    .registers 4

    iget v0, p0, Like;->b:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Like;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1b

    iget p0, p0, Like;->b:I

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {v1, p0, v0}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->clear()V

    :cond_1b
    return-void
.end method

.method public final v(I)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method
