.class public Lqsh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhrl;
.implements Lf94;
.implements Lzun;
.implements Lcco;
.implements Lcom/google/ads/interactivemedia/v3/internal/zzsf;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lqsh;->a:B

    packed-switch p1, :pswitch_data_1c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lis7;

    invoke-direct {p1}, Lis7;-><init>()V

    iput-object p1, p0, Lqsh;->b:Ljava/lang/Object;

    new-instance v0, Lu7k;

    invoke-direct {v0, p1}, Lu7k;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqsh;->c:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0xd
        :pswitch_9
    .end packed-switch
.end method

.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 28
    iput-byte p1, p0, Lqsh;->a:B

    iput-object p3, p0, Lqsh;->b:Ljava/lang/Object;

    iput-object p2, p0, Lqsh;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ldpj;Ln9h;)V
    .registers 4

    const/16 v0, 0x8

    iput-byte v0, p0, Lqsh;->a:B

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqsh;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lqsh;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgrl;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lqsh;->a:B

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lqsh;->b:Ljava/lang/Object;

    .line 43
    iput-object p1, p0, Lqsh;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 29
    iput-byte p3, p0, Lqsh;->a:B

    iput-object p1, p0, Lqsh;->b:Ljava/lang/Object;

    iput-object p2, p0, Lqsh;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lqsh;->a:B

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lqsh;->b:Ljava/lang/Object;

    .line 46
    invoke-static {p2}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object p1

    iput-object p1, p0, Lqsh;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lstm;Ls9i;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lqsh;->a:B

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p2, p0, Lqsh;->b:Ljava/lang/Object;

    .line 39
    new-instance p2, Lc6j;

    const/4 v0, 0x1

    invoke-direct {p2, p1, v0}, Lc6j;-><init>(Lt7j;Z)V

    iput-object p2, p0, Lqsh;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltcc;Leoj;Lk6l;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lqsh;->a:B

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p2, p0, Lqsh;->b:Ljava/lang/Object;

    .line 32
    iput-object p3, p0, Lqsh;->c:Ljava/lang/Object;

    .line 33
    new-instance p2, Lgoj;

    invoke-direct {p2, p0}, Lgoj;-><init>(Lqsh;)V

    .line 34
    invoke-static {p3, p1, p2}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    .line 35
    new-instance p1, Lfoj;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lfoj;-><init>(Lqsh;B)V

    const-wide/16 p2, 0x3e8

    .line 36
    invoke-static {p1, p2, p3}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method


# virtual methods
.method public final F(Ltun;)V
    .registers 7

    iget-object v0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast v0, Lwun;

    iget-object v1, v0, Lwun;->f:Ljava/util/ArrayList;

    iget-object p0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p0, Lvun;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v1, v0, Lwun;->c:Ljava/util/LinkedHashMap;

    iget-object v2, p0, Lvun;->b:Lp6l;

    iget-object v3, p0, Lvun;->a:Ljava/lang/String;

    sget-object v4, Lp6l;->a:Lp6l;

    if-ne v2, v4, :cond_26

    iget-object v2, v0, Lwun;->g:Lko7;

    invoke-virtual {v2}, Lldk;->i()V

    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v1, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lwun;->d()V

    goto :goto_2b

    :cond_26
    iget-object v1, v0, Lwun;->d:Ljava/util/HashMap;

    invoke-virtual {v1, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2b
    iget-object p0, p0, Lvun;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_32
    :goto_32
    if-ge v2, v1, :cond_46

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Luun;

    iget-boolean v4, v3, Luun;->b:Z

    if-nez v4, :cond_32

    iget-object v3, v3, Luun;->a:Lzun;

    invoke-interface {v3, p1}, Lzun;->F(Ltun;)V

    goto :goto_32

    :cond_46
    invoke-virtual {v0}, Lwun;->c()V

    return-void
.end method

.method public final a(Larl;)V
    .registers 5

    iget-object p1, p1, Larl;->a:Landroid/widget/Toast;

    invoke-virtual {p1}, Landroid/widget/Toast;->getDuration()I

    move-result p1

    if-nez p1, :cond_b

    const/16 p1, 0x7d0

    goto :goto_d

    :cond_b
    const/16 p1, 0xdac

    :goto_d
    iget-object v0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    iget-object p0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast p0, Lgrl;

    int-to-long v1, p1

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView;I)Landroid/graphics/Point;
    .registers 9

    iget-object v0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget-object v1, v1, Leyj;->j:Loxj;

    iget-object v1, v1, Loxj;->a:Lsxj;

    iget v2, v1, Lsxj;->d:I

    iget v3, v1, Lsxj;->b:I

    iget v4, v1, Lsxj;->c:I

    iget v1, v1, Lsxj;->a:I

    iget-object p0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast p0, Lx2l;

    invoke-virtual {p0, p2}, Ldt1;->H(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm2l;

    if-eqz p0, :cond_e1

    instance-of p2, p0, Lu2l;

    const/4 v5, 0x1

    if-eqz p2, :cond_48

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-object p0, p0, Leyj;->e:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result p2

    add-int/2addr p2, v1

    add-int/2addr p2, v4

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    add-int/2addr p0, v3

    add-int/2addr p0, v2

    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    if-ne p1, v5, :cond_44

    neg-int p2, p2

    :cond_44
    invoke-direct {v0, p2, p0}, Landroid/graphics/Point;-><init>(II)V

    return-object v0

    :cond_48
    instance-of p2, p0, Lg2l;

    if-eqz p2, :cond_6d

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-object p0, p0, Leyj;->g:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result p2

    add-int/2addr p2, v1

    add-int/2addr p2, v4

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    add-int/2addr p0, v3

    add-int/2addr p0, v2

    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    if-ne p1, v5, :cond_69

    neg-int p2, p2

    :cond_69
    invoke-direct {v0, p2, p0}, Landroid/graphics/Point;-><init>(II)V

    return-object v0

    :cond_6d
    instance-of p2, p0, Ll2l;

    if-eqz p2, :cond_a8

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-object p0, p0, Leyj;->h:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result p2

    add-int/2addr p2, v1

    add-int/2addr p2, v4

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    add-int/2addr p0, v3

    add-int/2addr p0, v2

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->j:Loxj;

    iget-object v0, v0, Loxj;->c:Lsxj;

    new-instance v1, Landroid/graphics/Point;

    iget v2, v0, Lsxj;->a:I

    add-int/2addr p2, v2

    iget v2, v0, Lsxj;->c:I

    add-int/2addr p2, v2

    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    if-ne p1, v5, :cond_9e

    neg-int p2, p2

    :cond_9e
    iget p1, v0, Lsxj;->b:I

    add-int/2addr p0, p1

    iget p1, v0, Lsxj;->d:I

    add-int/2addr p0, p1

    invoke-direct {v1, p2, p0}, Landroid/graphics/Point;-><init>(II)V

    return-object v1

    :cond_a8
    instance-of p0, p0, Lk2l;

    if-eqz p0, :cond_e1

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-object p0, p0, Leyj;->j:Loxj;

    iget-object p0, p0, Loxj;->e:Landroid/util/Size;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Leyj;

    iget-object p2, p2, Leyj;->j:Loxj;

    iget-object p2, p2, Loxj;->d:Lsxj;

    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget v2, p2, Lsxj;->a:I

    add-int/2addr v1, v2

    iget v2, p2, Lsxj;->c:I

    add-int/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    if-ne p1, v5, :cond_d3

    neg-int v1, v1

    :cond_d3
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    iget p1, p2, Lsxj;->b:I

    add-int/2addr p0, p1

    iget p1, p2, Lsxj;->d:I

    add-int/2addr p0, p1

    invoke-direct {v0, v1, p0}, Landroid/graphics/Point;-><init>(II)V

    return-object v0

    :cond_e1
    new-instance p0, Landroid/graphics/Point;

    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Landroid/graphics/Point;-><init>(II)V

    return-object p0
.end method

.method public final c(Landroid/net/Uri;Lcom/opera/api/Callback;)V
    .registers 10

    iget-object v0, p0, Lqsh;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Landroid/content/ContentResolver;

    iget-object v0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast v0, Lqln;

    new-instance v1, Liyk;

    const/16 v2, 0xb

    invoke-direct {v1, p0, p2, v2}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lqln;->f:Lami;

    new-instance p2, Lj12;

    const/16 v0, 0xd

    invoke-direct {p2, v1, v0}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    iget-object p0, p0, Lami;->d:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ls14;

    iget-object p0, v2, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v1, Lis6;

    const/4 v6, 0x5

    const/4 v5, 0x0

    move-object v4, p1

    invoke-direct/range {v1 .. v6}, Lis6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {p0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    new-instance v0, Lroj;

    const/16 v1, 0xf

    invoke-direct {v0, v2, p2, v1}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final d()V
    .registers 7

    iget-object v0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_25

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->d()Ltd0;

    move-result-object v1

    new-instance v3, Ld5f;

    const/4 v4, 0x3

    sget-object v5, Lvb0;->d:Lvb0;

    invoke-direct {v3, v5, v4}, Ld5f;-><init>(Lvb0;B)V

    invoke-virtual {v1, v3}, Ltd0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    :cond_25
    iget-object p0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p0, Ln1;

    invoke-interface {p0}, Lcco;->d()V

    return-void
.end method

.method public final e(Z)V
    .registers 8

    iget-object v0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast v0, Lx5f;

    if-eqz p1, :cond_9

    sget-object v1, Lvb0;->b:Lvb0;

    goto :goto_b

    :cond_9
    sget-object v1, Lvb0;->c:Lvb0;

    :goto_b
    iget-boolean v2, v0, Lx5f;->h:Z

    if-eqz v2, :cond_2a

    iget-object v2, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, v2, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->d()Ltd0;

    move-result-object v2

    new-instance v4, Ld5f;

    const/4 v5, 0x3

    invoke-direct {v4, v1, v5}, Ld5f;-><init>(Lvb0;B)V

    invoke-virtual {v2, v4}, Ltd0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_2a
    iget-object p0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p0, Ln1;

    invoke-interface {p0, p1}, Lcco;->e(Z)V

    return-void
.end method

.method public final f(Z)V
    .registers 7

    iget-object v0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast v0, Lwun;

    iget-object v1, v0, Lwun;->f:Ljava/util/ArrayList;

    iget-object p0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p0, Lvun;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lvun;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_14
    :goto_14
    if-ge v2, v1, :cond_28

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Luun;

    iget-boolean v4, v3, Luun;->b:Z

    if-nez v4, :cond_14

    iget-object v3, v3, Luun;->a:Lzun;

    invoke-interface {v3, p1}, Lzun;->f(Z)V

    goto :goto_14

    :cond_28
    invoke-virtual {v0}, Lwun;->c()V

    return-void
.end method

.method public final onCancel()V
    .registers 2

    iget-object v0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    iget-object p0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast p0, Lgrl;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lgrl;->run()V

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 4

    new-instance p1, Lssi;

    iget-object p2, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p2, Ln9h;

    const/16 v0, 0x11

    invoke-direct {p1, p0, p2, v0}, Lssi;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 9

    iget-object p1, p0, Lqsh;->b:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Ln9h;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2}, Lpzh;->h()Le74;

    move-result-object p1

    if-eqz p1, :cond_28

    iget p1, p1, Le74;->c:I

    if-ltz p1, :cond_28

    int-to-long v0, p1

    const-wide/16 v4, 0x3e8

    mul-long/2addr v0, v4

    const-wide/32 v4, 0x5265c00

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/32 v4, 0xea60

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    :goto_26
    move-wide v4, v0

    goto :goto_2c

    :cond_28
    const-wide/32 v0, 0x36ee80

    goto :goto_26

    :goto_2c
    :try_start_2c
    iget-object p1, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast p1, Ldpj;

    iget-object p2, p2, Lpzh;->g:Lvzh;

    invoke-virtual {p2}, Lvzh;->string()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lhai;

    const/16 v0, 0x15

    invoke-direct {p1, v0}, Lhai;-><init>(B)V

    const/4 v0, 0x0

    invoke-static {p2, p1, v0}, Lvsi;->d(Ljava/lang/String;Lusi;Z)Ljava/util/ArrayList;

    move-result-object p1

    new-instance p2, Lbql;

    const/4 v0, 0x5

    invoke-direct {p2, v0}, Lbql;-><init>(B)V

    invoke-static {p2, p1}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_52} :catch_5c

    new-instance v0, Ln6m;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Ln6m;-><init>(Lqsh;Ln9h;Ljava/util/ArrayList;J)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :catch_5c
    new-instance p0, Lcbl;

    const/16 p1, 0x13

    invoke-direct {p0, v2, p1}, Lcbl;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lqsh;->a:B

    packed-switch v0, :pswitch_data_28

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x9
        :pswitch_a
    .end packed-switch
.end method

.method public final u()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p0, Ln1;

    invoke-interface {p0}, Lcco;->u()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final zza(Ljava/lang/Throwable;)V
    .registers 2

    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    new-instance v0, Lwmb;

    sget-object v1, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;->nativeXhr:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    sget-object v2, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->nativeResponse:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    iget-object v3, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p1}, Lwmb;-><init>(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast p0, Loam;

    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, Lwpp;

    invoke-virtual {p0, v0}, Lwpp;->a(Lwmb;)V

    return-void
.end method
