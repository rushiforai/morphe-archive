.class public final Lmdh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lvqi;

.field public final b:Lpdh;

.field public final c:Lcul;

.field public final d:Lghf;

.field public final e:Lx5f;

.field public final f:Lcq5;

.field public final g:Lnv1;

.field public final h:Lh42;

.field public i:Lw6j;


# direct methods
.method public constructor <init>(Lvqi;Lcom/opera/android/settings/SettingsManager;Lpdh;Lcul;Lghf;Lx5f;Lcq5;Lnv1;Lv1;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmdh;->a:Lvqi;

    iput-object p3, p0, Lmdh;->b:Lpdh;

    iput-object p4, p0, Lmdh;->c:Lcul;

    iput-object p5, p0, Lmdh;->d:Lghf;

    iput-object p6, p0, Lmdh;->e:Lx5f;

    iput-object p7, p0, Lmdh;->f:Lcq5;

    iput-object p8, p0, Lmdh;->g:Lnv1;

    new-instance p3, Lg6e;

    const/4 p5, 0x1

    invoke-direct {p3, p0, p5}, Lg6e;-><init>(Ljava/lang/Object;B)V

    new-instance p5, Lh42;

    invoke-direct {p5}, Lh42;-><init>()V

    iput-object p5, p0, Lmdh;->h:Lh42;

    iget-object p1, p1, Lvqi;->f:Lode;

    new-instance p6, Lrmg;

    const/16 p7, 0x9

    invoke-direct {p6, p0, p7}, Lrmg;-><init>(Ljava/lang/Object;B)V

    new-instance p7, Liwa;

    const/16 p8, 0x12

    invoke-direct {p7, p6, p8}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p5, p1, p7}, Lh42;->s(Lekc;Lf7f;)V

    iget-object p1, p4, Lcul;->a:Landroid/util/ArraySet;

    invoke-virtual {p1, p3}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3c

    invoke-virtual {p4}, Lcul;->e()V

    :cond_3c
    invoke-virtual {p0}, Lmdh;->c()V

    new-instance p1, Llqh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result p2

    iput-boolean p2, p1, Llqh;->a:Z

    new-instance p2, Lty;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p1, p3}, Lty;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p9, p2}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public static b(Lmdh;ZLiqi;Lkotlin/jvm/functions/Function1;I)V
    .registers 13

    and-int/lit8 v0, p4, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    move-object v5, v1

    goto :goto_8

    :cond_7
    move-object v5, p2

    :goto_8
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_d

    move-object p3, v1

    :cond_d
    iget-object p2, p0, Lmdh;->b:Lpdh;

    iget-object p2, p2, Lpdh;->b:Lndh;

    invoke-interface {p2}, Lndh;->e()Z

    move-result p2

    if-eqz p2, :cond_21

    if-eqz p3, :cond_20

    invoke-virtual {p0}, Lmdh;->a()Ljava/util/List;

    move-result-object p0

    invoke-interface {p3, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20
    return-void

    :cond_21
    iget-object v3, p0, Lmdh;->a:Lvqi;

    new-instance v6, Ls4f;

    const/16 p2, 0xc

    invoke-direct {v6, p3, p0, p2}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lr62;

    iget-object p2, v3, Lvqi;->f:Lode;

    new-instance v2, Lve9;

    const/4 v7, 0x3

    move v4, p1

    invoke-direct/range {v2 .. v7}, Lve9;-><init>(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;B)V

    const/4 p1, 0x1

    invoke-direct {p0, p2, v2, p1}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .registers 8

    iget-object v0, p0, Lmdh;->b:Lpdh;

    iget-object v1, v0, Lpdh;->b:Lndh;

    invoke-interface {v1}, Lndh;->e()Z

    move-result v1

    if-eqz v1, :cond_d

    sget-object p0, Ll08;->a:Ll08;

    return-object p0

    :cond_d
    invoke-virtual {v0}, Lpdh;->a()Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lmdh;->a:Lvqi;

    iget-object v1, v1, Lvqi;->f:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_1f

    sget-object v1, Ll08;->a:Ll08;

    :cond_1f
    check-cast v1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2a
    :goto_2a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_47

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ltqi;

    iget v4, v4, Ltqi;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2a

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    :cond_47
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v2, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_57
    if-ge v3, v1, :cond_6c

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ltqi;

    new-instance v5, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object v6, p0, Lmdh;->d:Lghf;

    invoke-direct {v5, v4, v6}, Lcom/opera/android/favorites/PushedSpeedDialFavorite;-><init>(Ltqi;Lghf;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_57

    :cond_6c
    return-object v0
.end method

.method public final c()V
    .registers 6

    iget-object v0, p0, Lmdh;->b:Lpdh;

    iget-object v0, v0, Lpdh;->b:Lndh;

    invoke-interface {v0}, Lndh;->e()Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object v0, Lvd0;->c:Lvd0;

    goto :goto_f

    :cond_d
    sget-object v0, Lvd0;->b:Lvd0;

    :goto_f
    iget-object p0, p0, Lmdh;->e:Lx5f;

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v1}, Lx56;->O(Lzpa;)Le66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0x15

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void
.end method
