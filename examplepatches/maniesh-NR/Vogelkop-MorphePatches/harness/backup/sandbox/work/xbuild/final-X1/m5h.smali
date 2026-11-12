.class public abstract Lm5h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field public static b:Z

.field public static c:Lsa4;


# direct methods
.method public static A(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 3

    const-class v0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->getPinnedShortcuts()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ShortcutInfo;

    invoke-virtual {v0}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_28
    const/4 p0, 0x0

    return p0
.end method

.method public static B(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f141288

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static C(Ljava/lang/String;)Lapm;
    .registers 16

    sget-object v2, Lw6g;->b:Ljava/lang/String;

    const-string v0, "/"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    invoke-static {p0, v2, v0}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_11

    :cond_10
    move-object v1, p0

    :goto_11
    const/4 v0, 0x0

    const/4 v3, 0x1

    const/4 v4, -0x1

    move v5, v0

    move v8, v3

    move v6, v4

    move v7, v6

    move v9, v7

    move v10, v9

    move v11, v10

    :goto_1b
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v5, v12, :cond_7d

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const/16 v13, 0x23

    if-eq v12, v13, :cond_77

    const/16 v13, 0x2f

    if-eq v12, v13, :cond_6a

    const/16 v14, 0x3a

    if-eq v12, v14, :cond_3c

    const/16 v13, 0x3f

    if-ne v12, v13, :cond_7b

    if-ne v9, v4, :cond_7b

    if-ne v6, v4, :cond_7b

    add-int/lit8 v9, v5, 0x1

    goto :goto_7b

    :cond_3c
    if-eqz v8, :cond_7b

    if-ne v9, v4, :cond_7b

    if-ne v6, v4, :cond_7b

    add-int/lit8 v12, v5, 0x2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v14

    if-ge v12, v14, :cond_5e

    add-int/lit8 v14, v5, 0x1

    invoke-virtual {p0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-ne v14, v13, :cond_5e

    invoke-virtual {p0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-ne v14, v13, :cond_5e

    add-int/lit8 v10, v5, 0x3

    move v8, v0

    move v11, v5

    move v5, v12

    goto :goto_7b

    :cond_5e
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7b

    add-int/lit8 v7, v5, 0x1

    move v11, v5

    move v5, v7

    move v10, v5

    goto :goto_7b

    :cond_6a
    if-ne v7, v4, :cond_7b

    if-ne v9, v4, :cond_7b

    if-ne v6, v4, :cond_7b

    if-ne v10, v4, :cond_74

    move v7, v0

    goto :goto_75

    :cond_74
    move v7, v5

    :goto_75
    move v8, v0

    goto :goto_7b

    :cond_77
    if-ne v6, v4, :cond_7b

    add-int/lit8 v6, v5, 0x1

    :cond_7b
    :goto_7b
    add-int/2addr v5, v3

    goto :goto_1b

    :cond_7d
    const p0, 0x7fffffff

    if-ne v6, v4, :cond_84

    move v3, p0

    goto :goto_86

    :cond_84
    add-int/lit8 v3, v6, -0x1

    :goto_86
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-ne v9, v4, :cond_92

    move v5, p0

    goto :goto_94

    :cond_92
    add-int/lit8 v5, v9, -0x1

    :goto_94
    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/4 v8, 0x0

    if-eq v10, v4, :cond_ab

    invoke-virtual {v1, v0, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    if-eq v7, v4, :cond_a2

    move p0, v7

    :cond_a2
    invoke-static {p0, v5}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-virtual {v1, v10, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_ad

    :cond_ab
    move-object p0, v8

    move-object v11, p0

    :goto_ad
    if-eq v7, v4, :cond_b4

    invoke-virtual {v1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    goto :goto_b5

    :cond_b4
    move-object v5, v8

    :goto_b5
    if-eq v9, v4, :cond_bc

    invoke-virtual {v1, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_bd

    :cond_bc
    move-object v3, v8

    :goto_bd
    if-eq v6, v4, :cond_c8

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_c9

    :cond_c8
    move-object v4, v8

    :goto_c9
    if-eqz v11, :cond_d0

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v6

    goto :goto_d1

    :cond_d0
    move v6, v0

    :goto_d1
    if-eqz p0, :cond_d8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    goto :goto_d9

    :cond_d8
    move v7, v0

    :goto_d9
    if-eqz v5, :cond_e0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    goto :goto_e1

    :cond_e0
    move v9, v0

    :goto_e1
    if-eqz v3, :cond_e8

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v10

    goto :goto_e9

    :cond_e8
    move v10, v0

    :goto_e9
    if-eqz v4, :cond_f0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v12

    goto :goto_f1

    :cond_f0
    move v12, v0

    :goto_f1
    invoke-static {v10, v12}, Ljava/lang/Math;->max(II)I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    invoke-static {v7, v9}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    add-int/lit8 v6, v6, -0x2

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-array v0, v0, [B

    move-object v6, v0

    new-instance v0, Lapm;

    if-eqz v11, :cond_113

    invoke-static {v11, v6}, Lm5h;->s(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v7

    goto :goto_114

    :cond_113
    move-object v7, v8

    :goto_114
    if-eqz p0, :cond_11b

    invoke-static {p0, v6}, Lm5h;->s(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object p0

    goto :goto_11c

    :cond_11b
    move-object p0, v8

    :goto_11c
    if-eqz v5, :cond_122

    invoke-static {v5, v6}, Lm5h;->s(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v8

    :cond_122
    move-object v5, v8

    if-eqz v3, :cond_128

    invoke-static {v3, v6}, Lm5h;->s(Ljava/lang/String;[B)Ljava/lang/String;

    :cond_128
    if-eqz v4, :cond_12d

    invoke-static {v4, v6}, Lm5h;->s(Ljava/lang/String;[B)Ljava/lang/String;

    :cond_12d
    move-object v4, p0

    move-object v3, v7

    invoke-direct/range {v0 .. v5}, Lapm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static a(Ljava/lang/String;)Lapm;
    .registers 7

    sget-object v2, Lw6g;->b:Ljava/lang/String;

    new-instance v0, Lapm;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :cond_13

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "file"

    const/4 v4, 0x0

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lapm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static b(Ljava/lang/String;)V
    .registers 2

    sget-object v0, Lads_mobile_sdk/xu0;->a:Lvr3;

    const-string v0, "4: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lads_mobile_sdk/xu0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static c(Ljava/util/Collection;Lv2p;)V
    .registers 3

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Lv2p;->accept(Ljava/lang/Object;)V

    goto :goto_4

    :cond_12
    return-void
.end method

.method public static d(Ljava/util/List;)Z
    .registers 1

    if-eqz p0, :cond_a

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x1

    return p0
.end method

.method public static e(Landroid/content/Context;Lb3c;Landroid/util/Size;Landroid/util/Size;II)Leyj;
    .registers 63

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p4

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-le v4, v5, :cond_18

    move v4, v7

    goto :goto_19

    :cond_18
    move v4, v6

    :goto_19
    invoke-static {v0, v1}, Lm5h;->l(Landroid/content/Context;Landroid/util/Size;)Lvxj;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    const/4 v11, 0x0

    const/4 v13, 0x3

    const/high16 v14, 0x41800000    # 16.0f

    const/4 v15, 0x2

    if-eqz v8, :cond_546

    sget-object v24, Lyxj;->b:Lyxj;

    const/high16 v9, 0x41400000    # 12.0f

    const/high16 v12, 0x40800000    # 4.0f

    if-eq v8, v7, :cond_377

    if-eq v8, v15, :cond_15c

    if-ne v8, v13, :cond_158

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f070996

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v19

    new-instance v2, Landroid/util/Size;

    invoke-virtual/range {p3 .. p3}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual/range {p3 .. p3}, Landroid/util/Size;->getHeight()I

    move-result v5

    invoke-direct {v2, v4, v5}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v4

    shl-int/lit8 v5, v19, 0x1

    add-int v39, v4, v5

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07099c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v47

    new-instance v16, Lsxj;

    const/16 v20, 0x3

    const/16 v21, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v16 .. v21}, Lsxj;-><init>(IIIII)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070995

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    new-instance v5, Leyj;

    new-instance v6, Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v8

    invoke-direct {v6, v4, v8}, Landroid/util/Size;-><init>(II)V

    new-instance v8, Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v9

    invoke-direct {v8, v4, v9}, Landroid/util/Size;-><init>(II)V

    new-instance v9, Lxxj;

    new-instance v10, Llxh;

    const v11, 0x7f0809d7

    invoke-direct {v10, v11}, Llxh;-><init>(I)V

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v11

    invoke-direct {v9, v10, v4, v11}, Lxxj;-><init>(Llxh;II)V

    new-instance v29, Loxj;

    new-instance v17, Lsxj;

    const/16 v21, 0x7

    const/16 v22, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v17 .. v22}, Lsxj;-><init>(IIIII)V

    new-instance v10, Landroid/util/Size;

    invoke-static {v0, v12}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v11

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v12

    invoke-direct {v10, v11, v12}, Landroid/util/Size;-><init>(II)V

    new-instance v11, Landroid/util/Size;

    const v12, 0x7f070994

    invoke-virtual {v3, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    invoke-direct {v11, v12, v7}, Landroid/util/Size;-><init>(II)V

    new-instance v12, Landroid/util/Size;

    const v13, 0x7f070993

    invoke-virtual {v3, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-direct {v12, v3, v7}, Landroid/util/Size;-><init>(II)V

    move-object/from16 v23, v16

    move-object/from16 v24, v16

    move-object/from16 v25, v10

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v21, v16

    move-object/from16 v22, v17

    move-object/from16 v20, v29

    invoke-direct/range {v20 .. v27}, Loxj;-><init>(Lsxj;Lsxj;Lsxj;Lsxj;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    new-instance v3, Ldxh;

    const v10, 0x7f0402c8

    invoke-direct {v3, v10}, Ldxh;-><init>(I)V

    invoke-static {v0, v3}, Lm5h;->f(Landroid/content/Context;Lcxh;)Lcyj;

    move-result-object v30

    new-instance v3, Llxh;

    const v10, 0x7f0809d6

    invoke-direct {v3, v10}, Llxh;-><init>(I)V

    new-instance v10, Llxh;

    const v11, 0x7f0809e3

    invoke-direct {v10, v11}, Llxh;-><init>(I)V

    new-instance v11, Llxh;

    const v12, 0x7f0809e2

    invoke-direct {v11, v12}, Llxh;-><init>(I)V

    new-instance v12, Llxh;

    const v13, 0x7f0809d5

    invoke-direct {v12, v13}, Llxh;-><init>(I)V

    const/high16 v13, 0x42200000    # 40.0f

    invoke-static {v0, v13}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v37

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v0

    div-int/2addr v0, v15

    div-int v0, v0, v39

    if-ge v0, v7, :cond_121

    move/from16 v38, v7

    goto :goto_123

    :cond_121
    move/from16 v38, v0

    :goto_123
    add-int v46, v47, v4

    const v48, 0x14808802

    sget-object v21, Lmxj;->a:Lmxj;

    const/16 v22, 0x0

    const/16 v23, 0x2

    const/16 v31, 0x0

    const/16 v35, 0x0

    const/16 v40, 0x0

    const/16 v41, 0x0

    const v42, 0x3f733333    # 0.95f

    const v43, 0x3f733333    # 0.95f

    move-object/from16 v25, v2

    move/from16 v45, v4

    move-object/from16 v24, v2

    move-object/from16 v32, v3

    move/from16 v44, v4

    move-object/from16 v20, v5

    move-object/from16 v26, v6

    move-object/from16 v27, v8

    move-object/from16 v28, v9

    move-object/from16 v33, v10

    move-object/from16 v34, v11

    move-object/from16 v36, v12

    invoke-direct/range {v20 .. v48}, Leyj;-><init>(Ln6h;IILandroid/util/Size;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;Lj7h;Loxj;Lcyj;Ltxj;Llxh;Llxh;Llxh;Llxh;Llxh;IIIZZFFIIIII)V

    return-object v20

    :cond_158
    invoke-static {}, Lh9o;->p()V

    return-object v11

    :cond_15c
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_16e

    if-eq v3, v7, :cond_16e

    if-eq v3, v15, :cond_16e

    if-ne v3, v13, :cond_16a

    move v3, v7

    goto :goto_16f

    :cond_16a
    invoke-static {}, Lh9o;->p()V

    return-object v11

    :cond_16e
    move v3, v6

    :goto_16f
    new-instance v4, Lsxj;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0709aa

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-direct {v4, v5, v5, v5, v5}, Lsxj;-><init>(IIII)V

    if-eqz v3, :cond_1d3

    new-instance v18, Llxj;

    new-instance v5, Lkxj;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v13, 0x7f0709bc

    invoke-virtual {v8, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    new-instance v13, Llxh;

    const v12, 0x7f0809e6

    invoke-direct {v13, v12}, Llxh;-><init>(I)V

    new-instance v12, Llxh;

    move/from16 v26, v15

    const v15, 0x7f0809e4

    invoke-direct {v12, v15}, Llxh;-><init>(I)V

    new-instance v15, Llxh;

    const v11, 0x7f080522

    invoke-direct {v15, v11}, Llxh;-><init>(I)V

    invoke-direct {v5, v8, v13, v12, v15}, Lkxj;-><init>(ILlxh;Llxh;Llxh;)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0709ab

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v20

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0709a8

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v21

    const/high16 v8, 0x42400000    # 48.0f

    invoke-static {v0, v8}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v23

    move-object/from16 v22, v4

    move-object/from16 v19, v5

    invoke-direct/range {v18 .. v23}, Llxj;-><init>(Lkxj;IILsxj;I)V

    :goto_1d0
    move-object/from16 v4, v18

    goto :goto_223

    :cond_1d3
    move-object/from16 v22, v4

    move/from16 v26, v15

    new-instance v18, Llxj;

    new-instance v4, Lkxj;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0709bd

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    new-instance v8, Llxh;

    const v11, 0x7f0809e7

    invoke-direct {v8, v11}, Llxh;-><init>(I)V

    new-instance v11, Llxh;

    const v12, 0x7f0809e5

    invoke-direct {v11, v12}, Llxh;-><init>(I)V

    new-instance v12, Llxh;

    const v13, 0x7f080527

    invoke-direct {v12, v13}, Llxh;-><init>(I)V

    invoke-direct {v4, v5, v8, v11, v12}, Lkxj;-><init>(ILlxh;Llxh;Llxh;)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0709ac

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v20

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0709a9

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v21

    const/high16 v5, 0x42000000    # 32.0f

    invoke-static {v0, v5}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v23

    move-object/from16 v19, v4

    invoke-direct/range {v18 .. v23}, Llxj;-><init>(Lkxj;IILsxj;I)V

    goto :goto_1d0

    :goto_223
    invoke-static {v0, v9}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v5

    if-eqz v3, :cond_22c

    const/high16 v8, 0x41000000    # 8.0f

    goto :goto_22e

    :cond_22c
    const/high16 v8, 0x40800000    # 4.0f

    :goto_22e
    invoke-static {v0, v8}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v8

    if-eqz v3, :cond_237

    const/high16 v12, 0x41000000    # 8.0f

    goto :goto_239

    :cond_237
    const/high16 v12, 0x40800000    # 4.0f

    :goto_239
    invoke-static {v0, v12}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v3

    iget-object v9, v4, Llxj;->d:Lsxj;

    iget v11, v9, Lsxj;->b:I

    iget v12, v4, Llxj;->c:I

    add-int/2addr v11, v12

    iget v9, v9, Lsxj;->d:I

    add-int/2addr v11, v9

    add-int v9, v11, v8

    add-int v33, v9, v3

    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v9

    if-ge v9, v2, :cond_254

    move/from16 v18, v2

    goto :goto_256

    :cond_254
    move/from16 v18, v9

    :goto_256
    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v37

    new-instance v2, Lsxj;

    invoke-direct {v2, v6, v8, v6, v3}, Lsxj;-><init>(IIII)V

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    shl-int/lit8 v6, v18, 0x1

    sub-int/2addr v3, v6

    new-instance v34, Lsxj;

    const/16 v38, 0x3

    const/16 v39, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v34 .. v39}, Lsxj;-><init>(IIIII)V

    move-object/from16 v9, v34

    new-instance v16, Leyj;

    new-instance v14, Landroid/util/Size;

    invoke-direct {v14, v3, v11}, Landroid/util/Size;-><init>(II)V

    new-instance v15, Landroid/util/Size;

    iget v13, v9, Lsxj;->a:I

    sub-int v13, v3, v13

    move/from16 v19, v7

    iget v7, v9, Lsxj;->c:I

    sub-int/2addr v13, v7

    iget v7, v9, Lsxj;->b:I

    sub-int v7, v11, v7

    iget v10, v9, Lsxj;->d:I

    sub-int/2addr v7, v10

    invoke-direct {v15, v13, v7}, Landroid/util/Size;-><init>(II)V

    new-instance v7, Landroid/util/Size;

    invoke-direct {v7, v3, v11}, Landroid/util/Size;-><init>(II)V

    new-instance v10, Landroid/util/Size;

    invoke-direct {v10, v3, v11}, Landroid/util/Size;-><init>(II)V

    new-instance v38, Loxj;

    new-instance v3, Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v11

    sub-int/2addr v11, v6

    shl-int/lit8 v37, v37, 0x1

    sub-int v11, v11, v37

    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {v0, v6}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v6

    invoke-direct {v3, v11, v6}, Landroid/util/Size;-><init>(II)V

    new-instance v6, Landroid/util/Size;

    sub-int/2addr v5, v8

    move/from16 v8, v19

    invoke-direct {v6, v8, v5}, Landroid/util/Size;-><init>(II)V

    new-instance v5, Landroid/util/Size;

    invoke-direct {v5, v8, v8}, Landroid/util/Size;-><init>(II)V

    move-object/from16 v41, v2

    move-object/from16 v42, v2

    move-object/from16 v39, v2

    move-object/from16 v43, v3

    move-object/from16 v45, v5

    move-object/from16 v44, v6

    move-object/from16 v40, v9

    invoke-direct/range {v38 .. v45}, Loxj;-><init>(Lsxj;Lsxj;Lsxj;Lsxj;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    sget-object v40, Ljsc;->e:Ljsc;

    new-instance v2, Lhxh;

    const v3, 0x7f040940

    invoke-direct {v2, v3}, Lhxh;-><init>(I)V

    new-instance v3, Lhxh;

    const v5, 0x7f040941

    invoke-direct {v3, v5}, Lhxh;-><init>(I)V

    new-instance v5, Lqxj;

    new-instance v6, Llxh;

    const v8, 0x7f080572

    invoke-direct {v6, v8}, Llxh;-><init>(I)V

    const/16 v8, 0xfe

    const/4 v9, 0x0

    invoke-direct {v5, v6, v9, v9, v8}, Lqxj;-><init>(Llxh;Lgxh;Lcxh;I)V

    new-instance v6, Luxj;

    const/16 v8, 0x7d

    invoke-direct {v6, v9, v8}, Luxj;-><init>(Lixh;I)V

    new-instance v8, Lrxj;

    iget v9, v4, Llxj;->b:I

    invoke-direct {v8, v9, v12}, Lrxj;-><init>(II)V

    new-instance v9, Lpxj;

    new-instance v11, Lixh;

    const/high16 v13, 0x40000000    # 2.0f

    invoke-direct {v11, v13}, Lixh;-><init>(F)V

    const v12, 0x7f15026c

    invoke-static {v12, v0}, Lm5h;->m(ILandroid/content/Context;)Lkxh;

    move-result-object v0

    const/16 v12, 0xc

    const/4 v13, 0x4

    invoke-direct {v9, v13, v11, v0, v12}, Lpxj;-><init>(ILixh;Lkxh;I)V

    new-instance v39, Lcyj;

    const/16 v44, 0x0

    const/16 v48, 0x10

    move-object/from16 v41, v2

    move-object/from16 v42, v3

    move-object/from16 v46, v5

    move-object/from16 v45, v6

    move-object/from16 v43, v8

    move-object/from16 v47, v9

    invoke-direct/range {v39 .. v48}, Lcyj;-><init>(Ljsc;Ly7h;Lhxh;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;I)V

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    div-int v0, v0, v33

    const/4 v8, 0x1

    if-ge v0, v8, :cond_338

    const/16 v34, 0x1

    goto :goto_33a

    :cond_338
    move/from16 v34, v0

    :goto_33a
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v0

    sub-int v0, v0, v33

    div-int/lit8 v41, v0, 0x2

    const/16 v43, 0x0

    const v44, 0x1583f802

    const/16 v19, 0x2

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v36, 0x1

    const/16 v37, 0x1

    move-object/from16 v25, v38

    const v38, 0x3f666666    # 0.9f

    move-object/from16 v26, v39

    const v39, 0x3f666666    # 0.9f

    const/16 v42, 0x0

    move/from16 v35, v33

    move/from16 v40, v33

    move-object/from16 v17, v4

    move-object/from16 v22, v7

    move-object/from16 v23, v10

    move-object/from16 v20, v14

    move-object/from16 v21, v15

    invoke-direct/range {v16 .. v44}, Leyj;-><init>(Ln6h;IILandroid/util/Size;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;Lj7h;Loxj;Lcyj;Ltxj;Llxh;Llxh;Llxh;Llxh;Llxh;IIIZZFFIIIII)V

    return-object v16

    :cond_377
    move/from16 v26, v15

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_390

    const/4 v8, 0x1

    if-eq v3, v8, :cond_390

    move/from16 v7, v26

    if-eq v3, v7, :cond_390

    if-ne v3, v13, :cond_38a

    const/4 v3, 0x1

    goto :goto_391

    :cond_38a
    invoke-static {}, Lh9o;->p()V

    :goto_38d
    const/16 v27, 0x0

    return-object v27

    :cond_390
    move v3, v6

    :goto_391
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_3a5

    const/4 v8, 0x1

    if-eq v5, v8, :cond_3a5

    const/4 v7, 0x2

    if-eq v5, v7, :cond_3a5

    if-ne v5, v13, :cond_3a1

    const/4 v5, 0x1

    goto :goto_3a6

    :cond_3a1
    invoke-static {}, Lh9o;->p()V

    goto :goto_38d

    :cond_3a5
    move v5, v6

    :goto_3a6
    invoke-static {v0, v1}, Lm5h;->l(Landroid/content/Context;Landroid/util/Size;)Lvxj;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    const/4 v8, 0x5

    if-eqz v7, :cond_3c1

    const/4 v10, 0x1

    if-eq v7, v10, :cond_3bf

    const/4 v10, 0x2

    if-eq v7, v10, :cond_3bd

    if-eq v7, v13, :cond_3bd

    invoke-static {}, Lh9o;->p()V

    goto :goto_38d

    :cond_3bd
    move v7, v8

    goto :goto_3c2

    :cond_3bf
    const/4 v7, 0x4

    goto :goto_3c2

    :cond_3c1
    const/4 v7, 0x2

    :goto_3c2
    add-int/lit8 v10, v7, -0x1

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0709a5

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f0709a6

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v15, 0x7f0709a4

    invoke-virtual {v13, v15}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    new-instance v15, Lsxj;

    invoke-direct {v15, v11, v12, v11, v13}, Lsxj;-><init>(IIII)V

    invoke-static {v0, v3, v15}, Lm5h;->g(Landroid/content/Context;ZLsxj;)Lnxj;

    move-result-object v3

    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v11

    if-eqz v5, :cond_3f6

    move v12, v9

    goto :goto_3f8

    :cond_3f6
    const/high16 v12, 0x41000000    # 8.0f

    :goto_3f8
    invoke-static {v0, v12}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v12

    if-nez v5, :cond_400

    const/high16 v9, 0x41000000    # 8.0f

    :cond_400
    invoke-static {v0, v9}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v9

    if-lt v9, v2, :cond_40b

    move v2, v9

    :cond_40b
    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v9

    div-int/lit8 v13, v9, 0x2

    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v31

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v14

    shl-int/lit8 v15, v2, 0x1

    sub-int/2addr v14, v15

    mul-int/2addr v9, v10

    if-eqz v4, :cond_426

    new-instance v4, Lma2;

    const/4 v8, 0x1

    invoke-direct {v4, v8, v8}, Lma2;-><init>(II)V

    goto :goto_42c

    :cond_426
    new-instance v4, Lma2;

    const/4 v10, 0x4

    invoke-direct {v4, v10, v8}, Lma2;-><init>(II)V

    :goto_42c
    sub-int v8, v14, v9

    div-int/2addr v8, v7

    iget-byte v9, v4, Lma2;->b:B

    mul-int/2addr v9, v8

    iget-byte v4, v4, Lma2;->a:B

    div-int/2addr v9, v4

    sub-int v18, v2, v13

    new-instance v2, Lsxj;

    invoke-direct {v2, v13, v12, v13, v5}, Lsxj;-><init>(IIII)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v10, 0x7f0709a3

    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    new-instance v16, Leyj;

    new-instance v10, Landroid/util/Size;

    invoke-direct {v10, v8, v9}, Landroid/util/Size;-><init>(II)V

    new-instance v15, Landroid/util/Size;

    const/4 v6, -0x1

    invoke-direct {v15, v6, v9}, Landroid/util/Size;-><init>(II)V

    new-instance v6, Landroid/util/Size;

    invoke-direct {v6, v8, v9}, Landroid/util/Size;-><init>(II)V

    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v14, v4}, Landroid/util/Size;-><init>(II)V

    new-instance v14, Loxj;

    new-instance v28, Lsxj;

    const/16 v32, 0x3

    const/16 v33, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    invoke-direct/range {v28 .. v33}, Lsxj;-><init>(IIIII)V

    move-object/from16 v23, v1

    new-instance v1, Lsxj;

    move-object/from16 v33, v2

    const/4 v2, 0x0

    invoke-direct {v1, v13, v2, v13, v5}, Lsxj;-><init>(IIII)V

    new-instance v2, Landroid/util/Size;

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v21

    shl-int/lit8 v22, v18, 0x1

    sub-int v21, v21, v22

    move-object/from16 v36, v1

    const/4 v1, 0x1

    shl-int/2addr v13, v1

    sub-int v21, v21, v13

    shl-int/lit8 v31, v31, 0x1

    sub-int v13, v21, v31

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v0, v1}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v1

    invoke-direct {v2, v13, v1}, Landroid/util/Size;-><init>(II)V

    new-instance v1, Landroid/util/Size;

    sub-int/2addr v11, v12

    const/4 v13, 0x1

    invoke-direct {v1, v13, v11}, Landroid/util/Size;-><init>(II)V

    new-instance v11, Landroid/util/Size;

    invoke-direct {v11, v13, v13}, Landroid/util/Size;-><init>(II)V

    move-object/from16 v35, v33

    move-object/from16 v38, v1

    move-object/from16 v37, v2

    move-object/from16 v39, v11

    move-object/from16 v32, v14

    move-object/from16 v34, v28

    invoke-direct/range {v32 .. v39}, Loxj;-><init>(Lsxj;Lsxj;Lsxj;Lsxj;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    sget-object v34, Ljsc;->e:Ljsc;

    new-instance v1, Lqxj;

    new-instance v2, Llxh;

    const v11, 0x7f080573

    invoke-direct {v2, v11}, Llxh;-><init>(I)V

    const/16 v11, 0xfe

    const/4 v13, 0x0

    invoke-direct {v1, v2, v13, v13, v11}, Lqxj;-><init>(Llxh;Lgxh;Lcxh;I)V

    new-instance v2, Lrxj;

    iget-object v11, v3, Lnxj;->e:Lsxj;

    iget v13, v11, Lsxj;->a:I

    iget v14, v11, Lsxj;->c:I

    add-int/2addr v13, v14

    sub-int/2addr v8, v13

    iget v13, v3, Lnxj;->c:I

    iget v14, v11, Lsxj;->b:I

    add-int/2addr v13, v14

    iget v11, v11, Lsxj;->d:I

    add-int/2addr v13, v11

    sub-int v11, v9, v13

    invoke-direct {v2, v8, v11}, Lrxj;-><init>(II)V

    new-instance v8, Lpxj;

    new-instance v11, Lixh;

    const/high16 v13, 0x40800000    # 4.0f

    invoke-direct {v11, v13}, Lixh;-><init>(F)V

    const v13, 0x7f150280

    invoke-static {v13, v0}, Lm5h;->m(ILandroid/content/Context;)Lkxh;

    move-result-object v0

    const/16 v13, 0x2c

    const/4 v14, 0x4

    invoke-direct {v8, v14, v11, v0, v13}, Lpxj;-><init>(ILixh;Lkxh;I)V

    new-instance v33, Lcyj;

    const/16 v39, 0x0

    const/16 v42, 0x36

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v38, 0x0

    move-object/from16 v40, v1

    move-object/from16 v37, v2

    move-object/from16 v41, v8

    invoke-direct/range {v33 .. v42}, Lcyj;-><init>(Ljsc;Ly7h;Lhxh;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;I)V

    add-int v0, v12, v5

    add-int/2addr v0, v4

    add-int v1, v9, v12

    add-int v35, v1, v5

    add-int v40, v4, v12

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v1

    sub-int/2addr v1, v9

    const/16 v26, 0x2

    div-int/lit8 v41, v1, 0x2

    const/16 v43, 0x0

    const v44, 0x1f83f800

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    move-object/from16 v25, v32

    const/16 v32, 0x0

    const/16 v34, 0x0

    const/16 v36, 0x1

    const/16 v37, 0x1

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v42, 0x0

    move-object/from16 v17, v3

    move-object/from16 v22, v6

    move/from16 v19, v7

    move-object/from16 v20, v10

    move-object/from16 v21, v15

    move-object/from16 v26, v33

    move/from16 v33, v0

    invoke-direct/range {v16 .. v44}, Leyj;-><init>(Ln6h;IILandroid/util/Size;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;Lj7h;Loxj;Lcyj;Ltxj;Llxh;Llxh;Llxh;Llxh;Llxh;IIIZZFFIIIII)V

    return-object v16

    :cond_546
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_55b

    const/4 v8, 0x1

    if-eq v1, v8, :cond_55b

    const/4 v7, 0x2

    if-eq v1, v7, :cond_55b

    if-ne v1, v13, :cond_556

    const/4 v1, 0x1

    goto :goto_55c

    :cond_556
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_38d

    :cond_55b
    const/4 v1, 0x0

    :goto_55c
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0709a1

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v6, 0x7f0709a2

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0709a0

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    new-instance v7, Lsxj;

    invoke-direct {v7, v2, v3, v2, v6}, Lsxj;-><init>(IIII)V

    invoke-static {v0, v1, v7}, Lm5h;->g(Landroid/content/Context;ZLsxj;)Lnxj;

    move-result-object v1

    iget-object v2, v1, Lnxj;->e:Lsxj;

    if-nez v4, :cond_5a7

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v6, 0x7f0709b1

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    if-lt v3, v4, :cond_5a7

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0709b2

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    goto :goto_5a8

    :cond_5a7
    const/4 v3, 0x0

    :goto_5a8
    const/high16 v4, 0x433c0000    # 188.0f

    invoke-static {v0, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v6

    const/high16 v7, 0x41c00000    # 24.0f

    invoke-static {v0, v7}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v7

    add-int/2addr v7, v3

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v8

    sub-int/2addr v8, v6

    sub-int/2addr v8, v7

    sub-int v8, v8, p5

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0709bb

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    if-ge v8, v9, :cond_5cf

    move v8, v9

    :cond_5cf
    invoke-virtual/range {p3 .. p3}, Landroid/util/Size;->getWidth()I

    move-result v9

    invoke-virtual/range {p3 .. p3}, Landroid/util/Size;->getHeight()I

    move-result v10

    if-gt v9, v10, :cond_5fe

    invoke-virtual/range {p3 .. p3}, Landroid/util/Size;->getHeight()I

    move-result v9

    int-to-float v9, v9

    const v10, 0x3f19999a    # 0.6f

    mul-float/2addr v9, v10

    invoke-static {v9}, Lzed;->b(F)I

    move-result v9

    if-le v9, v8, :cond_5e9

    move v9, v8

    :cond_5e9
    invoke-virtual/range {p3 .. p3}, Landroid/util/Size;->getWidth()I

    move-result v10

    mul-int/2addr v10, v9

    invoke-virtual/range {p3 .. p3}, Landroid/util/Size;->getHeight()I

    move-result v11

    div-int/2addr v10, v11

    new-instance v11, Landroid/util/Size;

    if-lt v10, v4, :cond_5f8

    move v4, v10

    :cond_5f8
    invoke-direct {v11, v4, v9}, Landroid/util/Size;-><init>(II)V

    :goto_5fb
    move-object/from16 v32, v11

    goto :goto_60f

    :cond_5fe
    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v9

    div-int/2addr v9, v13

    if-le v9, v8, :cond_606

    move v9, v8

    :cond_606
    new-instance v11, Landroid/util/Size;

    if-lt v9, v4, :cond_60b

    move v4, v9

    :cond_60b
    invoke-direct {v11, v4, v9}, Landroid/util/Size;-><init>(II)V

    goto :goto_5fb

    :goto_60f
    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getHeight()I

    move-result v4

    sub-int/2addr v8, v4

    const/16 v26, 0x2

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v6, v8

    add-int/2addr v7, v8

    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v8

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getWidth()I

    move-result v9

    sub-int/2addr v8, v9

    div-int/lit8 v8, v8, 0x2

    sub-int/2addr v8, v4

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v9

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getWidth()I

    move-result v10

    sub-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x2

    sub-int v52, v9, v4

    new-instance v33, Lsxj;

    const/high16 v9, 0x42900000    # 72.0f

    invoke-static {v0, v9}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v34

    invoke-static {v0, v14}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v35

    const/16 v37, 0x4

    const/16 v38, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v33 .. v38}, Lsxj;-><init>(IIIII)V

    move-object/from16 v9, v33

    sget-object v34, Ljsc;->f:Ljsc;

    new-instance v10, Lqxj;

    new-instance v11, Llxh;

    const v12, 0x7f080574

    invoke-direct {v11, v12}, Llxh;-><init>(I)V

    const/16 v12, 0xfe

    const/4 v14, 0x0

    invoke-direct {v10, v11, v14, v14, v12}, Lqxj;-><init>(Llxh;Lgxh;Lcxh;I)V

    new-instance v11, Lrxj;

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getWidth()I

    move-result v12

    iget v14, v2, Lsxj;->a:I

    iget v15, v2, Lsxj;->c:I

    add-int/2addr v14, v15

    sub-int/2addr v12, v14

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getHeight()I

    move-result v14

    iget v15, v1, Lnxj;->c:I

    iget v13, v2, Lsxj;->b:I

    add-int/2addr v15, v13

    iget v2, v2, Lsxj;->d:I

    add-int/2addr v15, v2

    sub-int/2addr v14, v15

    invoke-direct {v11, v12, v14}, Lrxj;-><init>(II)V

    new-instance v2, Lpxj;

    new-instance v13, Lixh;

    const/high16 v15, 0x40c00000    # 6.0f

    invoke-direct {v13, v15}, Lixh;-><init>(F)V

    const v15, 0x7f15027f

    invoke-static {v15, v0}, Lm5h;->m(ILandroid/content/Context;)Lkxh;

    move-result-object v15

    const/4 v0, 0x6

    move-object/from16 v29, v1

    const/16 v1, 0x2c

    invoke-direct {v2, v0, v13, v15, v1}, Lpxj;-><init>(ILixh;Lkxh;I)V

    new-instance v33, Lcyj;

    const/16 v39, 0x0

    const/16 v42, 0x36

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v38, 0x0

    move-object/from16 v41, v2

    move-object/from16 v40, v10

    move-object/from16 v37, v11

    invoke-direct/range {v33 .. v42}, Lcyj;-><init>(Ljsc;Ly7h;Lhxh;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;I)V

    move-object/from16 v2, v33

    move-object/from16 v0, v34

    move-object/from16 v1, v37

    if-lez v3, :cond_788

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getHeight()I

    move-result v3

    add-int v34, v3, v6

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v3

    sub-int v3, v3, v34

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0709af

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v13, 0x7f0709ad

    invoke-virtual {v11, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    int-to-float v13, v11

    int-to-float v15, v14

    div-float/2addr v13, v15

    new-instance v15, Landroid/util/Size;

    mul-int/2addr v12, v11

    div-int/2addr v12, v14

    invoke-direct {v15, v12, v11}, Landroid/util/Size;-><init>(II)V

    new-instance v11, Landroid/util/Size;

    invoke-virtual {v15}, Landroid/util/Size;->getWidth()I

    move-result v12

    const/16 v19, 0x1

    shl-int/lit8 v10, v10, 0x1

    add-int/2addr v12, v10

    invoke-virtual {v15}, Landroid/util/Size;->getHeight()I

    move-result v14

    add-int/2addr v14, v10

    invoke-direct {v11, v12, v14}, Landroid/util/Size;-><init>(II)V

    new-instance v33, Ltxj;

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v10

    invoke-virtual {v11}, Landroid/util/Size;->getWidth()I

    move-result v12

    sub-int/2addr v10, v12

    const/4 v12, 0x2

    div-int/2addr v10, v12

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    move/from16 p1, v3

    if-eqz v5, :cond_71a

    const/4 v3, 0x1

    if-eq v5, v3, :cond_716

    if-eq v5, v12, :cond_716

    const/4 v3, 0x3

    if-eq v5, v3, :cond_716

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_38d

    :cond_716
    const v3, 0x7f0709b3

    goto :goto_71d

    :cond_71a
    const v3, 0x7f0709b4

    :goto_71d
    invoke-virtual {v14, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    new-instance v5, Ljsc;

    iget-object v0, v0, Ljsc;->b:Lshf;

    invoke-direct {v5, v0, v0}, Ljsc;-><init>(Lshf;Lshf;)V

    invoke-virtual {v15}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {v15}, Landroid/util/Size;->getHeight()I

    move-result v12

    invoke-static {v1, v0, v12}, Lrxj;->a(Lrxj;II)Lrxj;

    move-result-object v39

    new-instance v0, Ljxh;

    const v1, 0x7f0709b0

    invoke-direct {v0, v1}, Ljxh;-><init>(I)V

    new-instance v1, Lixh;

    const/high16 v12, 0x40000000    # 2.0f

    invoke-direct {v1, v12}, Lixh;-><init>(F)V

    iget-object v12, v2, Lcyj;->g:Lqxj;

    iget v14, v12, Lqxj;->h:F

    mul-float/2addr v14, v13

    invoke-static {v12, v14}, Lqxj;->a(Lqxj;F)Lqxj;

    move-result-object v40

    new-instance v14, Lixh;

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-direct {v14, v12}, Lixh;-><init>(F)V

    iget-object v12, v2, Lcyj;->h:Lpxj;

    iget v13, v12, Lpxj;->a:I

    iget-object v15, v12, Lpxj;->c:Lfxh;

    move-object/from16 v37, v0

    iget-object v0, v12, Lpxj;->d:Lfxh;

    move-object/from16 v16, v0

    iget-object v0, v12, Lpxj;->e:Ly7h;

    iget v12, v12, Lpxj;->f:I

    new-instance v41, Lpxj;

    move-object/from16 v17, v0

    move/from16 v18, v12

    move-object/from16 v12, v41

    invoke-direct/range {v12 .. v18}, Lpxj;-><init>(ILy7h;Lfxh;Lfxh;Ly7h;I)V

    const/16 v42, 0x30

    move-object/from16 v38, v1

    move-object/from16 v35, v2

    move-object/from16 v36, v5

    invoke-static/range {v35 .. v42}, Lcyj;->a(Lcyj;Ljsc;Ly7h;Lixh;Lrxj;Lqxj;Lpxj;I)Lcyj;

    move-result-object v39

    move/from16 v37, v3

    move/from16 v36, v10

    move-object/from16 v38, v11

    move/from16 v35, p1

    invoke-direct/range {v33 .. v39}, Ltxj;-><init>(IIIILandroid/util/Size;Lcyj;)V

    move-object/from16 v11, v33

    goto :goto_78c

    :cond_788
    const/16 v27, 0x0

    move-object/from16 v11, v27

    :goto_78c
    new-instance v28, Leyj;

    new-instance v0, Landroid/util/Size;

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget v3, v9, Lsxj;->a:I

    sub-int/2addr v1, v3

    iget v3, v9, Lsxj;->c:I

    sub-int/2addr v1, v3

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getHeight()I

    move-result v3

    iget v5, v9, Lsxj;->b:I

    sub-int/2addr v3, v5

    iget v10, v9, Lsxj;->d:I

    sub-int/2addr v3, v10

    invoke-direct {v0, v1, v3}, Landroid/util/Size;-><init>(II)V

    new-instance v1, Landroid/util/Size;

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getHeight()I

    move-result v3

    const/4 v13, 0x1

    invoke-direct {v1, v13, v3}, Landroid/util/Size;-><init>(II)V

    new-instance v3, Lwxj;

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getWidth()I

    move-result v12

    shl-int/lit8 v13, v4, 0x1

    add-int/2addr v12, v13

    invoke-direct {v3, v12}, Lwxj;-><init>(I)V

    new-instance v33, Loxj;

    new-instance v12, Lsxj;

    invoke-direct {v12, v4, v6, v4, v7}, Lsxj;-><init>(IIII)V

    new-instance v14, Lsxj;

    const/4 v15, 0x0

    invoke-direct {v14, v4, v6, v15, v7}, Lsxj;-><init>(IIII)V

    move-object/from16 p0, v0

    new-instance v0, Lsxj;

    invoke-direct {v0, v15, v6, v4, v7}, Lsxj;-><init>(IIII)V

    new-instance v4, Landroid/util/Size;

    invoke-virtual/range {v32 .. v32}, Landroid/util/Size;->getHeight()I

    move-result v6

    sub-int/2addr v6, v5

    sub-int/2addr v6, v10

    const/4 v10, 0x1

    invoke-direct {v4, v10, v6}, Landroid/util/Size;-><init>(II)V

    new-instance v5, Landroid/util/Size;

    invoke-direct {v5, v8, v10}, Landroid/util/Size;-><init>(II)V

    new-instance v6, Landroid/util/Size;

    invoke-direct {v6, v8, v10}, Landroid/util/Size;-><init>(II)V

    move-object/from16 v37, v0

    move-object/from16 v38, v4

    move-object/from16 v39, v5

    move-object/from16 v40, v6

    move-object/from16 v35, v9

    move-object/from16 v34, v12

    move-object/from16 v36, v14

    invoke-direct/range {v33 .. v40}, Loxj;-><init>(Lsxj;Lsxj;Lsxj;Lsxj;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    new-instance v0, Llxh;

    const v4, 0x7f080483

    invoke-direct {v0, v4}, Llxh;-><init>(I)V

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v4

    const/16 v26, 0x2

    div-int/lit8 v4, v4, 0x2

    if-ge v4, v13, :cond_80d

    move/from16 v45, v13

    goto :goto_80f

    :cond_80d
    move/from16 v45, v4

    :goto_80f
    const/16 v51, 0x0

    const v56, 0x1f837000

    const/16 v30, 0x0

    const/16 v31, 0x2

    const/16 v40, 0x0

    const/16 v41, 0x0

    const/16 v42, 0x0

    const/16 v44, 0x0

    const/16 v46, 0x0

    const/16 v47, 0x0

    const/16 v48, 0x1

    const/16 v49, 0x1

    const/16 v50, 0x0

    move-object/from16 v34, v32

    move/from16 v53, v52

    move/from16 v54, v52

    move/from16 v55, v52

    move-object/from16 v43, v0

    move-object/from16 v35, v1

    move-object/from16 v38, v2

    move-object/from16 v36, v3

    move-object/from16 v39, v11

    move-object/from16 v37, v33

    move-object/from16 v33, p0

    invoke-direct/range {v28 .. v56}, Leyj;-><init>(Ln6h;IILandroid/util/Size;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;Lj7h;Loxj;Lcyj;Ltxj;Llxh;Llxh;Llxh;Llxh;Llxh;IIIZZFFIIIII)V

    return-object v28
.end method

.method public static f(Landroid/content/Context;Lcxh;)Lcyj;
    .registers 12

    sget-object v1, Ljsc;->d:Ljsc;

    new-instance v2, Lixh;

    const/high16 v0, 0x41100000    # 9.0f

    invoke-direct {v2, v0}, Lixh;-><init>(F)V

    new-instance v3, Lixh;

    invoke-direct {v3, v0}, Lixh;-><init>(F)V

    new-instance v7, Lqxj;

    new-instance v0, Llxh;

    const v4, 0x7f080571

    invoke-direct {v0, v4}, Llxh;-><init>(I)V

    new-instance v4, Lgxh;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lgxh;-><init>(I)V

    const/16 v5, 0xf8

    invoke-direct {v7, v0, v4, p1, v5}, Lqxj;-><init>(Llxh;Lgxh;Lcxh;I)V

    new-instance v6, Luxj;

    const/16 v0, 0x7d

    const/4 v4, 0x0

    invoke-direct {v6, v4, v0}, Luxj;-><init>(Lixh;I)V

    move-object v0, v4

    new-instance v4, Lrxj;

    const/high16 v5, 0x41900000    # 18.0f

    invoke-static {p0, v5}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v8

    invoke-static {p0, v5}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    invoke-direct {v4, v8, p0}, Lrxj;-><init>(II)V

    new-instance v8, Lpxj;

    new-instance p0, Lixh;

    const/high16 v5, 0x40000000    # 2.0f

    invoke-direct {p0, v5}, Lixh;-><init>(F)V

    const/16 v5, 0x3c

    const/4 v9, 0x4

    invoke-direct {v8, v9, p0, v0, v5}, Lpxj;-><init>(ILixh;Lkxh;I)V

    new-instance v5, Lzxj;

    new-instance p0, Lbyj;

    new-instance v0, Llxh;

    const v9, 0x7f0805c6

    invoke-direct {v0, v9}, Llxh;-><init>(I)V

    invoke-direct {p0, v0, p1}, Lbyj;-><init>(Llxh;Lcxh;)V

    invoke-direct {v5, p0}, Lzxj;-><init>(Ly7h;)V

    new-instance v0, Lcyj;

    invoke-direct/range {v0 .. v8}, Lcyj;-><init>(Ljsc;Ly7h;Ly7h;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;)V

    return-object v0
.end method

.method public static g(Landroid/content/Context;ZLsxj;)Lnxj;
    .registers 17

    const v0, 0x7f061044

    if-eqz p1, :cond_b4

    new-instance v2, Lkxj;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0709be

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    new-instance v3, Llxh;

    const v4, 0x7f0809e6

    invoke-direct {v3, v4}, Llxh;-><init>(I)V

    new-instance v4, Llxh;

    const v5, 0x7f0809e4

    invoke-direct {v4, v5}, Llxh;-><init>(I)V

    new-instance v5, Llxh;

    const v6, 0x7f080522

    invoke-direct {v5, v6}, Llxh;-><init>(I)V

    invoke-direct {v2, v1, v3, v4, v5}, Lkxj;-><init>(ILlxh;Llxh;Llxh;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0709c0

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0709c2

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    new-instance v1, Lfxh;

    invoke-direct {v1, v0}, Lfxh;-><init>(I)V

    sget-object v6, Ljsc;->d:Ljsc;

    new-instance v7, Lixh;

    const/high16 v0, 0x41400000    # 12.0f

    invoke-direct {v7, v0}, Lixh;-><init>(F)V

    new-instance v8, Lixh;

    invoke-direct {v8, v0}, Lixh;-><init>(F)V

    new-instance v12, Lqxj;

    new-instance v0, Llxh;

    const v5, 0x7f080570

    invoke-direct {v0, v5}, Llxh;-><init>(I)V

    new-instance v5, Lgxh;

    const/4 v9, 0x0

    invoke-direct {v5, v9}, Lgxh;-><init>(I)V

    const/16 v9, 0xf8

    invoke-direct {v12, v0, v5, v1, v9}, Lqxj;-><init>(Llxh;Lgxh;Lcxh;I)V

    new-instance v11, Luxj;

    const/16 v0, 0x7d

    const/4 v5, 0x0

    invoke-direct {v11, v5, v0}, Luxj;-><init>(Lixh;I)V

    new-instance v9, Lrxj;

    const/high16 v0, 0x41c00000    # 24.0f

    invoke-static {p0, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v10

    invoke-static {p0, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    invoke-direct {v9, v10, p0}, Lrxj;-><init>(II)V

    new-instance v13, Lpxj;

    new-instance p0, Lixh;

    const/high16 v0, 0x40000000    # 2.0f

    invoke-direct {p0, v0}, Lixh;-><init>(F)V

    const/16 v0, 0x3c

    const/4 v10, 0x4

    invoke-direct {v13, v10, p0, v5, v0}, Lpxj;-><init>(ILixh;Lkxh;I)V

    new-instance v10, Lzxj;

    new-instance p0, Lbyj;

    new-instance v0, Llxh;

    const v5, 0x7f0805c5

    invoke-direct {v0, v5}, Llxh;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lbyj;-><init>(Llxh;Lcxh;)V

    invoke-direct {v10, p0}, Lzxj;-><init>(Ly7h;)V

    new-instance v5, Lcyj;

    invoke-direct/range {v5 .. v13}, Lcyj;-><init>(Ljsc;Ly7h;Ly7h;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;)V

    new-instance v1, Lnxj;

    move-object v7, v5

    const v5, 0x7f15028b

    move-object/from16 v6, p2

    invoke-direct/range {v1 .. v7}, Lnxj;-><init>(Lkxj;IIILsxj;Lcyj;)V

    return-object v1

    :cond_b4
    new-instance v3, Lkxj;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0709bf

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    new-instance v2, Llxh;

    const v4, 0x7f0809e7

    invoke-direct {v2, v4}, Llxh;-><init>(I)V

    new-instance v4, Llxh;

    const v5, 0x7f0809e5

    invoke-direct {v4, v5}, Llxh;-><init>(I)V

    new-instance v5, Llxh;

    const v6, 0x7f080527

    invoke-direct {v5, v6}, Llxh;-><init>(I)V

    invoke-direct {v3, v1, v2, v4, v5}, Lkxj;-><init>(ILlxh;Llxh;Llxh;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0709c1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0709c3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    new-instance v1, Lfxh;

    invoke-direct {v1, v0}, Lfxh;-><init>(I)V

    invoke-static {p0, v1}, Lm5h;->f(Landroid/content/Context;Lcxh;)Lcyj;

    move-result-object v8

    new-instance v2, Lnxj;

    const v6, 0x7f15028c

    move-object/from16 v7, p2

    invoke-direct/range {v2 .. v8}, Lnxj;-><init>(Lkxj;IIILsxj;Lcyj;)V

    return-object v2
.end method

.method public static h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .registers 5

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    const-string p1, "\n"

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    invoke-virtual {v0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance p2, Landroid/text/style/TextAppearanceSpan;

    const v1, 0x7f150299

    invoke-direct {p2, p0, v1}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p0

    const/16 v1, 0x21

    invoke-virtual {v0, p2, p1, p0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object v0
.end method

.method public static final i(Lapm;)Ljava/lang/String;
    .registers 10

    invoke-static {p0}, Lm5h;->j(Lapm;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lapm;->b:Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    iget-object v2, p0, Lapm;->e:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_19

    :goto_17
    move-object v4, v1

    goto :goto_1c

    :cond_19
    const-string v1, ""

    goto :goto_17

    :goto_1c
    iget-object v3, p0, Lapm;->b:Ljava/lang/String;

    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    const/4 v7, 0x0

    const/16 v8, 0x3c

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v8}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final j(Lapm;)Ljava/util/List;
    .registers 6

    iget-object p0, p0, Lapm;->e:Ljava/lang/String;

    if-nez p0, :cond_7

    sget-object p0, Ll08;->a:Ll08;

    return-object p0

    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, -0x1

    move v2, v1

    :goto_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_32

    add-int/lit8 v2, v2, 0x1

    const/16 v3, 0x2f

    const/4 v4, 0x4

    invoke-static {p0, v3, v2, v4}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v3

    if-ne v3, v1, :cond_23

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    :cond_23
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_30

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_30
    move v2, v3

    goto :goto_e

    :cond_32
    return-object v0
.end method

.method public static k(Landroid/content/Context;)Ljava/util/List;
    .registers 2

    :try_start_0
    const-class v0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p0}, Landroid/content/pm/ShortcutManager;->getPinnedShortcuts()Ljava/util/List;

    move-result-object p0
    :try_end_c
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_c} :catch_d

    return-object p0

    :catch_d
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public static l(Landroid/content/Context;Landroid/util/Size;)Lvxj;
    .registers 2

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result p1

    invoke-static {p1, p0}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_25

    const/4 p1, 0x1

    if-eq p0, p1, :cond_22

    const/4 p1, 0x2

    if-eq p0, p1, :cond_1f

    const/4 p1, 0x3

    if-ne p0, p1, :cond_1a

    sget-object p0, Lvxj;->d:Lvxj;

    return-object p0

    :cond_1a
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_1f
    sget-object p0, Lvxj;->c:Lvxj;

    return-object p0

    :cond_22
    sget-object p0, Lvxj;->b:Lvxj;

    return-object p0

    :cond_25
    sget-object p0, Lvxj;->a:Lvxj;

    return-object p0
.end method

.method public static m(ILandroid/content/Context;)Lkxh;
    .registers 3

    sget-object v0, Lzhh;->y:[I

    invoke-virtual {p1, p0, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p0, Lkxh;

    invoke-direct {p0, p1}, Lkxh;-><init>(I)V

    return-object p0
.end method

.method public static final n(Lw7n;)Lg06;
    .registers 2

    instance-of v0, p0, Ln7a;

    if-eqz v0, :cond_b

    check-cast p0, Ln7a;

    invoke-interface {p0}, Ln7a;->getDefaultViewModelCreationExtras()Lg06;

    move-result-object p0

    return-object p0

    :cond_b
    sget-object p0, Le06;->b:Le06;

    return-object p0
.end method

.method public static final o(Lsf1;)Z
    .registers 7

    iget-object v0, p0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget-object p0, p0, Lsf1;->a:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz p0, :cond_30

    move-object v2, p0

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v1

    :goto_13
    if-ge v3, v2, :cond_30

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrf1;

    iget-object v5, v4, Lrf1;->a:Ljava/lang/Object;

    instance-of v5, v5, Lpfc;

    if-eqz v5, :cond_2d

    iget v5, v4, Lrf1;->b:I

    iget v4, v4, Lrf1;->c:I

    invoke-static {v1, v0, v5, v4}, Ltf1;->b(IIII)Z

    move-result v4

    if-eqz v4, :cond_2d

    const/4 p0, 0x1

    return p0

    :cond_2d
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_30
    return v1
.end method

.method public static p(I)Z
    .registers 2

    invoke-static {p0}, Ljava/lang/Character;->getType(I)I

    move-result p0

    const/16 v0, 0x17

    if-eq p0, v0, :cond_22

    const/16 v0, 0x14

    if-eq p0, v0, :cond_22

    const/16 v0, 0x16

    if-eq p0, v0, :cond_22

    const/16 v0, 0x1e

    if-eq p0, v0, :cond_22

    const/16 v0, 0x1d

    if-eq p0, v0, :cond_22

    const/16 v0, 0x18

    if-eq p0, v0, :cond_22

    const/16 v0, 0x15

    if-eq p0, v0, :cond_22

    const/4 p0, 0x0

    return p0

    :cond_22
    const/4 p0, 0x1

    return p0
.end method

.method public static q()Z
    .registers 2

    sget-boolean v0, Lm5h;->a:Z

    if-nez v0, :cond_17

    sget-object v0, Lt8;->a:Landroid/content/Context;

    const-class v1, Landroid/content/pm/ShortcutManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {v0}, Landroid/content/pm/ShortcutManager;->isRequestPinShortcutSupported()Z

    move-result v0

    sput-boolean v0, Lm5h;->b:Z

    const/4 v0, 0x1

    sput-boolean v0, Lm5h;->a:Z

    :cond_17
    sget-boolean v0, Lm5h;->b:Z

    return v0
.end method

.method public static r(Lg1g;)Ljava/util/ArrayList;
    .registers 32

    move-object/from16 v0, p0

    invoke-virtual {v0}, Lg1g;->A()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1a4

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lg1g;->O(I)V

    invoke-virtual {v0}, Lg1g;->m()I

    move-result v3

    const v4, 0x64666c38

    const/4 v5, 0x1

    if-ne v3, v4, :cond_32

    new-instance v3, Lg1g;

    invoke-direct {v3}, Lg1g;-><init>()V

    new-instance v4, Ljava/util/zip/Inflater;

    invoke-direct {v4, v5}, Ljava/util/zip/Inflater;-><init>(Z)V

    :try_start_21
    invoke-static {v0, v3, v4}, Ltym;->H(Lg1g;Lg1g;Ljava/util/zip/Inflater;)Z

    move-result v0
    :try_end_25
    .catchall {:try_start_21 .. :try_end_25} :catchall_2d

    invoke-virtual {v4}, Ljava/util/zip/Inflater;->end()V

    if-nez v0, :cond_2b

    return-object v2

    :cond_2b
    move-object v0, v3

    goto :goto_37

    :catchall_2d
    move-exception v0

    invoke-virtual {v4}, Ljava/util/zip/Inflater;->end()V

    throw v0

    :cond_32
    const v4, 0x72617720

    if-ne v3, v4, :cond_1a4

    :goto_37
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget v4, v0, Lg1g;->b:I

    iget v6, v0, Lg1g;->c:I

    :goto_40
    if-ge v4, v6, :cond_1a7

    invoke-virtual {v0}, Lg1g;->m()I

    move-result v7

    add-int/2addr v7, v4

    if-le v7, v4, :cond_1a4

    if-gt v7, v6, :cond_1a4

    invoke-virtual {v0}, Lg1g;->m()I

    move-result v4

    const v8, 0x6d657368

    if-ne v4, v8, :cond_190

    invoke-virtual {v0}, Lg1g;->m()I

    move-result v4

    const/16 v8, 0x2710

    if-gt v4, v8, :cond_76

    new-array v8, v4, [F

    const/4 v10, 0x0

    :goto_5f
    if-ge v10, v4, :cond_6e

    invoke-virtual {v0}, Lg1g;->m()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v11

    aput v11, v8, v10

    add-int/lit8 v10, v10, 0x1

    goto :goto_5f

    :cond_6e
    invoke-virtual {v0}, Lg1g;->m()I

    move-result v10

    const/16 v11, 0x7d00

    if-le v10, v11, :cond_80

    :cond_76
    move/from16 v17, v1

    move-object v1, v2

    move-object/from16 v18, v1

    move-object v14, v3

    move/from16 v19, v5

    goto/16 :goto_18a

    :cond_80
    int-to-double v11, v4

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    mul-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->log(D)D

    move-result-wide v11

    const-wide v15, 0x3fe62e42fefa39efL    # 0.6931471805599453

    div-double/2addr v11, v15

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    double-to-int v11, v11

    new-instance v12, Lbq4;

    move/from16 v17, v1

    iget-object v1, v0, Lg1g;->a:[B

    move-object/from16 v18, v2

    array-length v2, v1

    invoke-direct {v12, v1, v2}, Lbq4;-><init>([BI)V

    iget v1, v0, Lg1g;->b:I

    shl-int/lit8 v1, v1, 0x3

    invoke-virtual {v12, v1}, Lbq4;->q(I)V

    mul-int/lit8 v1, v10, 0x5

    new-array v1, v1, [F

    const/4 v2, 0x5

    move/from16 v19, v5

    new-array v5, v2, [I

    const/4 v9, 0x0

    const/16 v20, 0x0

    :goto_b2
    move-wide/from16 v21, v13

    if-ge v9, v10, :cond_e0

    const/4 v13, 0x0

    :goto_b7
    if-ge v13, v2, :cond_da

    aget v14, v5, v13

    invoke-virtual {v12, v11}, Lbq4;->i(I)I

    move-result v23

    shr-int/lit8 v24, v23, 0x1

    and-int/lit8 v2, v23, 0x1

    neg-int v2, v2

    xor-int v24, v24, v2

    add-int v2, v24, v14

    if-ge v2, v4, :cond_109

    if-ltz v2, :cond_109

    add-int/lit8 v14, v20, 0x1

    aget v23, v8, v2

    aput v23, v1, v20

    aput v2, v5, v13

    add-int/lit8 v13, v13, 0x1

    move/from16 v20, v14

    const/4 v2, 0x5

    goto :goto_b7

    :cond_da
    add-int/lit8 v9, v9, 0x1

    move-wide/from16 v13, v21

    const/4 v2, 0x5

    goto :goto_b2

    :cond_e0
    invoke-virtual {v12}, Lbq4;->g()I

    move-result v2

    add-int/lit8 v2, v2, 0x7

    and-int/lit8 v2, v2, -0x8

    invoke-virtual {v12, v2}, Lbq4;->q(I)V

    const/16 v2, 0x20

    invoke-virtual {v12, v2}, Lbq4;->i(I)I

    move-result v4

    new-array v5, v4, [Li1;

    const/4 v8, 0x0

    :goto_f4
    if-ge v8, v4, :cond_184

    const/16 v9, 0x8

    invoke-virtual {v12, v9}, Lbq4;->i(I)I

    move-result v11

    invoke-virtual {v12, v9}, Lbq4;->i(I)I

    move-result v9

    invoke-virtual {v12, v2}, Lbq4;->i(I)I

    move-result v13

    const v14, 0x1f400

    if-le v13, v14, :cond_10e

    :cond_109
    move-object v14, v3

    :cond_10a
    move-object/from16 v1, v18

    goto/16 :goto_18a

    :cond_10e
    move-object v14, v3

    int-to-double v2, v10

    mul-double v2, v2, v21

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v2, v15

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    mul-int/lit8 v3, v13, 0x3

    new-array v3, v3, [F

    shl-int/lit8 v15, v13, 0x1

    new-array v15, v15, [F

    move-object/from16 v16, v1

    const/4 v1, 0x0

    const/16 v25, 0x0

    :goto_129
    if-ge v1, v13, :cond_16f

    invoke-virtual {v12, v2}, Lbq4;->i(I)I

    move-result v26

    shr-int/lit8 v27, v26, 0x1

    move/from16 v28, v1

    and-int/lit8 v1, v26, 0x1

    neg-int v1, v1

    xor-int v27, v27, v1

    add-int v1, v27, v25

    if-ltz v1, :cond_10a

    if-ge v1, v10, :cond_10a

    mul-int/lit8 v25, v28, 0x3

    mul-int/lit8 v26, v1, 0x5

    aget v27, v16, v26

    aput v27, v3, v25

    add-int/lit8 v27, v25, 0x1

    add-int/lit8 v29, v26, 0x1

    aget v29, v16, v29

    aput v29, v3, v27

    add-int/lit8 v25, v25, 0x2

    add-int/lit8 v27, v26, 0x2

    aget v27, v16, v27

    aput v27, v3, v25

    shl-int/lit8 v25, v28, 0x1

    add-int/lit8 v27, v26, 0x3

    aget v27, v16, v27

    aput v27, v15, v25

    add-int/lit8 v25, v25, 0x1

    add-int/lit8 v26, v26, 0x4

    aget v26, v16, v26

    aput v26, v15, v25

    add-int/lit8 v25, v28, 0x1

    move/from16 v30, v25

    move/from16 v25, v1

    move/from16 v1, v30

    goto :goto_129

    :cond_16f
    new-instance v1, Li1;

    invoke-direct {v1, v11, v9, v3, v15}, Li1;-><init>(II[F[F)V

    aput-object v1, v5, v8

    add-int/lit8 v8, v8, 0x1

    move-object v3, v14

    move-object/from16 v1, v16

    const/16 v2, 0x20

    const-wide v15, 0x3fe62e42fefa39efL    # 0.6931471805599453

    goto/16 :goto_f4

    :cond_184
    move-object v14, v3

    new-instance v1, Lk5h;

    invoke-direct {v1, v5}, Lk5h;-><init>([Li1;)V

    :goto_18a
    if-eqz v1, :cond_1a6

    invoke-virtual {v14, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_197

    :cond_190
    move/from16 v17, v1

    move-object/from16 v18, v2

    move-object v14, v3

    move/from16 v19, v5

    :goto_197
    invoke-virtual {v0, v7}, Lg1g;->N(I)V

    move v4, v7

    move-object v3, v14

    move/from16 v1, v17

    move-object/from16 v2, v18

    move/from16 v5, v19

    goto/16 :goto_40

    :cond_1a4
    move-object/from16 v18, v2

    :cond_1a6
    return-object v18

    :cond_1a7
    move-object v14, v3

    return-object v14
.end method

.method public static final s(Ljava/lang/String;[B)Ljava/lang/String;
    .registers 9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v1, v0, -0x2

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    move v3, v2

    :goto_c
    if-lt v2, v1, :cond_19

    if-ne v2, v3, :cond_11

    return-object p0

    :cond_11
    if-lt v2, v0, :cond_3a

    const/4 p0, 0x5

    invoke-static {v3, p0, p1}, Lkotlin/text/c;->j(II[B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_19
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x25

    if-ne v4, v5, :cond_3a

    add-int/lit8 v4, v2, 0x1

    add-int/lit8 v5, v2, 0x3

    :try_start_25
    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0x10

    invoke-static {v6}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v6

    invoke-static {v4, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, p1, v3
    :try_end_36
    .catch Ljava/lang/NumberFormatException; {:try_start_25 .. :try_end_36} :catch_3a

    add-int/lit8 v3, v3, 0x1

    move v2, v5

    goto :goto_c

    :catch_3a
    :cond_3a
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_c
.end method

.method public static final t(Lwsk;)Ljava/util/List;
    .registers 11

    const-string v0, "id"

    invoke-static {p0, v0}, Luyg;->i(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v1, "seq"

    invoke-static {p0, v1}, Luyg;->i(Lwsk;Ljava/lang/String;)I

    move-result v1

    const-string v2, "from"

    invoke-static {p0, v2}, Luyg;->i(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "to"

    invoke-static {p0, v3}, Luyg;->i(Lwsk;Ljava/lang/String;)I

    move-result v3

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v4

    :goto_1c
    invoke-virtual {p0}, Lwsk;->n()Z

    move-result v5

    if-eqz v5, :cond_3d

    new-instance v5, Ljj9;

    invoke-virtual {p0, v0}, Lwsk;->getLong(I)J

    move-result-wide v6

    long-to-int v6, v6

    invoke-virtual {p0, v1}, Lwsk;->getLong(I)J

    move-result-wide v7

    long-to-int v7, v7

    invoke-virtual {p0, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v5, v6, v7, v8, v9}, Ljj9;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_3d
    invoke-static {v4}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->b0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final u(Losk;Ljava/lang/String;Z)Lval;
    .registers 16

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PRAGMA index_xinfo(`"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "`)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p0

    :try_start_17
    const-string v0, "seqno"

    invoke-static {p0, v0}, Luyg;->i(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v1, "cid"

    invoke-static {p0, v1}, Luyg;->i(Lwsk;Ljava/lang/String;)I

    move-result v1

    const-string v2, "name"

    invoke-static {p0, v2}, Luyg;->i(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "desc"

    invoke-static {p0, v3}, Luyg;->i(Lwsk;Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    const/4 v5, 0x0

    if-eq v0, v4, :cond_f6

    if-eq v1, v4, :cond_f6

    if-eq v2, v4, :cond_f6

    if-eq v3, v4, :cond_f6

    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    :cond_43
    :goto_43
    invoke-virtual {p0}, Lwsk;->n()Z

    move-result v7

    if-eqz v7, :cond_77

    invoke-virtual {p0, v1}, Lwsk;->getLong(I)J

    move-result-wide v7

    long-to-int v7, v7

    if-ltz v7, :cond_43

    invoke-virtual {p0, v0}, Lwsk;->getLong(I)J

    move-result-wide v7

    long-to-int v7, v7

    invoke-virtual {p0, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v3}, Lwsk;->getLong(I)J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-lez v9, :cond_66

    const-string v9, "DESC"

    goto :goto_68

    :cond_66
    const-string v9, "ASC"

    :goto_68
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v4, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_43

    :cond_77
    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Lau9;

    const/16 v2, 0x13

    invoke-direct {v1, v2}, Lau9;-><init>(B)V

    invoke-static {v1, v0}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_99
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_af

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_99

    :cond_af
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v6}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Lau9;

    const/16 v4, 0x14

    invoke-direct {v3, v4}, Lau9;-><init>(B)V

    invoke-static {v3, v1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-static {v1, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d3

    :cond_e9
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    new-instance v2, Lval;

    invoke-direct {v2, p1, v0, v1, p2}, Lval;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Z)V
    :try_end_f2
    .catchall {:try_start_17 .. :try_end_f2} :catchall_fa

    invoke-static {p0, v5}, Lfr3;->t(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    return-object v2

    :cond_f6
    invoke-static {p0, v5}, Lfr3;->t(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    return-object v5

    :catchall_fa
    move-exception p1

    :try_start_fb
    throw p1
    :try_end_fc
    .catchall {:try_start_fb .. :try_end_fc} :catchall_fc

    :catchall_fc
    move-exception p2

    invoke-static {p0, p1}, Lfr3;->t(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public static final v(Ltcc;Lqcc;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;
    .registers 10

    sget-object v0, Lqcc;->b:Lqcc;

    if-eq p1, v0, :cond_27

    move-object v0, p0

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->a:Lqcc;

    if-ne v0, v1, :cond_10

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_10
    new-instance v0, Ls71;

    const/4 v4, 0x0

    const/16 v5, 0x1b

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Ls71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, p3}, Lsgb;->q(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_24

    return-object p0

    :cond_24
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_27
    const-string p0, "repeatOnLifecycle cannot start work with the INITIALIZED lifecycle state."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static final w(Lndc;Lqcc;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;
    .registers 4

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-static {p0, p1, p2, p3}, Lm5h;->v(Ltcc;Lqcc;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_d

    return-object p0

    :cond_d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static x(Lcom/opera/android/BrowserActivity;)V
    .registers 5

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1401b7

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0804ab

    invoke-static {v2, p0}, Landroidx/core/graphics/drawable/IconCompat;->c(ILandroid/content/Context;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v2

    const-string v3, "xiaomi_launcher_shortcut_id"

    invoke-static {p0, v3, v1, v2, v0}, Lm5h;->y(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Intent;)V

    return-void
.end method

.method public static y(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Intent;)V
    .registers 6

    :try_start_0
    new-instance v0, Lnhj;

    invoke-direct {v0}, Lnhj;-><init>()V

    iput-object p0, v0, Lnhj;->a:Landroid/content/Context;

    iput-object p1, v0, Lnhj;->b:Ljava/lang/String;

    iput-object p2, v0, Lnhj;->e:Ljava/lang/CharSequence;

    filled-new-array {p4}, [Landroid/content/Intent;

    move-result-object p1

    iput-object p1, v0, Lnhj;->c:[Landroid/content/Intent;

    iput-object p3, v0, Lnhj;->h:Landroidx/core/graphics/drawable/IconCompat;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_54

    iget-object p1, v0, Lnhj;->c:[Landroid/content/Intent;

    if-eqz p1, :cond_4c

    array-length p1, p1

    if-eqz p1, :cond_4c

    new-instance p1, Landroid/content/Intent;

    const-class p3, Lcom/opera/android/utilities/ShortcutUtils$Receiver;

    invoke-direct {p1, p0, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p3, "com.opera.android.action.SHORTCUT_ADDED"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "com.opera.browser.title"

    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p3, 0x0

    const/high16 p4, 0x4c000000    # 3.3554432E7f

    invoke-static {p0, p3, p1, p4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p1

    const-class p3, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p0, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/content/pm/ShortcutManager;

    invoke-virtual {v0}, Lnhj;->a()Landroid/content/pm/ShortcutInfo;

    move-result-object p4

    invoke-virtual {p3, p4, p1}, Landroid/content/pm/ShortcutManager;->requestPinShortcut(Landroid/content/pm/ShortcutInfo;Landroid/content/IntentSender;)Z

    return-void

    :cond_4c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p3, "Shortcut must have an intent"

    invoke-direct {p1, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_54
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p3, "Shortcut must have a non-empty label"

    invoke-direct {p1, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_5c
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_5c} :catch_5c

    :catch_5c
    invoke-static {p0, p2}, Lm5h;->B(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static z(Ldx3;Landroid/graphics/Canvas;)V
    .registers 7

    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v0, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    sget-object v1, Landroid/graphics/Path$FillType;->INVERSE_WINDING:Landroid/graphics/Path$FillType;

    invoke-virtual {v0, v1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v2, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    int-to-float p0, p0

    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v2, p0, p0, v1}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    new-instance p0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method
