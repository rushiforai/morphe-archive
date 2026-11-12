.class public final Lpfn;
.super Llim;
.source "SourceFile"

# interfaces
.implements Labh;
.implements Ldmk;
.implements Lg8d;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Laf3;

.field public final c:Lqb7;

.field public final d:Lxb;

.field public final e:Lslk;

.field public final f:Lfmk;

.field public final g:Lru9;

.field public final h:Lz77;

.field public final i:Ljtg;

.field public final j:Lq2;

.field public final k:Lode;

.field public final l:Lofn;

.field public final m:Lofn;

.field public final n:Lmfn;

.field public o:Lamk;

.field public p:Llh4;

.field public q:Luah;

.field public r:Lwvg;


# direct methods
.method public constructor <init>(Landroid/content/Context;Laf3;Lqb7;Lxb;Lslk;Lfmk;Lru9;Lz77;Ljtg;Lq2;Lx5f;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpfn;->a:Landroid/content/Context;

    iput-object p2, p0, Lpfn;->b:Laf3;

    iput-object p3, p0, Lpfn;->c:Lqb7;

    iput-object p4, p0, Lpfn;->d:Lxb;

    iput-object p5, p0, Lpfn;->e:Lslk;

    iput-object p6, p0, Lpfn;->f:Lfmk;

    iput-object p7, p0, Lpfn;->g:Lru9;

    iput-object p8, p0, Lpfn;->h:Lz77;

    iput-object p9, p0, Lpfn;->i:Ljtg;

    iput-object p10, p0, Lpfn;->j:Lq2;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lpfn;->k:Lode;

    new-instance p1, Lofn;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lofn;-><init>(Lpfn;B)V

    iput-object p1, p0, Lpfn;->l:Lofn;

    new-instance p1, Lofn;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lofn;-><init>(Lpfn;B)V

    iput-object p1, p0, Lpfn;->m:Lofn;

    new-instance p1, Lmfn;

    new-instance p3, Ljfn;

    invoke-direct {p3, p0, p2}, Ljfn;-><init>(Lpfn;B)V

    invoke-direct {p1, p11, p3}, Lmfn;-><init>(Lx5f;Ljfn;)V

    iput-object p1, p0, Lpfn;->n:Lmfn;

    sget-object p1, Llh4;->c:Llh4;

    iput-object p1, p0, Lpfn;->p:Llh4;

    return-void
.end method


# virtual methods
.method public final D()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lpfn;->q:Luah;

    invoke-virtual {p0}, Lpfn;->S()V

    return-void
.end method

.method public final J()V
    .registers 2

    iget-object p0, p0, Lpfn;->e:Lslk;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lslk;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final Q()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lpfn;->r:Lwvg;

    if-eqz p0, :cond_f

    iget-object p0, p0, Lwvg;->h:Ljmk;

    if-eqz p0, :cond_f

    iget-object p0, p0, Ljmk;->c:Lhmk;

    if-eqz p0, :cond_f

    iget-object p0, p0, Lhmk;->a:Ljava/lang/String;

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final R(Lnfn;)V
    .registers 2

    iget-object p0, p0, Lpfn;->k:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final S()V
    .registers 16

    iget-object v0, p0, Lpfn;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "vpn.vpnpro.upsell_banner_closed"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_184

    iget-object v1, p0, Lpfn;->i:Ljtg;

    invoke-virtual {v1}, Ljtg;->d()Z

    move-result v1

    if-eqz v1, :cond_184

    iget-object v1, p0, Lpfn;->r:Lwvg;

    if-eqz v1, :cond_23

    invoke-virtual {v1}, Lwvg;->a()Z

    move-result v4

    goto :goto_24

    :cond_23
    move v4, v3

    :goto_24
    if-nez v4, :cond_2a

    invoke-virtual {p0, v2}, Lpfn;->R(Lnfn;)V

    return-void

    :cond_2a
    invoke-virtual {v1}, Lwvg;->b()Z

    move-result v4

    if-eqz v4, :cond_50

    new-instance v1, Lnfn;

    const v3, 0x7f1413be

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcxc;->k:Luac;

    const v4, 0x7f1407ef

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f141194

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v3, v4, v0, v2}, Lnfn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Laxc;)V

    invoke-virtual {p0, v1}, Lpfn;->R(Lnfn;)V

    return-void

    :cond_50
    iget-object v4, p0, Lpfn;->q:Luah;

    if-nez v4, :cond_58

    invoke-virtual {p0, v2}, Lpfn;->R(Lnfn;)V

    return-void

    :cond_58
    iget-object v4, p0, Lpfn;->o:Lamk;

    const/4 v5, 0x1

    if-eqz v4, :cond_9c

    iget-object v6, v1, Lwvg;->i:Lo9g;

    if-eqz v6, :cond_9c

    iget-object v1, v1, Lwvg;->h:Ljmk;

    if-eqz v1, :cond_9c

    iget-object v1, v1, Ljmk;->b:Limk;

    if-eqz v1, :cond_9c

    iget-wide v7, v1, Limk;->b:D

    invoke-virtual {v6}, Lo9g;->a()I

    move-result v1

    if-eqz v1, :cond_7f

    if-eq v1, v5, :cond_7d

    const/4 v6, 0x2

    const/4 v9, 0x3

    if-eq v1, v6, :cond_81

    if-eq v1, v9, :cond_7b

    move v9, v3

    goto :goto_81

    :cond_7b
    move v9, v5

    goto :goto_81

    :cond_7d
    const/4 v9, 0x6

    goto :goto_81

    :cond_7f
    const/16 v9, 0xc

    :cond_81
    :goto_81
    if-lez v9, :cond_9c

    int-to-double v9, v9

    div-double/2addr v7, v9

    iget v1, v4, Lamk;->e:F

    float-to-double v9, v1

    cmpl-double v1, v9, v7

    if-gez v1, :cond_9c

    const-wide/high16 v11, 0x3ff0000000000000L    # 1.0

    div-double/2addr v9, v7

    sub-double/2addr v11, v9

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    mul-double/2addr v11, v6

    invoke-static {v11, v12}, Lzed;->a(D)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_9d

    :cond_9c
    move-object v1, v2

    :goto_9d
    if-eqz v1, :cond_180

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_180

    sget-object v4, Llfn;->a:Lh58;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v6

    iget-object v6, v6, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v7, "vpn.vpnpro.upsell_banner_version"

    invoke-interface {v6, v7, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v0}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v7

    invoke-virtual {v7}, Lno7;->i()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lbxc;

    new-instance v8, Lpqh;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    if-ltz v6, :cond_cf

    invoke-virtual {v4}, Lh58;->d()I

    move-result v9

    if-ge v6, v9, :cond_cf

    invoke-virtual {v4, v6}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v9

    goto :goto_d1

    :cond_cf
    sget-object v9, Laxc;->f:Laxc;

    :goto_d1
    iput-object v9, v8, Lpqh;->a:Ljava/lang/Object;

    invoke-static {v4}, Lj95;->g(Ljava/util/Collection;)Lkotlin/ranges/IntRange;

    move-result-object v9

    invoke-virtual {v9}, Lkotlin/ranges/a;->iterator()Ljava/util/Iterator;

    move-result-object v9

    move-object v10, v2

    move-object v11, v10

    move-object v12, v11

    :goto_de
    move-object v13, v9

    check-cast v13, Lacb;

    iget-boolean v13, v13, Lacb;->c:Z

    if-eqz v13, :cond_139

    move-object v10, v9

    check-cast v10, Lubb;

    invoke-virtual {v10}, Lubb;->nextInt()I

    if-ltz v6, :cond_f8

    invoke-virtual {v4}, Lh58;->d()I

    move-result v10

    if-ge v6, v10, :cond_f8

    invoke-virtual {v4, v6}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v10

    goto :goto_fa

    :cond_f8
    sget-object v10, Laxc;->f:Laxc;

    :goto_fa
    iput-object v10, v8, Lpqh;->a:Ljava/lang/Object;

    check-cast v10, Laxc;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-byte v10, v10, Laxc;->c:B

    invoke-virtual {v7, v10, v0}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v8, Lpqh;->a:Ljava/lang/Object;

    check-cast v11, Laxc;

    iget-byte v11, v11, Laxc;->d:B

    invoke-virtual {v7, v11, v0}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    iget-object v12, v8, Lpqh;->a:Ljava/lang/Object;

    check-cast v12, Laxc;

    iget-byte v12, v12, Laxc;->e:B

    invoke-virtual {v7, v12, v0}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    const-string v13, ""

    invoke-virtual {v13, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_131

    invoke-virtual {v13, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_131

    invoke-virtual {v13, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_131

    move v3, v5

    goto :goto_de

    :cond_131
    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v4}, La4;->d()I

    move-result v13

    rem-int/2addr v6, v13

    goto :goto_de

    :cond_139
    if-nez v3, :cond_13f

    invoke-virtual {p0, v2}, Lpfn;->R(Lnfn;)V

    return-void

    :cond_13f
    if-nez v10, :cond_14f

    iget-object v2, v8, Lpqh;->a:Ljava/lang/Object;

    check-cast v2, Laxc;

    iget v2, v2, Laxc;->a:I

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    :cond_14f
    if-nez v11, :cond_15f

    iget-object v2, v8, Lpqh;->a:Ljava/lang/Object;

    check-cast v2, Laxc;

    iget v2, v2, Laxc;->b:I

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    :cond_15f
    if-nez v12, :cond_173

    iget-object v2, v8, Lpqh;->a:Ljava/lang/Object;

    check-cast v2, Laxc;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v2, 0x7f141332

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    :cond_173
    new-instance v0, Lnfn;

    iget-object v1, v8, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Laxc;

    invoke-direct {v0, v10, v11, v12, v1}, Lnfn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Laxc;)V

    invoke-virtual {p0, v0}, Lpfn;->R(Lnfn;)V

    return-void

    :cond_180
    invoke-virtual {p0, v2}, Lpfn;->R(Lnfn;)V

    return-void

    :cond_184
    invoke-virtual {p0, v2}, Lpfn;->R(Lnfn;)V

    return-void
.end method

.method public final a(Lbbh;)V
    .registers 13

    iget-object v0, p0, Lpfn;->r:Lwvg;

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    iget-object v0, v0, Lwvg;->h:Ljmk;

    if-eqz v0, :cond_10

    iget-object v0, v0, Ljmk;->c:Lhmk;

    if-eqz v0, :cond_10

    iget-object v0, v0, Lhmk;->b:Ljava/lang/String;

    goto :goto_11

    :cond_10
    move-object v0, v1

    :goto_11
    if-eqz v0, :cond_5a

    iget-object p1, p1, Lbbh;->a:Lcsh;

    iget v2, p1, Lcsh;->d:I

    const/4 v3, 0x0

    move v4, v3

    :cond_19
    if-ge v4, v2, :cond_58

    invoke-virtual {p1, v4}, Lcsh;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    move-object v6, v5

    check-cast v6, Luah;

    iget-object v7, v6, Luah;->a:Ljava/lang/String;

    invoke-static {v7, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_19

    iget-object v6, v6, Luah;->e:Lh1b;

    if-eqz v6, :cond_36

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_19

    :cond_36
    invoke-virtual {v6}, Ljava/util/AbstractCollection;->size()I

    move-result v7

    move v8, v3

    :cond_3b
    if-ge v8, v7, :cond_19

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Ljava/lang/String;

    sget-object v10, Lzsk;->f:Ljava/util/Map;

    const-string v10, "premium_monthly"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_57

    const-string v10, "premium_3month"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3b

    :cond_57
    move-object v1, v5

    :cond_58
    check-cast v1, Luah;

    :cond_5a
    iput-object v1, p0, Lpfn;->q:Luah;

    invoke-virtual {p0}, Lpfn;->S()V

    return-void
.end method

.method public final handleSubscriptionPlans(Lbmk;)V
    .registers 7

    iget-object p1, p1, Lbmk;->c:Lcsh;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lh1b;->u(I)La1b;

    move-result-object p1

    const/4 v0, 0x0

    move-object v1, v0

    :cond_9
    :goto_9
    invoke-virtual {p1}, Lq4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-virtual {p1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lamk;

    if-eqz v1, :cond_21

    iget-object v3, v2, Lamk;->a:Lzsk;

    iget-byte v3, v3, Lzsk;->c:B

    iget-object v4, v1, Lamk;->a:Lzsk;

    iget-byte v4, v4, Lzsk;->c:B

    if-le v3, v4, :cond_9

    :cond_21
    move-object v1, v2

    goto :goto_9

    :cond_23
    iget-object p1, p0, Lpfn;->r:Lwvg;

    if-eqz p1, :cond_32

    iget-object p1, p1, Lwvg;->h:Ljmk;

    if-eqz p1, :cond_32

    iget-object p1, p1, Ljmk;->b:Limk;

    if-eqz p1, :cond_32

    iget-object p1, p1, Limk;->a:Ljava/lang/String;

    goto :goto_33

    :cond_32
    move-object p1, v0

    :goto_33
    if-eqz p1, :cond_46

    if-eqz v1, :cond_3e

    iget-object v2, v1, Lamk;->c:Lxlk;

    iget-object v2, v2, Lxlk;->c:Lwlk;

    iget-object v2, v2, Lwlk;->b:Ljava/lang/String;

    goto :goto_3f

    :cond_3e
    move-object v2, v0

    :goto_3f
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_46

    move-object v0, v1

    :cond_46
    iput-object v0, p0, Lpfn;->o:Lamk;

    invoke-virtual {p0}, Lpfn;->S()V

    return-void
.end method

.method public final handleSubscriptionPlans(Lcmk;)V
    .registers 2

    const/4 p1, 0x0

    .line 76
    iput-object p1, p0, Lpfn;->o:Lamk;

    .line 77
    invoke-virtual {p0}, Lpfn;->S()V

    return-void
.end method

.method public final handleSubscriptionPlans(Lzlk;)V
    .registers 2

    const/4 p1, 0x0

    .line 78
    iput-object p1, p0, Lpfn;->o:Lamk;

    .line 79
    invoke-virtual {p0}, Lpfn;->S()V

    return-void
.end method

.method public final j(Ljg4;)V
    .registers 4

    iget-object p0, p0, Lpfn;->d:Lxb;

    iget-object p0, p0, Lxb;->e:Ljze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldpf;

    new-instance v0, Ly8d;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ly8d;-><init>(Ljg4;B)V

    invoke-virtual {p0, v0}, Ldpf;->a(Lhpf;)V

    return-void
.end method

.method public final u()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lpfn;->q:Luah;

    iget-object p0, p0, Luah;->a:Ljava/lang/String;

    return-object p0
.end method
