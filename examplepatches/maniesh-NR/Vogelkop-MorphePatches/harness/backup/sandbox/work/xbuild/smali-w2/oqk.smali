.class public final Loqk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public final b:Lbrk;

.field public final c:Ldbf;

.field public d:Lcl0;


# direct methods
.method public constructor <init>(Lx5f;Lbrk;Ldbf;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loqk;->a:Lx5f;

    iput-object p2, p0, Loqk;->b:Lbrk;

    iput-object p3, p0, Loqk;->c:Ldbf;

    sget-object p1, Lcl0;->b:Lcl0;

    iput-object p1, p0, Loqk;->d:Lcl0;

    return-void
.end method

.method public static b(Lcom/opera/android/suggestion/Suggestion;)Lbl0;
    .registers 2

    iget p0, p0, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v0, 0x21

    if-eq p0, v0, :cond_35

    packed-switch p0, :pswitch_data_38

    packed-switch p0, :pswitch_data_4c

    packed-switch p0, :pswitch_data_58

    const/4 p0, 0x0

    return-object p0

    :pswitch_11
    sget-object p0, Lbl0;->m:Lbl0;

    return-object p0

    :pswitch_14
    sget-object p0, Lbl0;->o:Lbl0;

    return-object p0

    :pswitch_17
    sget-object p0, Lbl0;->k:Lbl0;

    return-object p0

    :pswitch_1a
    sget-object p0, Lbl0;->j:Lbl0;

    return-object p0

    :pswitch_1d
    sget-object p0, Lbl0;->i:Lbl0;

    return-object p0

    :pswitch_20
    sget-object p0, Lbl0;->c:Lbl0;

    return-object p0

    :pswitch_23
    sget-object p0, Lbl0;->b:Lbl0;

    return-object p0

    :pswitch_26
    sget-object p0, Lbl0;->e:Lbl0;

    return-object p0

    :pswitch_29
    sget-object p0, Lbl0;->d:Lbl0;

    return-object p0

    :pswitch_2c
    sget-object p0, Lbl0;->f:Lbl0;

    return-object p0

    :pswitch_2f
    sget-object p0, Lbl0;->h:Lbl0;

    return-object p0

    :pswitch_32
    sget-object p0, Lbl0;->g:Lbl0;

    return-object p0

    :cond_35
    sget-object p0, Lbl0;->p:Lbl0;

    return-object p0

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_32
        :pswitch_32
        :pswitch_2f
        :pswitch_2f
        :pswitch_2c
        :pswitch_2c
        :pswitch_2c
        :pswitch_2c
    .end packed-switch

    :pswitch_data_4c
    .packed-switch 0x10
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
    .end packed-switch

    :pswitch_data_58
    .packed-switch 0x15
        :pswitch_1d
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
    .end packed-switch
.end method


# virtual methods
.method public final a(Lcom/opera/android/suggestion/Suggestion;Lcl0;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    iget-object v3, v0, Loqk;->b:Lbrk;

    invoke-virtual {v3}, Lbrk;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v6, 0x0

    :goto_16
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, -0x1

    if-eqz v7, :cond_2c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/opera/android/suggestion/Suggestion;

    invoke-static {v7}, Loqk;->b(Lcom/opera/android/suggestion/Suggestion;)Lbl0;

    move-result-object v7

    if-nez v7, :cond_2d

    add-int/lit8 v6, v6, 0x1

    goto :goto_16

    :cond_2c
    move v6, v8

    :cond_2d
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    const/4 v7, 0x1

    if-eq v6, v8, :cond_76

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v9

    move v10, v6

    const/4 v11, 0x0

    :goto_3b
    if-ge v10, v9, :cond_77

    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/opera/android/suggestion/Suggestion;

    invoke-static {v12}, Loqk;->b(Lcom/opera/android/suggestion/Suggestion;)Lbl0;

    move-result-object v13

    if-eqz v13, :cond_73

    invoke-virtual {v4, v13}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    if-eqz v14, :cond_56

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    goto :goto_57

    :cond_56
    const/4 v14, 0x0

    :goto_57
    add-int/2addr v14, v7

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-interface {v4, v13, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sub-int v15, v10, v6

    add-int/2addr v15, v7

    new-instance v5, Lkbf;

    invoke-direct {v5, v13, v14}, Lkbf;-><init>(Lbl0;I)V

    invoke-virtual {v2, v15, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move-object/from16 v5, p1

    invoke-virtual {v12, v5}, Lcom/opera/android/suggestion/Suggestion;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_73

    move v11, v15

    :cond_73
    add-int/lit8 v10, v10, 0x1

    goto :goto_3b

    :cond_76
    const/4 v11, 0x0

    :cond_77
    sget-object v3, Lcl0;->i:Lcl0;

    if-eq v1, v3, :cond_80

    sget-object v3, Lcl0;->h:Lcl0;

    if-eq v1, v3, :cond_80

    const/4 v11, 0x0

    :cond_80
    iget-object v0, v0, Loqk;->a:Lx5f;

    iget-boolean v3, v0, Lx5f;->h:Z

    if-nez v3, :cond_87

    return-void

    :cond_87
    iget-object v3, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lzk0;

    const/4 v6, 0x3

    const/16 v9, 0x98b

    invoke-direct {v5, v9, v8, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v4, v3}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v3

    const/16 v6, 0x14

    invoke-virtual {v3, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    if-eqz v10, :cond_af

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_af

    new-instance v12, Lhf0;

    invoke-direct {v12, v3, v6, v10}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_b8

    :cond_af
    invoke-static {v3, v6, v7}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v10

    new-instance v12, Lhf0;

    invoke-direct {v12, v3, v6, v10}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_b8
    invoke-virtual {v12, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    const/4 v3, 0x0

    invoke-virtual {v5, v3, v7, v1}, Ljf0;->q(IILjava/lang/Object;)V

    if-lez v11, :cond_cd

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_c9

    const/4 v3, 0x0

    goto :goto_ca

    :cond_c9
    move v3, v7

    :goto_ca
    invoke-virtual {v5, v7, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_cd
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_d2
    if-ge v3, v1, :cond_11b

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkbf;

    new-instance v10, Lal0;

    const/4 v11, 0x2

    invoke-direct {v10, v9, v8, v11}, Ljf0;-><init>(III)V

    iget-object v12, v6, Lkbf;->a:Lbl0;

    const/4 v13, 0x0

    invoke-virtual {v10, v13, v7, v12}, Ljf0;->q(IILjava/lang/Object;)V

    iget v6, v6, Lkbf;->b:I

    int-to-long v14, v6

    invoke-virtual {v10, v7, v7, v14, v15}, Ljf0;->p(IIJ)V

    invoke-virtual {v5, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-eqz v6, :cond_100

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_100

    new-instance v12, Lif0;

    invoke-direct {v12, v5, v11, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_10d

    :cond_100
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v5, v11, v7, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v12, Lif0;

    invoke-direct {v12, v5, v11, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_10d
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v12, v6, v10}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_d2

    :cond_11b
    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    return-void
.end method
