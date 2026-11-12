.class public final Lkwf;
.super Lo73;
.source "SourceFile"


# instance fields
.field public A:Lpgf;

.field public B:Z

.field public C:Ltt3;

.field public D:Lkze;

.field public final j:Landroid/content/Context;

.field public final k:Lcom/opera/android/settings/SettingsManager;

.field public final l:Lnwf;

.field public final m:Lbf9;

.field public final n:Lswf;

.field public final o:Li3j;

.field public final p:Lisd;

.field public final q:Lx5f;

.field public final r:Lx5f;

.field public final s:Ldu3;

.field public final t:Lk5o;

.field public final u:Lin3;

.field public v:Lk6l;

.field public w:Laal;

.field public x:Ls9i;

.field public y:Lp8f;

.field public final z:Ljwf;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lswf;Lbf9;Lcom/opera/android/settings/SettingsManager;Lnwf;Lx5f;Lx5f;Ldu3;Lk5o;Lin3;)V
    .registers 13

    invoke-direct {p0}, Lo73;-><init>()V

    new-instance v0, Lisd;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lisd;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lkwf;->p:Lisd;

    new-instance v0, Ljwf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lkwf;->z:Ljwf;

    iput-object p1, p0, Lkwf;->j:Landroid/content/Context;

    iput-object p2, p0, Lkwf;->n:Lswf;

    iput-object p4, p0, Lkwf;->k:Lcom/opera/android/settings/SettingsManager;

    iput-object p5, p0, Lkwf;->l:Lnwf;

    iput-object p3, p0, Lkwf;->m:Lbf9;

    iput-object p6, p0, Lkwf;->q:Lx5f;

    iput-object p7, p0, Lkwf;->r:Lx5f;

    iput-object p8, p0, Lkwf;->s:Ldu3;

    iput-object p9, p0, Lkwf;->t:Lk5o;

    new-instance p1, Li3j;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p3, p1, Li3j;->a:Ljava/lang/Object;

    iput-object p4, p1, Li3j;->b:Ljava/lang/Object;

    iput-object p2, p1, Li3j;->c:Ljava/lang/Object;

    const/4 p2, 0x0

    iput-object p2, p1, Li3j;->d:Ljava/lang/Object;

    iput-object p1, p0, Lkwf;->o:Li3j;

    iput-object p10, p0, Lkwf;->u:Lin3;

    return-void
.end method

.method public static r(Lqwf;)Lz16;
    .registers 11

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const v3, 0x7f0d031f

    const/4 v7, 0x0

    packed-switch p0, :pswitch_data_17c

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_10
    new-instance v4, Lz16;

    const v6, 0x7f0805b5

    const/4 v9, 0x2

    const v5, 0x7f140d07

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_1e
    new-instance v4, Lz16;

    const v6, 0x7f08063e

    const/4 v9, 0x2

    const v5, 0x7f1415b8

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_2c
    new-instance v4, Lz16;

    const v6, 0x7f0803ec

    const/4 v9, 0x2

    const v5, 0x7f1401dc

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_3a
    new-instance v4, Lz16;

    const v6, 0x7f0805f3

    const/4 v9, 0x2

    const v5, 0x7f14012d

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_48
    new-instance v4, Lz16;

    const v6, 0x7f0804f6

    const/4 v9, 0x2

    const v5, 0x7f14129c

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_56
    new-instance v4, Lz16;

    move v8, v7

    const v7, 0x7f0d031d

    const/4 v9, 0x2

    const v5, 0x7f140a29

    const v6, 0x7f0804e3

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_67
    new-instance v4, Lz16;

    const v6, 0x7f080426

    const/4 v9, 0x2

    const v5, 0x7f140155

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_75
    new-instance v4, Lz16;

    const v6, 0x7f08054e

    const/4 v9, 0x2

    const v5, 0x7f140a36

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_83
    new-instance v4, Lz16;

    move v8, v7

    const v7, 0x7f0d0320

    const/4 v9, 0x2

    move v6, v8

    move v5, v8

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_90
    new-instance v4, Lz16;

    const v6, 0x7f0805bc

    const/4 v9, 0x2

    const v5, 0x7f140a38

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_9e
    new-instance v4, Lz16;

    const v6, 0x7f080639

    const/4 v9, 0x2

    const v5, 0x7f141256

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_ac
    new-instance v4, Lz16;

    const v6, 0x7f080558

    const/4 v9, 0x2

    const v5, 0x7f140f33

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_ba
    new-instance v0, Lz16;

    const v2, 0x7f0805d3

    const/4 v5, 0x2

    const v1, 0x7f140da0

    move v4, v7

    invoke-direct/range {v0 .. v5}, Lz16;-><init>(IIIIB)V

    return-object v0

    :pswitch_c8
    new-instance v4, Lz16;

    const v6, 0x7f0804e9

    const/4 v9, 0x2

    const v5, 0x7f1410f7

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_d6
    new-instance v4, Lz16;

    const v8, 0x7f0a05c9

    const/4 v9, 0x2

    const v5, 0x7f1410f8

    const v6, 0x7f0805a4

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_e6
    new-instance v4, Lz16;

    const v8, 0x7f0a05c8

    const/4 v9, 0x2

    const v5, 0x7f1410f6

    const v6, 0x7f0804e2

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_f6
    new-instance v4, Lz16;

    const v6, 0x7f0805fa

    const/4 v9, 0x2

    const v5, 0x7f1410fa

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_104
    new-instance v0, Lz16;

    const v2, 0x7f080541

    const/4 v5, 0x2

    const v1, 0x7f140572

    move v4, v7

    invoke-direct/range {v0 .. v5}, Lz16;-><init>(IIIIB)V

    return-object v0

    :pswitch_112
    new-instance v4, Lz16;

    const v6, 0x7f080563

    const/4 v9, 0x2

    const v5, 0x7f140a2d

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_120
    new-instance v4, Lz16;

    const v6, 0x7f080509

    const/4 v9, 0x2

    const v5, 0x7f140eab

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_12e
    new-instance v4, Lz16;

    const v6, 0x7f080543

    const/4 v9, 0x2

    const v5, 0x7f140a3a

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_13c
    new-instance v4, Lz16;

    const v8, 0x7f0a05cb

    const/4 v9, 0x2

    const v5, 0x7f140a2c

    const v6, 0x7f080554

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_14c
    new-instance v4, Lz16;

    const v6, 0x7f08061b

    const/4 v9, 0x2

    const v5, 0x7f140a3c

    move v8, v7

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_15a
    new-instance v4, Lz16;

    move v8, v7

    const v7, 0x7f0d031e

    const/4 v9, 0x2

    const v5, 0x7f1412bd

    const v6, 0x7f0805f4

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    :pswitch_16b
    new-instance v4, Lz16;

    const v8, 0x7f0a05d7

    const/4 v9, 0x2

    const v5, 0x7f1412b9

    const v6, 0x7f0805d4

    invoke-direct/range {v4 .. v9}, Lz16;-><init>(IIIIB)V

    return-object v4

    nop

    :pswitch_data_17c
    .packed-switch 0x0
        :pswitch_16b
        :pswitch_15a
        :pswitch_14c
        :pswitch_13c
        :pswitch_12e
        :pswitch_120
        :pswitch_112
        :pswitch_104
        :pswitch_f6
        :pswitch_e6
        :pswitch_d6
        :pswitch_c8
        :pswitch_ba
        :pswitch_ac
        :pswitch_9e
        :pswitch_90
        :pswitch_83
        :pswitch_75
        :pswitch_67
        :pswitch_56
        :pswitch_48
        :pswitch_3a
        :pswitch_2c
        :pswitch_1e
        :pswitch_10
    .end packed-switch
.end method

.method public static u(Landroid/view/MenuItem;Lb2l;)V
    .registers 2

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->isLoading()Z

    move-result p1

    if-eqz p1, :cond_17

    const p1, 0x7f1412bf

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    const p1, 0x7f080522

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    return-void

    :cond_17
    const p1, 0x7f1412b9

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    const p1, 0x7f0805d4

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    return-void
.end method


# virtual methods
.method public final c()Ljwf;
    .registers 1

    iget-object p0, p0, Lkwf;->z:Ljwf;

    return-object p0
.end method

.method public final m(Lr9i;Landroid/view/View;)V
    .registers 16

    invoke-virtual {p0, p2}, Lo73;->j(Landroid/view/View;)Z

    move-result p2

    iput-boolean p2, p0, Lkwf;->B:Z

    iget-object v0, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast v0, Lm66;

    iget-object v1, p0, Lkwf;->o:Li3j;

    iget-object v2, v1, Li3j;->c:Ljava/lang/Object;

    check-cast v2, Lswf;

    iget-object v3, v1, Li3j;->d:Ljava/lang/Object;

    check-cast v3, Lk6l;

    const/16 v4, 0xa

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v3, :cond_3d

    iget-object v3, v3, Lk6l;->o:Lb2l;

    if-eqz v3, :cond_3d

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3d

    invoke-static {v3}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v3

    if-ne v3, v6, :cond_3d

    new-instance p2, Lpwf;

    iget-object v1, v2, Lswf;->e:Ljava/util/ArrayList;

    sget-object v2, Lowf;->c:Lowf;

    invoke-direct {p2, v1, v2}, Lpwf;-><init>(Ljava/util/List;Lowf;)V

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    goto/16 :goto_ea

    :cond_3d
    iget-object v2, v2, Lswf;->e:Ljava/util/ArrayList;

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v5

    :goto_49
    if-ge v8, v7, :cond_a1

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    move-object v10, v9

    check-cast v10, Lqwf;

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    packed-switch v10, :pswitch_data_17a

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_5f
    sget-object v10, Lowf;->e:Lowf;

    goto :goto_8d

    :pswitch_62
    sget-object v10, Lowf;->f:Lowf;

    goto :goto_8d

    :pswitch_65
    iget-object v10, v1, Li3j;->a:Ljava/lang/Object;

    check-cast v10, Lbf9;

    invoke-virtual {v10}, Lbf9;->t()Z

    move-result v11

    if-eqz v11, :cond_85

    invoke-virtual {v10}, Lbf9;->r()I

    move-result v10

    const/4 v11, 0x2

    if-lt v10, v11, :cond_85

    iget-object v10, v1, Li3j;->b:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/settings/SettingsManager;

    const-string v11, "my_flow_visible"

    invoke-virtual {v10, v11}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_85

    sget-object v10, Lowf;->d:Lowf;

    goto :goto_8d

    :cond_85
    sget-object v10, Lowf;->c:Lowf;

    goto :goto_8d

    :pswitch_88
    sget-object v10, Lowf;->c:Lowf;

    goto :goto_8d

    :pswitch_8b
    sget-object v10, Lowf;->d:Lowf;

    :goto_8d
    invoke-virtual {v3, v10}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-nez v11, :cond_9b

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9b
    check-cast v11, Ljava/util/List;

    invoke-interface {v11, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_49

    :cond_a1
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    new-instance v7, Lpwf;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lowf;

    invoke-direct {v7, v8, v3}, Lpwf;-><init>(Ljava/util/List;Lowf;)V

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b2

    :cond_d3
    if-eqz p2, :cond_df

    new-instance p2, Lau9;

    invoke-direct {p2, v4}, Lau9;-><init>(B)V

    invoke-static {p2, v1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p2

    goto :goto_ea

    :cond_df
    new-instance p2, Lau9;

    const/16 v2, 0x9

    invoke-direct {p2, v2}, Lau9;-><init>(B)V

    invoke-static {p2, v1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p2

    :goto_ea
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v1, 0x0

    :cond_ef
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16e

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpwf;

    new-instance v3, Ljava/util/ArrayList;

    iget-boolean v7, p0, Lkwf;->B:Z

    iget-object v8, v2, Lpwf;->a:Ljava/util/List;

    iget-object v9, v2, Lpwf;->b:Lowf;

    iget-boolean v9, v9, Lowf;->b:Z

    if-eqz v9, :cond_10f

    if-eqz v7, :cond_10f

    check-cast v8, Ljava/lang/Iterable;

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->Y(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v8

    :cond_10f
    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-boolean v7, p0, Lkwf;->B:Z

    if-eqz v7, :cond_133

    sget-object v7, Lqwf;->s:Lqwf;

    invoke-virtual {p0, v7}, Lkwf;->t(Lqwf;)Z

    move-result v8

    if-eqz v8, :cond_133

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_133

    iget-object v7, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v7, Lo66;

    iput-boolean v6, v7, Lo66;->E:Z

    new-instance v8, Lkqd;

    const/16 v9, 0x16

    invoke-direct {v8, p0, v9}, Lkqd;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v7, Lo66;->D:Lkqd;

    :cond_133
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v5

    :cond_138
    :goto_138
    if-ge v8, v7, :cond_ef

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lqwf;

    invoke-virtual {p0, v9}, Lkwf;->t(Lqwf;)Z

    move-result v10

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v11

    const/16 v12, 0x8

    if-eq v11, v12, :cond_138

    if-eq v11, v4, :cond_138

    const/16 v12, 0xb

    if-eq v11, v12, :cond_138

    if-eqz v10, :cond_16a

    if-eq v2, v1, :cond_169

    if-eqz v1, :cond_169

    const-string v1, ""

    invoke-virtual {v0, v5, v5, v5, v1}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v1

    const v11, 0x7f0d010e

    invoke-virtual {v1, v11}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    invoke-virtual {v1, v5}, Lptd;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_169
    move-object v1, v2

    :cond_16a
    invoke-virtual {p0, p1, v0, v9, v10}, Lkwf;->q(Lr9i;Landroid/view/Menu;Lqwf;Z)V

    goto :goto_138

    :cond_16e
    new-instance p2, Ls9i;

    invoke-direct {p2, p0}, Ls9i;-><init>(Lkwf;)V

    iput-object p2, p0, Lkwf;->x:Ls9i;

    invoke-virtual {p1, v6}, Lr9i;->S(Z)V

    return-void

    nop

    :pswitch_data_17a
    .packed-switch 0x0
        :pswitch_8b
        :pswitch_8b
        :pswitch_88
        :pswitch_88
        :pswitch_88
        :pswitch_88
        :pswitch_88
        :pswitch_88
        :pswitch_88
        :pswitch_8b
        :pswitch_88
        :pswitch_88
        :pswitch_88
        :pswitch_65
        :pswitch_88
        :pswitch_88
        :pswitch_62
        :pswitch_88
        :pswitch_88
        :pswitch_8b
        :pswitch_8b
        :pswitch_5f
        :pswitch_88
        :pswitch_88
        :pswitch_88
    .end packed-switch
.end method

.method public final onDismiss()V
    .registers 5

    invoke-super {p0}, Lo73;->onDismiss()V

    iget-object v0, p0, Lkwf;->x:Ls9i;

    if-eqz v0, :cond_2f

    iget-object v1, v0, Ls9i;->e:Ljava/lang/Object;

    check-cast v1, Lkwf;

    iget-object v2, v1, Lkwf;->v:Lk6l;

    iget-object v3, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v3, Lf6l;

    invoke-virtual {v2, v3}, Lk6l;->x(Lj6l;)V

    iget-object v2, v1, Lkwf;->y:Lp8f;

    iget-object v3, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v3, Lsbf;

    iget-object v2, v2, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, Li7f;

    invoke-virtual {v2, v3}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v1, v1, Lkwf;->D:Lkze;

    if-eqz v1, :cond_2c

    iget-object v0, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Ld8d;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    :cond_2c
    const/4 v0, 0x0

    iput-object v0, p0, Lkwf;->x:Ls9i;

    :cond_2f
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 12

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07e4

    const v2, 0x7f0a05bd

    const/4 v3, 0x1

    if-ne v0, v1, :cond_1b

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p0

    invoke-static {v2, p0}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p0}, Landroidx/appcompat/widget/SwitchCompat;->toggle()V

    return v3

    :cond_1b
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07ed

    if-ne v0, v1, :cond_32

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p0

    invoke-static {v2, p0}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p0}, Landroidx/appcompat/widget/SwitchCompat;->toggle()V

    return v3

    :cond_32
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07e6

    const/4 v2, 0x0

    iget-object v4, p0, Lkwf;->q:Lx5f;

    iget-object v5, p0, Lkwf;->l:Lnwf;

    if-ne v0, v1, :cond_49

    sget-object p0, Lxl0;->C:Lxl0;

    invoke-virtual {v4, p0}, Lx5f;->k0(Lxl0;)V

    invoke-virtual {v5, v2}, Lnwf;->u(Z)V

    return v3

    :cond_49
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07ef

    if-ne v0, v1, :cond_76

    iget-object p0, p0, Lkwf;->v:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->isLoading()Z

    move-result p0

    if-eqz p0, :cond_6b

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x16

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_6b
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x11

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_76
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07fb

    if-ne v0, v1, :cond_8a

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x17

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_8a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07e5

    if-ne v0, v1, :cond_9e

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x9

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_9e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07fc

    if-ne v0, v1, :cond_b2

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x18

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_b2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07f4

    if-ne v0, v1, :cond_c6

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x14

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_c6
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07f8

    if-ne v0, v1, :cond_d9

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/4 p1, 0x3

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_d9
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07f5

    if-ne v0, v1, :cond_127

    iget-object p1, p0, Lkwf;->v:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lkwf;->u:Lin3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_101

    move-object v0, p1

    :cond_101
    iget-object p1, p0, Lin3;->a:Li53;

    invoke-virtual {p1, v0}, Li53;->c(Ljava/lang/String;)Lal3;

    move-result-object p1

    if-eqz p1, :cond_111

    iget-object p0, p0, Lin3;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_112

    :cond_111
    const/4 p1, 0x0

    :cond_112
    if-eqz p1, :cond_11e

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/4 p1, 0x6

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_11e
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    invoke-direct {p0, v5, v2}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_127
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07f7

    const/4 v6, 0x2

    if-ne v0, v1, :cond_13a

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    invoke-direct {p0, v5, v6}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_13a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07f6

    if-ne v0, v1, :cond_14c

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    invoke-direct {p0, v5, v3}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_14c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07e7

    if-ne v0, v1, :cond_15f

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/4 p1, 0x7

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_15f
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a07f0

    if-ne v0, v1, :cond_1e0

    sget-object p1, Lxl0;->j:Lxl0;

    invoke-virtual {v4, p1}, Lx5f;->k0(Lxl0;)V

    iget-object p1, p0, Lkwf;->v:Lk6l;

    if-eqz p1, :cond_1df

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_1df

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lkwf;->r:Lx5f;

    iget-object v4, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v7, Lza0;

    const/16 v8, 0x98b

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9, v3}, Ljf0;-><init>(III)V

    sget-object v8, Laik;->a:[Ljava/lang/String;

    const/16 v8, 0x3f

    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-ltz v8, :cond_19c

    invoke-virtual {v0, v2, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_19c
    invoke-static {v0}, Laik;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1a4

    move v8, v2

    goto :goto_1a5

    :cond_1a4
    move v8, v3

    :goto_1a5
    invoke-virtual {v7, v2, v8, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v4}, Lx56;->C(Lzpa;)Lde0;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_1c0

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1c0

    new-instance v8, Lhf0;

    invoke-direct {v8, v0, v2, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_1cd

    :cond_1c0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v8, Lhf0;

    invoke-direct {v8, v0, v2, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_1cd
    invoke-virtual {v8, v7}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v5}, Lx5f;->U0(Lx56;)V

    iget-object p0, p0, Lkwf;->w:Laal;

    if-eqz p0, :cond_1df

    new-instance v0, Lw0a;

    invoke-direct {v0, v6}, Lw0a;-><init>(B)V

    invoke-virtual {p0, v0, p1, v2}, Laal;->S(Lo93;Lb2l;Z)V

    :cond_1df
    return v3

    :cond_1e0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07f1

    if-ne p0, v0, :cond_1f4

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x12

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_1f4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07ec

    if-ne p0, v0, :cond_208

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0xf

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_208
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07f3

    if-ne p0, v0, :cond_21c

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x13

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_21c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07f9

    if-ne p0, v0, :cond_230

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x15

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_230
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07ea

    if-ne p0, v0, :cond_244

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0xe

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_244
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07e9

    if-ne p0, v0, :cond_257

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/4 p1, 0x4

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_257
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07e8

    if-ne p0, v0, :cond_26a

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/4 p1, 0x5

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_26a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07e2

    if-ne p0, v0, :cond_27e

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0xd

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_27e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a07e1

    if-ne p0, v0, :cond_28d

    sget-object p0, Lxl0;->A:Lxl0;

    invoke-virtual {v4, p0}, Lx5f;->k0(Lxl0;)V

    return v3

    :cond_28d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const p1, 0x7f0a07eb

    if-ne p0, p1, :cond_2a1

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Llwf;

    const/16 p1, 0x8

    invoke-direct {p0, v5, p1}, Llwf;-><init>(Lnwf;B)V

    return v3

    :cond_2a1
    return v2
.end method

.method public final q(Lr9i;Landroid/view/Menu;Lqwf;Z)V
    .registers 15

    invoke-static {p3}, Lkwf;->r(Lqwf;)Lz16;

    move-result-object v0

    iget v1, v0, Lz16;->c:I

    iget v2, v0, Lz16;->b:I

    sget-object v3, Lqwf;->v:Lqwf;

    const/4 v4, 0x3

    const/4 v5, 0x0

    if-ne p3, v3, :cond_30

    sget-object v3, Lqwf;->m:Lqwf;

    sget-object v6, Lqwf;->n:Lqwf;

    sget-object v7, Lqwf;->k:Lqwf;

    filled-new-array {v7, v3, v6}, [Ljava/lang/Object;

    move-result-object v3

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v4}, Ljava/util/ArrayList;-><init>(I)V

    move v7, v5

    :goto_1e
    if-ge v7, v4, :cond_2b

    aget-object v8, v3, v7

    invoke-static {v8}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_1e

    :cond_2b
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    goto :goto_32

    :cond_30
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_32
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v6

    iget v7, p3, Lqwf;->a:I

    const-string v8, ""

    iget-object v9, p0, Lkwf;->j:Landroid/content/Context;

    if-nez v6, :cond_68

    if-eqz v2, :cond_44

    invoke-virtual {v9, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    :cond_44
    invoke-interface {p2, v5, v7, v5, v8}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object p2

    invoke-interface {p2}, Landroid/view/SubMenu;->clearHeader()V

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_63

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqwf;

    invoke-virtual {p0, v3}, Lkwf;->t(Lqwf;)Z

    move-result v6

    invoke-virtual {p0, p1, p2, v3, v6}, Lkwf;->q(Lr9i;Landroid/view/Menu;Lqwf;Z)V

    goto :goto_4f

    :cond_63
    invoke-interface {p2}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object p2

    goto :goto_72

    :cond_68
    if-eqz v2, :cond_6e

    invoke-virtual {v9, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    :cond_6e
    invoke-interface {p2, v5, v7, v5, v8}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    :goto_72
    invoke-interface {p2, p4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    sget-object p4, Lqwf;->t:Lqwf;

    const/4 v2, 0x0

    if-ne p3, p4, :cond_ad

    iget-object p4, p0, Lkwf;->A:Lpgf;

    if-eqz p4, :cond_87

    invoke-virtual {p4}, Lpgf;->a()Logf;

    move-result-object p4

    if-eqz p4, :cond_87

    iget-object p4, p4, Logf;->c:Landroid/graphics/drawable/Drawable;

    goto :goto_88

    :cond_87
    move-object p4, v2

    :goto_88
    if-eqz p4, :cond_a7

    new-instance v1, Landroid/graphics/drawable/LayerDrawable;

    filled-new-array {p4}, [Landroid/graphics/drawable/Drawable;

    move-result-object p4

    invoke-direct {v1, p4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v5, v5}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    new-instance p4, Lb0j;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p4, v1, v3}, Lb0j;-><init>(Landroid/graphics/drawable/LayerDrawable;[Ljava/lang/Integer;)V

    invoke-interface {p2, p4}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    goto :goto_b2

    :cond_a7
    if-eqz v1, :cond_b2

    invoke-interface {p2, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    goto :goto_b2

    :cond_ad
    if-eqz v1, :cond_b2

    invoke-interface {p2, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    :cond_b2
    :goto_b2
    iget p4, v0, Lz16;->d:I

    if-eqz p4, :cond_b9

    invoke-interface {p2, p4}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    :cond_b9
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    if-eqz p3, :cond_265

    const/16 p4, 0xa

    const/4 v0, 0x1

    if-eq p3, v0, :cond_213

    if-eq p3, v4, :cond_200

    const/4 v1, 0x4

    if-eq p3, v1, :cond_1fc

    const/4 v1, 0x7

    const v3, 0x7f0a05bd

    if-eq p3, v1, :cond_1da

    const/16 v1, 0x9

    if-eq p3, v1, :cond_18e

    const/16 v1, 0xc

    if-eq p3, v1, :cond_149

    const/16 v1, 0x18

    if-eq p3, v1, :cond_138

    const/16 v1, 0xf

    if-eq p3, v1, :cond_134

    const/16 v1, 0x10

    if-eq p3, v1, :cond_10d

    const/16 p4, 0x13

    if-eq p3, p4, :cond_f9

    const/16 p4, 0x14

    if-ne p3, p4, :cond_113

    new-instance p3, Lc37;

    iget-object p1, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lo66;

    iget-object p1, p1, Lo66;->F:Lkze;

    iget-object p0, p0, Lkwf;->v:Lk6l;

    invoke-direct {p3, p1, p0, p2}, Lc37;-><init>(Lkze;Lk6l;Landroid/view/MenuItem;)V

    return-void

    :cond_f9
    invoke-interface {p2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a0066

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    const p1, 0x7f08051d

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void

    :cond_10d
    invoke-interface {p2}, Landroid/view/MenuItem;->isVisible()Z

    move-result p1

    if-nez p1, :cond_114

    :cond_113
    return-void

    :cond_114
    invoke-interface {p2, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-interface {p2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lpt1;->b(Landroid/view/View;)Lpt1;

    move-result-object v3

    new-instance v1, Ligi;

    iget-object v2, p0, Lkwf;->v:Lk6l;

    new-instance v4, Leu3;

    invoke-direct {v4, p0, v0}, Leu3;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lvdf;

    invoke-direct {v6, p0, p4}, Lvdf;-><init>(Ljava/lang/Object;B)V

    const/4 v7, 0x0

    iget-object v5, p0, Lkwf;->l:Lnwf;

    invoke-direct/range {v1 .. v7}, Ligi;-><init>(Lk6l;Lpt1;Ljava/util/function/BooleanSupplier;Lnwf;Ljava/lang/Runnable;Lkze;)V

    return-void

    :cond_134
    invoke-virtual {p0, p2}, Lkwf;->s(Landroid/view/MenuItem;)V

    return-void

    :cond_138
    iget-object p0, p0, Lkwf;->D:Lkze;

    if-eqz p0, :cond_145

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpeg;->c:Lpeg;

    if-ne p0, p1, :cond_145

    move v5, v0

    :cond_145
    invoke-interface {p2, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :cond_149
    iget-object p1, p0, Lkwf;->y:Lp8f;

    iget-object p3, p1, Lp8f;->c:Ljava/lang/Object;

    check-cast p3, Lukh;

    iget-boolean p4, p3, Lukh;->b:Z

    if-nez p4, :cond_15c

    iget-object p1, p1, Lp8f;->d:Ljava/lang/Object;

    check-cast p1, Lukh;

    sget-object p4, Lukh;->e:Lukh;

    if-eq p1, p4, :cond_15c

    move-object p3, p1

    :cond_15c
    iget-boolean p1, p3, Lukh;->c:Z

    invoke-interface {p2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p4

    invoke-static {v3, p4}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p4

    check-cast p4, Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p4, p1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    new-instance p1, Liwf;

    invoke-direct {p1, p0, p2, v5}, Liwf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p4, p1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-boolean p0, p3, Lukh;->b:Z

    invoke-interface {p2, p0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-interface {p2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    invoke-static {v3, p1}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p1, v5}, Landroid/view/View;->setEnabled(Z)V

    iget-boolean p2, p3, Lukh;->c:Z

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :cond_18e
    iget-object p1, p0, Lkwf;->v:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    move-object p3, p1

    check-cast p3, Ld7l;

    iget-object p3, p3, Ld7l;->j:Le7l;

    invoke-interface {p3}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p3

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lkwf;->u:Lin3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p3}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_1ad

    move-object p3, p1

    :cond_1ad
    iget-object p1, p0, Lin3;->a:Li53;

    invoke-virtual {p1, p3}, Li53;->c(Ljava/lang/String;)Lal3;

    move-result-object p1

    if-eqz p1, :cond_1be

    iget-object p0, p0, Lin3;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1be

    move-object v2, p1

    :cond_1be
    if-eqz v2, :cond_1cd

    const p0, 0x7f140633

    invoke-interface {p2, p0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    const p0, 0x7f080549

    invoke-interface {p2, p0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    return-void

    :cond_1cd
    const p0, 0x7f1410f6

    invoke-interface {p2, p0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    const p0, 0x7f0804e2

    invoke-interface {p2, p0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    return-void

    :cond_1da
    iget-object p1, p0, Lkwf;->v:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->g()Z

    move-result p1

    invoke-interface {p2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p3

    invoke-static {v3, p3}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p3, p1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    new-instance p1, Liwf;

    invoke-direct {p1, p0, p2, v5}, Liwf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, p1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void

    :cond_1fc
    invoke-virtual {p0, p2}, Lkwf;->s(Landroid/view/MenuItem;)V

    return-void

    :cond_200
    iget-object p0, p0, Lkwf;->v:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->R()Lzg;

    move-result-object p0

    if-eqz p0, :cond_20f

    move v5, v0

    :cond_20f
    invoke-interface {p2, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void

    :cond_213
    invoke-interface {p2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0a40

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iget-object p2, p0, Lkwf;->v:Lk6l;

    iget-object p2, p2, Lk6l;->o:Lb2l;

    move-object p3, p2

    check-cast p3, Ld7l;

    iget-object p3, p3, Ld7l;->j:Le7l;

    invoke-interface {p3}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_242

    new-instance p3, Li4d;

    new-instance p4, Lu5f;

    const/16 v1, 0xb

    const-string v2, "Fake text"

    invoke-direct {p4, v2, v1}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-direct {p3, p4}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    goto :goto_258

    :cond_242
    move-object p3, p2

    check-cast p3, Ld7l;

    invoke-virtual {p3}, Ld7l;->k0()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Ld7l;->l0()Ljava/lang/String;

    move-result-object p3

    new-instance v2, Li4d;

    new-instance v3, Le5f;

    invoke-direct {v3, v1, p3, p4}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-direct {v2, v3}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    move-object p3, v2

    :goto_258
    invoke-static {p1}, Lrmh;->a(Landroid/view/View;)Lrmh;

    move-result-object p4

    new-instance v1, Leof;

    invoke-direct {v1, p0, p1, v0}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p4, p3, p2, v1}, Lrmh;->b(Li4d;Lb2l;Lcom/opera/api/Callback;)V

    return-void

    :cond_265
    iget-object p0, p0, Lkwf;->v:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    invoke-static {p2, p0}, Lkwf;->u(Landroid/view/MenuItem;Lb2l;)V

    return-void
.end method

.method public final s(Landroid/view/MenuItem;)V
    .registers 4

    iget-object p0, p0, Lkwf;->v:Lk6l;

    if-eqz p0, :cond_45

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_45

    check-cast p0, Ld7l;

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v0

    if-eqz v0, :cond_45

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v0

    invoke-static {v0}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    move-result-object v0

    invoke-virtual {v0}, Llyg;->d()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_27

    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void

    :cond_27
    invoke-virtual {p0}, Ld7l;->o0()Z

    move-result v0

    if-nez v0, :cond_42

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->r()Z

    move-result v0

    if-nez v0, :cond_42

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->c0()Z

    move-result p0

    if-nez p0, :cond_42

    const/4 p0, 0x1

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void

    :cond_42
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_45
    return-void
.end method

.method public final t(Lqwf;)Z
    .registers 8

    iget-object v0, p0, Lkwf;->n:Lswf;

    iget-object v0, v0, Lswf;->f:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1af

    invoke-static {p1}, Lqwf;->k(Lqwf;)Z

    move-result v0

    if-eqz v0, :cond_1af

    invoke-static {p1}, Lqwf;->j(Lqwf;)Z

    move-result v0

    if-eqz v0, :cond_39

    iget-object v0, p0, Lkwf;->v:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    move-object v2, v0

    check-cast v2, Ld7l;

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_38

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_39

    :cond_38
    return v1

    :cond_39
    invoke-static {p1}, Lqwf;->h(Lqwf;)Z

    move-result v0

    if-eqz v0, :cond_51

    iget-object v0, p0, Lkwf;->v:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1af

    :cond_51
    invoke-static {p1}, Lqwf;->i(Lqwf;)Z

    move-result v0

    if-eqz v0, :cond_69

    iget-object v0, p0, Lkwf;->v:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->b(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1af

    :cond_69
    invoke-static {p1}, Lqwf;->d(Lqwf;)Z

    move-result v0

    if-eqz v0, :cond_81

    iget-object v0, p0, Lkwf;->v:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1af

    :cond_81
    invoke-static {p1}, Lqwf;->g(Lqwf;)Z

    move-result v0

    if-eqz v0, :cond_99

    iget-object v0, p0, Lkwf;->v:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lbtb;->b(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1af

    :cond_99
    iget-object v0, p0, Lkwf;->s:Ldu3;

    invoke-virtual {v0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lntl;

    iget-boolean v2, v0, Lntl;->a:Z

    iget-boolean v3, v0, Lntl;->b:Z

    const/4 v4, 0x1

    if-nez v2, :cond_b0

    if-nez v3, :cond_b0

    iget-boolean v0, v0, Lntl;->c:Z

    if-nez v0, :cond_b0

    move v0, v4

    goto :goto_b1

    :cond_b0
    move v0, v1

    :goto_b1
    if-nez v0, :cond_b7

    if-nez v3, :cond_b7

    move v2, v4

    goto :goto_b8

    :cond_b7
    move v2, v1

    :goto_b8
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object v3, p0, Lkwf;->t:Lk5o;

    iget-object v5, p0, Lkwf;->k:Lcom/opera/android/settings/SettingsManager;

    packed-switch p1, :pswitch_data_1b6

    :pswitch_c3
    goto/16 :goto_1ac

    :pswitch_c5
    iget-object p0, p0, Lkwf;->D:Lkze;

    if-eqz p0, :cond_d2

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpeg;->c:Lpeg;

    if-ne p0, p1, :cond_d2

    return v4

    :cond_d2
    return v1

    :pswitch_d3
    invoke-virtual {v3}, Lk5o;->u()Z

    move-result p0

    return p0

    :pswitch_d8
    iget-object p0, p0, Lkwf;->v:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p0

    return p0

    :pswitch_e9
    if-eqz v2, :cond_1af

    iget-object p0, p0, Lkwf;->v:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->n()Z

    move-result p0

    if-eqz p0, :cond_1af

    goto/16 :goto_1ac

    :pswitch_f9
    invoke-virtual {v3}, Lk5o;->o()Z

    move-result p0

    return p0

    :pswitch_fe
    const-string p1, "page_menu_show_open_in_external_app"

    invoke-virtual {v5, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1af

    iget-object p0, p0, Lkwf;->A:Lpgf;

    if-eqz p0, :cond_1af

    invoke-virtual {p0}, Lpgf;->a()Logf;

    move-result-object p0

    if-eqz p0, :cond_1af

    goto/16 :goto_1ac

    :pswitch_112
    return v0

    :pswitch_113
    iget-object p1, p0, Lkwf;->v:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_1af

    check-cast p1, Ld7l;

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v0

    if-eqz v0, :cond_1af

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object p1

    invoke-static {p1}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    iget-object p0, p0, Lkwf;->j:Landroid/content/Context;

    invoke-static {p0}, Lhyg;->h(Landroid/content/Context;)Z

    move-result p0

    return p0

    :pswitch_133
    iget-object p0, p0, Lkwf;->m:Lbf9;

    invoke-virtual {p0}, Lbf9;->t()Z

    move-result p0

    return p0

    :pswitch_13a
    iget-object p0, p0, Lkwf;->v:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->z()Z

    move-result p0

    return p0

    :pswitch_147
    const-string p0, "speed_dial.enabled"

    invoke-virtual {v5, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0

    :pswitch_14e
    iget-object p0, p0, Lkwf;->v:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->r()Z

    move-result p0

    xor-int/2addr p0, v4

    return p0

    :pswitch_15c
    iget-object p0, p0, Lkwf;->C:Ltt3;

    if-eqz p0, :cond_16d

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_16d

    move v1, v4

    :cond_16d
    xor-int/2addr v1, v4

    return v1

    :pswitch_16f
    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->h()Z

    move-result p0

    return p0

    :pswitch_174
    iget-object p0, p0, Lkwf;->v:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_1af

    check-cast p0, Ld7l;

    iget-object p1, p0, Ld7l;->j:Le7l;

    invoke-interface {p1}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object p1

    if-eqz p1, :cond_1af

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object p0

    invoke-static {p0}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    return v4

    :pswitch_18e
    iget-object p0, p0, Lkwf;->v:Lk6l;

    if-eqz p0, :cond_195

    iget-object p0, p0, Lk6l;->o:Lb2l;

    goto :goto_196

    :cond_195
    const/4 p0, 0x0

    :goto_196
    if-eqz p0, :cond_1af

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->c(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1af

    invoke-static {p0}, Lwqm;->A(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1af

    :goto_1ac
    return v4

    :pswitch_1ad
    if-eqz v0, :cond_1b0

    :cond_1af
    return v1

    :cond_1b0
    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->Z()Z

    move-result p0

    xor-int/2addr p0, v4

    return p0

    :pswitch_data_1b6
    .packed-switch 0x0
        :pswitch_1ad
        :pswitch_c3
        :pswitch_18e
        :pswitch_c3
        :pswitch_174
        :pswitch_16f
        :pswitch_15c
        :pswitch_14e
        :pswitch_147
        :pswitch_c3
        :pswitch_13a
        :pswitch_c3
        :pswitch_c3
        :pswitch_133
        :pswitch_c3
        :pswitch_113
        :pswitch_112
        :pswitch_fe
        :pswitch_f9
        :pswitch_c3
        :pswitch_e9
        :pswitch_d8
        :pswitch_d3
        :pswitch_c3
        :pswitch_c5
    .end packed-switch
.end method
