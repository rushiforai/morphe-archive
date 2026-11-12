.class public final Lx5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lubk;
.implements Lorm;
.implements Lskm;


# instance fields
.field public final a:Lb59;

.field public final b:Lumi;

.field public final c:Landroid/content/Context;

.field public final d:Lzpa;

.field public final e:Lqie;

.field public final f:Lmgh;

.field public final g:Lf11;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lb59;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lx5f;->a:Lb59;

    iput-object p3, p0, Lx5f;->b:Lumi;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lx5f;->c:Landroid/content/Context;

    new-instance p2, Lzpa;

    const/16 p3, 0x14

    invoke-direct {p2, p3}, Lzpa;-><init>(B)V

    iput-object p2, p0, Lx5f;->d:Lzpa;

    new-instance p2, Lqie;

    const/16 p3, 0x13

    invoke-direct {p2, p3}, Lqie;-><init>(B)V

    iput-object p2, p0, Lx5f;->e:Lqie;

    new-instance p2, Lmgh;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Lmgh;-><init>(B)V

    iput-object p2, p0, Lx5f;->f:Lmgh;

    new-instance p2, Lf11;

    sget-object p3, Llkk;->b:Llkk;

    invoke-direct {p2, p1, p3}, Lshf;-><init>(Landroid/content/Context;Llkk;)V

    iput-object p2, p0, Lx5f;->g:Lf11;

    return-void
.end method

.method public static W0(Lqu0;Luu0;Ljava/lang/String;Ljava/lang/String;Lpu0;)V
    .registers 7

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x2

    invoke-virtual {p0, p1, v1, p3}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1, v1, p4}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method

.method public static f(Landroid/net/Uri;)Ljava/lang/String;
    .registers 3

    const-string v0, "udm"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_62

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    if-eqz v1, :cond_59

    const/16 p0, 0x32

    if-eq v1, p0, :cond_4e

    const/16 p0, 0x37

    if-eq v1, p0, :cond_43

    const/16 p0, 0x623

    if-eq v1, p0, :cond_38

    const/16 p0, 0x666

    if-eq v1, p0, :cond_2d

    const/16 p0, 0x69b

    if-ne v1, p0, :cond_61

    const-string p0, "50"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_61

    const-string p0, "ai_mode"

    return-object p0

    :cond_2d
    const-string p0, "39"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_61

    const-string p0, "short_videos"

    return-object p0

    :cond_38
    const-string p0, "14"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_61

    const-string p0, "web"

    return-object p0

    :cond_43
    const-string p0, "7"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_61

    const-string p0, "videos"

    return-object p0

    :cond_4e
    const-string p0, "2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_61

    const-string p0, "images"

    return-object p0

    :cond_59
    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_62

    :cond_61
    return-object v0

    :cond_62
    const-string v0, "tbm"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_7e

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0x1abca

    if-ne v0, v1, :cond_7e

    const-string v0, "nws"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7e

    const-string p0, "news"

    return-object p0

    :cond_7e
    const-string p0, "all"

    return-object p0
.end method


# virtual methods
.method public final A(ZZ)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v3, 0x39

    if-eqz p2, :cond_22

    if-eqz p1, :cond_19

    sget-object p1, Le80;->b:Le80;

    goto :goto_1b

    :cond_19
    sget-object p1, Le80;->c:Le80;

    :goto_1b
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_2a

    :cond_22
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Le80;->d:Le80;

    invoke-virtual {v1, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :goto_2a
    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final A0(Lb60;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x4c

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final B(ZZ)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v3, 0x3a

    if-eqz p2, :cond_22

    if-eqz p1, :cond_19

    sget-object p1, Le80;->b:Le80;

    goto :goto_1b

    :cond_19
    sget-object p1, Le80;->c:Le80;

    :goto_1b
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_2a

    :cond_22
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Le80;->d:Le80;

    invoke-virtual {v1, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :goto_2a
    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final B0(Lab0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x6

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final C(ZZZ)V
    .registers 9

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->H(Lzpa;)Lhm0;

    move-result-object v2

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    const/16 v3, 0x1f

    const/4 v4, 0x1

    if-eqz p2, :cond_33

    if-eqz p1, :cond_1d

    sget-object p1, Le80;->b:Le80;

    goto :goto_1f

    :cond_1d
    sget-object p1, Le80;->c:Le80;

    :goto_1f
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v4, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p3, :cond_2a

    sget-object p1, Lcp0;->b:Lcp0;

    goto :goto_2c

    :cond_2a
    sget-object p1, Lcp0;->c:Lcp0;

    :goto_2c
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v3, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_43

    :cond_33
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Le80;->d:Le80;

    invoke-virtual {v2, v4, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lcp0;->d:Lcp0;

    invoke-virtual {v1, v3, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :goto_43
    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final C0(Lyf0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0xa

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final D(Lfq0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    new-instance v2, Lu80;

    const/16 v3, 0x98b

    const/4 v4, -0x1

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x28

    invoke-virtual {v1, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_36

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_36

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, p1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3f

    :cond_36
    invoke-static {v1, p1, v5}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, p1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3f
    invoke-virtual {v4, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final D0(Ldj0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0xd

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final E(Lvb0;Z)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lsm0;

    const/4 v1, -0x1

    const/4 v2, 0x2

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2, v2, p2}, Ljf0;->r(IIZ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, p2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    invoke-virtual {v1, p2}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p2

    const/16 v1, 0x2b

    invoke-virtual {p2, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_3a

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3a

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, v1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_44

    :cond_3a
    invoke-static {p2, v1, v2}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p2, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v2, v3

    :goto_44
    invoke-virtual {v2, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final E0(Luk0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p1, :cond_16

    const/4 v2, 0x0

    goto :goto_17

    :cond_16
    const/4 v2, 0x1

    :goto_17
    const/16 v3, 0x34

    invoke-virtual {v1, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final F(Ljava/lang/String;Ly90;Ljava/util/List;Z)V
    .registers 10

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lx90;

    const/4 v2, -0x1

    const/4 v3, 0x4

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez p1, :cond_13

    move v4, v2

    goto :goto_14

    :cond_13
    move v4, v3

    :goto_14
    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x2

    invoke-virtual {v1, p1, v3, p4}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v3, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-interface {p3}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance p2, Lzbe;

    const/16 p3, 0x19

    invoke-direct {p2, p0, p3}, Lzbe;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Lm1e;

    invoke-direct {p3, p2, v3}, Lm1e;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {p1, p3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object p1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    move-object p2, p1

    check-cast p2, Ljava/util/Collection;

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_4c

    if-eqz p1, :cond_48

    move v2, v3

    :cond_48
    const/4 p2, 0x3

    invoke-virtual {v1, p2, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4c
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 p2, 0x2f

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/List;

    if-eqz p3, :cond_68

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_68

    new-instance p4, Lhf0;

    invoke-direct {p4, p1, p2, p3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_71

    :cond_68
    invoke-static {p1, p2, v3}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object p3

    new-instance p4, Lhf0;

    invoke-direct {p4, p1, p2, p3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_71
    invoke-virtual {p4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final F0(Lko0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x13

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final G(Lvb0;Laa0;Ljava/lang/String;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lz90;

    const/4 v1, -0x1

    const/4 v2, 0x3

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2, v2, p2}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p3, :cond_19

    move v1, v2

    :cond_19
    const/4 p1, 0x2

    invoke-virtual {v0, p1, v1, p3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, p2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p3

    invoke-virtual {p3, p2}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p2

    const/16 p3, 0x26

    invoke-virtual {p2, p3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_41

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_41

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, p3, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4a

    :cond_41
    invoke-static {p2, p3, v2}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, p3, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4a
    invoke-virtual {v2, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final G0(Lvd0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x47

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final H(Lp90;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lya0;

    const/16 v1, 0x98b

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_36

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_36

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v2, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_40

    :cond_36
    invoke-static {v1, v2, v3}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v3, v4

    :goto_40
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final H0(Lwq0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x21

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final I(Lw2b;Lc3b;Lv2b;Leb0;)V
    .registers 14

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-direct {v1, v2, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v3, Lrg;

    const/16 v8, 0xa

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v3 .. v8}, Lrg;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final I0(Ljs0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x4e

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final J(JJLjava/lang/String;)V
    .registers 14

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const/4 v3, 0x1

    if-eqz v2, :cond_20

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_20

    new-instance v4, Lif0;

    invoke-direct {v4, v0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_2d

    :cond_20
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v1, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, v0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_2d
    invoke-virtual {v4, p5}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfb0;

    const/4 v2, 0x0

    if-nez v1, :cond_43

    new-instance v1, Lfb0;

    const/4 v5, -0x1

    const/4 v6, 0x2

    const/16 v7, 0x98b

    invoke-direct {v1, v7, v5, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v4, p5, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_61

    :cond_43
    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Long;

    const-wide/16 v4, 0x0

    if-eqz p5, :cond_52

    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    goto :goto_53

    :cond_52
    move-wide v6, v4

    :goto_53
    add-long/2addr p1, v6

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Long;

    if-eqz p5, :cond_60

    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    :cond_60
    add-long/2addr p3, v4

    :goto_61
    invoke-virtual {v1, v3, v3, p1, p2}, Ljf0;->p(IIJ)V

    invoke-virtual {v1, v2, v3, p3, p4}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final J0(Lit0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0xc

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final K(Ljava/lang/String;Lib0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 16

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    new-instance v2, Lhb0;

    const/4 v3, -0x1

    const/4 v4, 0x4

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v6, 0x0

    if-nez p3, :cond_21

    if-nez p4, :cond_21

    if-eqz p5, :cond_33

    :cond_21
    new-instance v7, Lgb0;

    const/4 v8, 0x3

    invoke-direct {v7, v5, v3, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v7, v6, p3}, Lgb0;->x(ILjava/lang/String;)V

    invoke-virtual {v7, v3, p4}, Lgb0;->x(ILjava/lang/String;)V

    invoke-virtual {v7, v4, p5}, Lgb0;->x(ILjava/lang/String;)V

    invoke-virtual {v2, v8, v3, v7}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_33
    if-nez p1, :cond_37

    move p3, v6

    goto :goto_38

    :cond_37
    move p3, v3

    :goto_38
    invoke-virtual {v2, v3, p3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v6, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v4, v3, p6}, Ljf0;->r(IIZ)V

    const/16 p1, 0x23

    invoke-virtual {v1, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_57

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_57

    new-instance p3, Lhf0;

    invoke-direct {p3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_60

    :cond_57
    invoke-static {v1, p1, v3}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object p2

    new-instance p3, Lhf0;

    invoke-direct {p3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_60
    invoke-virtual {p3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final K0(IZ)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-direct {v1, v2, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v2, Lm5f;

    invoke-direct {v2, p1, p2}, Lm5f;-><init>(IZ)V

    invoke-virtual {v1, v2}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final L(ILwb0;Ljava/lang/Integer;)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-direct {v1, v2, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v2, Lj5f;

    invoke-direct {v2, p1, p2, p3}, Lj5f;-><init>(ILwb0;Ljava/lang/Integer;)V

    invoke-virtual {v1, v2}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final L0(Lkr0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Llr0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 v2, 0x30

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_32

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_32

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3b

    :cond_32
    invoke-static {p1, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3b
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final M(Ljc0;Lnc0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lic0;

    const/4 v1, -0x1

    const/4 v2, 0x2

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2, v2, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, p2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    invoke-virtual {v1, p2}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p2

    const/4 v1, 0x7

    invoke-virtual {p2, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_39

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_39

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, v1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_43

    :cond_39
    invoke-static {p2, v1, v2}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p2, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v2, v3

    :goto_43
    invoke-virtual {v2, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final M0(ILop0;Z)V
    .registers 9

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lds0;

    const/4 v2, -0x1

    const/4 v3, 0x2

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    if-eqz p3, :cond_17

    sget-object p3, Lvd0;->b:Lvd0;

    goto :goto_19

    :cond_17
    sget-object p3, Lvd0;->c:Lvd0;

    :goto_19
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v3, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0}, Lx56;->U()Lif0;

    move-result-object p2

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final N(Lkc0;Lmc0;ZZZZLnc0;)V
    .registers 14

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    new-instance v2, Llc0;

    const/4 v3, -0x1

    const/4 v4, 0x7

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez p1, :cond_22

    move v5, v4

    goto :goto_23

    :cond_22
    move v5, v3

    :goto_23
    invoke-virtual {v2, v4, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p2, :cond_29

    move v4, v3

    :cond_29
    const/4 p1, 0x2

    invoke-virtual {v2, p1, v4, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v3, v3, p3}, Ljf0;->r(IIZ)V

    const/4 p1, 0x3

    invoke-virtual {v2, p1, v3, p4}, Ljf0;->r(IIZ)V

    const/4 p1, 0x4

    invoke-virtual {v2, p1, v3, p5}, Ljf0;->r(IIZ)V

    const/4 p1, 0x5

    invoke-virtual {v2, p1, v3, p6}, Ljf0;->r(IIZ)V

    const/4 p1, 0x6

    invoke-virtual {v2, p1, v3, p7}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_54

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_54

    new-instance p3, Lhf0;

    invoke-direct {p3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_5d

    :cond_54
    invoke-static {v1, p1, v3}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object p2

    new-instance p3, Lhf0;

    invoke-direct {p3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_5d
    invoke-virtual {p3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final N0(I)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lds0;

    const/4 v2, -0x1

    const/4 v3, 0x2

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    sget-object v4, Lvd0;->d:Lvd0;

    invoke-virtual {v1, v2, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0}, Lx56;->U()Lif0;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final O(Loc0;Lnc0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lpc0;

    const/4 v2, -0x1

    const/4 v3, 0x2

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez p1, :cond_18

    move v4, v3

    goto :goto_19

    :cond_18
    move v4, v2

    :goto_19
    invoke-virtual {v1, v3, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v2, v2, p2}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_3a

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3a

    new-instance v2, Lhf0;

    invoke-direct {v2, p1, p2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_44

    :cond_3a
    invoke-static {p1, p2, v2}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p2, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v2, v3

    :goto_44
    invoke-virtual {v2, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final O0(Lvb0;Z)V
    .registers 9

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    new-instance v2, Ldt0;

    const/4 v3, -0x1

    const/4 v4, 0x2

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    if-eqz p2, :cond_21

    sget-object p2, Let0;->b:Let0;

    goto :goto_23

    :cond_21
    sget-object p2, Let0;->c:Let0;

    :goto_23
    const/4 v3, 0x1

    invoke-virtual {v2, v3, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p2, 0x0

    invoke-virtual {v2, p2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x12

    invoke-virtual {v1, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_41

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_41

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4a

    :cond_41
    invoke-static {v1, p1, v3}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object p2

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4a
    invoke-virtual {v3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final P(Lqc0;Lnc0;)V
    .registers 8

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lrc0;

    const/4 v2, -0x1

    const/4 v3, 0x2

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p2, :cond_17

    invoke-virtual {v1, v3, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_17
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_32

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_32

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p2, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3b

    :cond_32
    invoke-static {p1, p2, v3}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p2, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3b
    invoke-virtual {v3, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final P0(Lvb0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lst0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, p1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p1

    const/16 v2, 0x1e

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_36

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_36

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3f

    :cond_36
    invoke-static {p1, v2, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3f
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final Q(Lvb0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lsc0;

    const/16 v1, 0x98b

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_36

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_36

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v2, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_40

    :cond_36
    invoke-static {v1, v2, v3}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v3, v4

    :goto_40
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final Q0(Lvt0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-direct {v1, v2, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v2, Lo5f;

    const/4 v3, 0x2

    invoke-direct {v2, p1, v3}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final R(ILjava/lang/String;)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lzc0;

    const/4 v1, -0x1

    const/4 v2, 0x2

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    int-to-long v1, p1

    const/4 p1, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, p1, v3, v1, v2}, Ljf0;->p(IIJ)V

    if-eqz p2, :cond_17

    move p1, v3

    :cond_17
    invoke-virtual {v0, v3, p1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, p2}, Lx56;->z(Lzpa;)Lq56;

    move-result-object p2

    invoke-virtual {p2}, Lq56;->B()Lhf0;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final R0(Lou0;)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lnu0;

    const/16 v2, 0x98b

    const/4 v3, 0x3

    const/4 v4, 0x1

    invoke-direct {v1, v2, v4, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x46

    invoke-virtual {p1, v2, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final S(I)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_25

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_25

    new-instance v4, Lif0;

    invoke-direct {v4, v1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_33

    :cond_25
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, v1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_33
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const-wide/16 v1, 0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v4, p1, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final S0(Lfv0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    const/16 v2, 0x1c

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    const/4 v4, 0x1

    if-eqz v3, :cond_26

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_26

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_2f

    :cond_26
    invoke-static {v1, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_2f
    new-instance v1, Lev0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final T(ZLjava/lang/String;Lle0;Lje0;)V
    .registers 11

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    new-instance v2, Lke0;

    const/4 v3, -0x1

    const/4 v4, 0x4

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x3

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4, p4}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p4, 0x0

    if-nez p3, :cond_22

    move v3, p4

    goto :goto_23

    :cond_22
    move v3, v4

    :goto_23
    const/4 v5, 0x2

    invoke-virtual {v2, v5, v3, p3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, p4, v4, p1}, Ljf0;->r(IIZ)V

    sget-object p1, Lle0;->b:Lle0;

    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_38

    if-eqz p2, :cond_35

    move p4, v4

    :cond_35
    invoke-virtual {v2, v4, p4, p2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_38
    const/16 p1, 0x22

    invoke-virtual {v1, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_4e

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_4e

    new-instance p3, Lhf0;

    invoke-direct {p3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_57

    :cond_4e
    invoke-static {v1, p1, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object p2

    new-instance p3, Lhf0;

    invoke-direct {p3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_57
    invoke-virtual {p3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final T0(Lkotlin/jvm/functions/Function1;)V
    .registers 5

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-direct {v1, v2, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-interface {p1, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final U(Lfq0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    new-instance v2, Lte0;

    const/16 v3, 0x98b

    const/4 v4, -0x1

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x27

    invoke-virtual {v1, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_36

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_36

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, p1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3f

    :cond_36
    invoke-static {v1, p1, v5}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, p1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3f
    invoke-virtual {v4, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final U0(Lx56;)V
    .registers 4

    iget-object v0, p0, Lx5f;->f:Lmgh;

    invoke-virtual {v0, p1}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-eqz p1, :cond_9

    return-void

    :cond_9
    new-instance p1, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v1, p0, Lx5f;->b:Lumi;

    invoke-direct {p1, v0, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Li5f;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Li5f;-><init>(Lx5f;B)V

    invoke-virtual {p1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lx5f;->e:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final V(Lwe0;Lci0;)V
    .registers 9

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    new-instance v2, Lcf0;

    const/4 v3, -0x1

    const/4 v4, 0x2

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v4, v4, p2}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x17

    invoke-virtual {v1, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_3a

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3a

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_43

    :cond_3a
    invoke-static {v1, p1, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object p2

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_43
    invoke-virtual {v3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final V0(Lwn0;)V
    .registers 7

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    const/16 v2, 0x18

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_20

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_20

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_2a

    :cond_20
    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_2a
    invoke-virtual {v4, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final W(Lkf0;Lmf0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Llf0;

    const/4 v1, -0x1

    const/4 v2, 0x2

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2, v2, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, p2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    invoke-virtual {v1, p2}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p2

    const/16 v1, 0x23

    invoke-virtual {p2, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_3a

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3a

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, v1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_44

    :cond_3a
    invoke-static {p2, v1, v2}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p2, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v2, v3

    :goto_44
    invoke-virtual {v2, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final X(Lz80;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Ly80;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 v2, 0x35

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_32

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_32

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3b

    :cond_32
    invoke-static {p1, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3b
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V
    .registers 12

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lfg0;

    const/4 v1, -0x1

    const/4 v2, 0x5

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p1, :cond_14

    move v3, v1

    goto :goto_15

    :cond_14
    move v3, v2

    :goto_15
    const/4 v4, 0x3

    invoke-virtual {v0, v4, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-nez p2, :cond_1d

    move p1, v1

    goto :goto_1e

    :cond_1d
    move p1, v2

    :goto_1e
    invoke-virtual {v0, v1, p1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2, v2, p3, p4}, Ljf0;->p(IIJ)V

    if-nez p5, :cond_28

    move p1, v1

    goto :goto_29

    :cond_28
    move p1, v2

    :goto_29
    const/4 p2, 0x2

    invoke-virtual {v0, p2, p1, p5}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p6, :cond_30

    move v1, v2

    :cond_30
    const/4 p1, 0x4

    invoke-virtual {v0, p1, v1, p6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, p2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p3

    invoke-virtual {p3, p2}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p2

    const/16 p3, 0x11

    invoke-virtual {p2, p3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/List;

    if-eqz p4, :cond_58

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_58

    new-instance p5, Lhf0;

    invoke-direct {p5, p2, p3, p4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_61

    :cond_58
    invoke-static {p2, p3, v2}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object p4

    new-instance p5, Lhf0;

    invoke-direct {p5, p2, p3, p4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_61
    invoke-virtual {p5, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final Z(Lgt0;ZZ)V
    .registers 11

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    const/16 v2, 0x1e

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    const/4 v4, 0x1

    if-eqz v3, :cond_21

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_21

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_2a

    :cond_21
    invoke-static {v1, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_2a
    new-instance v1, Lft0;

    const/4 v2, -0x1

    const/4 v3, 0x3

    const/16 v6, 0x98b

    invoke-direct {v1, v6, v2, v3}, Ljf0;-><init>(III)V

    if-eqz p1, :cond_39

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_39
    invoke-virtual {v1, v4, v4, p2}, Ljf0;->r(IIZ)V

    const/4 p1, 0x2

    invoke-virtual {v1, p1, v4, p3}, Ljf0;->r(IIZ)V

    invoke-virtual {v5, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final a0(ILjava/lang/String;)V
    .registers 8

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lqg0;

    const/4 v2, -0x1

    const/16 v3, 0xd

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v1, p1}, Ljf0;->e(I)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v2

    invoke-virtual {v2, p1}, Lfi0;->y(Lzpa;)Lug0;

    move-result-object p1

    invoke-virtual {p1}, Lug0;->x()Lif0;

    move-result-object p1

    invoke-virtual {p1, p2, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final b(Lqyl;Lxn0;Z)Lwn0;
    .registers 7

    new-instance p0, Lwn0;

    const/4 v0, -0x1

    const/16 v1, 0xd

    const/16 v2, 0x98b

    invoke-direct {p0, v2, v0, v1}, Ljf0;-><init>(III)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-interface {p1}, Lqyl;->i()Lzn0;

    move-result-object p2

    const/4 v1, 0x7

    invoke-virtual {p0, v1, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p2, 0x5

    invoke-virtual {p0, p2, v0, p3}, Ljf0;->r(IIZ)V

    invoke-interface {p1}, Lqyl;->c()Lyn0;

    move-result-object p2

    const/16 p3, 0xa

    invoke-virtual {p0, p3, v0, p2}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p3, Lyn0;->f:Lyn0;

    if-ne p2, p3, :cond_49

    const/16 p2, 0x9

    invoke-interface {p1}, Lqyl;->h()Z

    move-result p3

    invoke-virtual {p0, p2, v0, p3}, Ljf0;->r(IIZ)V

    const/16 p2, 0xc

    invoke-interface {p1}, Lqyl;->e()Z

    move-result p3

    invoke-virtual {p0, p2, v0, p3}, Ljf0;->r(IIZ)V

    const/4 p2, 0x6

    invoke-interface {p1}, Lqyl;->g()Z

    move-result p3

    invoke-virtual {p0, p2, v0, p3}, Ljf0;->r(IIZ)V

    const/4 p2, 0x4

    invoke-interface {p1}, Lqyl;->j()Z

    move-result p3

    invoke-virtual {p0, p2, v0, p3}, Ljf0;->r(IIZ)V

    :cond_49
    invoke-interface {p1}, Lqyl;->f()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_5e

    invoke-interface {p1}, Lqyl;->f()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_5a

    const/4 v0, 0x0

    :cond_5a
    const/4 p2, 0x3

    invoke-virtual {p0, p2, v0, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5e
    return-object p0
.end method

.method public final b0(Ljh0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p1, :cond_16

    const/4 v2, 0x0

    goto :goto_17

    :cond_16
    const/4 v2, 0x1

    :goto_17
    const/16 v3, 0xb

    invoke-virtual {v1, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final c(Lx56;Ljava/lang/String;Lu50;Ljava/lang/String;)Lc60;
    .registers 11

    const/16 p0, 0x25

    invoke-virtual {p1, p0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const/4 v1, 0x1

    if-eqz v0, :cond_17

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_17

    new-instance v2, Lif0;

    invoke-direct {v2, p1, p0, v0}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_24

    :cond_17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, p0, v1, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, p1, p0, v0}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_24
    invoke-virtual {v2, p2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc60;

    const/4 p1, 0x2

    const/4 v0, 0x0

    const/16 v3, 0x98b

    if-nez p0, :cond_5d

    new-instance p0, Lc60;

    const/4 v4, -0x1

    const/4 v5, 0x3

    invoke-direct {p0, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lt50;

    if-nez v4, :cond_4e

    new-instance v4, Lt50;

    invoke-direct {v4, v3, v1, p1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v1, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lt50;

    :cond_4e
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p3, :cond_55

    move p1, v0

    goto :goto_56

    :cond_55
    move p1, v1

    :goto_56
    invoke-virtual {v4, v0, p1, p3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, p2, p0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_76

    :cond_5d
    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lt50;

    if-eqz p2, :cond_67

    move-object v4, p2

    goto :goto_76

    :cond_67
    new-instance p2, Lt50;

    invoke-direct {p2, v3, v1, p1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lt50;

    move-object v4, p1

    :goto_76
    if-eqz p4, :cond_7e

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, v1, v1, p4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_7e
    return-object p0
.end method

.method public final c0(Lmh0;)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_1c

    sget-object v0, Lmh0;->b:Lmh0;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lmh0;->x:Lmh0;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lmh0;->z:Lmh0;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Llh0;

    const/4 v2, -0x1

    const/4 v3, 0x4

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    if-nez p1, :cond_2f

    move v3, v2

    goto :goto_30

    :cond_2f
    const/4 v3, 0x1

    :goto_30
    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    invoke-virtual {p1}, Lqd0;->B0()Lhf0;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final d(Lif0;Lkq0;ILjava/lang/Integer;)V
    .registers 8

    iget-object p0, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p2, p0}, Lkq0;->x(Lzpa;)Ly56;

    move-result-object p0

    const/4 v0, 0x1

    if-eqz p4, :cond_12

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    int-to-long v1, p4

    const/4 p4, 0x0

    invoke-virtual {p0, p4, v0, v1, v2}, Ljf0;->p(IIJ)V

    :cond_12
    int-to-long v1, p3

    invoke-virtual {p0, v0, v0, v1, v2}, Ljf0;->p(IIJ)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p4, "ntp_sdx_"

    invoke-direct {p0, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0, p2}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final d0(Lkh0;)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Llh0;

    const/4 v2, -0x1

    const/4 v3, 0x4

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    sget-object v4, Lmh0;->x:Lmh0;

    invoke-virtual {v1, v2, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    invoke-virtual {p1}, Lqd0;->B0()Lhf0;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final e(Lif0;Lkq0;ILjava/lang/Integer;II)Ly56;
    .registers 10

    iget-object p0, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p2, p0}, Lkq0;->x(Lzpa;)Ly56;

    move-result-object p0

    int-to-long v0, p5

    const/4 p5, 0x6

    const/4 v2, 0x1

    invoke-virtual {p0, p5, v2, v0, v1}, Ljf0;->p(IIJ)V

    if-lez p6, :cond_13

    const/4 p5, 0x7

    int-to-long v0, p6

    invoke-virtual {p0, p5, v2, v0, v1}, Ljf0;->p(IIJ)V

    :cond_13
    if-eqz p4, :cond_1e

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    int-to-long p4, p4

    const/4 p6, 0x0

    invoke-virtual {p0, p6, v2, p4, p5}, Ljf0;->p(IIJ)V

    :cond_1e
    int-to-long p4, p3

    invoke-virtual {p0, v2, v2, p4, p5}, Ljf0;->p(IIJ)V

    new-instance p4, Ljava/lang/StringBuilder;

    const-string p5, "sdx_"

    invoke-direct {p4, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3, p2}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public final e0(Lht0;)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Llh0;

    const/4 v2, -0x1

    const/4 v3, 0x4

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    sget-object v4, Lmh0;->b:Lmh0;

    invoke-virtual {v1, v2, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v3, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    invoke-virtual {p1}, Lqd0;->B0()Lhf0;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final f0(Lph0;)V
    .registers 4

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lo5f;

    const/4 v1, 0x3

    invoke-direct {v0, p1, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5

    invoke-static {p1}, Ldti;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p2, :cond_1b

    invoke-static {p2}, Ldti;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-static {p2}, Lx5f;->f(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1c

    :cond_1b
    const/4 p2, 0x0

    :goto_1c
    invoke-static {p1}, Lx5f;->f(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    if-nez p3, :cond_2b

    if-eqz p2, :cond_2a

    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2b

    :cond_2a
    return-void

    :cond_2b
    new-instance p3, Le5f;

    const/4 v0, 0x3

    invoke-direct {p3, p2, p1, v0}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {p0, p3}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final g0(Lej0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0xe

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final h(Ljava/lang/String;Llqm;Ljava/lang/String;Z)V
    .registers 9

    invoke-static {p1}, Ldti;->a(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    if-eqz v0, :cond_4f

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p3, :cond_1d

    invoke-static {p3}, Ldti;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-static {p3}, Lx5f;->f(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p3

    goto :goto_1e

    :cond_1d
    const/4 p3, 0x0

    :goto_1e
    invoke-static {p1}, Lx5f;->f(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    if-nez p4, :cond_2c

    if-eqz p3, :cond_14d

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_14d

    :cond_2c
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p3

    new-instance p4, Lck0;

    invoke-direct {p4, v1, p3}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {p4}, Lck0;->f()Lhp0;

    move-result-object p4

    new-instance v0, Ljkc;

    const/16 v1, 0x15

    invoke-direct {v0, p1, p2, v1}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p4, Lhp0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lve0;

    invoke-virtual {v0, p1}, Ljkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p3}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_4f
    sget-object p2, Ldti;->b:Ljava/util/regex/Pattern;

    sget-object p3, Laik;->a:[Ljava/lang/String;

    invoke-static {p1, p3}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/regex/Matcher;->matches()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_8d

    if-eqz p4, :cond_14d

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    new-instance p3, Lck0;

    invoke-direct {p3, v1, p2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {p3}, Lck0;->f()Lhp0;

    move-result-object p3

    iget-object p4, p3, Lhp0;->b:Lz56;

    const/4 v1, 0x7

    invoke-virtual {p4, v1, v0, v0}, Ljf0;->o(III)V

    const-string p4, "clid="

    invoke-static {p1, p4}, Lkotlin/text/StringsKt;->G(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    iget-object p3, p3, Lhp0;->b:Lz56;

    if-eqz p1, :cond_85

    invoke-virtual {p3, v0, v0, v0}, Ljf0;->o(III)V

    goto :goto_89

    :cond_85
    const/4 p1, 0x2

    invoke-virtual {p3, p1, v0, v0}, Ljf0;->o(III)V

    :goto_89
    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_8d
    sget-object p2, Ldti;->c:Ljava/util/regex/Pattern;

    invoke-static {p1, p3}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/regex/Matcher;->matches()Z

    move-result p2

    if-eqz p2, :cond_ca

    if-eqz p4, :cond_14d

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    new-instance p3, Lck0;

    invoke-direct {p3, v1, p2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {p3}, Lck0;->f()Lhp0;

    move-result-object p3

    iget-object p4, p3, Lhp0;->b:Lz56;

    const/16 v1, 0x8

    invoke-virtual {p4, v1, v0, v0}, Ljf0;->o(III)V

    const-string p4, "Opera_14mobile"

    invoke-static {p1, p4}, Lkotlin/text/StringsKt;->G(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    iget-object p3, p3, Lhp0;->b:Lz56;

    if-eqz p1, :cond_c2

    const/4 p1, 0x3

    invoke-virtual {p3, p1, v0, v0}, Ljf0;->o(III)V

    goto :goto_c6

    :cond_c2
    const/4 p1, 0x4

    invoke-virtual {p3, p1, v0, v0}, Ljf0;->o(III)V

    :goto_c6
    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_ca
    sget-object p2, Ldti;->d:Ljava/util/regex/Pattern;

    invoke-virtual {p2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/regex/Matcher;->matches()Z

    move-result p2

    const-wide/16 v2, 0x1

    if-eqz p2, :cond_10c

    if-eqz p4, :cond_14d

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    new-instance p3, Lck0;

    invoke-direct {p3, v1, p2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {p3}, Lck0;->f()Lhp0;

    move-result-object p3

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p4, "t"

    invoke-virtual {p1, p4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p4, "ofa"

    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_101

    iget-object p1, p3, Lhp0;->b:Lz56;

    const/16 p3, 0x12

    invoke-virtual {p1, p3, v0, v2, v3}, Ljf0;->p(IIJ)V

    goto :goto_108

    :cond_101
    iget-object p1, p3, Lhp0;->b:Lz56;

    const/16 p3, 0x13

    invoke-virtual {p1, p3, v0, v2, v3}, Ljf0;->p(IIJ)V

    :goto_108
    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_10c
    sget-object p2, Ldti;->e:Ljava/util/regex/Pattern;

    invoke-static {p1, p3}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/regex/Matcher;->matches()Z

    move-result p2

    if-eqz p2, :cond_14d

    if-eqz p4, :cond_14d

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    new-instance p3, Lck0;

    invoke-direct {p3, v1, p2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {p3}, Lck0;->f()Lhp0;

    move-result-object p3

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p4, "segment"

    invoke-virtual {p1, p4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p4, "startpage.opera.android"

    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_144

    iget-object p1, p3, Lhp0;->b:Lz56;

    const/4 p3, 0x5

    invoke-virtual {p1, p3, v0, v2, v3}, Ljf0;->p(IIJ)V

    goto :goto_14a

    :cond_144
    iget-object p1, p3, Lhp0;->b:Lz56;

    const/4 p3, 0x6

    invoke-virtual {p1, p3, v0, v2, v3}, Ljf0;->p(IIJ)V

    :goto_14a
    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    :cond_14d
    return-void
.end method

.method public final h0(Lfc0;)V
    .registers 8

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lec0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 v2, 0x2b

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_2d

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2d

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_36

    :cond_2d
    invoke-static {p1, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_36
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final i(Landroidx/fragment/app/r;)V
    .registers 2

    iget-object p0, p0, Lx5f;->g:Lf11;

    invoke-virtual {p0, p1}, Lshf;->N(Landroidx/fragment/app/r;)V

    return-void
.end method

.method public final i0(Lhl0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Loj0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 v2, 0x20

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_32

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_32

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3b

    :cond_32
    invoke-static {p1, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3b
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final j(ILjava/lang/String;Z)V
    .registers 9

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->y(Lzpa;)Liq0;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz p3, :cond_33

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map;

    if-eqz p3, :cond_25

    invoke-interface {p3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_25

    new-instance v3, Lif0;

    invoke-direct {v3, v1, v2, p3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_57

    :cond_25
    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v2, v2, p3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, v1, v2, p3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_57

    :cond_33
    const/4 p3, 0x0

    invoke-virtual {v1, p3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_49

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_49

    new-instance v2, Lif0;

    invoke-direct {v2, v1, p3, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_47
    move-object v3, v2

    goto :goto_57

    :cond_49
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, p3, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, v1, p3, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_47

    :goto_57
    invoke-virtual {v3, p2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, La60;

    if-nez p3, :cond_6b

    new-instance p3, La60;

    const/4 v1, -0x1

    const/4 v2, 0x5

    const/16 v4, 0x98b

    invoke-direct {p3, v4, v1, v2}, Ljf0;-><init>(III)V

    invoke-virtual {v3, p2, p3}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6b
    invoke-virtual {p3, p1}, Ljf0;->e(I)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final j0(Lpl0;)V
    .registers 6

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->O(Lzpa;)Le66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0xa

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final k(I)V
    .registers 9

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v1

    const/16 v2, 0x16

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lua0;

    if-nez v3, :cond_27

    new-instance v3, Lua0;

    const/16 v4, 0x98b

    const/4 v5, 0x6

    const/4 v6, 0x1

    invoke-direct {v3, v4, v6, v5}, Ljf0;-><init>(III)V

    invoke-virtual {v1, v2, v6, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lua0;

    :cond_27
    invoke-virtual {v3, p1}, Ljf0;->e(I)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final k0(Lxl0;)V
    .registers 4

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lrkc;

    const/16 v1, 0x1b

    invoke-direct {v0, p1, v1}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final l(I)V
    .registers 9

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v1

    const/16 v2, 0x14

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnf0;

    if-nez v3, :cond_27

    new-instance v3, Lnf0;

    const/16 v4, 0x98b

    const/4 v5, 0x5

    const/4 v6, 0x1

    invoke-direct {v3, v4, v6, v5}, Ljf0;-><init>(III)V

    invoke-virtual {v1, v2, v6, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lnf0;

    :cond_27
    invoke-virtual {v3, p1}, Ljf0;->e(I)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final l0(Lgm0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Ljm0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    if-nez p1, :cond_17

    move v3, v2

    goto :goto_18

    :cond_17
    move v3, v4

    :goto_18
    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 v2, 0x37

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_37

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_37

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_40

    :cond_37
    invoke-static {p1, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_40
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final m(Landroidx/fragment/app/r;)V
    .registers 2

    iget-object p0, p0, Lx5f;->g:Lf11;

    invoke-virtual {p0, p1}, Lshf;->f(Landroidx/fragment/app/r;)V

    return-void
.end method

.method public final m0(Z)V
    .registers 6

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object v1

    const/16 v2, 0x8

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final n(JZ)V
    .registers 7

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Lx5f;->b:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lh5f;

    invoke-direct {v1, p0, p1, p2, p3}, Lh5f;-><init>(Lx5f;JZ)V

    invoke-virtual {v0, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lx5f;->e:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final n0(Len0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Ldn0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    if-nez p1, :cond_17

    move v3, v2

    goto :goto_18

    :cond_17
    move v3, v4

    :goto_18
    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/4 v2, 0x7

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_36

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_36

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3f

    :cond_36
    invoke-static {p1, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3f
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final o(I)V
    .registers 8

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lz56;

    if-nez v2, :cond_22

    new-instance v2, Lz56;

    const/16 v3, 0x98b

    const/16 v4, 0x15

    const/4 v5, 0x1

    invoke-direct {v2, v3, v5, v4}, Ljf0;-><init>(III)V

    invoke-virtual {v0, v1, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lz56;

    :cond_22
    invoke-virtual {v2, p1}, Ljf0;->e(I)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V
    .registers 14

    const-string v0, "utm_source"

    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "utm_medium"

    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "utm_campaign"

    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v1, Lpr3;

    const/4 v8, 0x2

    move-object v4, p1

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v1 .. v8}, Lpr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final p(Ljava/lang/String;Lu50;Lq50;Ljava/lang/String;JZLv50;Ljava/lang/Long;)V
    .registers 22

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_5

    return-void

    :cond_5
    if-eqz p7, :cond_a

    sget-object v1, Lg60;->c:Lg60;

    goto :goto_c

    :cond_a
    sget-object v1, Lg60;->d:Lg60;

    :goto_c
    const-wide/16 v9, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p5

    move-object/from16 v8, p8

    move-object/from16 v11, p9

    invoke-virtual/range {v0 .. v11}, Lx5f;->t(Lg60;Ljava/lang/String;Lu50;Lq50;Ljava/lang/String;JLv50;JLjava/lang/Long;)V

    return-void
.end method

.method public final p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lgc0;

    const/4 v1, -0x1

    const/4 v2, 0x3

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p1, :cond_14

    move v3, v1

    goto :goto_15

    :cond_14
    move v3, v2

    :goto_15
    invoke-virtual {v0, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-nez p2, :cond_1c

    move p1, v1

    goto :goto_1d

    :cond_1c
    move p1, v2

    :goto_1d
    invoke-virtual {v0, v1, p1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p3, :cond_23

    move v1, v2

    :cond_23
    const/4 p1, 0x2

    invoke-virtual {v0, p1, v1, p3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, p2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p2

    const/16 p3, 0x17

    invoke-virtual {p2, p3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_47

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_47

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, p3, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_50

    :cond_47
    invoke-static {p2, p3, v2}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lhf0;

    invoke-direct {v2, p2, p3, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_50
    invoke-virtual {v2, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V
    .registers 28

    move-object/from16 v1, p7

    move-object/from16 v2, p16

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Le60;

    const/4 v5, -0x1

    const/16 v6, 0xc

    const/16 v7, 0x98b

    invoke-direct {v4, v7, v5, v6}, Ljf0;-><init>(III)V

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez p1, :cond_18

    move v7, v6

    goto :goto_19

    :cond_18
    move v7, v5

    :goto_19
    invoke-virtual {v4, v6, v7, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-nez p5, :cond_20

    move v7, v6

    goto :goto_21

    :cond_20
    move v7, v5

    :goto_21
    invoke-virtual {v4, v5, v7, p5}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v1, :cond_27

    move v6, v5

    :cond_27
    const/4 v0, 0x3

    invoke-virtual {v4, v0, v6, v1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v0, 0x2

    move-object/from16 v1, p6

    invoke-virtual {v4, v0, v1}, Le60;->x(ILjava/lang/String;)V

    const/4 v0, 0x4

    move-object/from16 v1, p8

    invoke-virtual {v4, v0, v1}, Le60;->x(ILjava/lang/String;)V

    move/from16 v1, p9

    int-to-long v6, v1

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    const/4 v1, 0x5

    invoke-virtual {v4, v1, v5, v6, v7}, Ljf0;->p(IIJ)V

    const/4 v1, 0x6

    move/from16 v6, p10

    invoke-virtual {v4, v1, v5, v6}, Ljf0;->r(IIZ)V

    sget-object v1, Ld60;->c:Ld60;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5a

    sget-object v1, Ld60;->d:Ld60;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_61

    :cond_5a
    const/16 v1, 0x8

    move-wide/from16 v6, p12

    invoke-virtual {v4, v1, v5, v6, v7}, Ljf0;->p(IIJ)V

    :cond_61
    new-instance v1, Ldf0;

    invoke-static/range {p11 .. p11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-direct {v1, v5, v6, v0}, Ldf0;-><init>(ILjava/lang/Object;B)V

    iget-object v0, v4, Ljf0;->d:[Ldf0;

    const/4 v6, 0x7

    aput-object v1, v0, v6

    sget-object v0, Ld60;->j:Ld60;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7e

    const/16 p1, 0x9

    move-wide/from16 v0, p14

    invoke-virtual {v4, p1, v5, v0, v1}, Ljf0;->p(IIJ)V

    :cond_7e
    if-eqz v2, :cond_85

    const/16 p1, 0xa

    invoke-virtual {v4, p1, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_85
    const/16 p1, 0xb

    move-object/from16 v0, p17

    invoke-virtual {v4, p1, v0}, Le60;->x(ILjava/lang/String;)V

    invoke-virtual {p0, v3, p2, p3, p4}, Lx5f;->c(Lx56;Ljava/lang/String;Lu50;Ljava/lang/String;)Lc60;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_a4

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_a4

    new-instance p3, Lhf0;

    invoke-direct {p3, p1, v5, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_b1

    :cond_a4
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v5, v5, p2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance p3, Lhf0;

    invoke-direct {p3, p1, v5, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_b1
    invoke-virtual {p3, v4}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final q0(Lqyl;ZJ)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    sget-object v0, Lxn0;->b:Lxn0;

    invoke-virtual {p0, p1, v0, p2}, Lx5f;->b(Lqyl;Lxn0;Z)Lwn0;

    move-result-object p2

    invoke-interface {p1}, Lqyl;->b()Ljava/lang/Boolean;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_1a

    const/4 v1, 0x2

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p2, v1, v0, p1}, Ljf0;->r(IIZ)V

    :cond_1a
    const/16 p1, 0xb

    invoke-virtual {p2, p1, v0, p3, p4}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, p2}, Lx5f;->V0(Lwn0;)V

    return-void
.end method

.method public final r(Lq50;Ljava/lang/String;IZZ)V
    .registers 11

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lr50;

    const/4 v2, -0x1

    const/4 v3, 0x6

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v3, v3, v3}, Ljf0;->r(IIZ)V

    const/4 p1, 0x2

    invoke-virtual {v1, p1, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x4

    int-to-long p2, p3

    invoke-virtual {v1, p1, v3, p2, p3}, Ljf0;->p(IIJ)V

    if-eqz p4, :cond_29

    const/4 p1, 0x5

    invoke-virtual {v1, p1, v3, p5}, Ljf0;->r(IIZ)V

    :cond_29
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    invoke-virtual {p1}, Lqd0;->A0()Lhf0;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final r0(Lqyl;Lvn0;)V
    .registers 5

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    sget-object v0, Lxn0;->c:Lxn0;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lx5f;->b(Lqyl;Lxn0;Z)Lwn0;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, p1}, Lx5f;->V0(Lwn0;)V

    return-void
.end method

.method public final s(Lq50;Ljava/lang/String;IZZLs50;)V
    .registers 12

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lr50;

    const/4 v2, -0x1

    const/4 v3, 0x6

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v3, v3, v2}, Ljf0;->r(IIZ)V

    if-eqz p6, :cond_1d

    move v2, v3

    :cond_1d
    const/4 p1, 0x3

    invoke-virtual {v1, p1, v2, p6}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x2

    invoke-virtual {v1, p1, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x4

    int-to-long p2, p3

    invoke-virtual {v1, p1, v3, p2, p3}, Ljf0;->p(IIJ)V

    if-eqz p4, :cond_30

    const/4 p1, 0x5

    invoke-virtual {v1, p1, v3, p5}, Ljf0;->r(IIZ)V

    :cond_30
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    invoke-virtual {p1}, Lqd0;->A0()Lhf0;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final s0(Lqyl;Z)V
    .registers 5

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    sget-object v0, Lxn0;->f:Lxn0;

    invoke-virtual {p0, p1, v0, p2}, Lx5f;->b(Lqyl;Lxn0;Z)Lwn0;

    move-result-object p2

    invoke-interface {p1}, Lqyl;->b()Ljava/lang/Boolean;

    move-result-object p1

    if-eqz p1, :cond_1a

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x2

    invoke-virtual {p2, v1, v0, p1}, Ljf0;->r(IIZ)V

    :cond_1a
    invoke-virtual {p0, p2}, Lx5f;->V0(Lwn0;)V

    return-void
.end method

.method public final setEnabled(Z)V
    .registers 2

    iput-boolean p1, p0, Lx5f;->h:Z

    return-void
.end method

.method public final t(Lg60;Ljava/lang/String;Lu50;Lq50;Ljava/lang/String;JLv50;JLjava/lang/Long;)V
    .registers 18

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lf60;

    const/4 v2, -0x1

    const/16 v3, 0x8

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v3, v3, p6, p7}, Ljf0;->p(IIJ)V

    const/4 p1, 0x2

    invoke-virtual {v1, p1, v3, p4}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p5, :cond_1d

    move v2, v3

    :cond_1d
    const/4 p4, 0x3

    invoke-virtual {v1, p4, v2, p5}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p8, :cond_27

    const/4 p4, 0x5

    invoke-virtual {v1, p4, v3, p8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_27
    const/4 p4, 0x6

    move-wide v4, p9

    invoke-virtual {v1, p4, v3, v4, v5}, Ljf0;->p(IIJ)V

    if-eqz p11, :cond_36

    const/4 p4, 0x7

    invoke-virtual/range {p11 .. p11}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v1, p4, v3, v4, v5}, Ljf0;->p(IIJ)V

    :cond_36
    const/4 p4, 0x0

    invoke-virtual {p0, v0, p2, p3, p4}, Lx5f;->c(Lx56;Ljava/lang/String;Lu50;Ljava/lang/String;)Lc60;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/List;

    if-eqz p3, :cond_4f

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_4f

    new-instance p4, Lhf0;

    invoke-direct {p4, p2, p1, p3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_5c

    :cond_4f
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2, p1, v3, p3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance p4, Lhf0;

    invoke-direct {p4, p2, p1, p3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_5c
    invoke-virtual {p4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final t0(Ljava/lang/String;)V
    .registers 8

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lgo0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    if-nez p1, :cond_12

    move v3, v2

    goto :goto_13

    :cond_12
    move v3, v4

    :goto_13
    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->C(Lzpa;)Lde0;

    move-result-object p1

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_31

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_31

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3e

    :cond_31
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3e
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final u(Lip0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lhq0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, p1}, Lqd0;->y(Lzpa;)Liq0;

    move-result-object p1

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_35

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_35

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_42

    :cond_35
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_42
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final u0(Leo0;Lee0;JJZLjava/lang/Long;Ljava/lang/Long;Lho0;)V
    .registers 15

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lfo0;

    const/4 v1, -0x1

    const/16 v2, 0x9

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p2, :cond_17

    move v1, v2

    :cond_17
    const/4 v3, 0x2

    invoke-virtual {v0, v3, v1, p2}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p2, 0x8

    invoke-virtual {v0, p2, v2, p10}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2, v2, p3, p4}, Ljf0;->p(IIJ)V

    const/4 p2, 0x4

    invoke-virtual {v0, p2, v2, p5, p6}, Ljf0;->p(IIJ)V

    if-eqz p9, :cond_31

    const/4 p2, 0x7

    invoke-virtual {p9}, Ljava/lang/Long;->longValue()J

    move-result-wide p3

    invoke-virtual {v0, p2, v2, p3, p4}, Ljf0;->p(IIJ)V

    :cond_31
    sget-object p2, Leo0;->d:Leo0;

    const/4 p3, 0x5

    if-ne p1, p2, :cond_39

    invoke-virtual {v0, p3, v2, p7}, Ljf0;->r(IIZ)V

    :cond_39
    if-eqz p8, :cond_43

    const/4 p1, 0x6

    invoke-virtual {p8}, Ljava/lang/Long;->longValue()J

    move-result-wide p4

    invoke-virtual {v0, p1, v2, p4, p5}, Ljf0;->p(IIJ)V

    :cond_43
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, p2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p4

    invoke-virtual {p4, p2}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/List;

    if-eqz p4, :cond_65

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_65

    new-instance p5, Lhf0;

    invoke-direct {p5, p2, p3, p4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_6e

    :cond_65
    invoke-static {p2, p3, v2}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object p4

    new-instance p5, Lhf0;

    invoke-direct {p5, p2, p3, p4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_6e
    invoke-virtual {p5, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final v(Ljava/lang/String;Ln60;)V
    .registers 10

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lws0;

    const/16 v3, 0x98b

    const/4 v4, 0x1

    if-nez v2, :cond_22

    new-instance v2, Lws0;

    const/16 v5, 0x8

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-virtual {v0, v1, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lws0;

    :cond_22
    const/4 v1, 0x2

    invoke-virtual {v2, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lm60;

    if-nez v5, :cond_3b

    new-instance v5, Lm60;

    const/4 v6, 0x3

    invoke-direct {v5, v3, v4, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v2, v1, v4, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lm60;

    :cond_3b
    const/4 v1, 0x0

    invoke-virtual {v5, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_50

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_50

    new-instance v3, Lif0;

    invoke-direct {v3, v5, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_5d

    :cond_50
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v5, v1, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, v5, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_5d
    invoke-virtual {v3, p1, p2}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final v0(Ljava/lang/String;)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v1

    const/16 v2, 0x16

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_25

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_25

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_33

    :cond_25
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_33
    invoke-virtual {v4, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final w(Lf90;I)V
    .registers 9

    sget-object v0, Lf90;->b:Lf90;

    if-eq p1, v0, :cond_22

    sget-object v0, Lf90;->c:Lf90;

    if-eq p1, v0, :cond_1f

    sget-object v0, Lf90;->d:Lf90;

    if-eq p1, v0, :cond_1c

    sget-object v0, Lf90;->e:Lf90;

    if-eq p1, v0, :cond_19

    sget-object v0, Lf90;->f:Lf90;

    if-eq p1, v0, :cond_16

    const/4 p1, 0x0

    goto :goto_24

    :cond_16
    const-string p1, "ARTICLE_READER_MODE"

    goto :goto_24

    :cond_19
    const-string p1, "ARTICLE_PREVIEW"

    goto :goto_24

    :cond_1c
    const-string p1, "HIGHLIGHTS_CAROUSEL"

    goto :goto_24

    :cond_1f
    const-string p1, "ROUNDUP_CAROUSEL"

    goto :goto_24

    :cond_22
    const-string p1, "ROUNDUP_BANNER"

    :goto_24
    if-nez p1, :cond_27

    return-void

    :cond_27
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object v1

    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_4b

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4b

    new-instance v4, Lif0;

    invoke-direct {v4, v1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_59

    :cond_4b
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, v1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_59
    invoke-virtual {v4, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lv60;

    if-nez v1, :cond_6d

    new-instance v1, Lv60;

    const/4 v2, -0x1

    const/4 v3, 0x3

    const/16 v5, 0x98b

    invoke-direct {v1, v5, v2, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v4, p1, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6d
    invoke-virtual {v1, p2}, Ljf0;->e(I)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final w0(Lvb0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lzo0;

    const/16 v1, 0x98b

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    const/16 v2, 0xf

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_36

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_36

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v2, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_40

    :cond_36
    invoke-static {v1, v2, v3}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v3, v4

    :goto_40
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final x(Lb70;)V
    .registers 6

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->O(Lzpa;)Le66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x11

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final x0(Lvb0;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lap0;

    const/16 v1, 0x98b

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljf0;-><init>(III)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {p1, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    const/16 v2, 0xe

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_36

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_36

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v2, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_40

    :cond_36
    invoke-static {v1, v2, v3}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v3, v4

    :goto_40
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final y(Lg80;)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    new-instance v2, Lh80;

    const/16 v3, 0x98b

    const/4 v4, -0x1

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x25

    invoke-virtual {v1, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_32

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_32

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, p1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3b

    :cond_32
    invoke-static {v1, p1, v5}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, p1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3b
    invoke-virtual {v4, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final y0(Ljp0;)V
    .registers 6

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x4f

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final z(ZZ)V
    .registers 7

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v3, 0x38

    if-eqz p2, :cond_22

    if-eqz p1, :cond_19

    sget-object p1, Le80;->b:Le80;

    goto :goto_1b

    :cond_19
    sget-object p1, Le80;->c:Le80;

    :goto_1b
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_2a

    :cond_22
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Le80;->d:Le80;

    invoke-virtual {v1, v3, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :goto_2a
    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final z0(J)V
    .registers 8

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-virtual {v0, v1}, Lx56;->A(Lzpa;)Luc0;

    move-result-object v1

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_25

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_25

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_33

    :cond_25
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_33
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method
