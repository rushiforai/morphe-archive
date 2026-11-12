.class public abstract Ls62;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndc;


# instance fields
.field public A:Lr62;

.field public B:Lr62;

.field public C:Z

.field public D:Z

.field public E:Z

.field public final a:Lt62;

.field public final b:Lcom/opera/android/browser/WebContentsWrapper;

.field public final c:Lg7m;

.field public final d:Lp12;

.field public final e:Lqb;

.field public final f:Lesk;

.field public final g:Lyv3;

.field public final h:Lzyk;

.field public final i:Lzyk;

.field public final j:Lzyk;

.field public final k:Lzyk;

.field public final l:Lwth;

.field public final m:Lz;

.field public final n:Lqdc;

.field public final o:Lqdc;

.field public final p:Lq52;

.field public final q:Lpde;

.field public final r:Lc12;

.field public final s:Lode;

.field public final t:Lkze;

.field public final u:Lkze;

.field public final v:Lu02;

.field public final w:Lr9i;

.field public final x:Lg22;

.field public final y:Leyi;

.field public final z:Lzyk;


# direct methods
.method public constructor <init>(Lt62;Lcom/opera/android/browser/WebContentsWrapper;Ld12;Lwth;Ll02;Lkotlin/jvm/functions/Function1;Lf62;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lg7m;Lp12;Lwyn;Lky1;Lyk6;La52;Lqb;Lesk;Lkotlin/jvm/functions/Function1;Lr2;Lyv3;)V
    .registers 40

    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v2, p1

    iput-object v2, v0, Ls62;->a:Lt62;

    move-object/from16 v2, p2

    iput-object v2, v0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    move-object/from16 v9, p10

    iput-object v9, v0, Ls62;->c:Lg7m;

    move-object/from16 v3, p11

    iput-object v3, v0, Ls62;->d:Lp12;

    move-object/from16 v3, p16

    iput-object v3, v0, Ls62;->e:Lqb;

    move-object/from16 v3, p17

    iput-object v3, v0, Ls62;->f:Lesk;

    move-object/from16 v3, p20

    iput-object v3, v0, Ls62;->g:Lyv3;

    new-instance v3, Lhv;

    const/4 v4, 0x3

    move-object/from16 v5, p15

    move-object/from16 v6, p18

    invoke-direct {v3, v0, v5, v6, v4}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, v0, Ls62;->h:Lzyk;

    new-instance v3, Lk62;

    invoke-direct {v3, v0, v4}, Lk62;-><init>(Ls62;B)V

    invoke-static {v3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, v0, Ls62;->i:Lzyk;

    new-instance v3, Lk62;

    const/4 v6, 0x4

    invoke-direct {v3, v0, v6}, Lk62;-><init>(Ls62;B)V

    invoke-static {v3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, v0, Ls62;->j:Lzyk;

    new-instance v3, Lx2;

    const/16 v7, 0x17

    move-object/from16 v8, p9

    invoke-direct {v3, v0, v8, v7}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, v0, Ls62;->k:Lzyk;

    move-object/from16 v3, p4

    iput-object v3, v0, Ls62;->l:Lwth;

    new-instance v7, Lz;

    new-instance v8, Lm62;

    const/4 v10, 0x1

    invoke-direct {v8, v0, v10}, Lm62;-><init>(Ls62;B)V

    invoke-direct {v7, v8}, Lz;-><init>(Ljava/lang/Object;)V

    iput-object v7, v0, Ls62;->m:Lz;

    new-instance v7, Lqdc;

    invoke-direct {v7, v0, v10}, Lqdc;-><init>(Lndc;Z)V

    iput-object v7, v0, Ls62;->n:Lqdc;

    iput-object v7, v0, Ls62;->o:Lqdc;

    move-object/from16 v8, p6

    invoke-interface {v8, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v14, v8

    check-cast v14, Lq52;

    iput-object v14, v0, Ls62;->p:Lq52;

    new-instance v8, Lpde;

    new-instance v11, Lr52;

    const-wide/16 v12, 0x0

    const/4 v15, 0x0

    invoke-direct {v11, v12, v13, v15}, Lr52;-><init>(JZ)V

    invoke-direct {v8, v11}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v8, v0, Ls62;->q:Lpde;

    iget-byte v11, v1, Lf62;->a:B

    const-string v12, "ga_usage_statistics"

    packed-switch v11, :pswitch_data_1a4

    iget-boolean v11, v1, Lf62;->b:Z

    iget-object v13, v1, Lf62;->c:Lyk6;

    iget-object v15, v1, Lf62;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, v1, Lf62;->e:Lekc;

    move/from16 v16, v11

    new-instance v11, Lc12;

    new-instance v10, Lf32;

    invoke-direct {v10, v4}, Lf32;-><init>(B)V

    invoke-static {v15, v12, v10}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v15

    const/16 v17, 0x1

    move-object/from16 v18, v1

    move/from16 v12, v16

    const/4 v4, 0x0

    move-object/from16 v16, v8

    invoke-direct/range {v11 .. v18}, Lc12;-><init>(ZLyk6;Lq52;Ltsd;Lpde;ZLekc;)V

    goto :goto_d4

    :pswitch_b6
    move-object/from16 v16, v8

    move v4, v15

    iget-boolean v8, v1, Lf62;->b:Z

    iget-object v13, v1, Lf62;->c:Lyk6;

    iget-object v10, v1, Lf62;->d:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, v1, Lf62;->e:Lekc;

    new-instance v11, Lc12;

    new-instance v15, Lf32;

    invoke-direct {v15, v6}, Lf32;-><init>(B)V

    invoke-static {v10, v12, v15}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v15

    const/16 v17, 0x0

    move-object/from16 v18, v1

    move v12, v8

    invoke-direct/range {v11 .. v18}, Lc12;-><init>(ZLyk6;Lq52;Ltsd;Lpde;ZLekc;)V

    :goto_d4
    iput-object v11, v0, Ls62;->r:Lc12;

    new-instance v1, Lode;

    const/4 v8, 0x0

    invoke-direct {v1, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Ls62;->s:Lode;

    new-instance v1, Lkze;

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v1, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Ls62;->t:Lkze;

    new-instance v1, Lkze;

    sget-object v8, Lx52;->a:Lx52;

    invoke-direct {v1, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Ls62;->u:Lkze;

    new-instance v3, Lu02;

    new-instance v8, Lab;

    const/16 v1, 0x11

    invoke-direct {v8, v0, v1}, Lab;-><init>(Ljava/lang/Object;B)V

    new-instance v10, Lt22;

    const/4 v1, 0x1

    invoke-direct {v10, v0, v1}, Lt22;-><init>(Ls62;B)V

    move-object v12, v7

    move-object v7, v11

    new-instance v11, Lk62;

    invoke-direct {v11, v0, v4}, Lk62;-><init>(Ls62;B)V

    move-object v13, v12

    new-instance v12, Lk62;

    invoke-direct {v12, v0, v1}, Lk62;-><init>(Ls62;B)V

    move-object v14, v13

    new-instance v13, Lpjn;

    const/16 v15, 0xc

    invoke-direct {v13, v0, v15}, Lpjn;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v6, p5

    move-object/from16 v15, p14

    move-object/from16 v17, p19

    move v2, v4

    move-object/from16 v16, v5

    move-object v1, v14

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v14, p12

    invoke-direct/range {v3 .. v17}, Lu02;-><init>(Ld12;Lwth;Ll02;Lc12;Lab;Lg7m;Lt22;Lk62;Lk62;Lpjn;Lwyn;Lyk6;La52;Lr2;)V

    iput-object v3, v0, Ls62;->v:Lu02;

    new-instance v4, Lr9i;

    invoke-virtual/range {p2 .. p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Lr9i;-><init>(Lorg/chromium/content_public/browser/WebContents;Lu02;)V

    iput-object v4, v0, Ls62;->w:Lr9i;

    new-instance v3, Lg22;

    invoke-direct {v3, v2}, Lg22;-><init>(B)V

    iput-object v3, v0, Ls62;->x:Lg22;

    new-instance v3, Leyi;

    invoke-virtual/range {p2 .. p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    invoke-interface {v4}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v4

    move-object/from16 v5, p8

    invoke-direct {v3, v4, v5}, Leyi;-><init>(ZLcom/opera/android/settings/SettingsManager;)V

    iput-object v3, v0, Ls62;->y:Leyi;

    new-instance v3, Lx2;

    const/16 v4, 0x15

    move-object/from16 v5, p13

    invoke-direct {v3, v5, v0, v4}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, v0, Ls62;->z:Lzyk;

    iget-object v3, v7, Lc12;->i:Lwnm;

    invoke-static {v3}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v4

    new-instance v5, Lk9;

    const/16 v6, 0x9

    invoke-direct {v5, v0, v6}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-static {v4, v0, v5}, Lxf8;->g0(Lekc;Lndc;Lf7f;)V

    invoke-static {v3}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v3

    new-instance v4, Ll62;

    const/4 v5, 0x4

    invoke-direct {v4, v0, v5}, Ll62;-><init>(Ls62;B)V

    new-instance v5, Lug;

    const/4 v6, 0x6

    invoke-direct {v5, v4, v6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v3, v0, v5}, Lekc;->j(Lndc;Lf7f;)V

    sget-object v3, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v3}, Lqdc;->g(Lqcc;)V

    new-instance v3, Ln62;

    invoke-direct {v3, v0, v2}, Ln62;-><init>(Ls62;B)V

    invoke-virtual {v1, v3}, Lqdc;->a(Lmdc;)V

    invoke-virtual/range {p2 .. p2}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    if-eqz v1, :cond_1a0

    invoke-virtual {v1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    if-eqz v1, :cond_1a0

    new-instance v2, Ln62;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Ln62;-><init>(Ls62;B)V

    invoke-virtual {v1, v2}, Ltcc;->a(Lmdc;)V

    :cond_1a0
    invoke-virtual {v0}, Ls62;->h()V

    return-void

    :pswitch_data_1a4
    .packed-switch 0x0
        :pswitch_b6
    .end packed-switch
.end method


# virtual methods
.method public final a()V
    .registers 9

    invoke-virtual {p0}, Ls62;->l()Z

    move-result v0

    if-nez v0, :cond_6f

    iget-object v0, p0, Ls62;->A:Lr62;

    if-nez v0, :cond_6f

    invoke-virtual {p0}, Ls62;->f()Lqyj;

    move-result-object v0

    invoke-virtual {v0}, Lqyj;->f()V

    invoke-virtual {v0}, Lqyj;->m()V

    iget-object v0, p0, Ls62;->s:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu42;

    const/4 v2, 0x0

    if-eqz v1, :cond_22

    iget-object v1, v1, Lu42;->a:Ly42;

    goto :goto_23

    :cond_22
    move-object v1, v2

    :goto_23
    invoke-static {v1}, Lphj;->a0(Ly42;)Z

    move-result v1

    if-nez v1, :cond_68

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu42;

    if-eqz v1, :cond_33

    iget-object v2, v1, Lu42;->a:Ly42;

    :cond_33
    invoke-static {v2}, Lphj;->a0(Ly42;)Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-virtual {p0}, Ls62;->a()V

    return-void

    :cond_3d
    iget-object v1, p0, Ls62;->m:Lz;

    const/4 v2, 0x0

    iput v2, v1, Lz;->b:I

    iput-boolean v2, v1, Lz;->a:Z

    new-instance v3, Lqdc;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lqdc;-><init>(Lndc;Z)V

    sget-object v4, Lqcc;->c:Lqcc;

    invoke-virtual {v3, v4}, Lqdc;->g(Lqcc;)V

    new-instance v4, Lr62;

    new-instance v5, Lxa;

    const/16 v6, 0x14

    invoke-direct {v5, p0, v3, v6}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lab;

    const/16 v7, 0x12

    invoke-direct {v6, v5, v7}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v4, v0, v6, v2}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    iput-object v4, p0, Ls62;->A:Lr62;

    invoke-virtual {v1, v3}, Lz;->t(Ltcc;)V

    return-void

    :cond_68
    iget-object p0, p0, Ls62;->n:Lqdc;

    sget-object v0, Locc;->ON_DESTROY:Locc;

    invoke-virtual {p0, v0}, Lqdc;->e(Locc;)V

    :cond_6f
    return-void
.end method

.method public abstract b(Ll62;)V
.end method

.method public final c()Lp62;
    .registers 1

    iget-object p0, p0, Ls62;->h:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lp62;

    return-object p0
.end method

.method public final d()Lekc;
    .registers 1

    iget-object p0, p0, Ls62;->i:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lekc;

    return-object p0
.end method

.method public final e()Liy1;
    .registers 1

    iget-object p0, p0, Ls62;->z:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Liy1;

    return-object p0
.end method

.method public final f()Lqyj;
    .registers 1

    iget-object p0, p0, Ls62;->k:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqyj;

    return-object p0
.end method

.method public abstract g()Likc;
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Ls62;->o:Lqdc;

    return-object p0
.end method

.method public final h()V
    .registers 13

    iget-boolean v0, p0, Ls62;->E:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Ls62;->E:Z

    iget-object v0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v1

    new-instance v2, Lu59;

    const/16 v3, 0xc

    invoke-direct {v2, p0, v3}, Lu59;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v5

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v3

    new-instance v7, Ltn;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Ls62;->d:Lp12;

    iput-object p0, v7, Ltn;->b:Ljava/lang/Object;

    iput-boolean v1, v7, Ltn;->a:Z

    iput-object v0, v7, Ltn;->c:Ljava/lang/Object;

    iput-object v2, v7, Ltn;->d:Ljava/lang/Object;

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lqs7;

    iget-object v0, p0, Lp12;->g:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ly55;

    sget-object v10, Lwln;->h:Lwln;

    invoke-static {v5}, LJ/N;->Ma9TFgP9(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;

    if-eqz v0, :cond_47

    iget-object v0, v0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->b:Lns5;

    goto :goto_48

    :cond_47
    const/4 v0, 0x0

    :goto_48
    if-eqz v0, :cond_57

    new-instance v6, Los5;

    check-cast v3, Landroid/view/ViewGroup;

    move-object v10, v8

    move-object v11, v9

    move-object v8, v3

    move-object v9, v7

    move-object v7, v0

    invoke-direct/range {v6 .. v11}, Los5;-><init>(Lns5;Landroid/view/ViewGroup;Ltn;Lg1j;Ljv0;)V

    goto :goto_60

    :cond_57
    new-instance v4, Lns5;

    move-object v6, v3

    check-cast v6, Landroid/view/ViewGroup;

    invoke-direct/range {v4 .. v10}, Lns5;-><init>(Lorg/chromium/content_public/browser/WebContents;Landroid/view/ViewGroup;Ljs5;Lg1j;Ljv0;Lwln;)V

    move-object v6, v4

    :goto_60
    iput-object v6, p0, Lp12;->h:Ljava/lang/Object;

    return-void
.end method

.method public final j()V
    .registers 6

    iget-boolean v0, p0, Ls62;->D:Z

    iget-object v1, p0, Ls62;->y:Leyi;

    if-eqz v0, :cond_37

    iget-object v0, v1, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Ls62;->w:Lr9i;

    iget-object v2, v1, Lr9i;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/webcore/WebcoreRpcBridge;

    invoke-virtual {v2, v0}, Lcom/opera/android/webcore/WebcoreRpcBridge;->a(Ljava/lang/String;)V

    invoke-virtual {p0}, Ls62;->g()Likc;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iget-object v1, v1, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v1, v1, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-eqz v3, :cond_5e

    invoke-static {v1, v2, v0}, LJ/N;->M0ycnTP5(JF)V

    goto :goto_5e

    :cond_37
    iget-object v0, v1, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Lkze;

    new-instance v1, Ll62;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ll62;-><init>(Ls62;B)V

    new-instance v2, Lug;

    const/4 v3, 0x6

    invoke-direct {v2, v1, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p0, v2}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {p0}, Ls62;->g()Likc;

    move-result-object v0

    new-instance v1, Ll62;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ll62;-><init>(Ls62;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v1, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p0, v4}, Lekc;->j(Lndc;Lf7f;)V

    iput-boolean v2, p0, Ls62;->D:Z

    :cond_5e
    :goto_5e
    iget-object p0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    return-void
.end method

.method public final k(Lz5i;)V
    .registers 5

    iget-object v0, p0, Ls62;->B:Lr62;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lq59;->cancel()V

    :cond_7
    iget-object v0, p0, Ls62;->t:Lkze;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    new-instance v0, Lr62;

    new-instance v1, Lwx;

    const/16 v2, 0xb

    invoke-direct {v1, p0, p1, v2}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p1, 0x1

    iget-object v2, p0, Ls62;->s:Lode;

    invoke-direct {v0, v2, v1, p1}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    iput-object v0, p0, Ls62;->B:Lr62;

    return-void
.end method

.method public final l()Z
    .registers 2

    iget-object p0, p0, Ls62;->o:Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    sget-object v0, Lqcc;->a:Lqcc;

    if-ne p0, v0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public m()V
    .registers 1

    iget-object p0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->b()V

    return-void
.end method

.method public n()V
    .registers 3

    iget-boolean v0, p0, Ls62;->C:Z

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    iput-boolean v0, p0, Ls62;->C:Z

    invoke-virtual {p0}, Ls62;->l()Z

    move-result v0

    if-nez v0, :cond_1d

    iget-object v0, p0, Ls62;->u:Lkze;

    sget-object v1, Lx52;->a:Lx52;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    new-instance v0, Ll62;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ll62;-><init>(Ls62;B)V

    invoke-virtual {p0, v0}, Ls62;->b(Ll62;)V

    :cond_1d
    return-void
.end method
