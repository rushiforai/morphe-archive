.class public final Ld6k;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljava/util/List;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Lzyk;

.field public final c:Lomj;


# direct methods
.method static constructor <clinit>()V
    .registers 21

    sget-object v1, Le6k;->d:Le6k;

    sget-object v2, Le6k;->e:Le6k;

    sget-object v3, Le6k;->b:Le6k;

    sget-object v4, Le6k;->f:Le6k;

    sget-object v5, Le6k;->g:Le6k;

    sget-object v6, Le6k;->h:Le6k;

    sget-object v7, Le6k;->i:Le6k;

    sget-object v8, Le6k;->j:Le6k;

    sget-object v9, Le6k;->c:Le6k;

    sget-object v10, Le6k;->k:Le6k;

    sget-object v11, Le6k;->l:Le6k;

    sget-object v12, Le6k;->m:Le6k;

    sget-object v13, Le6k;->n:Le6k;

    sget-object v14, Le6k;->o:Le6k;

    sget-object v15, Le6k;->p:Le6k;

    sget-object v16, Le6k;->q:Le6k;

    sget-object v17, Le6k;->r:Le6k;

    sget-object v18, Le6k;->s:Le6k;

    sget-object v19, Le6k;->t:Le6k;

    sget-object v20, Le6k;->u:Le6k;

    filled-new-array/range {v1 .. v20}, [Le6k;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Ld6k;->d:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld6k;->a:Ljava/util/ArrayList;

    new-instance v0, Ldnj;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Ld6k;->b:Lzyk;

    new-instance v0, Lomj;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lomj;-><init>(B)V

    iput-object v0, p0, Ld6k;->c:Lomj;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;IILjava/util/Map;)Lc6k;
    .registers 14

    new-instance v0, Lbz3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput p2, v0, Lbz3;->a:I

    iput p3, v0, Lbz3;->b:I

    iput p3, v0, Lbz3;->c:I

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, v0, Lbz3;->e:Ljava/lang/Object;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, v0, Lbz3;->f:Ljava/lang/Object;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, v0, Lbz3;->g:Ljava/lang/Object;

    iget-object p2, v0, Lbz3;->f:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    iget-object p3, v0, Lbz3;->e:Ljava/lang/Object;

    check-cast p3, Ljava/util/ArrayList;

    iget-object v1, v0, Lbz3;->g:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, p0, Ld6k;->b:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v3, :cond_13e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lk6k;

    invoke-virtual {v3, v0}, Lk6k;->d(Lbz3;)Z

    move-result v6

    iget-object v7, v3, Lk6k;->a:Le6k;

    if-nez v6, :cond_54

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    :cond_54
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    packed-switch v6, :pswitch_data_1bc

    invoke-static {}, Lh9o;->p()V

    return-object v5

    :pswitch_5f
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_85

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v6

    :pswitch_69
    if-ge v4, v6, :cond_85

    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v4, v4, 0x1

    check-cast v8, La6k;

    iget-object v8, v8, La6k;->a:Lk6k;

    iget-object v8, v8, Lk6k;->a:Le6k;

    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    packed-switch v8, :pswitch_data_1e8

    invoke-static {}, Lh9o;->p()V

    return-object v5

    :pswitch_82
    sget-object v4, Li6k;->b:Li6k;

    goto :goto_87

    :cond_85
    :pswitch_85
    iget-object v4, v7, Le6k;->a:Li6k;

    :goto_87
    invoke-interface {p4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lf6k;

    if-eqz v6, :cond_92

    iget v6, v6, Lf6k;->c:I

    goto :goto_9c

    :cond_92
    invoke-virtual {v3}, Lk6k;->a()Lkv8;

    move-result-object v6

    iget-object v6, v6, Lkv8;->a:Ly7h;

    invoke-virtual {v6, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v6

    :goto_9c
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_120

    const/4 v7, 0x1

    if-eq v4, v7, :cond_ef

    const/4 v7, 0x2

    if-eq v4, v7, :cond_e5

    const/4 v7, 0x3

    if-ne v4, v7, :cond_e1

    invoke-virtual {v3, v0}, Lk6k;->c(Lbz3;)I

    move-result v4

    if-gtz v4, :cond_b5

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    :cond_b5
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_d2

    add-int/2addr v6, v4

    iget v5, v0, Lbz3;->c:I

    if-gt v6, v5, :cond_d2

    invoke-virtual {v0, v6}, Lbz3;->a(I)V

    new-instance v5, La6k;

    new-instance v6, Lb6k;

    invoke-direct {v6, v4}, Lb6k;-><init>(I)V

    invoke-direct {v5, v3, v6}, La6k;-><init>(Lk6k;Lb6k;)V

    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    :cond_d2
    new-instance v5, La6k;

    new-instance v6, Lb6k;

    invoke-direct {v6, v4}, Lb6k;-><init>(I)V

    invoke-direct {v5, v3, v6}, La6k;-><init>(Lk6k;Lb6k;)V

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    :cond_e1
    invoke-static {}, Lh9o;->p()V

    return-object v5

    :cond_e5
    new-instance v4, La6k;

    invoke-direct {v4, v3, v5}, La6k;-><init>(Lk6k;Lb6k;)V

    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    :cond_ef
    invoke-virtual {v3, v0}, Lk6k;->c(Lbz3;)I

    move-result v4

    if-gtz v4, :cond_fa

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    :cond_fa
    add-int/2addr v6, v4

    iget v5, v0, Lbz3;->c:I

    if-gt v6, v5, :cond_111

    invoke-virtual {v0, v6}, Lbz3;->a(I)V

    new-instance v5, La6k;

    new-instance v6, Lb6k;

    invoke-direct {v6, v4}, Lb6k;-><init>(I)V

    invoke-direct {v5, v3, v6}, La6k;-><init>(Lk6k;Lb6k;)V

    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    :cond_111
    new-instance v5, La6k;

    new-instance v6, Lb6k;

    invoke-direct {v6, v4}, Lb6k;-><init>(I)V

    invoke-direct {v5, v3, v6}, La6k;-><init>(Lk6k;Lb6k;)V

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    :cond_120
    invoke-virtual {v3, v0}, Lk6k;->c(Lbz3;)I

    move-result v4

    if-gtz v4, :cond_12b

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    :cond_12b
    add-int/2addr v6, v4

    invoke-virtual {v0, v6}, Lbz3;->a(I)V

    new-instance v5, La6k;

    new-instance v6, Lb6k;

    invoke-direct {v6, v4}, Lb6k;-><init>(I)V

    invoke-direct {v5, v3, v6}, La6k;-><init>(Lk6k;Lb6k;)V

    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3a

    :cond_13e
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object p4

    iget-object p0, p0, Ld6k;->c:Lomj;

    invoke-static {p0, p3}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p3

    check-cast p3, Ljava/util/Collection;

    invoke-virtual {p4, p3}, Lehc;->addAll(Ljava/util/Collection;)Z

    invoke-static {p0, p2}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-virtual {p4, p0}, Lehc;->addAll(Ljava/util/Collection;)Z

    invoke-static {p4}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {p0, v4}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p3

    :goto_163
    move-object p4, p3

    check-cast p4, Lmea;

    invoke-virtual {p4}, Lmea;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b4

    invoke-virtual {p4}, Lmea;->next()Ljava/lang/Object;

    move-result-object p4

    add-int/lit8 v2, v4, 0x1

    if-ltz v4, :cond_1b0

    check-cast p4, La6k;

    if-lez v4, :cond_185

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v4}, Lehc;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, La6k;

    iget-object v3, v3, La6k;->a:Lk6k;

    iget-object v3, v3, Lk6k;->a:Le6k;

    goto :goto_186

    :cond_185
    move-object v3, v5

    :goto_186
    iget-object v4, p4, La6k;->a:Lk6k;

    invoke-virtual {v4, v3}, Lk6k;->b(Le6k;)Lmv8;

    move-result-object v3

    new-instance v4, Lf6k;

    iget-object v6, p4, La6k;->b:Lb6k;

    if-eqz v6, :cond_19a

    new-instance v7, Lg6k;

    iget v6, v6, Lb6k;->a:I

    invoke-direct {v7, v6}, Lg6k;-><init>(I)V

    goto :goto_19c

    :cond_19a
    sget-object v7, Lh6k;->a:Lh6k;

    :goto_19c
    invoke-interface {v3}, Lmv8;->b()Lkv8;

    move-result-object v6

    iget-object v6, v6, Lkv8;->a:Ly7h;

    invoke-virtual {v6, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v6

    invoke-direct {v4, v7, v3, v6}, Lf6k;-><init>(Lzch;Lmv8;I)V

    iget-object p4, p4, La6k;->a:Lk6k;

    invoke-interface {p2, p4, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v4, v2

    goto :goto_163

    :cond_1b0
    invoke-static {}, Lj95;->n()V

    throw v5

    :cond_1b4
    new-instance p0, Lc6k;

    iget-boolean p1, v0, Lbz3;->d:Z

    invoke-direct {p0, p2, v1, p1}, Lc6k;-><init>(Ljava/util/LinkedHashMap;Ljava/util/ArrayList;Z)V

    return-object p0

    :pswitch_data_1bc
    .packed-switch 0x0
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_85
    .end packed-switch

    :pswitch_data_1e8
    .packed-switch 0x0
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_82
        :pswitch_82
        :pswitch_82
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
        :pswitch_69
    .end packed-switch
.end method
