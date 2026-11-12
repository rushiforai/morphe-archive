.class public final Lk82;
.super Lz4o;
.source "SourceFile"


# instance fields
.field public final synthetic r:B

.field public final s:Ljava/lang/Object;

.field public final t:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 14
    iput-byte p3, p0, Lk82;->r:B

    iput-object p2, p0, Lk82;->s:Ljava/lang/Object;

    iput-object p1, p0, Lk82;->t:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ls14;Lso4;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lk82;->r:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lk82;->s:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lk82;->t:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lz4o;Lvr9;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lk82;->r:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lk82;->s:Ljava/lang/Object;

    .line 17
    iput-object p2, p0, Lk82;->t:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final Y(Ljava/lang/String;Z)V
    .registers 6

    iget-byte v0, p0, Lk82;->r:B

    iget-object v1, p0, Lk82;->t:Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object p0, p0, Lk82;->s:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    check-cast p0, Lxla;

    invoke-interface {p0, v2}, Lxla;->f(Lyla;)V

    return-void

    :pswitch_10
    check-cast p0, Lb15;

    const/4 p1, 0x0

    invoke-virtual {p0, v2, v2, p1}, Lb15;->f(Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V

    return-void

    :pswitch_17
    check-cast p0, Lz4o;

    invoke-virtual {p0, p1, p2}, Lz4o;->Y(Ljava/lang/String;Z)V

    check-cast v1, Lvr9;

    invoke-virtual {v1}, Lvr9;->run()V

    return-void

    :pswitch_22
    check-cast p0, Lso4;

    invoke-virtual {p0, v2}, Lso4;->a(Ljava/util/ArrayList;)V

    return-void

    :pswitch_28
    check-cast p0, Lm82;

    check-cast v1, Ln82;

    invoke-interface {p0, v1}, Lm82;->w(Ln82;)V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_28
        :pswitch_22
        :pswitch_17
        :pswitch_10
    .end packed-switch
.end method

.method public final Z(Lpzh;[B)Z
    .registers 4

    iget-byte v0, p0, Lk82;->r:B

    packed-switch v0, :pswitch_data_20

    invoke-super {p0, p1, p2}, Lz4o;->Z(Lpzh;[B)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object v0, p0, Lk82;->s:Ljava/lang/Object;

    check-cast v0, Lz4o;

    invoke-virtual {v0, p1, p2}, Lz4o;->Z(Lpzh;[B)Z

    move-result p1

    if-eqz p1, :cond_1d

    iget-object p0, p0, Lk82;->t:Ljava/lang/Object;

    check-cast p0, Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    const/4 p0, 0x1

    goto :goto_1e

    :cond_1d
    const/4 p0, 0x0

    :goto_1e
    return p0

    nop

    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final b0(Lpzh;[B)Z
    .registers 4

    iget-byte v0, p0, Lk82;->r:B

    packed-switch v0, :pswitch_data_20

    invoke-super {p0, p1, p2}, Lz4o;->b0(Lpzh;[B)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object v0, p0, Lk82;->s:Ljava/lang/Object;

    check-cast v0, Lz4o;

    invoke-virtual {v0, p1, p2}, Lz4o;->b0(Lpzh;[B)Z

    move-result p1

    if-eqz p1, :cond_1d

    iget-object p0, p0, Lk82;->t:Ljava/lang/Object;

    check-cast p0, Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    const/4 p0, 0x1

    goto :goto_1e

    :cond_1d
    const/4 p0, 0x0

    :goto_1e
    return p0

    nop

    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final c0(Lpzh;Lorb;)V
    .registers 15

    iget-byte v0, p0, Lk82;->r:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lk82;->t:Ljava/lang/Object;

    iget-object v4, p0, Lk82;->s:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_f0

    check-cast v4, Lxla;

    check-cast v3, Lx79;

    :try_start_f
    const-string p1, "news_feed_host"

    const-string v0, ""

    invoke-virtual {p2, p1, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1e

    move-object p1, v2

    :cond_1e
    const-string v5, "article_detail_host"

    invoke-virtual {p2, v5, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2b

    move-object v5, v2

    :cond_2b
    const-string v6, "account_host"

    invoke-virtual {p2, v6, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_5a

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_5a

    new-instance v6, Lyla;

    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iget-object p0, v3, Lx79;->a:Ljava/lang/Object;

    move-object v10, p0

    check-cast v10, Ll0c;

    const/4 v11, 0x0

    const/4 v9, 0x1

    invoke-direct/range {v6 .. v11}, Lyla;-><init>(Ljava/net/URL;Ljava/net/URL;ILl0c;Z)V

    invoke-interface {v4, v6}, Lxla;->f(Lyla;)V

    goto :goto_63

    :cond_5a
    const-string p1, "Invalid configuration"

    invoke-virtual {p0, p1, v1}, Lk82;->Y(Ljava/lang/String;Z)V
    :try_end_5f
    .catch Ljava/net/MalformedURLException; {:try_start_f .. :try_end_5f} :catch_60

    goto :goto_63

    :catch_60
    invoke-interface {v4, v2}, Lxla;->f(Lyla;)V

    :goto_63
    return-void

    :pswitch_64
    check-cast v3, Lvw9;

    iget-object p0, p1, Lpzh;->j:Lpzh;

    const/4 p1, 0x1

    if-eqz p0, :cond_6c

    move v1, p1

    :cond_6c
    check-cast v4, Lb15;

    iget-boolean p0, v3, Lvw9;->f:Z

    const-string v0, "ip_cities"

    invoke-virtual {p2, v0}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v0

    if-eqz v0, :cond_8a

    invoke-static {v0, p0}, Le15;->a(Lvpb;Z)Ljava/util/List;

    move-result-object v0

    new-instance v3, Luw9;

    invoke-direct {v3, p1}, Luw9;-><init>(I)V

    invoke-static {v0, v3}, Lsfe;->M0(Ljava/lang/Iterable;Lxq9;)Lzlb;

    move-result-object p1

    invoke-static {p1}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_8b

    :cond_8a
    move-object p1, v2

    :goto_8b
    const-string v0, "top_cities"

    invoke-virtual {p2, v0}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object p2

    if-eqz p2, :cond_a5

    invoke-static {p2, p0}, Le15;->a(Lvpb;Z)Ljava/util/List;

    move-result-object p0

    new-instance p2, Luw9;

    const/4 v0, 0x2

    invoke-direct {p2, v0}, Luw9;-><init>(I)V

    invoke-static {p0, p2}, Lsfe;->M0(Ljava/lang/Iterable;Lxq9;)Lzlb;

    move-result-object p0

    invoke-static {p0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v2

    :cond_a5
    invoke-virtual {v4, p1, v2, v1}, Lb15;->f(Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V

    return-void

    :pswitch_a9
    check-cast v4, Lz4o;

    invoke-virtual {v4, p1, p2}, Lz4o;->c0(Lpzh;Lorb;)V

    check-cast v3, Lvr9;

    invoke-virtual {v3}, Lvr9;->run()V

    return-void

    :pswitch_b4
    check-cast v3, Ls14;

    check-cast v4, Lso4;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "cities"

    invoke-virtual {p2, p0}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object p0

    if-eqz p0, :cond_d7

    iget-boolean p1, v3, Ls14;->b:Z

    invoke-static {p0, p1}, Le15;->a(Lvpb;Z)Ljava/util/List;

    move-result-object p0

    new-instance p1, Lb10;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Lb10;-><init>(B)V

    invoke-static {p0, p1}, Lsfe;->M0(Ljava/lang/Iterable;Lxq9;)Lzlb;

    move-result-object p0

    invoke-static {p0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v2

    :cond_d7
    invoke-virtual {v4, v2}, Lso4;->a(Ljava/util/ArrayList;)V

    return-void

    :pswitch_db
    check-cast v3, Ln82;

    invoke-virtual {v3, p2}, Ln82;->R(Lorb;)Ld5o;

    move-result-object p0

    iget-object p1, v3, Lr22;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v3, p0, p1}, Ln82;->T(Ld5o;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    check-cast v4, Lm82;

    invoke-interface {v4, v3, p0}, Lm82;->k(Ln82;Ljava/util/List;)V

    return-void

    nop

    :pswitch_data_f0
    .packed-switch 0x0
        :pswitch_db
        :pswitch_b4
        :pswitch_a9
        :pswitch_64
    .end packed-switch
.end method
