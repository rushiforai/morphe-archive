.class public final Lvsn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lize;

.field public final b:Z

.field public final c:Ls62;

.field public final d:Lkotlin/jvm/functions/Function2;

.field public final e:Lkotlin/jvm/functions/Function2;

.field public final f:Lesk;

.field public final g:Lkze;

.field public final h:Ljava/lang/Runnable;

.field public final i:Lurn;

.field public final j:Lesk;

.field public final k:Lg7m;

.field public final l:Lkze;

.field public final m:Z

.field public final n:Lkze;

.field public final o:Lnak;

.field public final p:Lrlh;

.field public final q:Lwnm;

.field public final r:Ly1n;

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z


# direct methods
.method public constructor <init>(Lize;ZLs62;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lesk;Lkze;Ljava/lang/Runnable;Lurn;Lesk;)V
    .registers 28

    move-object/from16 v2, p0

    move/from16 v0, p2

    move-object/from16 v8, p3

    move-object/from16 v1, p7

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    move-object/from16 v3, p1

    iput-object v3, v2, Lvsn;->a:Lize;

    iput-boolean v0, v2, Lvsn;->b:Z

    iput-object v8, v2, Lvsn;->c:Ls62;

    move-object/from16 v4, p4

    iput-object v4, v2, Lvsn;->d:Lkotlin/jvm/functions/Function2;

    move-object/from16 v4, p5

    iput-object v4, v2, Lvsn;->e:Lkotlin/jvm/functions/Function2;

    move-object/from16 v4, p6

    iput-object v4, v2, Lvsn;->f:Lesk;

    iput-object v1, v2, Lvsn;->g:Lkze;

    move-object/from16 v4, p8

    iput-object v4, v2, Lvsn;->h:Ljava/lang/Runnable;

    move-object/from16 v4, p9

    iput-object v4, v2, Lvsn;->i:Lurn;

    move-object/from16 v4, p10

    iput-object v4, v2, Lvsn;->j:Lesk;

    iget-object v4, v8, Ls62;->c:Lg7m;

    iput-object v4, v2, Lvsn;->k:Lg7m;

    new-instance v9, Lkze;

    sget-object v4, Log;->a:Log;

    invoke-direct {v9, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v9, v2, Lvsn;->l:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iput-boolean v3, v2, Lvsn;->m:Z

    new-instance v3, Lkze;

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v3, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v3, v2, Lvsn;->n:Lkze;

    const/4 v3, 0x0

    invoke-static {v3}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v3

    iput-object v3, v2, Lvsn;->o:Lnak;

    invoke-static {v3}, La26;->j(Lnak;)Lrlh;

    move-result-object v3

    iput-object v3, v2, Lvsn;->p:Lrlh;

    sget-object v11, Lrsn;->f:Lrsn;

    sget-object v13, Lnsn;->e:Lnsn;

    new-instance v12, Lisn;

    const/4 v3, 0x1

    invoke-direct {v12, v0, v3}, Lisn;-><init>(ZZ)V

    new-instance v10, Ltsn;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v10 .. v16}, Ltsn;-><init>(Lzm9;Llsn;Lnsn;ZZZ)V

    iget-object v11, v8, Ls62;->s:Lode;

    iget-object v0, v8, Ls62;->r:Lc12;

    iget-object v0, v0, Lc12;->i:Lwnm;

    invoke-static {v0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v0

    iget-object v4, v8, Ls62;->t:Lkze;

    invoke-virtual {v8}, Ls62;->f()Lqyj;

    move-result-object v5

    iget-object v5, v5, Lqyj;->k:Lkze;

    iget-object v6, v8, Ls62;->u:Lkze;

    invoke-virtual {v8}, Ls62;->e()Liy1;

    move-result-object v7

    iget-object v7, v7, Liy1;->m:Lqde;

    iget-object v12, v8, Ls62;->p:Lq52;

    iget-object v12, v12, Lq52;->c:Lkze;

    const/16 v13, 0x8

    new-array v13, v13, [Lekc;

    aput-object v11, v13, v14

    aput-object v0, v13, v3

    const/4 v15, 0x2

    aput-object v1, v13, v15

    const/4 v0, 0x3

    aput-object v4, v13, v0

    const/4 v0, 0x4

    aput-object v5, v13, v0

    const/4 v0, 0x5

    aput-object v6, v13, v0

    const/4 v0, 0x6

    aput-object v7, v13, v0

    const/4 v0, 0x7

    aput-object v12, v13, v0

    invoke-static {v13}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Ljava/lang/Iterable;

    new-instance v0, Lcfn;

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v1, 0x0

    move v4, v3

    const-class v3, Lvsn;

    move v5, v4

    const-string v4, "calculateNewState"

    move v13, v5

    const-string v5, "calculateNewState()Lcom/opera/android/webaiassistant/WebAiAssistantViewModel$ViewState;"

    invoke-direct/range {v0 .. v7}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lwnm;

    new-instance v3, Lfza;

    const/16 v4, 0x11

    invoke-direct {v3, v4}, Lfza;-><init>(B)V

    invoke-direct {v1, v10, v12, v3, v0}, Lwnm;-><init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v8}, Ls62;->f()Lqyj;

    move-result-object v0

    iget-object v0, v0, Lqyj;->i:Lode;

    new-instance v3, Lvrn;

    invoke-direct {v3, v2, v14}, Lvrn;-><init>(Lvsn;B)V

    new-instance v4, Ljqn;

    invoke-direct {v4, v3, v13}, Ljqn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v0, v4}, Lwnm;->s(Lekc;Lf7f;)V

    invoke-virtual {v8}, Ls62;->f()Lqyj;

    move-result-object v0

    iget-object v0, v0, Lqyj;->j:Lode;

    new-instance v3, Lvrn;

    invoke-direct {v3, v2, v13}, Lvrn;-><init>(Lvsn;B)V

    new-instance v4, Ljqn;

    invoke-direct {v4, v3, v13}, Ljqn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v0, v4}, Lwnm;->s(Lekc;Lf7f;)V

    iput-object v1, v2, Lvsn;->q:Lwnm;

    new-instance v0, Ly1n;

    const/16 v1, 0x1c

    invoke-direct {v0, v2, v1}, Ly1n;-><init>(Ljava/lang/Object;B)V

    iput-object v0, v2, Lvsn;->r:Ly1n;

    new-instance v0, Lvrn;

    invoke-direct {v0, v2, v15}, Lvrn;-><init>(Lvsn;B)V

    new-instance v1, Ljqn;

    invoke-direct {v1, v0, v13}, Ljqn;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v9, v1}, Lekc;->k(Lf7f;)V

    new-instance v0, Lwrn;

    invoke-direct {v0, v2, v14}, Lwrn;-><init>(Lvsn;B)V

    invoke-static {v11, v9, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public static j(Lvsn;Z)V
    .registers 9

    invoke-virtual {p0}, Lvsn;->c()Lju4;

    move-result-object v0

    if-eqz v0, :cond_61

    iget-wide v0, v0, Lju4;->a:J

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->c()Lp62;

    move-result-object p0

    iget-object p0, p0, Lp62;->a:Lole;

    sget-object v2, Ll08;->a:Ll08;

    new-instance v3, Lqu4;

    invoke-direct {v3, v2, v2, p1}, Lqu4;-><init>(Ljava/util/List;Ljava/util/List;Z)V

    new-instance p1, Lt40;

    const/16 v2, 0x11

    invoke-direct {p1, v2}, Lt40;-><init>(B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    invoke-virtual {v2, v4}, Lvpb;->a(Ljava/lang/Object;)V

    const-string v5, "id"

    invoke-virtual {v4, v0, v1, v5}, Lorb;->o(JLjava/lang/String;)V

    invoke-virtual {v3}, Lqu4;->a()Lorb;

    move-result-object v0

    const-string v1, "modifiers"

    invoke-virtual {v4, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lqq8;

    invoke-virtual {p0}, Lqq8;->h()Ljava/lang/String;

    move-result-object v0

    const-string v1, "2.0"

    const-string v3, "method"

    const-string v4, "jsonrpc"

    const-string v6, "actions.v1.updateChatModifiers"

    invoke-static {v4, v1, v3, v6}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v1

    const-string v3, "params"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v0, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lc42;

    const/4 v2, 0x1

    invoke-direct {v0, p1, v2}, Lc42;-><init>(Lt40;B)V

    invoke-virtual {p0, v1, v0}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    :cond_61
    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;)V
    .registers 6

    invoke-virtual {p0}, Lvsn;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_c

    return-void

    :cond_c
    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object p0

    sget-object v0, Lux1;->c:Lux1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Liy1;->c(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    new-instance v3, Lw12;

    invoke-direct {v3, p1, v2}, Lw12;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    invoke-virtual {p0, v1, v3, v0}, Liy1;->e(Ljava/lang/String;Lo0g;Lux1;)V

    return-void
.end method

.method public final b()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object p0

    iget-object p0, p0, Liy1;->m:Lqde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final c()Lju4;
    .registers 3

    iget-object p0, p0, Lvsn;->c:Ls62;

    iget-object p0, p0, Ls62;->s:Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu42;

    if-eqz p0, :cond_16

    iget-object p0, p0, Lu42;->c:Lpu4;

    iget-wide v0, p0, Lpu4;->a:J

    new-instance p0, Lju4;

    invoke-direct {p0, v0, v1}, Lju4;-><init>(J)V

    return-object p0

    :cond_16
    const/4 p0, 0x0

    return-object p0
.end method

.method public final d(Z)V
    .registers 2

    iput-boolean p1, p0, Lvsn;->s:Z

    iget-object p0, p0, Lvsn;->q:Lwnm;

    invoke-virtual {p0}, Lwnm;->u()V

    return-void
.end method

.method public final e(Lnv0;Ljoh;Lfw0;)V
    .registers 11

    iget-object v0, p0, Lvsn;->c:Ls62;

    iget-object v1, v0, Ls62;->l:Lwth;

    iget-object v1, v1, Lwth;->b:Ljava/lang/Object;

    check-cast v1, Ld12;

    invoke-interface {v1}, Ld12;->h()V

    iget-object v1, p0, Lvsn;->k:Lg7m;

    iput-object p1, v1, Lg7m;->h:Ljava/lang/Object;

    sget-object v2, Lnv0;->c:Lnv0;

    const/4 v3, 0x0

    if-ne p1, v2, :cond_1f

    new-instance v2, Ls6h;

    sget-object v4, Lorn;->c:Lorn;

    sget-object v5, Ll08;->a:Ll08;

    invoke-direct {v2, v4, v5, v3}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v2, v1, Lg7m;->j:Ljava/lang/Object;

    :cond_1f
    iget-boolean v2, p0, Lvsn;->v:Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v2, :cond_8e

    iput-boolean v5, p0, Lvsn;->v:Z

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    packed-switch p1, :pswitch_data_15e

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_32
    sget-object p1, Lt70;->m:Lt70;

    goto :goto_63

    :pswitch_35
    sget-object p1, Lt70;->q:Lt70;

    goto :goto_63

    :pswitch_38
    sget-object p1, Lt70;->p:Lt70;

    goto :goto_63

    :pswitch_3b
    sget-object p1, Lt70;->o:Lt70;

    goto :goto_63

    :pswitch_3e
    sget-object p1, Lt70;->n:Lt70;

    goto :goto_63

    :pswitch_41
    sget-object p1, Lt70;->l:Lt70;

    goto :goto_63

    :pswitch_44
    sget-object p1, Lt70;->k:Lt70;

    goto :goto_63

    :pswitch_47
    sget-object p1, Lt70;->j:Lt70;

    goto :goto_63

    :pswitch_4a
    sget-object p1, Lt70;->i:Lt70;

    goto :goto_63

    :pswitch_4d
    sget-object p1, Lt70;->h:Lt70;

    goto :goto_63

    :pswitch_50
    sget-object p1, Lt70;->g:Lt70;

    goto :goto_63

    :pswitch_53
    sget-object p1, Lt70;->f:Lt70;

    goto :goto_63

    :pswitch_56
    sget-object p1, Lt70;->e:Lt70;

    goto :goto_63

    :pswitch_59
    sget-object p1, Lt70;->c:Lt70;

    goto :goto_63

    :pswitch_5c
    sget-object p1, Lt70;->d:Lt70;

    goto :goto_63

    :pswitch_5f
    move-object p1, v4

    goto :goto_63

    :pswitch_61
    sget-object p1, Lt70;->b:Lt70;

    :goto_63
    if-eqz p1, :cond_8e

    iget-object v1, v1, Lg7m;->g:Ljava/lang/Object;

    check-cast v1, Ld5o;

    iget-object v2, v1, Ld5o;->c:Ljava/lang/Object;

    check-cast v2, Lgw0;

    if-eqz v2, :cond_74

    sget-object v2, Lu70;->d:Lu70;

    invoke-virtual {v1, v2}, Ld5o;->w(Lu70;)V

    :cond_74
    iget-object v2, v1, Ld5o;->a:Ljava/lang/Object;

    check-cast v2, Lru9;

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "ai.used_chat"

    invoke-interface {v2, v6, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_8e

    new-instance v2, Lgw0;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v2, p1, p3, v3}, Lgw0;-><init>(Lt70;Lfw0;Ljava/util/ArrayList;)V

    iput-object v2, v1, Ld5o;->c:Ljava/lang/Object;

    :cond_8e
    sget-object p1, Lz52;->x:Lz52;

    sget-object p3, Lzrn;->a:Lzrn;

    invoke-virtual {p2, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_d4

    sget-object p0, Lasn;->a:Lasn;

    invoke-virtual {p2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_156

    sget-object p0, Lbsn;->a:Lbsn;

    invoke-virtual {p2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_156

    instance-of p0, p2, Lyrn;

    if-eqz p0, :cond_b7

    new-instance v4, Ly52;

    check-cast p2, Lyrn;

    iget-object p0, p2, Lyrn;->a:Ljava/lang/String;

    invoke-direct {v4, p0}, Ly52;-><init>(Ljava/lang/String;)V

    goto/16 :goto_157

    :cond_b7
    instance-of p0, p2, Ldsn;

    if-eqz p0, :cond_c8

    new-instance v4, Lb62;

    check-cast p2, Ldsn;

    iget-object p0, p2, Ldsn;->a:Ljava/lang/String;

    iget-object p1, p2, Ldsn;->b:Ljava/lang/String;

    invoke-direct {v4, p0, p1}, Lb62;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_157

    :cond_c8
    sget-object p0, Lcsn;->a:Lcsn;

    invoke-virtual {p2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_157

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_d4
    iget-object p2, v0, Ls62;->t:Lkze;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_157

    iget-object p2, p0, Lvsn;->i:Lurn;

    iget-boolean p3, p2, Lurn;->e:Z

    iget-boolean p0, p0, Lvsn;->m:Z

    iput-boolean p0, p2, Lurn;->e:Z

    if-eqz p0, :cond_ef

    sget-object p0, Ltrn;->b:Ltrn;

    goto :goto_147

    :cond_ef
    iget-object p0, p2, Lurn;->a:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->v:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_108

    sget-object p0, Ltrn;->a:Ltrn;

    goto :goto_147

    :cond_108
    iget-object p0, p2, Lurn;->b:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq52;

    iget-object p0, p0, Lq52;->c:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo52;

    instance-of p0, p0, Lm52;

    if-eqz p0, :cond_11f

    sget-object p0, Ltrn;->a:Ltrn;

    goto :goto_147

    :cond_11f
    if-eqz p3, :cond_124

    sget-object p0, Ltrn;->a:Ltrn;

    goto :goto_147

    :cond_124
    iget-object p0, p2, Lurn;->d:Lspl;

    if-eqz p0, :cond_145

    iget-object p2, p2, Lurn;->c:Ltpl;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lf9e;->a:Lf9e;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lf9e;->b()J

    move-result-wide p2

    invoke-static {p2, p3, p0}, Lspl;->c(JLsc5;)J

    move-result-wide p2

    sget-wide v1, Lurn;->f:J

    invoke-static {p2, p3, v1, v2}, Lpn7;->c(JJ)I

    move-result p0

    if-gtz p0, :cond_145

    sget-object p0, Ltrn;->b:Ltrn;

    goto :goto_147

    :cond_145
    sget-object p0, Ltrn;->a:Ltrn;

    :goto_147
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_156

    if-ne p0, v5, :cond_152

    sget-object v4, Lc62;->x:Lc62;

    goto :goto_157

    :cond_152
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_156
    move-object v4, p1

    :cond_157
    :goto_157
    if-eqz v4, :cond_15c

    invoke-virtual {v0, v4}, Ls62;->k(Lz5i;)V

    :cond_15c
    return-void

    nop

    :pswitch_data_15e
    .packed-switch 0x0
        :pswitch_61
        :pswitch_5f
        :pswitch_5c
        :pswitch_59
        :pswitch_5f
        :pswitch_5f
        :pswitch_56
        :pswitch_53
        :pswitch_50
        :pswitch_4d
        :pswitch_4a
        :pswitch_47
        :pswitch_44
        :pswitch_5f
        :pswitch_41
        :pswitch_3e
        :pswitch_3b
        :pswitch_38
        :pswitch_35
        :pswitch_32
    .end packed-switch
.end method

.method public final f(Ljava/lang/String;)Lqx1;
    .registers 5

    invoke-virtual {p0}, Lvsn;->b()Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_23

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljx1;

    invoke-interface {v2}, Ljx1;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    goto :goto_24

    :cond_23
    move-object v0, v1

    :goto_24
    check-cast v0, Ljx1;

    if-eqz v0, :cond_34

    instance-of p0, v0, Lvx1;

    if-eqz p0, :cond_34

    check-cast v0, Lvx1;

    iget-object p0, v0, Lvx1;->b:Lwxe;

    instance-of p1, p0, Lqx1;

    if-nez p1, :cond_35

    :cond_34
    return-object v1

    :cond_35
    check-cast p0, Lqx1;

    return-object p0
.end method

.method public final g()V
    .registers 3

    iget-object v0, p0, Lvsn;->n:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lvsn;->l()V

    return-void

    :cond_12
    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->f()Lqyj;

    move-result-object p0

    iget-object v0, p0, Lqyj;->j:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbzj;

    if-eqz v0, :cond_2d

    invoke-virtual {v0}, Lbzj;->a()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2d

    invoke-virtual {p0}, Lqyj;->m()V

    return-void

    :cond_2d
    iget-object v0, p0, Lqyj;->i:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhbn;

    if-eqz v0, :cond_5b

    instance-of v1, v0, Lebn;

    if-nez v1, :cond_5b

    instance-of v1, v0, Lfbn;

    if-nez v1, :cond_5b

    instance-of v1, v0, Lcbn;

    if-nez v1, :cond_5b

    instance-of v1, v0, Lgbn;

    if-nez v1, :cond_57

    instance-of v1, v0, Lbbn;

    if-nez v1, :cond_57

    sget-object v1, Ldbn;->a:Ldbn;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_57

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_57
    invoke-virtual {p0}, Lqyj;->f()V

    return-void

    :cond_5b
    invoke-virtual {p0}, Lqyj;->f()V

    invoke-virtual {p0}, Lqyj;->b()V

    return-void
.end method

.method public final h(Lux1;ZLcom/opera/api/Callback;)V
    .registers 6

    invoke-virtual {p0}, Lvsn;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_c

    return-void

    :cond_c
    if-eqz p2, :cond_15

    iget-object p2, p0, Lvsn;->k:Lg7m;

    sget-object v0, Ll60;->g:Ll60;

    invoke-virtual {p2, v0}, Lg7m;->c(Ll60;)V

    :cond_15
    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object p0

    new-instance p2, Lj12;

    const/16 v0, 0xe

    invoke-direct {p2, p3, v0}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p0, p1, p2}, Liy1;->f(Lux1;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final i(Lux1;)V
    .registers 8

    invoke-virtual {p0}, Lvsn;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_c

    return-void

    :cond_c
    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Liy1;->c(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    iget-object p0, v1, Liy1;->d:Lq32;

    new-instance v0, Lxx1;

    const/4 v5, 0x0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lq32;->a:Landroid/content/Context;

    new-instance p1, Lj12;

    const/4 v1, 0x1

    invoke-direct {p1, v0, v1}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-static {p0, p1}, Lb8h;->m(Landroid/content/Context;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final k(Lb80;)V
    .registers 5

    iget-object v0, p0, Lvsn;->j:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhxk;

    new-instance v1, Lgil;

    const/16 v2, 0x15

    invoke-direct {v1, p0, p1, v2}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    check-cast v0, Lkxk;

    iget-object p1, v0, Lkxk;->f:Landroidx/fragment/app/w;

    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-static {p1, v0, v2}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    new-instance v0, Lcrk;

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcrk;-><init>(Ljava/lang/Object;B)V

    const-string v1, "SyncAuthPortalFragment_request"

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p1, v1, p0, v0}, Landroidx/fragment/app/w;->i0(Ljava/lang/String;Lndc;Lmm9;)V

    return-void
.end method

.method public final l()V
    .registers 9

    invoke-virtual {p0}, Lvsn;->c()Lju4;

    move-result-object v0

    if-eqz v0, :cond_52

    iget-wide v0, v0, Lju4;->a:J

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->c()Lp62;

    move-result-object p0

    iget-object v2, p0, Lp62;->a:Lole;

    new-instance v3, Lbi;

    const/16 v4, 0x18

    invoke-direct {v3, p0, v4}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lvpb;

    invoke-direct {p0}, Lvpb;-><init>()V

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    invoke-virtual {p0, v4}, Lvpb;->a(Ljava/lang/Object;)V

    const-string v5, "id"

    invoke-virtual {v4, v0, v1, v5}, Lorb;->o(JLjava/lang/String;)V

    iget-object v0, v2, Lole;->a:Ljava/lang/Object;

    check-cast v0, Lqq8;

    invoke-virtual {v0}, Lqq8;->h()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2.0"

    const-string v4, "method"

    const-string v6, "jsonrpc"

    const-string v7, "actions.v1.stopChat"

    invoke-static {v6, v2, v4, v7}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v2

    const-string v4, "params"

    invoke-virtual {v2, p0, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v1, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, Lt02;

    const/16 v1, 0x8

    invoke-direct {p0, v3, v1}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, p0}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    :cond_52
    return-void
.end method

.method public final m(Ljava/lang/String;Z)V
    .registers 8

    invoke-virtual {p0}, Lvsn;->c()Lju4;

    move-result-object v0

    if-eqz v0, :cond_36

    iget-wide v0, v0, Lju4;->a:J

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object v2

    sget-object v3, Lez1;->c:Lez1;

    iget-object v4, v2, Liy1;->j:La52;

    iget-object v2, v2, Liy1;->m:Lqde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {v4, v2, v3, p2}, La52;->c(Ljava/util/List;Lez1;Z)V

    invoke-virtual {p0}, Ls62;->c()Lp62;

    move-result-object p2

    sget-object v2, Lw52;->a:[Lw52;

    iget-object v2, p2, Lp62;->e:La52;

    invoke-virtual {v2}, La52;->b()Lz42;

    move-result-object v3

    invoke-virtual {p2, v0, v1, p1, v3}, Lp62;->c(JLjava/lang/String;Lz42;)V

    invoke-virtual {v2, v3}, La52;->a(Lz42;)V

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object p0

    invoke-virtual {p0}, Liy1;->b()V

    :cond_36
    return-void
.end method
