.class public final synthetic Ltji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Leoj;Lv4b;)V
    .registers 3

    const/16 p2, 0x14

    iput-byte p2, p0, Ltji;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltji;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Ltji;->a:B

    iput-object p1, p0, Ltji;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Ltji;->a:B

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v0, v0, Ltji;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_4f0

    check-cast v0, Lc5k;

    check-cast v1, Landroid/view/View;

    iget-object v0, v0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v1, 0x7f15039a

    invoke-static {v1, v0}, Lu8n;->d(ILandroid/view/View;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1d
    check-cast v0, Luyj;

    check-cast v1, Lbzj;

    invoke-virtual {v1}, Lbzj;->a()Z

    move-result v1

    if-nez v1, :cond_53

    iget-object v1, v0, Luyj;->h:Lpyl;

    iget-object v2, v0, Luyj;->d:Landroid/speech/tts/TextToSpeech;

    iput-object v5, v1, Lpyl;->c:Ljava/lang/Object;

    iput-object v5, v1, Lpyl;->d:Ljava/lang/Object;

    iput v3, v1, Lpyl;->b:I

    iget-object v1, v1, Lpyl;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v2}, Landroid/speech/tts/TextToSpeech;->shutdown()V

    invoke-virtual {v2, v5}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I

    iget-object v1, v0, Luyj;->i:Lsyj;

    if-eqz v1, :cond_51

    iget-object v2, v1, Lsyj;->f:Lsyj;

    monitor-enter v2

    :try_start_45
    iget-object v3, v1, Lsyj;->j:Lssi;

    invoke-static {v3}, Lvml;->a(Ljava/lang/Runnable;)V

    iput-object v5, v1, Lsyj;->g:Ljava/lang/Long;
    :try_end_4c
    .catchall {:try_start_45 .. :try_end_4c} :catchall_4e

    monitor-exit v2

    goto :goto_51

    :catchall_4e
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_51
    :goto_51
    iput-object v5, v0, Luyj;->i:Lsyj;

    :cond_53
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_56
    check-cast v0, Ld22;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v1, v1

    iget-boolean v3, v0, Ld22;->e:Z

    if-nez v3, :cond_85

    iget-boolean v3, v0, Ld22;->d:Z

    if-nez v3, :cond_85

    iget-object v3, v0, Ld22;->c:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc22;

    iget-boolean v5, v3, Lc22;->b:Z

    if-eqz v5, :cond_85

    iget-object v3, v3, Lc22;->a:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    int-to-long v5, v3

    cmp-long v1, v1, v5

    if-ltz v1, :cond_85

    iget-object v1, v0, Ld22;->b:Lq3;

    invoke-virtual {v1, v0}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iput-boolean v4, v0, Ld22;->e:Z

    :cond_85
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_88
    check-cast v0, Ltuj;

    iget-object v2, v0, Ltuj;->i:Ljava/lang/Object;

    monitor-enter v2

    :try_start_8d
    iget-object v0, v0, Ltuj;->k:Ljava/lang/Object;

    check-cast v0, Lsuj;

    iget-object v3, v0, Lsuj;->b:Ljava/lang/Object;

    iget v4, v0, Lsuj;->d:I

    iget-object v5, v0, Lsuj;->c:Lzde;

    if-nez v5, :cond_a5

    new-instance v5, Lzde;

    invoke-direct {v5}, Lzde;-><init>()V

    iput-object v5, v0, Lsuj;->c:Lzde;

    iget-object v6, v0, Lsuj;->f:Lsee;

    invoke-virtual {v6, v3, v5}, Lsee;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_a5
    invoke-virtual {v0, v1, v4, v3, v5}, Lsuj;->b(Ljava/lang/Object;ILjava/lang/Object;Lzde;)V
    :try_end_a8
    .catchall {:try_start_8d .. :try_end_a8} :catchall_ac

    monitor-exit v2

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_ac
    move-exception v0

    monitor-exit v2

    throw v0

    :pswitch_af
    check-cast v0, Lgtj;

    check-cast v1, Landroid/view/View;

    iget-object v1, v0, Lgtj;->a:Lasj;

    iget-object v1, v1, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    new-instance v2, Letj;

    invoke-direct {v2, v0, v3}, Letj;-><init>(Lgtj;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_c2
    check-cast v0, Lnsj;

    check-cast v1, Ldo8;

    iget-object v1, v1, Ldo8;->a:Lnsj;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_d1
    check-cast v0, Lxoj;

    check-cast v1, Ln6j;

    iget-object v0, v0, Lxoj;->i:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_dd
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_ef

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lex4;

    iget-char v2, v2, Lv6j;->a:C

    invoke-virtual {v1, v2}, Ln6j;->a(I)V

    goto :goto_dd

    :cond_ef
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_f2
    check-cast v0, Lf9;

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_fd

    move-object v5, v1

    :cond_fd
    check-cast v5, Ljava/lang/Long;

    if-eqz v5, :cond_106

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    goto :goto_108

    :cond_106
    const-wide/16 v1, 0x0

    :goto_108
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lf9;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_112
    check-cast v0, Lvvf;

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_11d

    move-object v5, v1

    :cond_11d
    invoke-virtual {v0, v5}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_123
    check-cast v0, Leoj;

    check-cast v1, Lndc;

    new-instance v1, Lioj;

    invoke-direct {v1, v3}, Lioj;-><init>(B)V

    iput-object v1, v0, Leoj;->d:Lhoj;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_131
    check-cast v0, Lemj;

    iget-object v2, v0, Lemj;->g:Lor4;

    invoke-static {v2, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_140

    const-string v2, "Requested a SingleSubscriptionSnapshotFlowManager to manage multiple subscriptions"

    invoke-static {v2}, Lbpg;->b(Ljava/lang/String;)V

    :cond_140
    iget-object v2, v0, Lemj;->f:Ltee;

    iget-object v3, v0, Lemj;->d:Ljava/lang/Object;

    if-nez v2, :cond_15d

    if-nez v3, :cond_14b

    iput-object v1, v0, Lemj;->d:Ljava/lang/Object;

    goto :goto_167

    :cond_14b
    sget-object v2, Ljmi;->a:Ltee;

    new-instance v2, Ltee;

    invoke-direct {v2}, Ltee;-><init>()V

    invoke-virtual {v2, v3}, Ltee;->a(Ljava/lang/Object;)Z

    invoke-virtual {v2, v1}, Ltee;->a(Ljava/lang/Object;)Z

    iput-object v2, v0, Lemj;->f:Ltee;

    iput-object v5, v0, Lemj;->d:Ljava/lang/Object;

    goto :goto_167

    :cond_15d
    if-eqz v3, :cond_164

    const-string v0, "workingSoleWatchedObject must be null when workingWatchSet is non-null"

    invoke-static {v0}, Lbpg;->b(Ljava/lang/String;)V

    :cond_164
    invoke-virtual {v2, v1}, Ltee;->a(Ljava/lang/Object;)Z

    :goto_167
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_16a
    check-cast v0, Lplj;

    check-cast v1, Ljava/lang/String;

    iput-object v5, v0, Lplj;->t:Lolj;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_173
    check-cast v0, Lwkj;

    check-cast v1, Lm1i;

    iget v2, v0, Lwkj;->o:F

    invoke-virtual {v1, v2}, Lm1i;->g(F)V

    iget v2, v0, Lwkj;->p:F

    invoke-virtual {v1, v2}, Lm1i;->h(F)V

    iget v2, v0, Lwkj;->q:F

    invoke-virtual {v1, v2}, Lm1i;->c(F)V

    iget v2, v0, Lwkj;->r:F

    iget v3, v1, Lm1i;->e:F

    cmpg-float v3, v3, v2

    if-eqz v3, :cond_196

    iget v3, v1, Lm1i;->a:I

    or-int/lit8 v3, v3, 0x8

    iput v3, v1, Lm1i;->a:I

    iput v2, v1, Lm1i;->e:F

    :cond_196
    iget v2, v0, Lwkj;->s:F

    invoke-virtual {v1, v2}, Lm1i;->t(F)V

    iget v2, v0, Lwkj;->t:F

    invoke-virtual {v1, v2}, Lm1i;->l(F)V

    iget v2, v0, Lwkj;->u:F

    iget v3, v1, Lm1i;->j:F

    cmpg-float v3, v3, v2

    if-eqz v3, :cond_1b0

    iget v3, v1, Lm1i;->a:I

    or-int/lit16 v3, v3, 0x100

    iput v3, v1, Lm1i;->a:I

    iput v2, v1, Lm1i;->j:F

    :cond_1b0
    iget v2, v0, Lwkj;->v:F

    iget v3, v1, Lm1i;->k:F

    cmpg-float v3, v3, v2

    if-eqz v3, :cond_1c0

    iget v3, v1, Lm1i;->a:I

    or-int/lit16 v3, v3, 0x200

    iput v3, v1, Lm1i;->a:I

    iput v2, v1, Lm1i;->k:F

    :cond_1c0
    iget v2, v0, Lwkj;->w:F

    iget v3, v1, Lm1i;->l:F

    cmpg-float v3, v3, v2

    if-eqz v3, :cond_1d0

    iget v3, v1, Lm1i;->a:I

    or-int/lit16 v3, v3, 0x400

    iput v3, v1, Lm1i;->a:I

    iput v2, v1, Lm1i;->l:F

    :cond_1d0
    iget v2, v0, Lwkj;->x:F

    iget v3, v1, Lm1i;->m:F

    cmpg-float v3, v3, v2

    if-eqz v3, :cond_1e0

    iget v3, v1, Lm1i;->a:I

    or-int/lit16 v3, v3, 0x800

    iput v3, v1, Lm1i;->a:I

    iput v2, v1, Lm1i;->m:F

    :cond_1e0
    iget-wide v2, v0, Lwkj;->y:J

    invoke-virtual {v1, v2, v3}, Lm1i;->r(J)V

    iget-object v2, v0, Lwkj;->z:Lpaj;

    invoke-virtual {v1, v2}, Lm1i;->n(Lpaj;)V

    iget-boolean v2, v0, Lwkj;->A:Z

    invoke-virtual {v1, v2}, Lm1i;->f(Z)V

    iget-wide v2, v0, Lwkj;->B:J

    invoke-virtual {v1, v2, v3}, Lm1i;->d(J)V

    iget-wide v2, v0, Lwkj;->C:J

    invoke-virtual {v1, v2, v3}, Lm1i;->p(J)V

    iget v2, v0, Lwkj;->D:I

    iget v3, v1, Lm1i;->q:I

    if-eq v3, v2, :cond_209

    iget v3, v1, Lm1i;->a:I

    const v4, 0x8000

    or-int/2addr v3, v4

    iput v3, v1, Lm1i;->a:I

    iput v2, v1, Lm1i;->q:I

    :cond_209
    iget v2, v0, Lwkj;->E:I

    iget v3, v1, Lm1i;->w:I

    if-eq v3, v2, :cond_218

    iget v3, v1, Lm1i;->a:I

    const/high16 v4, 0x80000

    or-int/2addr v3, v4

    iput v3, v1, Lm1i;->a:I

    iput v2, v1, Lm1i;->w:I

    :cond_218
    iget-object v2, v0, Lwkj;->F:Lkh3;

    iget-object v3, v1, Lm1i;->v:Lkh3;

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22b

    iget v3, v1, Lm1i;->a:I

    const/high16 v4, 0x40000

    or-int/2addr v3, v4

    iput v3, v1, Lm1i;->a:I

    iput-object v2, v1, Lm1i;->v:Lkh3;

    :cond_22b
    iget-object v0, v0, Lwkj;->G:Lv1c;

    iget-object v2, v1, Lm1i;->s:Lv1c;

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23e

    iget v2, v1, Lm1i;->a:I

    const/high16 v3, 0x100000

    or-int/2addr v2, v3

    iput v2, v1, Lm1i;->a:I

    iput-object v0, v1, Lm1i;->s:Lv1c;

    :cond_23e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_241
    check-cast v0, Lecj;

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_24c

    move-object v5, v1

    :cond_24c
    invoke-virtual {v0, v5}, Lecj;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_252
    check-cast v0, Lkaj;

    check-cast v1, Lm1i;

    iget v2, v0, Lkaj;->b:F

    iget-object v3, v1, Lm1i;->t:Ln27;

    invoke-interface {v3}, Ln27;->b()F

    move-result v3

    mul-float/2addr v3, v2

    invoke-virtual {v1, v3}, Lm1i;->l(F)V

    iget-object v2, v0, Lkaj;->c:Lpaj;

    invoke-virtual {v1, v2}, Lm1i;->n(Lpaj;)V

    iget-boolean v2, v0, Lkaj;->d:Z

    invoke-virtual {v1, v2}, Lm1i;->f(Z)V

    iget-wide v2, v0, Lkaj;->e:J

    invoke-virtual {v1, v2, v3}, Lm1i;->d(J)V

    iget-wide v2, v0, Lkaj;->f:J

    invoke-virtual {v1, v2, v3}, Lm1i;->p(J)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_279
    check-cast v0, La21;

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, La21;->e:Ljava/lang/Object;

    check-cast v2, Lshf;

    invoke-virtual {v2}, Lshf;->q()V

    const/4 v2, 0x2

    invoke-static {v0, v1, v5, v2}, La21;->s(La21;Ljava/util/List;Ljava/lang/String;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_28b
    check-cast v0, Lc9j;

    check-cast v1, Ll6j;

    sget-object v2, Lc9j;->w:[Lxtb;

    iget-object v2, v0, Lc9j;->r:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lo9j;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v3, v1, Ll6j;->a:I

    new-instance v4, Lg00;

    const/4 v5, 0x7

    invoke-direct {v4, v2, v3, v5}, Lg00;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {v2, v4}, Lo9j;->f(Ln5o;)V

    iget-object v2, v2, Lo9j;->d:Loji;

    iget-object v1, v1, Ll6j;->b:Lx6j;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v1, Lx6j;->c:Lkotlin/jvm/functions/Function2;

    iget-object v2, v2, Loji;->a:Ljava/lang/Object;

    check-cast v2, Lwub;

    iget-object v4, v1, Lx6j;->a:Ljava/lang/Class;

    invoke-virtual {v2, v4}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v2

    iget-object v1, v1, Lx6j;->b:[I

    invoke-interface {v3, v2, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lc9j;->G0()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2c5
    check-cast v0, Llb;

    invoke-virtual {v0}, Llb;->invoke()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_2cc
    check-cast v0, Ld6c;

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0}, Ld6c;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_2de
    check-cast v0, Lq5i;

    check-cast v1, Lq0j;

    iget-byte v0, v0, Lq5i;->a:B

    invoke-static {v1, v0}, Lo0j;->h(Lq0j;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2ea
    check-cast v0, Ltn;

    check-cast v1, Lrjf;

    sget-object v2, Lrjf;->d:Lrjf;

    if-ne v1, v2, :cond_301

    iget-object v2, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v2, Lc9l;

    invoke-virtual {v2}, Lc9l;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-eqz v2, :cond_301

    invoke-virtual {v2}, Landroid/view/View;->performClick()Z

    :cond_301
    sget-object v2, Lrjf;->c:Lrjf;

    if-ne v1, v2, :cond_31b

    iput-boolean v4, v0, Ltn;->a:Z

    iget-object v1, v0, Ltn;->d:Ljava/lang/Object;

    check-cast v1, Lc9l;

    iget-object v1, v1, Lc9l;->b:Lr9l;

    iget-object v1, v1, Lr9l;->p:Li03;

    new-instance v2, Lmni;

    const/4 v3, 0x5

    invoke-direct {v2, v0, v3}, Lmni;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    goto :goto_322

    :cond_31b
    iget-object v0, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Lwci;

    invoke-virtual {v0, v1}, Lwci;->o(Lrjf;)V

    :goto_322
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_325
    check-cast v0, Lxbf;

    move-object v2, v1

    check-cast v2, Lge;

    new-instance v1, Lasi;

    iget-object v3, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v3, Lk6l;

    iget-object v4, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v4, Lu4l;

    iget-object v5, v0, Lxbf;->d:Ljava/lang/Object;

    check-cast v5, Ls9i;

    iget-object v0, v0, Lxbf;->e:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lp9l;

    invoke-direct/range {v1 .. v6}, Lasi;-><init>(Lge;Lk6l;Lu4l;Ls9i;Lp9l;)V

    return-object v1

    :pswitch_341
    move-object v5, v0

    check-cast v5, Leyi;

    move-object v0, v1

    check-cast v0, Llmg;

    iget-wide v7, v0, Llmg;->c:J

    iget-object v1, v5, Leyi;->d:Ljava/lang/Object;

    check-cast v1, Ldil;

    invoke-virtual {v1}, Ldil;->i()Z

    move-result v2

    if-eqz v2, :cond_376

    invoke-virtual {v1}, Ldil;->l()Lmil;

    move-result-object v2

    iget-object v2, v2, Lmil;->a:Lsf1;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_376

    iget-object v2, v1, Ldil;->d:Lgbc;

    if-eqz v2, :cond_376

    invoke-virtual {v2}, Lgbc;->d()Lojl;

    move-result-object v2

    if-eqz v2, :cond_376

    invoke-virtual {v1}, Ldil;->l()Lmil;

    move-result-object v6

    const/4 v9, 0x0

    sget-object v10, Lujp;->o:Lhai;

    invoke-virtual/range {v5 .. v10}, Leyi;->m(Lmil;JZLhai;)J

    move v3, v4

    :cond_376
    if-eqz v3, :cond_37b

    invoke-virtual {v0}, Llmg;->a()V

    :cond_37b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_37e
    check-cast v0, Lnrl;

    check-cast v1, Lpg;

    sget-object v2, Lng;->a:Lng;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3a3

    sget-object v1, Lwbc;->g:Lwbc;

    invoke-virtual {v1}, Lwbc;->c()Z

    move-result v1

    if-nez v1, :cond_394

    move v1, v3

    goto :goto_398

    :cond_394
    invoke-static {}, LJ/N;->MFTJCvBh()Z

    move-result v1

    :goto_398
    if-eqz v1, :cond_3a2

    const-string v1, "IncognitoScreenshot"

    invoke-static {v1}, LJ/N;->M$PqApPr(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3a3

    :cond_3a2
    move v3, v4

    :cond_3a3
    iget-boolean v1, v0, Lnrl;->a:Z

    if-eq v3, v1, :cond_3b0

    iput-boolean v3, v0, Lnrl;->a:Z

    iget-object v0, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lgwi;

    invoke-virtual {v0, v3}, Lgwi;->b(Z)V

    :cond_3b0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3b3
    check-cast v0, Loy;

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0}, Loy;->l()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3bd
    check-cast v0, Lgqi;

    check-cast v1, Ljqi;

    iget-object v2, v0, Lgqi;->d:Lpqi;

    invoke-virtual {v2, v1}, Lpqi;->b(Ljqi;)Ljqi;

    move-result-object v3

    iget-object v4, v0, Lgqi;->e:Lode;

    new-instance v5, Lfqi;

    iget-object v6, v2, Lpqi;->a:Loqi;

    iget-boolean v7, v6, Loqi;->k:Z

    if-nez v7, :cond_3d4

    invoke-virtual {v6}, Lldk;->i()V

    :cond_3d4
    iget-boolean v6, v6, Loqi;->l:Z

    iget-object v0, v0, Lgqi;->b:Lpne;

    iget-object v7, v0, Lpne;->a:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lpqi;->a(Lpne;)Lpne;

    move-result-object v0

    iget-object v0, v0, Lpne;->a:Ljava/lang/String;

    invoke-static {v7, v0}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v7

    iget-object v0, v1, Ljqi;->b:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->b:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v8

    iget-object v0, v1, Ljqi;->c:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->c:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v9

    iget-object v0, v1, Ljqi;->d:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->d:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v10

    iget-object v0, v1, Ljqi;->e:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->e:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v11

    iget-object v0, v1, Ljqi;->f:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->f:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v12

    iget-object v0, v1, Ljqi;->g:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->g:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v13

    iget-object v0, v1, Ljqi;->h:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->h:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v14

    iget-object v0, v1, Ljqi;->i:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->i:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v15

    iget-object v0, v1, Ljqi;->j:Ljava/util/Set;

    iget-object v2, v3, Ljqi;->j:Ljava/util/Set;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v16

    iget v0, v1, Ljqi;->m:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v2, v3, Ljqi;->m:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v17

    iget-object v0, v1, Ljqi;->o:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->o:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v18

    iget-object v0, v1, Ljqi;->p:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->p:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v19

    iget-object v0, v1, Ljqi;->q:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->q:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v20

    iget-object v0, v1, Ljqi;->r:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->r:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v21

    iget-object v0, v1, Ljqi;->s:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->s:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v22

    iget-object v0, v1, Ljqi;->t:Ljava/lang/String;

    iget-object v2, v3, Ljqi;->t:Ljava/lang/String;

    invoke-static {v0, v2}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v23

    iget-object v0, v1, Ljqi;->u:Ljava/lang/Boolean;

    iget-object v1, v3, Ljqi;->u:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lgqi;->f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;

    move-result-object v24

    invoke-direct/range {v5 .. v24}, Lfqi;-><init>(ZLeqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;Leqi;)V

    invoke-virtual {v4, v5}, Lekc;->r(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_47d
    check-cast v0, Lspi;

    check-cast v1, Ly8f;

    iget-object v2, v0, Lspi;->k:Ltoi;

    iget-wide v3, v1, Ly8f;->a:J

    iget-byte v1, v0, Lspi;->j:B

    invoke-virtual {v0, v2, v3, v4, v1}, Lspi;->d(Ltoi;JI)J

    move-result-wide v0

    new-instance v2, Ly8f;

    invoke-direct {v2, v0, v1}, Ly8f;-><init>(J)V

    return-object v2

    :pswitch_491
    check-cast v0, Lvoi;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget-object v2, v0, Lvoi;->a:Lq0g;

    invoke-virtual {v2}, Lq0g;->h()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v1

    iget v6, v0, Lvoi;->g:F

    add-float/2addr v5, v6

    iget-object v6, v0, Lvoi;->f:Lq0g;

    invoke-virtual {v6}, Lq0g;->h()I

    move-result v6

    int-to-float v6, v6

    const/4 v7, 0x0

    invoke-static {v5, v7, v6}, Ldjh;->b(FFF)F

    move-result v6

    cmpg-float v5, v5, v6

    if-nez v5, :cond_4b5

    move v3, v4

    :cond_4b5
    invoke-virtual {v2}, Lq0g;->h()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v6, v4

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v2}, Lq0g;->h()I

    move-result v5

    add-int/2addr v5, v4

    invoke-virtual {v2, v5}, Lq0g;->i(I)V

    int-to-float v2, v4

    sub-float v2, v6, v2

    iput v2, v0, Lvoi;->g:F

    if-nez v3, :cond_4cf

    move v1, v6

    :cond_4cf
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    :pswitch_4d4
    check-cast v0, Lwj9;

    check-cast v1, Lt0a;

    iget-object v0, v0, Lwj9;->b:Lfd;

    invoke-virtual {v0}, Lfd;->c()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4e0
    check-cast v0, Luji;

    iget-object v0, v0, Luji;->c:Lvji;

    if-eqz v0, :cond_4ea

    invoke-interface {v0, v1}, Lvji;->c(Ljava/lang/Object;)Z

    move-result v4

    :cond_4ea
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_4f0
    .packed-switch 0x0
        :pswitch_4e0
        :pswitch_4d4
        :pswitch_491
        :pswitch_47d
        :pswitch_3bd
        :pswitch_3b3
        :pswitch_37e
        :pswitch_341
        :pswitch_325
        :pswitch_2ea
        :pswitch_2de
        :pswitch_2cc
        :pswitch_2c5
        :pswitch_28b
        :pswitch_279
        :pswitch_252
        :pswitch_241
        :pswitch_173
        :pswitch_16a
        :pswitch_131
        :pswitch_123
        :pswitch_112
        :pswitch_f2
        :pswitch_d1
        :pswitch_c2
        :pswitch_af
        :pswitch_88
        :pswitch_56
        :pswitch_1d
    .end packed-switch
.end method
