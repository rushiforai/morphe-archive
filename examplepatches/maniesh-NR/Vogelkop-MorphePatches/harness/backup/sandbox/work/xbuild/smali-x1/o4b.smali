.class public final Lo4b;
.super Lk6k;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final synthetic e:Lu5k;


# direct methods
.method public synthetic constructor <init>(Le6k;Lv5k;B)V
    .registers 4

    .line 8
    iput-byte p3, p0, Lo4b;->d:B

    iput-object p2, p0, Lo4b;->e:Lu5k;

    invoke-direct {p0, p1, p2}, Lk6k;-><init>(Le6k;Lu5k;)V

    return-void
.end method

.method public synthetic constructor <init>(Lu5k;Le6k;B)V
    .registers 4

    iput-byte p3, p0, Lo4b;->d:B

    iput-object p1, p0, Lo4b;->e:Lu5k;

    invoke-direct {p0, p2, p1}, Lk6k;-><init>(Le6k;Lu5k;)V

    return-void
.end method


# virtual methods
.method public final a()Lkv8;
    .registers 2

    iget-byte v0, p0, Lo4b;->d:B

    packed-switch v0, :pswitch_data_32

    :pswitch_5
    invoke-super {p0}, Lk6k;->a()Lkv8;

    move-result-object p0

    return-object p0

    :pswitch_a
    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_f
    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_14
    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_19
    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_1e
    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_23
    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_28
    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_2d
    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_28
        :pswitch_23
        :pswitch_1e
        :pswitch_5
        :pswitch_5
        :pswitch_19
        :pswitch_14
        :pswitch_f
        :pswitch_a
    .end packed-switch
.end method

.method public final b(Le6k;)Lmv8;
    .registers 3

    iget-byte v0, p0, Lo4b;->d:B

    packed-switch v0, :pswitch_data_22

    :pswitch_5
    invoke-super {p0, p1}, Lk6k;->b(Le6k;)Lmv8;

    move-result-object p0

    return-object p0

    :pswitch_a
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_d
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_10
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_13
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_16
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_19
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_1c
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_1f
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_5
        :pswitch_5
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method

.method public final c(Lbz3;)I
    .registers 8

    iget-byte v0, p0, Lo4b;->d:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lo4b;->e:Lu5k;

    packed-switch v0, :pswitch_data_142

    check-cast p0, Lcok;

    iget-object p0, p0, Lcok;->s:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lbok;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_1a
    check-cast p0, Ls4b;

    iget-object p0, p0, Ls4b;->f:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lm8k;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_2b
    check-cast p0, Lk8k;

    iget-object p0, p0, Lk8k;->k:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lj8k;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_3c
    sget-object v0, La7k;->m:Ljava/util/List;

    check-cast p0, La7k;

    iget-object v0, p0, La7k;->i:Lmgh;

    iget-object v3, p0, La7k;->d:Landroid/content/Context;

    iget-object v4, p0, La7k;->h:Ltsd;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkl5;

    invoke-static {v3, v4}, Lddh;->r(Landroid/content/Context;Lkl5;)I

    move-result v3

    iget p1, p1, Lbz3;->c:I

    if-ge p1, v3, :cond_55

    move v1, v2

    :cond_55
    iget-object p1, v0, Lmgh;->c:Ljava/lang/Object;

    check-cast p1, Lru9;

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v4, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    const-string v5, "startpage.logo_fits"

    invoke-interface {v4, v5, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    iget-object p0, p0, La7k;->f:Lu8k;

    invoke-virtual {p0}, Lu8k;->b()Lt8k;

    move-result-object p0

    iget-boolean p0, p0, Lt8k;->b:Z

    invoke-virtual {v0, v1, p0}, Lmgh;->k(ZZ)Z

    move-result p0

    if-eqz p0, :cond_78

    move v2, v3

    :cond_78
    return v2

    :pswitch_79
    check-cast p0, Ls6k;

    iget-object p0, p0, Ls6k;->f:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lr6k;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_8a
    check-cast p0, Lz5k;

    invoke-virtual {p0}, Lz5k;->C()Lagm;

    move-result-object p0

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lm6k;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_9d
    check-cast p0, Lz5k;

    invoke-virtual {p0}, Lz5k;->C()Lagm;

    move-result-object p0

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lcu5;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_b0
    check-cast p0, Ly5k;

    iget-object p0, p0, Ly5k;->f:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lx5k;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_c1
    iget p1, p1, Lbz3;->c:I

    check-cast p0, Ls5k;

    iget-object p0, p0, Ls5k;->g:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lr5k;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Ls5k;->h:Ljxh;

    invoke-virtual {v0, p0}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    if-ge p1, p0, :cond_dc

    move p1, p0

    :cond_dc
    return p1

    :pswitch_dd
    check-cast p0, Lp5k;

    iget-object p0, p0, Lp5k;->f:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lo5k;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_ee
    check-cast p0, Lvdh;

    iget-object p0, p0, Lvdh;->t:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lbeh;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_ff
    check-cast p0, Lncd;

    iget v0, p0, Lncd;->g:I

    if-nez v0, :cond_111

    iget-object v0, p0, Lncd;->f:Lplj;

    iget-object v0, v0, Lplj;->q:Ln43;

    new-instance v3, Lca2;

    invoke-direct {v3, v1, v1}, Lca2;-><init>(ZI)V

    invoke-virtual {p0, v0, v2, v3}, Lncd;->q(Lja2;ILca2;)I

    :cond_111
    iget-object p0, p0, Lncd;->h:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_11e
    check-cast p0, Ls4b;

    iget-object p0, p0, Ls4b;->f:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, La7n;

    invoke-virtual {p0, p1}, La7n;->c0(Lbz3;)I

    move-result p0

    return p0

    :pswitch_12d
    check-cast p0, Lp4b;

    iget-object p0, p0, Lp4b;->h:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, La7n;

    invoke-virtual {p0, p1}, La7n;->c0(Lbz3;)I

    move-result p0

    iget p1, p1, Lbz3;->c:I

    if-ge p0, p1, :cond_140

    move p0, p1

    :cond_140
    return p0

    nop

    :pswitch_data_142
    .packed-switch 0x0
        :pswitch_12d
        :pswitch_11e
        :pswitch_ff
        :pswitch_ee
        :pswitch_dd
        :pswitch_c1
        :pswitch_b0
        :pswitch_9d
        :pswitch_8a
        :pswitch_79
        :pswitch_3c
        :pswitch_2b
        :pswitch_1a
    .end packed-switch
.end method

.method public final d(Lbz3;)Z
    .registers 9

    iget-byte v0, p0, Lo4b;->d:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lo4b;->e:Lu5k;

    packed-switch v0, :pswitch_data_144

    check-cast p0, Lcok;

    invoke-virtual {p0}, Lcok;->z()Z

    move-result p0

    return p0

    :pswitch_10
    return v2

    :pswitch_11
    check-cast p0, Lk8k;

    invoke-virtual {p0}, Lk8k;->z()Z

    move-result p0

    return p0

    :pswitch_18
    check-cast p0, La7k;

    iget-object v0, p0, La7k;->i:Lmgh;

    iget-object v3, p0, La7k;->h:Ltsd;

    iget-object v4, p0, La7k;->d:Landroid/content/Context;

    iget-object v5, p0, La7k;->j:Lp6l;

    sget-object v6, Lp6l;->b:Lp6l;

    if-ne v5, v6, :cond_4d

    sget-object v5, La7k;->m:Ljava/util/List;

    check-cast v5, Ljava/lang/Iterable;

    instance-of v6, v5, Ljava/util/Collection;

    if-eqz v6, :cond_37

    move-object v6, v5

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_97

    :cond_37
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_97

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le6k;

    invoke-virtual {p1, v6}, Lbz3;->b(Le6k;)Z

    move-result v6

    if-eqz v6, :cond_3b

    :cond_4d
    iget-object p0, p0, La7k;->f:Lu8k;

    invoke-virtual {p0}, Lu8k;->b()Lt8k;

    move-result-object p0

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkl5;

    iget-object v5, v5, Lkl5;->b:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-static {v5, v4}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v5

    sget-object v6, Lgpj;->a:Lgpj;

    invoke-virtual {v5}, Lgpj;->d()Z

    move-result v5

    if-eqz v5, :cond_91

    sget-object p0, La7k;->m:Ljava/util/List;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkl5;

    invoke-static {v4, p0}, Lddh;->r(Landroid/content/Context;Lkl5;)I

    move-result p0

    iget p1, p1, Lbz3;->c:I

    if-ge p1, p0, :cond_7c

    move v2, v1

    :cond_7c
    iget-object p0, v0, Lmgh;->c:Ljava/lang/Object;

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "startpage.logo_fits"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    goto :goto_97

    :cond_91
    iget-boolean p0, p0, Lt8k;->b:Z

    invoke-virtual {v0, v2, p0}, Lmgh;->k(ZZ)Z

    move-result v1

    :cond_97
    :goto_97
    return v1

    :pswitch_98
    check-cast p0, Ls6k;

    invoke-virtual {p0}, Ls6k;->z()Z

    move-result p0

    return p0

    :pswitch_9f
    check-cast p0, Lz5k;

    invoke-virtual {p0}, Lu5k;->z()Z

    move-result p0

    return p0

    :pswitch_a6
    check-cast p0, Lz5k;

    invoke-virtual {p0}, Lz5k;->w()Z

    move-result p0

    return p0

    :pswitch_ad
    sget-object p0, Le6k;->p:Le6k;

    invoke-virtual {p1, p0}, Lbz3;->b(Le6k;)Z

    move-result p0

    if-nez p0, :cond_bd

    sget-object p0, Le6k;->k:Le6k;

    invoke-virtual {p1, p0}, Lbz3;->b(Le6k;)Z

    move-result p0

    if-eqz p0, :cond_c7

    :cond_bd
    iget-object p0, p1, Lbz3;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_c8

    :cond_c7
    move v1, v2

    :cond_c8
    return v1

    :pswitch_c9
    check-cast p0, Ls5k;

    invoke-virtual {p0}, Ls5k;->z()Z

    move-result p0

    if-eqz p0, :cond_da

    sget-object p0, Le6k;->k:Le6k;

    invoke-virtual {p1, p0}, Lbz3;->b(Le6k;)Z

    move-result p0

    if-nez p0, :cond_da

    move v1, v2

    :cond_da
    return v1

    :pswitch_db
    sget-object p0, Lp5k;->g:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_ec

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_103

    :cond_ec
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_f0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_103

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le6k;

    invoke-virtual {p1, v0}, Lbz3;->b(Le6k;)Z

    move-result v0

    if-eqz v0, :cond_f0

    move v1, v2

    :cond_103
    return v1

    :pswitch_104
    check-cast p0, Lvdh;

    invoke-virtual {p0}, Lvdh;->z()Z

    move-result p0

    return p0

    :pswitch_10b
    check-cast p0, Lncd;

    invoke-virtual {p0}, Lncd;->z()Z

    move-result p0

    return p0

    :pswitch_112
    sget-object p0, Le6k;->k:Le6k;

    invoke-virtual {p1, p0}, Lbz3;->b(Le6k;)Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :pswitch_11a
    sget-object p0, Lp4b;->i:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_12b

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_142

    :cond_12b
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_12f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_142

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le6k;

    invoke-virtual {p1, v0}, Lbz3;->b(Le6k;)Z

    move-result v0

    if-eqz v0, :cond_12f

    goto :goto_143

    :cond_142
    move v1, v2

    :goto_143
    return v1

    :pswitch_data_144
    .packed-switch 0x0
        :pswitch_11a
        :pswitch_112
        :pswitch_10b
        :pswitch_104
        :pswitch_db
        :pswitch_c9
        :pswitch_ad
        :pswitch_a6
        :pswitch_9f
        :pswitch_98
        :pswitch_18
        :pswitch_11
        :pswitch_10
    .end packed-switch
.end method
