.class public final Lt9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvnk;
.implements Ljma;
.implements Ljrp;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Landroidx/collection/ArrayMap;

    const/4 v1, 0x0

    .line 47
    invoke-direct {v0, v1}, Lhkj;-><init>(I)V

    .line 48
    iput-object v0, p0, Lt9l;->a:Ljava/lang/Object;

    .line 49
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lt9l;->b:Ljava/lang/Object;

    .line 50
    new-instance v0, Lj1d;

    const/4 v2, 0x0

    .line 51
    invoke-direct {v0, v2}, Lj1d;-><init>(Ljava/lang/Object;)V

    .line 52
    iput-object v0, p0, Lt9l;->c:Ljava/lang/Object;

    .line 53
    new-instance v0, Landroidx/collection/ArrayMap;

    .line 54
    invoke-direct {v0, v1}, Lhkj;-><init>(I)V

    .line 55
    iput-object v0, p0, Lt9l;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt9l;->a:Ljava/lang/Object;

    new-instance v0, Lpde;

    sget-object v1, Log;->a:Log;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lt9l;->b:Ljava/lang/Object;

    invoke-static {p1}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object v0

    iput-object v0, p0, Lt9l;->c:Ljava/lang/Object;

    new-instance v0, Lgyf;

    const-wide/16 v1, 0xc8

    invoke-direct {v0, p1, v1, v2}, Lgyf;-><init>(Landroid/view/View;J)V

    iput-object v0, p0, Lt9l;->d:Ljava/lang/Object;

    new-instance v0, Ls9l;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ls9l;-><init>(Lt9l;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;Lwv1;)V
    .registers 4

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lt9l;->a:Ljava/lang/Object;

    .line 58
    iput-object p2, p0, Lt9l;->b:Ljava/lang/Object;

    .line 59
    iput-object p3, p0, Lt9l;->c:Ljava/lang/Object;

    .line 60
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lt9l;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfao;)V
    .registers 3

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lt9l;->b:Ljava/lang/Object;

    iput-object v0, p0, Lt9l;->c:Ljava/lang/Object;

    iput-object v0, p0, Lt9l;->d:Ljava/lang/Object;

    iput-object p1, p0, Lt9l;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 40
    iput-object p1, p0, Lt9l;->a:Ljava/lang/Object;

    iput-object p2, p0, Lt9l;->b:Ljava/lang/Object;

    iput-object p3, p0, Lt9l;->c:Ljava/lang/Object;

    iput-object p4, p0, Lt9l;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lm9f;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt9l;->a:Ljava/lang/Object;

    .line 41
    iget v0, p1, Lm9f;->a:I

    .line 42
    new-instance v1, Lyvb;

    .line 43
    iget-object p1, p1, Lm9f;->c:Ljava/lang/Object;

    check-cast p1, Lq0;

    .line 44
    invoke-direct {v1, p1, v0}, Lyvb;-><init>(Lq0;I)V

    iput-object v1, p0, Lt9l;->b:Ljava/lang/Object;

    new-array p1, v0, [B

    iput-object p1, p0, Lt9l;->c:Ljava/lang/Object;

    new-array p1, v0, [B

    iput-object p1, p0, Lt9l;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lw1n;)V
    .registers 2

    iget-object p0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()Lll4;
    .registers 8

    new-instance v0, Lll4;

    iget-object v1, p0, Lt9l;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    iget-object v2, p0, Lt9l;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    iget-object v3, p0, Lt9l;->c:Ljava/lang/Object;

    check-cast v3, Lwv1;

    iget-object p0, p0, Lt9l;->d:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Ljava/util/ArrayList;

    const/4 v5, 0x3

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lll4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V

    return-object v0
.end method

.method public final c([B)Lu7k;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v5, p1

    iget-object v1, v0, Lt9l;->b:Ljava/lang/Object;

    check-cast v1, Lyvb;

    iget-object v2, v0, Lt9l;->a:Ljava/lang/Object;

    check-cast v2, Lm9f;

    iget v12, v2, Lm9f;->a:I

    iget v13, v2, Lm9f;->b:I

    new-array v14, v13, [[B

    const/16 v2, 0x20

    new-array v10, v2, [B

    new-array v11, v12, [B

    new-array v2, v12, [B

    new-array v15, v12, [B

    const/4 v4, 0x0

    :goto_1d
    if-ge v4, v13, :cond_b4

    const/16 v6, 0x14

    invoke-static {v4, v6, v5}, Lsfe;->h0(II[B)V

    if-ltz v4, :cond_ad

    if-ge v4, v13, :cond_ad

    int-to-long v6, v4

    const/16 v8, 0x8

    const/16 v9, 0x18

    invoke-static {v6, v7, v10, v9, v8}, Lsfe;->w0(J[BII)V

    iget-object v6, v0, Lt9l;->c:Ljava/lang/Object;

    check-cast v6, [B

    const/4 v7, 0x3

    const/4 v8, 0x0

    move-object/from16 v20, v6

    move-object v6, v1

    move v1, v9

    move-object/from16 v9, v20

    invoke-virtual/range {v6 .. v11}, Lyvb;->a(II[B[B[B)V

    iget-object v7, v0, Lt9l;->d:Ljava/lang/Object;

    check-cast v7, [B

    move v8, v4

    move-object v4, v7

    new-array v7, v12, [B

    move-object/from16 v16, v2

    move-object v9, v11

    const/4 v2, 0x0

    :goto_4b
    const/16 v3, 0xf

    if-eq v2, v3, :cond_9e

    invoke-static {v2, v1, v5}, Lsfe;->h0(II[B)V

    const/16 v3, 0x1c

    const/4 v1, 0x0

    invoke-static {v1, v3, v5}, Lsfe;->h0(II[B)V

    move/from16 v17, v2

    const/4 v2, 0x3

    move/from16 v19, v3

    const/4 v3, 0x0

    move/from16 v0, v17

    move/from16 v17, v1

    move-object v1, v6

    move-object/from16 v6, v16

    move/from16 v16, v0

    move/from16 v0, v19

    const/16 v18, 0x18

    invoke-virtual/range {v1 .. v6}, Lyvb;->a(II[B[B[B)V

    move-object/from16 v19, v6

    const/4 v2, 0x1

    invoke-static {v2, v0, v5}, Lsfe;->h0(II[B)V

    const/4 v2, 0x3

    move-object v6, v15

    invoke-virtual/range {v1 .. v6}, Lyvb;->a(II[B[B[B)V

    move-object v0, v4

    move/from16 v3, v17

    :goto_7c
    if-ge v3, v12, :cond_89

    aget-byte v2, v6, v3

    aget-byte v4, v9, v3

    xor-int/2addr v2, v4

    int-to-byte v2, v2

    aput-byte v2, v6, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_7c

    :cond_89
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, v1

    move-object/from16 v5, v19

    invoke-virtual/range {v2 .. v7}, Lyvb;->a(II[B[B[B)V

    add-int/lit8 v2, v16, 0x1

    move-object/from16 v5, p1

    move-object v4, v0

    move-object v15, v6

    move-object v9, v7

    move-object/from16 v16, v19

    move-object v6, v1

    move/from16 v1, v18

    goto :goto_4b

    :cond_9e
    move-object v1, v6

    move-object/from16 v19, v16

    aput-object v7, v14, v8

    add-int/lit8 v4, v8, 0x1

    move-object/from16 v0, p0

    move-object/from16 v5, p1

    move-object/from16 v2, v19

    goto/16 :goto_1d

    :cond_ad
    const-string v0, "index out of bounds"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    :cond_b4
    new-instance v0, Lu7k;

    invoke-direct {v0, v14}, Lu7k;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public final d([B[B)[B
    .registers 9

    const/16 v0, 0x14

    const/4 v1, 0x0

    invoke-static {v1, v0, p2}, Lsfe;->h0(II[B)V

    const/16 v0, 0x18

    invoke-static {v1, v0, p2}, Lsfe;->h0(II[B)V

    const/16 v0, 0x1c

    invoke-static {v1, v0, p2}, Lsfe;->h0(II[B)V

    iget-object p0, p0, Lt9l;->b:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lyvb;

    iget p0, v0, Lyvb;->b:I

    new-array v5, p0, [B

    const/4 v2, 0x0

    const/4 v1, 0x3

    move-object v3, p1

    move-object v4, p2

    invoke-virtual/range {v0 .. v5}, Lyvb;->a(II[B[B[B)V

    return-object v5
.end method

.method public final e([B[B)V
    .registers 6

    iget-object v0, p0, Lt9l;->a:Ljava/lang/Object;

    check-cast v0, Lm9f;

    iget v0, v0, Lm9f;->a:I

    const-string v1, "secretKeySeed"

    invoke-static {v0, v1, p1}, Lybh;->B(ILjava/lang/String;[B)V

    const-string v1, "publicSeed"

    invoke-static {v0, v1, p2}, Lybh;->B(ILjava/lang/String;[B)V

    iget-object v0, p0, Lt9l;->c:Ljava/lang/Object;

    check-cast v0, [B

    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object p0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast p0, [B

    array-length p1, p0

    invoke-static {p2, v2, p0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public final f()V
    .registers 4

    iget-object v0, p0, Lt9l;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    iget-object v1, p0, Lt9l;->c:Ljava/lang/Object;

    check-cast v1, Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lng;->a:Lng;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object p0, p0, Lt9l;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result p0

    if-nez p0, :cond_20

    :cond_1e
    sget-object v2, Log;->a:Log;

    :cond_20
    invoke-static {v0, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final j([BIILunk;Lop5;)V
    .registers 31

    move-object/from16 v0, p0

    move/from16 v1, p2

    iget-object v2, v0, Lt9l;->a:Ljava/lang/Object;

    check-cast v2, Lg1g;

    add-int v3, v1, p3

    move-object/from16 v4, p1

    invoke-virtual {v2, v4, v3}, Lg1g;->L([BI)V

    invoke-virtual {v2, v1}, Lg1g;->N(I)V

    iget-object v1, v0, Lt9l;->b:Ljava/lang/Object;

    check-cast v1, Lg1g;

    iget-object v3, v0, Lt9l;->c:Ljava/lang/Object;

    check-cast v3, Lyan;

    iget-object v4, v0, Lt9l;->d:Ljava/lang/Object;

    check-cast v4, Ljava/util/zip/Inflater;

    if-nez v4, :cond_27

    new-instance v4, Ljava/util/zip/Inflater;

    invoke-direct {v4}, Ljava/util/zip/Inflater;-><init>()V

    iput-object v4, v0, Lt9l;->d:Ljava/lang/Object;

    :cond_27
    sget-object v0, Ltym;->a:Ljava/lang/String;

    invoke-virtual {v2}, Lg1g;->a()I

    move-result v0

    if-lez v0, :cond_44

    invoke-virtual {v2}, Lg1g;->j()I

    move-result v0

    const/16 v5, 0x78

    if-ne v0, v5, :cond_44

    invoke-static {v2, v1, v4}, Ltym;->H(Lg1g;Lg1g;Ljava/util/zip/Inflater;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object v0, v1, Lg1g;->a:[B

    iget v1, v1, Lg1g;->c:I

    invoke-virtual {v2, v0, v1}, Lg1g;->L([BI)V

    :cond_44
    const/4 v0, 0x0

    iput-boolean v0, v3, Lyan;->c:Z

    const/4 v1, 0x0

    iput-object v1, v3, Lyan;->g:Landroid/graphics/Rect;

    const/4 v4, -0x1

    iput v4, v3, Lyan;->h:I

    iput v4, v3, Lyan;->i:I

    invoke-virtual {v2}, Lg1g;->a()I

    move-result v5

    const/4 v6, 0x2

    if-lt v5, v6, :cond_1df

    invoke-virtual {v2}, Lg1g;->H()I

    move-result v7

    if-ne v7, v5, :cond_1df

    iget-object v5, v3, Lyan;->d:[I

    const/4 v7, 0x1

    if-eqz v5, :cond_144

    iget-boolean v8, v3, Lyan;->b:Z

    if-eqz v8, :cond_144

    invoke-virtual {v2}, Lg1g;->H()I

    move-result v8

    sub-int/2addr v8, v6

    invoke-virtual {v2, v8}, Lg1g;->O(I)V

    invoke-virtual {v2}, Lg1g;->H()I

    move-result v8

    iget-object v9, v3, Lyan;->a:[I

    :goto_73
    :pswitch_73
    iget v10, v2, Lg1g;->b:I

    if-ge v10, v8, :cond_144

    invoke-virtual {v2}, Lg1g;->a()I

    move-result v10

    if-lez v10, :cond_144

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v10

    const/4 v11, 0x3

    const/4 v12, 0x4

    packed-switch v10, :pswitch_data_200

    goto/16 :goto_144

    :pswitch_88
    invoke-virtual {v2}, Lg1g;->a()I

    move-result v10

    if-lt v10, v12, :cond_144

    invoke-virtual {v2}, Lg1g;->H()I

    move-result v10

    iput v10, v3, Lyan;->h:I

    invoke-virtual {v2}, Lg1g;->H()I

    move-result v10

    iput v10, v3, Lyan;->i:I

    goto :goto_73

    :pswitch_9b
    invoke-virtual {v2}, Lg1g;->a()I

    move-result v10

    const/4 v11, 0x6

    if-lt v10, v11, :cond_144

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v10

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v11

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v13

    shl-int/2addr v10, v12

    shr-int/lit8 v14, v11, 0x4

    or-int/2addr v10, v14

    and-int/lit8 v11, v11, 0xf

    shl-int/lit8 v11, v11, 0x8

    or-int/2addr v11, v13

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v13

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v14

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v15

    shl-int/2addr v13, v12

    shr-int/lit8 v12, v14, 0x4

    or-int/2addr v13, v12

    and-int/lit8 v14, v14, 0xf

    shl-int/lit8 v14, v14, 0x8

    or-int/2addr v14, v15

    new-instance v12, Landroid/graphics/Rect;

    add-int/2addr v11, v7

    add-int/2addr v14, v7

    invoke-direct {v12, v10, v13, v11, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v12, v3, Lyan;->g:Landroid/graphics/Rect;

    goto :goto_73

    :pswitch_d6
    invoke-virtual {v2}, Lg1g;->a()I

    move-result v10

    if-lt v10, v6, :cond_144

    iget-boolean v10, v3, Lyan;->c:Z

    if-eqz v10, :cond_144

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v10

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v12

    aget v13, v9, v11

    shr-int/lit8 v14, v10, 0x4

    invoke-static {v13, v14}, Lyan;->c(II)I

    move-result v13

    aput v13, v9, v11

    aget v11, v9, v6

    and-int/lit8 v10, v10, 0xf

    invoke-static {v11, v10}, Lyan;->c(II)I

    move-result v10

    aput v10, v9, v6

    aget v10, v9, v7

    shr-int/lit8 v11, v12, 0x4

    invoke-static {v10, v11}, Lyan;->c(II)I

    move-result v10

    aput v10, v9, v7

    aget v10, v9, v0

    and-int/lit8 v12, v12, 0xf

    invoke-static {v10, v12}, Lyan;->c(II)I

    move-result v10

    aput v10, v9, v0

    goto/16 :goto_73

    :pswitch_112
    invoke-virtual {v2}, Lg1g;->a()I

    move-result v10

    if-lt v10, v6, :cond_144

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v10

    invoke-virtual {v2}, Lg1g;->A()I

    move-result v12

    shr-int/lit8 v13, v10, 0x4

    invoke-static {v13, v5}, Lyan;->a(I[I)I

    move-result v13

    aput v13, v9, v11

    and-int/lit8 v10, v10, 0xf

    invoke-static {v10, v5}, Lyan;->a(I[I)I

    move-result v10

    aput v10, v9, v6

    shr-int/lit8 v10, v12, 0x4

    invoke-static {v10, v5}, Lyan;->a(I[I)I

    move-result v10

    aput v10, v9, v7

    and-int/lit8 v12, v12, 0xf

    invoke-static {v12, v5}, Lyan;->a(I[I)I

    move-result v10

    aput v10, v9, v0

    iput-boolean v7, v3, Lyan;->c:Z

    goto/16 :goto_73

    :cond_144
    :goto_144
    iget-object v5, v3, Lyan;->d:[I

    if-eqz v5, :cond_1df

    iget-boolean v5, v3, Lyan;->b:Z

    if-eqz v5, :cond_1df

    iget-boolean v5, v3, Lyan;->c:Z

    if-eqz v5, :cond_1df

    iget-object v5, v3, Lyan;->g:Landroid/graphics/Rect;

    if-eqz v5, :cond_1df

    iget v8, v3, Lyan;->h:I

    if-eq v8, v4, :cond_1df

    iget v8, v3, Lyan;->i:I

    if-eq v8, v4, :cond_1df

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v4

    if-lt v4, v6, :cond_1df

    iget-object v4, v3, Lyan;->g:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    if-lt v4, v6, :cond_1df

    iget-object v1, v3, Lyan;->g:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v5

    mul-int/2addr v5, v4

    new-array v4, v5, [I

    new-instance v5, Lbq4;

    invoke-direct {v5}, Lbq4;-><init>()V

    iget v6, v3, Lyan;->h:I

    invoke-virtual {v2, v6}, Lg1g;->N(I)V

    invoke-virtual {v5, v2}, Lbq4;->o(Lg1g;)V

    invoke-virtual {v3, v5, v7, v1, v4}, Lyan;->b(Lbq4;ZLandroid/graphics/Rect;[I)V

    iget v6, v3, Lyan;->i:I

    invoke-virtual {v2, v6}, Lg1g;->N(I)V

    invoke-virtual {v5, v2}, Lbq4;->o(Lg1g;)V

    invoke-virtual {v3, v5, v0, v1, v4}, Lyan;->b(Lbq4;ZLandroid/graphics/Rect;[I)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v2

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v0, v2, v5}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v10

    iget v0, v1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget v2, v3, Lyan;->e:I

    int-to-float v2, v2

    div-float v14, v0, v2

    iget v0, v1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    iget v2, v3, Lyan;->f:I

    int-to-float v2, v2

    div-float v11, v0, v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    iget v2, v3, Lyan;->e:I

    int-to-float v2, v2

    div-float v18, v0, v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    iget v1, v3, Lyan;->f:I

    int-to-float v1, v1

    div-float v19, v0, v1

    new-instance v6, Lx36;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x0

    const/high16 v16, -0x80000000

    const v17, -0x800001

    const/16 v20, 0x0

    const/high16 v21, -0x1000000

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object v9, v8

    move/from16 v22, v16

    invoke-direct/range {v6 .. v24}, Lx36;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;Landroid/text/Layout$Alignment;Landroid/graphics/Bitmap;FIIFIIFFFZIIFI)V

    move-object v1, v6

    :cond_1df
    new-instance v2, La46;

    if-eqz v1, :cond_1e9

    invoke-static {v1}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v0

    :goto_1e7
    move-object v3, v0

    goto :goto_1ee

    :cond_1e9
    sget-object v0, Lh1b;->b:La1b;

    sget-object v0, Lcsh;->e:Lcsh;

    goto :goto_1e7

    :goto_1ee
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    const-wide/32 v6, 0x4c4b40

    invoke-direct/range {v2 .. v7}, La46;-><init>(Ljava/util/List;JJ)V

    move-object/from16 v0, p5

    invoke-interface {v0, v2}, Lop5;->accept(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_200
    .packed-switch 0x0
        :pswitch_73
        :pswitch_73
        :pswitch_73
        :pswitch_112
        :pswitch_d6
        :pswitch_9b
        :pswitch_88
    .end packed-switch
.end method

.method public final onDismissed(Landroid/os/Bundle;)V
    .registers 4

    iget-object p0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/play/core/hsdp/service/HsdpShimActivity;

    const-string v0, "dldpRedirect"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iget-boolean v0, p0, Lcom/google/android/play/core/hsdp/service/HsdpShimActivity;->b:Z

    if-nez v0, :cond_12

    if-nez p1, :cond_12

    return-void

    :cond_12
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/play/core/hsdp/service/HsdpShimActivity;->a:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onError(Landroid/os/Bundle;)V
    .registers 4

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    iget-object p1, p0, Lt9l;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lt9l;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lt9l;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    iget-object p0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/play/core/hsdp/service/HsdpShimActivity;

    invoke-static {p1, v0, v1}, Ly4h;->t(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/play/core/hsdp/service/HsdpShimActivity;->a:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/google/android/play/core/hsdp/service/HsdpShimActivity;->b:Z

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onShown(Landroid/os/Bundle;)V
    .registers 2

    iget-object p0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/play/core/hsdp/service/HsdpShimActivity;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/play/core/hsdp/service/HsdpShimActivity;->b:Z

    return-void
.end method

.method public final z()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public final zza()Ljava/lang/Object;
    .registers 5

    iget-object v0, p0, Lt9l;->a:Ljava/lang/Object;

    check-cast v0, Lz4k;

    iget-object v0, v0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Lh61;

    iget-object v0, v0, Lh61;->a:Landroid/content/Context;

    iget-object v1, p0, Lt9l;->b:Ljava/lang/Object;

    check-cast v1, Ljrp;

    invoke-interface {v1}, Ljrp;->zza()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    iget-object v2, p0, Lt9l;->c:Ljava/lang/Object;

    check-cast v2, Ljrp;

    invoke-interface {v2}, Ljrp;->zza()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpup;

    iget-object p0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast p0, Lrii;

    invoke-static {p0}, Larp;->a(Ljrp;)Larp;

    move-result-object p0

    new-instance v3, Lcp8;

    invoke-direct {v3, v0, v1, v2, p0}, Lcp8;-><init>(Landroid/content/Context;Ljava/io/File;Lpup;Larp;)V

    return-object v3
.end method
