.class public final La9d;
.super Ll7n;
.source "SourceFile"

# interfaces
.implements Labh;
.implements Lg8d;


# instance fields
.field public final b:Laf3;

.field public final c:Lxb;

.field public final d:Lslk;

.field public final e:Ljtg;

.field public final f:Lfmk;

.field public final g:Lru9;

.field public final h:Lorm;

.field public final i:Lz77;

.field public final j:Lysj;

.field public final k:Lyug;

.field public final l:Lqb7;

.field public final m:Lulp;

.field public final n:Lnak;

.field public final o:Lnak;

.field public final p:Lnak;

.field public final q:Lrlh;

.field public r:Lwvg;

.field public s:Luah;

.field public t:Z

.field public u:Ld3k;

.field public v:Ld3k;

.field public final w:Ld8d;


# direct methods
.method public constructor <init>(Laf3;Lxb;Lslk;Ljtg;Lfmk;Lru9;Lorm;Lz77;Lysj;Lyug;Lqb7;)V
    .registers 12

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, La9d;->b:Laf3;

    iput-object p2, p0, La9d;->c:Lxb;

    iput-object p3, p0, La9d;->d:Lslk;

    iput-object p4, p0, La9d;->e:Ljtg;

    iput-object p5, p0, La9d;->f:Lfmk;

    iput-object p6, p0, La9d;->g:Lru9;

    iput-object p7, p0, La9d;->h:Lorm;

    iput-object p8, p0, La9d;->i:Lz77;

    iput-object p9, p0, La9d;->j:Lysj;

    iput-object p10, p0, La9d;->k:Lyug;

    iput-object p11, p0, La9d;->l:Lqb7;

    sget-object p1, Lu55;->Ro:Lulp;

    iput-object p1, p0, La9d;->m:Lulp;

    const/4 p1, 0x0

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p2

    iput-object p2, p0, La9d;->n:Lnak;

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p4

    iput-object p4, p0, La9d;->o:Lnak;

    iget-object p5, p6, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p6, "vpn_pro.kill_switch.on"

    const/4 p7, 0x0

    invoke-interface {p5, p6, p7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p5

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p5

    invoke-static {p5}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p5

    iput-object p5, p0, La9d;->p:Lnak;

    new-instance p6, Lz8d;

    invoke-direct {p6, p7, p1, p0}, Lz8d;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p2, p5, p4, p6}, Lnb6;->l(Lf99;Lf99;Lf99;Ldr9;)Lcw;

    move-result-object p2

    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object p4

    new-instance p5, Lv8d;

    sget-object p6, Llyi;->a:Llyi;

    invoke-direct {p5, p1, p6, p1}, Lv8d;-><init>(Lu8d;Llyi;Ljava/lang/Integer;)V

    sget-object p1, Laej;->a:Lftj;

    invoke-static {p2, p4, p1, p5}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    iput-object p1, p0, La9d;->q:Lrlh;

    iget-object p1, p3, Lslk;->i:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwvg;

    iput-object p1, p0, La9d;->r:Lwvg;

    new-instance p1, Ld8d;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ld8d;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, La9d;->w:Ld8d;

    iget-object p0, p3, Lslk;->i:Lkze;

    invoke-virtual {p0, p1}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final D()V
    .registers 1

    invoke-virtual {p0}, La9d;->g()V

    return-void
.end method

.method public final J()V
    .registers 1

    invoke-virtual {p0}, La9d;->f()V

    return-void
.end method

.method public final Q()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, La9d;->r:Lwvg;

    iget-object p0, p0, Lwvg;->h:Ljmk;

    if-eqz p0, :cond_d

    iget-object p0, p0, Ljmk;->c:Lhmk;

    if-eqz p0, :cond_d

    iget-object p0, p0, Lhmk;->a:Ljava/lang/String;

    return-object p0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method

.method public final a(Lbbh;)V
    .registers 5

    iget-object v0, p0, La9d;->r:Lwvg;

    iget-object v0, v0, Lwvg;->h:Ljmk;

    if-eqz v0, :cond_d

    iget-object v0, v0, Ljmk;->c:Lhmk;

    if-eqz v0, :cond_d

    iget-object v0, v0, Lhmk;->b:Ljava/lang/String;

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    if-eqz v0, :cond_31

    iget-object p1, p1, Lbbh;->a:Lcsh;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lh1b;->u(I)La1b;

    move-result-object p1

    :cond_17
    invoke-virtual {p1}, Lq4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-virtual {p1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luah;

    iget-object v2, v1, Luah;->a:Ljava/lang/String;

    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_17

    iput-object v1, p0, La9d;->s:Luah;

    invoke-virtual {p0}, La9d;->g()V

    return-void

    :cond_31
    invoke-virtual {p0}, La9d;->g()V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object v0, p0, La9d;->d:Lslk;

    iget-object v0, v0, Lslk;->i:Lkze;

    iget-object p0, p0, La9d;->w:Ld8d;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final f()V
    .registers 5

    const/4 v0, 0x1

    iput-boolean v0, p0, La9d;->t:Z

    invoke-virtual {p0}, La9d;->g()V

    iget-object v1, p0, La9d;->u:Ld3k;

    const/4 v2, 0x0

    if-eqz v1, :cond_e

    invoke-virtual {v1, v2}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_e
    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v1

    new-instance v3, Lx8d;

    invoke-direct {v3, p0, v2, v0}, Lx8d;-><init>(La9d;Lmt5;B)V

    const/4 v0, 0x3

    invoke-static {v1, v2, v2, v3, v0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    iput-object v0, p0, La9d;->u:Ld3k;

    return-void
.end method

.method public final g()V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, La9d;->r:Lwvg;

    invoke-virtual {v1}, Lwvg;->b()Z

    move-result v1

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    if-eqz v1, :cond_53

    iget-object v1, v0, La9d;->r:Lwvg;

    invoke-virtual {v1}, Lwvg;->a()Z

    move-result v5

    if-eqz v5, :cond_4d

    invoke-virtual {v1}, Lwvg;->b()Z

    move-result v5

    if-eqz v5, :cond_4d

    sget-object v5, Lpn7;->b:Lon7;

    iget-wide v5, v1, Lwvg;->c:J

    iget-object v1, v0, La9d;->m:Lulp;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v5, v7

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v5, v6, v1}, Lcs5;->y0(JLun7;)J

    move-result-wide v5

    sget-object v1, Lpn7;->b:Lon7;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v6, v2, v3}, Lpn7;->c(JJ)I

    move-result v1

    if-lez v1, :cond_4d

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v5, v6, v1}, Lpn7;->p(JLun7;)J

    move-result-wide v1

    long-to-double v1, v1

    const-wide/high16 v3, 0x4038000000000000L    # 24.0

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    :cond_4d
    iget-object v0, v0, La9d;->o:Lnak;

    invoke-virtual {v0, v4}, Lnak;->j(Ljava/lang/Object;)V

    return-void

    :cond_53
    iget-object v1, v0, La9d;->r:Lwvg;

    iget-object v5, v1, Lwvg;->h:Ljmk;

    if-eqz v5, :cond_5f

    iget-object v6, v5, Ljmk;->c:Lhmk;

    iget-object v5, v5, Ljmk;->b:Limk;

    if-nez v5, :cond_60

    :cond_5f
    return-void

    :cond_60
    iget-wide v7, v1, Lwvg;->c:J

    cmp-long v1, v7, v2

    if-gtz v1, :cond_68

    move-object v15, v4

    goto :goto_72

    :cond_68
    new-instance v1, Ljava/util/Date;

    iget-object v2, v0, La9d;->r:Lwvg;

    iget-wide v2, v2, Lwvg;->c:J

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    move-object v15, v1

    :goto_72
    iget-object v1, v0, La9d;->r:Lwvg;

    iget v2, v1, Lwvg;->e:I

    const/4 v3, 0x5

    const/4 v7, 0x4

    if-eq v2, v7, :cond_91

    if-eq v2, v3, :cond_7e

    move-object v14, v15

    goto :goto_92

    :cond_7e
    iget-wide v1, v1, Lwvg;->d:J

    const-wide/16 v8, -0x1

    cmp-long v1, v1, v8

    if-eqz v1, :cond_91

    new-instance v1, Ljava/util/Date;

    iget-object v2, v0, La9d;->r:Lwvg;

    iget-wide v8, v2, Lwvg;->d:J

    invoke-direct {v1, v8, v9}, Ljava/util/Date;-><init>(J)V

    move-object v14, v1

    goto :goto_92

    :cond_91
    move-object v14, v4

    :goto_92
    new-instance v1, Lu8d;

    iget-object v2, v0, La9d;->r:Lwvg;

    iget v2, v2, Lwvg;->e:I

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eq v2, v7, :cond_a7

    if-eq v2, v3, :cond_a5

    const/4 v3, 0x6

    if-eq v2, v3, :cond_a3

    const/4 v2, 0x2

    goto :goto_a8

    :cond_a3
    const/4 v2, 0x3

    goto :goto_a8

    :cond_a5
    move v2, v9

    goto :goto_a8

    :cond_a7
    move v2, v8

    :goto_a8
    iget-object v3, v0, La9d;->e:Ljtg;

    if-eqz v6, :cond_b6

    iget-object v7, v0, La9d;->s:Luah;

    if-nez v7, :cond_b8

    invoke-virtual {v3}, Ljtg;->a()Z

    move-result v7

    if-eqz v7, :cond_b8

    :cond_b6
    move v7, v9

    goto :goto_ba

    :cond_b8
    move v7, v9

    move v9, v8

    :goto_ba
    iget-wide v10, v5, Limk;->b:D

    iget-object v12, v0, La9d;->r:Lwvg;

    iget-object v12, v12, Lwvg;->i:Lo9g;

    if-nez v12, :cond_c4

    sget-object v12, Lo9g;->e:Lo9g;

    :cond_c4
    iget-object v13, v5, Limk;->a:Ljava/lang/String;

    if-eqz v6, :cond_cb

    move/from16 v16, v7

    goto :goto_cd

    :cond_cb
    move/from16 v16, v8

    :goto_cd
    iget-boolean v5, v0, La9d;->t:Z

    invoke-virtual {v3}, Ljtg;->a()Z

    move-result v18

    move-object v7, v1

    move v8, v2

    move/from16 v17, v5

    invoke-direct/range {v7 .. v18}, Lu8d;-><init>(IZDLo9g;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;ZZZ)V

    iget-object v0, v0, La9d;->n:Lnak;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v4, v7}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public final j(Ljg4;)V
    .registers 4

    iget-object p0, p0, La9d;->c:Lxb;

    iget-object p0, p0, Lxb;->e:Ljze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldpf;

    new-instance v0, Ly8d;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ly8d;-><init>(Ljg4;B)V

    invoke-virtual {p0, v0}, Ldpf;->a(Lhpf;)V

    return-void
.end method

.method public final u()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, La9d;->s:Luah;

    if-eqz p0, :cond_7

    iget-object p0, p0, Luah;->a:Ljava/lang/String;

    return-object p0

    :cond_7
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
