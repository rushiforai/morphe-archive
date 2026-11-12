.class public final Lbr6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Lesk;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljv1;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lbr6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lbr6;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lbr6;->c:Ljava/lang/Object;

    new-instance p1, Lvx;

    const/16 p2, 0x11

    invoke-direct {p1, p0, p2}, Lvx;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lbr6;->d:Lesk;

    sget-object p1, Lxne;->b:Lii;

    iput-object p1, p0, Lbr6;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lbr6;Lpqi;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lbr6;->a:B

    .line 28
    iput-byte v0, p0, Lbr6;->a:B

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbr6;->b:Ljava/lang/Object;

    .line 30
    invoke-virtual {p1}, Lbr6;->b()Lesk;

    move-result-object v0

    iput-object v0, p0, Lbr6;->c:Ljava/lang/Object;

    .line 31
    invoke-virtual {p1}, Lbr6;->a()Lesk;

    move-result-object p1

    iput-object p1, p0, Lbr6;->d:Lesk;

    .line 32
    iput-object p2, p0, Lbr6;->e:Ljava/lang/Object;

    return-void
.end method

.method public static d(Lbr6;Lnt5;)Ljava/lang/Comparable;
    .registers 7

    instance-of v0, p1, Lhoa;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lhoa;

    iget v1, v0, Lhoa;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lhoa;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lhoa;

    invoke-direct {v0, p0, p1}, Lhoa;-><init>(Lbr6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lhoa;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lhoa;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p0, v0, Lhoa;->t:Landroid/net/Uri$Builder;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4c

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Landroid/net/Uri$Builder;

    invoke-direct {p1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v2, "https"

    invoke-virtual {p1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    iput-object p1, v0, Lhoa;->t:Landroid/net/Uri$Builder;

    iput v3, v0, Lhoa;->w:I

    invoke-virtual {p0, v0}, Lbr6;->c(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_49

    return-object v1

    :cond_49
    move-object v4, p1

    move-object p1, p0

    move-object p0, v4

    :goto_4c
    check-cast p1, Lpne;

    iget-object p1, p1, Lpne;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string p1, "/"

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a()Lesk;
    .registers 2

    iget-byte v0, p0, Lbr6;->a:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Lbr6;->d:Lesk;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lbr6;->e:Ljava/lang/Object;

    check-cast p0, Lii;

    return-object p0

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final b()Lesk;
    .registers 2

    iget-byte v0, p0, Lbr6;->a:B

    packed-switch v0, :pswitch_data_10

    iget-object p0, p0, Lbr6;->c:Ljava/lang/Object;

    check-cast p0, Lesk;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lbr6;->d:Lesk;

    check-cast p0, Lvx;

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lbr6;->a:B

    iget-object v1, p0, Lbr6;->b:Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    const/high16 v4, -0x80000000

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_9a

    instance-of v0, p1, Lqqi;

    if-eqz v0, :cond_1e

    move-object v0, p1

    check-cast v0, Lqqi;

    iget v6, v0, Lqqi;->w:I

    and-int v7, v6, v4

    if-eqz v7, :cond_1e

    sub-int/2addr v6, v4

    iput v6, v0, Lqqi;->w:I

    goto :goto_23

    :cond_1e
    new-instance v0, Lqqi;

    invoke-direct {v0, p0, p1}, Lqqi;-><init>(Lbr6;Lnt5;)V

    :goto_23
    iget-object p1, v0, Lqqi;->u:Ljava/lang/Object;

    sget-object v4, Lpx5;->a:Lpx5;

    iget v6, v0, Lqqi;->w:I

    if-eqz v6, :cond_37

    if-ne v6, v5, :cond_33

    iget-object p0, v0, Lqqi;->t:Lpqi;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4c

    :cond_33
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_52

    :cond_37
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lbr6;->e:Ljava/lang/Object;

    check-cast p0, Lpqi;

    iput-object p0, v0, Lqqi;->t:Lpqi;

    iput v5, v0, Lqqi;->w:I

    check-cast v1, Lbr6;

    invoke-virtual {v1, v0}, Lbr6;->c(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v4, :cond_4c

    move-object v2, v4

    goto :goto_52

    :cond_4c
    :goto_4c
    check-cast p1, Lpne;

    invoke-virtual {p0, p1}, Lpqi;->a(Lpne;)Lpne;

    move-result-object v2

    :goto_52
    return-object v2

    :pswitch_53
    instance-of v0, p1, Lar6;

    if-eqz v0, :cond_64

    move-object v0, p1

    check-cast v0, Lar6;

    iget v6, v0, Lar6;->v:I

    and-int v7, v6, v4

    if-eqz v7, :cond_64

    sub-int/2addr v6, v4

    iput v6, v0, Lar6;->v:I

    goto :goto_69

    :cond_64
    new-instance v0, Lar6;

    invoke-direct {v0, p0, p1}, Lar6;-><init>(Lbr6;Lnt5;)V

    :goto_69
    iget-object p1, v0, Lar6;->t:Ljava/lang/Object;

    sget-object v4, Lpx5;->a:Lpx5;

    iget v6, v0, Lar6;->v:I

    if-eqz v6, :cond_7b

    if-ne v6, v5, :cond_77

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_90

    :cond_77
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_98

    :cond_7b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v1, Ljv1;

    invoke-virtual {v1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lno7;

    iput v5, v0, Lar6;->v:I

    invoke-static {p1, v0}, La26;->k(Lno7;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v4, :cond_90

    move-object v2, v4

    goto :goto_98

    :cond_90
    :goto_90
    iget-object p0, p0, Lbr6;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lcqp;->e0(Landroid/content/Context;)Lpne;

    move-result-object v2

    :goto_98
    return-object v2

    nop

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_53
    .end packed-switch
.end method
