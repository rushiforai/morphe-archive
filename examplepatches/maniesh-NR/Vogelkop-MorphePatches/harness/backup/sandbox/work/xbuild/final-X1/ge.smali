.class public final Lge;
.super Lo73;
.source "SourceFile"


# instance fields
.field public j:Lie;

.field public k:Ldkf;

.field public final synthetic l:Lkotlin/jvm/functions/Function1;


# direct methods
.method public constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .registers 2

    iput-object p1, p0, Lge;->l:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Lo73;-><init>()V

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 3

    iget-object p2, p1, Lr9i;->b:Ljava/lang/Object;

    check-cast p2, Ldkf;

    iput-object p2, p0, Lge;->k:Ldkf;

    iget-object p2, p0, Lge;->l:Lkotlin/jvm/functions/Function1;

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lie;

    iput-object p2, p0, Lge;->j:Lie;

    if-nez p2, :cond_13

    const/4 p2, 0x0

    :cond_13
    iget-object p0, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lm66;

    invoke-virtual {p2, p0}, Lie;->e(Landroid/view/Menu;)V

    return-void
.end method

.method public final onDismiss()V
    .registers 3

    invoke-super {p0}, Lo73;->onDismiss()V

    iget-object p0, p0, Lge;->j:Lie;

    if-nez p0, :cond_8

    const/4 p0, 0x0

    :cond_8
    iget-object v0, p0, Lie;->h:Ldkf;

    invoke-static {v0}, Lzi4;->y(Landroid/content/Context;)Lm24;

    move-result-object v0

    iget-object v1, p0, Lie;->g:Lhe;

    invoke-interface {v0, v1}, Lm24;->c(Ll24;)V

    iget-object p0, p0, Lie;->e:Lx9l;

    invoke-interface {p0}, Lx9l;->k0()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 11

    iget-object p0, p0, Lge;->j:Lie;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    iget-object v0, p0, Lie;->b:Lk6l;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lie;->f:Ljava/util/LinkedHashSet;

    iget-object v4, p0, Lie;->e:Lx9l;

    iget-object v5, p0, Lie;->d:Ls9i;

    iget-object v6, p0, Lie;->j:Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfe;

    if-nez p1, :cond_25

    return v1

    :cond_25
    instance-of v6, p1, Lae;

    sget-object v7, Ly6l;->a:Ly6l;

    const/4 v8, 0x1

    if-eqz v6, :cond_38

    check-cast p1, Lae;

    iget-object p0, p1, Lae;->a:Lu3l;

    invoke-static {v0, p0, v7}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v5, p0}, Ls9i;->d0(Ljava/lang/Iterable;)V

    return v8

    :cond_38
    instance-of v6, p1, Lpd;

    if-eqz v6, :cond_48

    check-cast p1, Lpd;

    iget-object p0, p1, Lpd;->a:Lu3l;

    invoke-static {v0, p0, v7}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v5, p0}, Ls9i;->J(Ljava/lang/Iterable;)V

    return v8

    :cond_48
    instance-of v0, p1, Lnd;

    sget-object v6, Lvr0;->k:Lvr0;

    if-eqz v0, :cond_57

    invoke-virtual {v5}, Ls9i;->h0()V

    sget-object p0, Lpdb;->c:Lpdb;

    invoke-interface {v4, v3, p0, v6, v1}, Lx9l;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    return v8

    :cond_57
    instance-of v0, p1, Lod;

    if-eqz v0, :cond_64

    invoke-virtual {v5}, Ls9i;->h0()V

    sget-object p0, Lpdb;->c:Lpdb;

    invoke-interface {v4, v3, p0, v6, v1}, Lx9l;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    return v8

    :cond_64
    instance-of v0, p1, Lmd;

    if-eqz v0, :cond_77

    invoke-virtual {v5}, Ls9i;->h0()V

    sget-object p0, Lpdb;->c:Lpdb;

    check-cast p1, Lmd;

    iget-object v0, p1, Lmd;->b:Lvr0;

    iget-boolean p1, p1, Lmd;->a:Z

    invoke-interface {v4, v3, p0, v0, p1}, Lx9l;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    return v8

    :cond_77
    sget-object v0, Ltd;->a:Ltd;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_199

    sget-object v0, Lyd;->a:Lyd;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_199

    sget-object p0, Lzd;->a:Lzd;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_98

    invoke-virtual {v5}, Ls9i;->h0()V

    sget-object p0, Lvr0;->p:Lvr0;

    invoke-interface {v4, v2, v3, p0}, Lx9l;->P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V

    return v8

    :cond_98
    sget-object p0, Lce;->a:Lce;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a9

    invoke-virtual {v5}, Ls9i;->h0()V

    sget-object p0, Lvr0;->h:Lvr0;

    invoke-interface {v4, v2, v3, p0}, Lx9l;->P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V

    return v8

    :cond_a9
    sget-object p0, Ljd;->a:Ljd;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_198

    sget-object p0, Lud;->a:Lud;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_198

    sget-object p0, Lkd;->a:Lkd;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c8

    invoke-virtual {v5}, Ls9i;->h0()V

    invoke-interface {v4, v3}, Lx9l;->m0(Ljava/util/LinkedHashSet;)V

    return v8

    :cond_c8
    sget-object p0, Lld;->a:Lld;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d7

    invoke-virtual {v5}, Ls9i;->h0()V

    invoke-interface {v4, v3}, Lx9l;->w(Ljava/util/LinkedHashSet;)V

    return v8

    :cond_d7
    sget-object p0, Lqd;->a:Lqd;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ee

    invoke-virtual {v5}, Ls9i;->h0()V

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->L(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    if-eqz p0, :cond_198

    invoke-interface {v4, p0}, Lx9l;->d0(Lb2l;)V

    return v8

    :cond_ee
    instance-of p0, p1, Lvd;

    if-eqz p0, :cond_105

    invoke-virtual {v5}, Ls9i;->h0()V

    check-cast p1, Lvd;

    iget-object p0, p1, Lvd;->a:Lm4l;

    iget p0, p0, Lm4l;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    sget-object p1, Lvr0;->q:Lvr0;

    invoke-interface {v4, p0, v3, p1}, Lx9l;->P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V

    return v8

    :cond_105
    instance-of p0, p1, Lrd;

    if-eqz p0, :cond_114

    invoke-virtual {v5}, Ls9i;->h0()V

    check-cast p1, Lrd;

    iget p0, p1, Lrd;->a:I

    invoke-interface {v4, p0}, Lx9l;->p0(I)V

    return v8

    :cond_114
    instance-of p0, p1, Lsd;

    if-eqz p0, :cond_123

    invoke-virtual {v5}, Ls9i;->h0()V

    check-cast p1, Lsd;

    iget p0, p1, Lsd;->a:I

    invoke-interface {v4, p0}, Lx9l;->D(I)Z

    return v8

    :cond_123
    instance-of p0, p1, Lbe;

    if-eqz p0, :cond_167

    check-cast p1, Lbe;

    iget-object p0, p1, Lbe;->a:Lu3l;

    invoke-virtual {v5}, Ls9i;->Y()Z

    move-result v0

    if-nez v0, :cond_15f

    iput-object p0, v5, Ls9i;->e:Ljava/lang/Object;

    iget-object p0, v5, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lpde;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, v5, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lpde;

    new-instance v0, Lpyi;

    iget-object v2, v5, Ls9i;->b:Ljava/lang/Object;

    check-cast v2, Lk6l;

    iget-object v3, v5, Ls9i;->e:Ljava/lang/Object;

    check-cast v3, Lu3l;

    invoke-static {v2, v3, v7}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v3, v5, Ls9i;->e:Ljava/lang/Object;

    check-cast v3, Lu3l;

    invoke-direct {v0, v2, v3, v1}, Lpyi;-><init>(ILu3l;Z)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_15f
    iget-object p0, p1, Lbe;->b:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-virtual {v5, p0}, Ls9i;->d0(Ljava/lang/Iterable;)V

    return v8

    :cond_167
    sget-object p0, Lwd;->a:Lwd;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_192

    sget-object p0, Lxd;->a:Lxd;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_192

    sget-object p0, Lde;->a:Lde;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18b

    sget-object p0, Lee;->a:Lee;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18b

    invoke-static {}, Lh9o;->p()V

    return v1

    :cond_18b
    invoke-virtual {v5}, Ls9i;->h0()V

    invoke-interface {v4, v3, v1, v8}, Lx9l;->O(Ljava/lang/Iterable;ZZ)V

    return v8

    :cond_192
    invoke-virtual {v5}, Ls9i;->h0()V

    invoke-interface {v4, v3, v1, v8}, Lx9l;->o0(Ljava/lang/Iterable;ZZ)V

    :cond_198
    return v8

    :cond_199
    invoke-virtual {v5}, Ls9i;->h0()V

    new-instance p1, Lz3;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lz3;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v4, p1}, Lx9l;->N(Lz3;)V

    return v8
.end method
