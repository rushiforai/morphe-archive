.class public final Lxh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final synthetic a:B

.field public final b:Li7f;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    iput-byte v0, p0, Lxh7;->a:B

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lxh7;->b:Li7f;

    .line 160
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lxh7;->c:Ljava/lang/Object;

    .line 161
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lxh7;->d:Ljava/lang/Object;

    .line 162
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lxh7;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnx5;Lfs6;)V
    .registers 16

    const/4 v0, 0x1

    iput-byte v0, p0, Lxh7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lxh7;->b:Li7f;

    sget-object v0, Ll08;->a:Ll08;

    invoke-static {v0}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v0

    iput-object v0, p0, Lxh7;->c:Ljava/lang/Object;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v1

    iput-object v1, p0, Lxh7;->d:Ljava/lang/Object;

    new-instance v1, Lcw;

    const/16 v2, 0xa

    invoke-direct {v1, v0, p0, v2}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    sget-object v1, Lqoc;->g:Lh58;

    new-instance v3, Ljava/util/ArrayList;

    invoke-static {v1, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_39
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/16 v4, 0xb

    const/4 v5, 0x0

    if-eqz v2, :cond_58

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqoc;

    new-instance v6, Lhz1;

    const/16 v7, 0x11

    invoke-direct {v6, v2, p0, v5, v7}, Lhz1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    new-instance v2, Lxd6;

    invoke-direct {v2, v6, v4}, Lxd6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_39

    :cond_58
    invoke-static {v3, v0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v8

    sget v0, Lma9;->a:I

    new-instance v7, Lur4;

    sget-object v9, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    sget-object v11, Lh04;->a:Lh04;

    const/4 v12, 0x1

    const/4 v10, -0x2

    invoke-direct/range {v7 .. v12}, Lur4;-><init>(Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;ILh04;B)V

    iput-object v7, p0, Lxh7;->e:Ljava/lang/Object;

    iget-object v0, p2, Lfs6;->d:Ljze;

    invoke-static {v0}, Lxf8;->t(Lekc;)Lf99;

    move-result-object v0

    iget-object p2, p2, Lfs6;->f:Ljze;

    invoke-static {p2}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p2

    iget-object v1, p0, Lxh7;->d:Ljava/lang/Object;

    check-cast v1, Lnak;

    new-instance v2, Looc;

    const/4 v3, 0x4

    const/4 v6, 0x0

    invoke-direct {v2, v3, v5, v6}, Looc;-><init>(ILmt5;B)V

    invoke-static {v0, p2, v1, v2}, Lnb6;->l(Lf99;Lf99;Lf99;Ldr9;)Lcw;

    move-result-object p2

    invoke-static {p2}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p2

    new-instance v0, Lzp6;

    const/16 v1, 0x9

    invoke-direct {v0, v1, v5, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p2, v0}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object p2

    new-instance v0, Lfb9;

    invoke-direct {v0, v4, v5, p0}, Lfb9;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p2, p1, v0}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lxh7;->a:B

    iget-object p0, p0, Lxh7;->b:Li7f;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lpi9;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void

    :pswitch_d
    check-cast p1, Lokb;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lxh7;->a:B

    iget-object p0, p0, Lxh7;->b:Li7f;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lpi9;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void

    :pswitch_d
    check-cast p1, Lokb;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final a(Landroid/view/View;)F
    .registers 2

    iget-object p0, p0, Lxh7;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_19

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_19

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public final b()F
    .registers 4

    iget-object p0, p0, Lxh7;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_f
    :goto_f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    cmpg-float v2, v0, v1

    if-gez v2, :cond_f

    move v0, v1

    goto :goto_f

    :cond_2b
    return v0
.end method

.method public final c()V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lxh7;->b:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_2e

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lokb;

    iget-byte v1, p0, Lokb;->a:B

    iget-object p0, p0, Lokb;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_30

    check-cast p0, Lev7;

    invoke-virtual {p0}, Lev7;->j()V

    goto :goto_7

    :pswitch_20
    check-cast p0, Lf0e;

    invoke-virtual {p0}, Lf0e;->U()V

    goto :goto_7

    :pswitch_26
    check-cast p0, Lrkb;

    iget-object p0, p0, Lrkb;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_7

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_26
        :pswitch_20
    .end packed-switch
.end method

.method public final e(Lpoc;)Lqoc;
    .registers 5

    iget-object p0, p1, Lpoc;->b:Ljnc;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_10

    if-eq p0, v0, :cond_d

    const/4 p0, 0x0

    return-object p0

    :cond_d
    sget-object p0, Lqoc;->b:Lqoc;

    return-object p0

    :cond_10
    sget-object p0, Lpn7;->b:Lon7;

    iget-wide p0, p1, Lpoc;->c:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sub-long/2addr p0, v1

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {p0, p1, v1}, Lcs5;->y0(JLun7;)J

    move-result-wide p0

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lpn7;->c(JJ)I

    move-result v0

    if-lez v0, :cond_2e

    sget-object p0, Lqoc;->e:Lqoc;

    return-object p0

    :cond_2e
    const/4 v0, 0x2

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lpn7;->c(JJ)I

    move-result v0

    if-lez v0, :cond_3e

    sget-object p0, Lqoc;->d:Lqoc;

    return-object p0

    :cond_3e
    const/4 v0, 0x5

    sget-object v1, Lun7;->f:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lpn7;->c(JJ)I

    move-result p0

    if-lez p0, :cond_4e

    sget-object p0, Lqoc;->c:Lqoc;

    return-object p0

    :cond_4e
    sget-object p0, Lqoc;->b:Lqoc;

    return-object p0
.end method
