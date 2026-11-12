.class public final Ldd;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Lfd;

.field public final k:Ljava/util/List;

.field public final l:Ljava/util/LinkedHashMap;

.field public m:Ldkf;

.field public n:Landroid/content/res/Resources;

.field public o:Lm66;

.field public p:Landroid/view/View;


# direct methods
.method public constructor <init>(Lfd;)V
    .registers 4

    .line 15
    new-instance v0, Lzc;

    sget-object v1, Lpc;->p:Lpc;

    invoke-direct {v0, v1}, Lzc;-><init>(Lpc;)V

    .line 16
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 17
    invoke-direct {p0, p1, v0}, Ldd;-><init>(Lfd;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lfd;Ljava/util/List;)V
    .registers 3

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Ldd;->j:Lfd;

    iput-object p2, p0, Ldd;->k:Ljava/util/List;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Ldd;->l:Ljava/util/LinkedHashMap;

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 14

    iget-object v0, p1, Lr9i;->b:Ljava/lang/Object;

    check-cast v0, Ldkf;

    iput-object v0, p0, Ldd;->m:Ldkf;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Ldd;->n:Landroid/content/res/Resources;

    iget-object v0, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast v0, Lm66;

    iput-object v0, p0, Ldd;->o:Lm66;

    iput-object p2, p0, Ldd;->p:Landroid/view/View;

    iget-object p2, p0, Ldd;->k:Ljava/util/List;

    check-cast p2, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_21
    :goto_21
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    iget-object v2, p0, Ldd;->j:Lfd;

    sget-object v3, Lad;->a:Lad;

    if-eqz v1, :cond_4f

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lbd;

    instance-of v5, v4, Lzc;

    if-eqz v5, :cond_41

    check-cast v4, Lzc;

    iget-object v3, v4, Lzc;->a:Lpc;

    invoke-virtual {v2, v3}, Lfd;->e(Lpc;)Ljf;

    move-result-object v2

    if-eqz v2, :cond_21

    goto :goto_47

    :cond_41
    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4b

    :goto_47
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_21

    :cond_4b
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_4f
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v1, 0x0

    move v4, v1

    :cond_55
    :goto_55
    if-ge v4, p2, :cond_ce

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lbd;

    instance-of v6, v5, Lzc;

    const/4 v7, 0x0

    if-eqz v6, :cond_9b

    check-cast v5, Lzc;

    iget-object v5, v5, Lzc;->a:Lpc;

    iget-object v6, p0, Ldd;->o:Lm66;

    if-nez v6, :cond_6d

    move-object v6, v7

    :cond_6d
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    iget-object v9, v5, Lpc;->a:Lxc;

    iget-object v9, v9, Lxc;->b:Lrxh;

    iget-object v10, p0, Ldd;->n:Landroid/content/res/Resources;

    if-eqz v10, :cond_7a

    move-object v7, v10

    :cond_7a
    invoke-virtual {v9, v7}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v1, v8, v1, v7}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v6

    new-instance v7, Lcd;

    invoke-virtual {v2, v5}, Lfd;->e(Lpc;)Ljf;

    move-result-object v8

    if-nez v8, :cond_8c

    sget-object v8, Lfd;->e:Ljf;

    :cond_8c
    invoke-direct {v7, v5, v8}, Lcd;-><init>(Lpc;Ljf;)V

    invoke-virtual {p0, v6, v7}, Ldd;->q(Landroid/view/MenuItem;Lcd;)V

    iget-object v5, p0, Ldd;->l:Ljava/util/LinkedHashMap;

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcd;

    goto :goto_55

    :cond_9b
    invoke-static {v5, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_ca

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_55

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_55

    iget-object v5, p0, Ldd;->o:Lm66;

    if-eqz v5, :cond_ba

    move-object v7, v5

    :cond_ba
    const-string v5, ""

    invoke-virtual {v7, v1, v1, v1, v5}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v5

    const v6, 0x7f0d010e

    invoke-virtual {v5, v6}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    invoke-interface {v5, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_55

    :cond_ca
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_ce
    iget-object p1, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lo66;

    iget-object p1, p1, Lo66;->F:Lkze;

    new-instance p2, Lyc;

    invoke-direct {p2, p0, v1}, Lyc;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, p1, p2}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 4

    iget-object v0, p0, Ldd;->l:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcd;

    if-nez p1, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    iget-object p1, p1, Lcd;->b:Ljf;

    iget-object p1, p1, Ljf;->a:Lkotlin/jvm/functions/Function2;

    iget-object p0, p0, Ldd;->p:Landroid/view/View;

    if-nez p0, :cond_15

    const/4 p0, 0x0

    :cond_15
    new-instance v0, Lef;

    sget-object v1, Laf;->a:Laf;

    invoke-direct {v0, v1}, Lef;-><init>(Ldf;)V

    invoke-interface {p1, p0, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0
.end method

.method public final q(Landroid/view/MenuItem;Lcd;)V
    .registers 8

    iget-object v0, p2, Lcd;->b:Ljf;

    iget-object v1, v0, Ljf;->c:Lxc;

    if-nez v1, :cond_a

    iget-object p2, p2, Lcd;->a:Lpc;

    iget-object v1, p2, Lpc;->a:Lxc;

    :cond_a
    iget-object p2, p0, Ldd;->m:Ldkf;

    const/4 v2, 0x0

    if-nez p2, :cond_10

    move-object p2, v2

    :cond_10
    iget v3, v1, Lxc;->a:I

    iget-object v4, v1, Lxc;->f:Lrm5;

    invoke-static {v3, p2}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    sget-object v3, Luc;->m:Luc;

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_61

    sget-object v3, Lvc;->m:Lvc;

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_46

    sget v3, Lb0j;->d:I

    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    filled-new-array {p2}, [Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-direct {v3, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/4 p2, 0x0

    invoke-virtual {v3, p2, p2}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    new-instance v4, Lb0j;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {v4, v3, p2}, Lb0j;-><init>(Landroid/graphics/drawable/LayerDrawable;[Ljava/lang/Integer;)V

    move-object p2, v4

    goto :goto_61

    :cond_46
    instance-of v3, v4, Lwc;

    if-eqz v3, :cond_78

    instance-of v3, p2, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v3, :cond_61

    new-instance v3, Lb0j;

    check-cast p2, Landroid/graphics/drawable/LayerDrawable;

    const v4, 0x7f0a0347

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v3, p2, v4}, Lb0j;-><init>(Landroid/graphics/drawable/LayerDrawable;[Ljava/lang/Integer;)V

    move-object p2, v3

    :cond_61
    :goto_61
    iget-object v1, v1, Lxc;->b:Lrxh;

    iget-object p0, p0, Ldd;->n:Landroid/content/res/Resources;

    if-eqz p0, :cond_68

    move-object v2, p0

    :cond_68
    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    iget-boolean p0, v0, Ljf;->d:Z

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void

    :cond_78
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
