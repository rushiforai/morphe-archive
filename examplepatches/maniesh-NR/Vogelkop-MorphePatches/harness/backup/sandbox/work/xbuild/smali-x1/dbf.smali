.class public final Ldbf;
.super Lt0h;
.source "SourceFile"

# interfaces
.implements Lgim;
.implements Lhim;


# instance fields
.field public final a:Lhv3;

.field public final b:Lx5f;

.field public final c:Lwt3;

.field public final d:Lumi;

.field public final e:Lhv3;

.field public final f:Lgjm;

.field public final g:Lz77;

.field public final h:Lnej;

.field public final i:Lcdn;

.field public final j:Lx5f;

.field public final k:Lwt3;

.field public final l:Lwt3;

.field public m:Loim;

.field public n:Lk18;

.field public o:Lcbf;

.field public p:Z

.field public final synthetic q:Lgbf;


# direct methods
.method public constructor <init>(Lgbf;Lumi;Lhv3;Lgjm;Lz77;Lnej;Lcdn;Lx5f;Lwt3;Lwt3;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldbf;->q:Lgbf;

    iput-object p3, p0, Ldbf;->a:Lhv3;

    iput-object p8, p0, Ldbf;->b:Lx5f;

    iput-object p9, p0, Ldbf;->c:Lwt3;

    iput-object p2, p0, Ldbf;->d:Lumi;

    iput-object p3, p0, Ldbf;->e:Lhv3;

    iput-object p4, p0, Ldbf;->f:Lgjm;

    iput-object p5, p0, Ldbf;->g:Lz77;

    iput-object p6, p0, Ldbf;->h:Lnej;

    iput-object p7, p0, Ldbf;->i:Lcdn;

    iput-object p8, p0, Ldbf;->j:Lx5f;

    iput-object p9, p0, Ldbf;->k:Lwt3;

    iput-object p10, p0, Ldbf;->l:Lwt3;

    return-void
.end method

.method public static u(Loim;)Z
    .registers 1

    if-eqz p0, :cond_a

    invoke-interface {p0}, Loim;->isFinished()Z

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final A(Lqk0;)V
    .registers 11

    iget-object v0, p0, Ldbf;->c:Lwt3;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmbf;

    iget-object v1, v0, Lmbf;->c:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ltk0;

    iget-object v1, v0, Lmbf;->d:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lsk0;

    iget-object v0, v0, Lmbf;->f:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    iget-object p0, p0, Ldbf;->b:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_2d

    return-void

    :cond_2d
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v8, Lck0;

    invoke-direct {v8, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v0, v8, Lck0;->i:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpk0;

    iget-object v0, v0, Lpk0;->a:Lok0;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3, v3}, Ljf0;->o(III)V

    new-instance v2, Lha1;

    const/4 v7, 0x2

    move-object v3, p1

    invoke-direct/range {v2 .. v7}, Lha1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {v8, v2}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final B()V
    .registers 23

    move-object/from16 v0, p0

    iget-object v1, v0, Ldbf;->n:Lk18;

    invoke-static {v1}, Ldbf;->u(Loim;)Z

    move-result v1

    if-eqz v1, :cond_b

    return-void

    :cond_b
    iget-object v1, v0, Ldbf;->q:Lgbf;

    iget-object v2, v1, Lgbf;->b:Lz43;

    invoke-virtual {v2}, Lz43;->i()Lbp;

    move-result-object v4

    iget-object v2, v1, Lgbf;->c:Lcom/opera/android/settings/SettingsManager;

    iget-object v3, v1, Lgbf;->d:Ls9g;

    new-instance v12, Lcbf;

    const/4 v5, 0x0

    invoke-direct {v12, v0, v5}, Lcbf;-><init>(Ldbf;B)V

    iget-boolean v11, v1, Lgbf;->e:Z

    new-instance v6, Lp0h;

    invoke-direct {v6, v2, v3}, Lp0h;-><init>(Lcom/opera/android/settings/SettingsManager;Ls9g;)V

    iget-object v15, v0, Ldbf;->d:Lumi;

    iget-object v7, v0, Ldbf;->j:Lx5f;

    iget-object v8, v0, Ldbf;->f:Lgjm;

    iget-object v9, v0, Ldbf;->l:Lwt3;

    if-eqz v4, :cond_3b

    new-instance v2, Lk18;

    new-instance v3, Lxzg;

    const/4 v10, 0x0

    move-object v5, v15

    invoke-direct/range {v3 .. v11}, Lxzg;-><init>(Lbp;Lumi;Lp0h;Lx5f;Lgjm;Lwt3;ZI)V

    invoke-direct {v2, v3, v6, v12}, Lk18;-><init>(Lxzg;Lp0h;Lcbf;)V

    goto :goto_52

    :cond_3b
    move-object/from16 v17, v7

    move-object/from16 v18, v8

    move-object/from16 v19, v9

    move/from16 v21, v11

    new-instance v2, Lk18;

    new-instance v13, Lxzg;

    const/4 v14, 0x0

    const/16 v20, 0x1

    move-object/from16 v16, v6

    invoke-direct/range {v13 .. v21}, Lxzg;-><init>(Lbp;Lumi;Lp0h;Lx5f;Lgjm;Lwt3;ZI)V

    invoke-direct {v2, v13, v6, v12}, Lk18;-><init>(Lxzg;Lp0h;Lcbf;)V

    :goto_52
    iput-object v2, v0, Ldbf;->n:Lk18;

    iget-object v1, v1, Lgbf;->h:Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    if-eqz v1, :cond_5d

    invoke-virtual {v0, v1}, Ldbf;->C(Lb2l;)V

    :cond_5d
    iget-object v1, v0, Ldbf;->g:Lz77;

    iget-object v0, v0, Ldbf;->n:Lk18;

    invoke-virtual {v1, v0}, Lr22;->a(Ljjm;)V

    return-void
.end method

.method public final C(Lb2l;)V
    .registers 7

    iget-object v0, p0, Ldbf;->n:Lk18;

    invoke-static {v0}, Ldbf;->u(Loim;)Z

    move-result v0

    if-eqz v0, :cond_69

    iget-object v0, p0, Ldbf;->n:Lk18;

    iget-object p0, p0, Ldbf;->q:Lgbf;

    iget-object p0, p0, Lgbf;->j:Lvbf;

    iget-object p0, p0, Lvbf;->t:Ltbf;

    iget-object v0, v0, Lk18;->c:Ljava/lang/Object;

    check-cast v0, Lp0h;

    iget-object v1, p0, Ltbf;->b:Lypm;

    iget-object v1, v1, Lypm;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lp0h;->e:Lkze;

    invoke-virtual {v2, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Ltbf;->a()Lqwi;

    move-result-object v1

    iget-object v2, v0, Lp0h;->f:Lkze;

    invoke-virtual {v2, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Ltbf;->b:Lypm;

    iget-boolean p0, p0, Lypm;->j:Z

    iget-object v1, v0, Lp0h;->g:Lkze;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Lekc;->r(Ljava/lang/Object;)V

    move-object p0, p1

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->y()Lt59;

    move-result-object p0

    const-wide/16 v1, 0x0

    if-nez p0, :cond_46

    move-wide v3, v1

    goto :goto_51

    :cond_46
    move-object p0, p1

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->y()Lt59;

    move-result-object p0

    iget-wide v3, p0, Lt59;->b:J

    :goto_51
    invoke-virtual {v0, v3, v4}, Lp0h;->e(J)V

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->y()Lt59;

    move-result-object p0

    if-eqz p0, :cond_66

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->y()Lt59;

    move-result-object p0

    iget-wide v1, p0, Lt59;->a:J

    :cond_66
    invoke-virtual {v0, v1, v2}, Lp0h;->h(J)V

    :cond_69
    return-void
.end method

.method public final a(Landroid/view/View;)V
    .registers 4

    sget-object v0, Lph0;->d:Lph0;

    iget-object v1, p0, Ldbf;->b:Lx5f;

    invoke-virtual {v1, v0}, Lx5f;->f0(Lph0;)V

    iget-object p0, p0, Ldbf;->a:Lhv3;

    invoke-virtual {p0, p1}, Lhv3;->u(Landroid/view/View;)V

    return-void
.end method

.method public final b(Landroid/view/View;)V
    .registers 4

    sget-object v0, Lph0;->e:Lph0;

    iget-object v1, p0, Ldbf;->b:Lx5f;

    invoke-virtual {v1, v0}, Lx5f;->f0(Lph0;)V

    iget-object p0, p0, Ldbf;->a:Lhv3;

    invoke-virtual {p0, p1}, Lhv3;->k(Landroid/view/View;)V

    return-void
.end method

.method public final v(Landroid/view/View;Ltaf;ZLhbf;)V
    .registers 16

    iget-object v0, p0, Ldbf;->a:Lhv3;

    iget-object v1, v0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v3, p0, Ldbf;->q:Lgbf;

    iget-object v2, v3, Lgbf;->t:Lbpd;

    invoke-virtual {v3}, Lgbf;->s()V

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    const/4 v5, 0x0

    iget-object v8, p0, Ldbf;->b:Lx5f;

    iget-object v7, p0, Ldbf;->e:Lhv3;

    const/4 v6, 0x0

    move-object v9, v6

    const/4 v6, 0x0

    const/4 v10, 0x1

    packed-switch v4, :pswitch_data_20c

    :pswitch_1b
    goto/16 :goto_204

    :pswitch_1d
    sget-object p1, Lqk0;->S:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->h()V

    goto/16 :goto_204

    :pswitch_27
    sget-object p1, Lqk0;->N:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    sget-object p0, Lhw0;->a:Lhw0;

    invoke-virtual {v0}, Lhv3;->e()V

    goto/16 :goto_204

    :pswitch_33
    sget-object p1, Lqk0;->R:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    sget-object p0, Lhw0;->b:Lhw0;

    invoke-virtual {v0, p0}, Lhv3;->f(Lhw0;)V

    goto/16 :goto_204

    :pswitch_3f
    sget-object p1, Lqk0;->u:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->r()V

    goto/16 :goto_204

    :pswitch_49
    sget-object p1, Lqk0;->z:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->o()V

    goto/16 :goto_204

    :pswitch_53
    sget-object p1, Lqk0;->y:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_204

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->X()V

    goto/16 :goto_204

    :pswitch_67
    sget-object p1, Lqk0;->x:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->g0()V

    goto/16 :goto_204

    :pswitch_73
    sget-object p1, Lqk0;->B:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->g()V

    goto/16 :goto_204

    :pswitch_7d
    sget-object p1, Lqk0;->w:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->c()V

    goto/16 :goto_204

    :pswitch_87
    sget-object p1, Lqk0;->v:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->d()V

    goto/16 :goto_204

    :pswitch_91
    sget-object p1, Ltaf;->z:Ltaf;

    if-ne p2, p1, :cond_96

    move v6, v10

    :cond_96
    sget-object p1, Lqk0;->t:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0, v9, v6}, Lhv3;->p(Ljava/lang/String;Z)V

    goto/16 :goto_204

    :pswitch_a0
    sget-object p1, Lqk0;->s:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->n()V

    goto/16 :goto_204

    :pswitch_aa
    sget-object p1, Lqk0;->r:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    iget-object p0, v0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p0, :cond_b7

    move-object v6, v9

    goto :goto_b8

    :cond_b7
    move-object v6, p0

    :goto_b8
    invoke-virtual {v6, v10}, Lgbf;->t(Z)V

    goto/16 :goto_204

    :pswitch_bd
    sget-object p1, Lqk0;->q:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->t()V

    goto/16 :goto_204

    :pswitch_c7
    sget-object p1, Lqk0;->p:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->q()V

    goto/16 :goto_204

    :pswitch_d1
    iget-object p1, p0, Ldbf;->m:Loim;

    invoke-static {p1}, Ldbf;->u(Loim;)Z

    move-result p1

    if-nez p1, :cond_204

    new-instance p1, Li4d;

    const/16 p2, 0x9

    invoke-direct {p1, v3, p2}, Li4d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Ldbf;->z(Lebf;)V

    goto/16 :goto_204

    :pswitch_e5
    iget-object p1, p0, Ldbf;->m:Loim;

    invoke-static {p1}, Ldbf;->u(Loim;)Z

    move-result p1

    if-nez p1, :cond_204

    new-instance p1, Lpad;

    const/16 p2, 0x1a

    invoke-direct {p1, p2, v3, v7, v5}, Lpad;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {p0, p1}, Ldbf;->z(Lebf;)V

    goto/16 :goto_204

    :pswitch_f9
    iget-object p1, p0, Ldbf;->m:Loim;

    invoke-static {p1}, Ldbf;->u(Loim;)Z

    move-result p1

    if-nez p1, :cond_204

    new-instance v2, Ls14;

    iget-object v4, p0, Ldbf;->f:Lgjm;

    iget-object v5, p0, Ldbf;->i:Lcdn;

    invoke-direct/range {v2 .. v7}, Ls14;-><init>(Lgbf;Lgjm;Lcdn;ZLhv3;)V

    invoke-virtual {p0, v2}, Ldbf;->z(Lebf;)V

    goto/16 :goto_204

    :pswitch_10f
    invoke-virtual {p0}, Ldbf;->B()V

    sget-object p0, Lph0;->r:Lph0;

    invoke-virtual {v8, p0}, Lx5f;->f0(Lph0;)V

    goto/16 :goto_204

    :pswitch_119
    sget-object p1, Lqk0;->m:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->l()V

    goto/16 :goto_204

    :pswitch_123
    sget-object p1, Lqk0;->n:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->l()V

    goto/16 :goto_204

    :pswitch_12d
    invoke-virtual {p0, p1}, Ldbf;->b(Landroid/view/View;)V

    goto/16 :goto_204

    :pswitch_132
    iget-object p1, v2, Lbpd;->c:Ljava/lang/Object;

    check-cast p1, Lgbf;

    iget-object p1, p1, Lgbf;->j:Lvbf;

    invoke-virtual {p1}, Lvbf;->c()V

    iget-object p1, v2, Lbpd;->b:Ljava/lang/Object;

    check-cast p1, Lupm;

    if-eqz p1, :cond_144

    invoke-interface {p1}, Lupm;->c()V

    :cond_144
    sget-object p1, Lqk0;->c:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    goto/16 :goto_204

    :pswitch_14b
    sget-object p1, Lqk0;->j:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    sget p0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    iget-object p0, v1, Lcom/opera/android/BrowserActivity;->Z0:Lhv3;

    const-string p1, "android.permission.CAMERA"

    invoke-static {v1, p1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_178

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lq9n;->v(Landroid/view/Window;)Z

    new-instance p1, Landroid/content/Intent;

    const-class p2, Lcom/opera/android/qr/ScanQrCodeActivity;

    invoke-direct {p1, v1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance p2, Lqj2;

    const/16 p4, 0xc

    invoke-direct {p2, p0, p4}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p1, p2}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    goto/16 :goto_204

    :cond_178
    iget-object p2, v1, Ldx3;->j:Lqi;

    new-instance p4, Lrli;

    invoke-direct {p4, v1, p0}, Lrli;-><init>(Lcom/opera/android/BrowserActivity;Lhv3;)V

    invoke-static {p2, p1, p4}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    goto/16 :goto_204

    :pswitch_184
    sget-object p1, Lqk0;->i:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    iget-object p0, v0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p1, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p1, :cond_190

    move-object p1, v9

    :cond_190
    invoke-virtual {p1, v9, p4}, Lgbf;->l(Lbsi;Lhbf;)V

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p0, :cond_199

    move-object v6, v9

    goto :goto_19a

    :cond_199
    move-object v6, p0

    :goto_19a
    invoke-virtual {v6}, Lgbf;->b()V

    goto :goto_204

    :pswitch_19e
    sget-object p1, Lqk0;->l:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->m()V

    goto :goto_204

    :pswitch_1a7
    sget-object p1, Lqk0;->k:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    invoke-virtual {v0}, Lhv3;->s()V

    goto :goto_204

    :pswitch_1b0
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eq p1, v10, :cond_1bf

    const/4 p4, 0x2

    if-ne p1, p4, :cond_1c4

    sget-object p1, Lqk0;->f:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    goto :goto_1c4

    :cond_1bf
    sget-object p1, Lqk0;->h:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    :cond_1c4
    :goto_1c4
    new-instance p0, Lpkk;

    invoke-direct {p0, p2}, Lpkk;-><init>(Ltaf;)V

    invoke-virtual {v2}, Lbpd;->y()Lupm;

    move-result-object p1

    invoke-interface {p1}, Lupm;->g()Lxbf;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p2, 0x6

    invoke-static {p1, p0, v5, p2}, Lxbf;->F(Lxbf;Lj7h;II)V

    goto :goto_204

    :pswitch_1d9
    iget-object p1, v3, Lgbf;->s:Lay;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzqi;

    iget-object p2, p1, Lzqi;->a:Lmri;

    invoke-virtual {p2}, Lo73;->k()Z

    move-result p4

    if-eqz p4, :cond_1f3

    invoke-virtual {p2}, Lo73;->k()Z

    move-result p1

    if-eqz p1, :cond_1ff

    invoke-virtual {p2}, Lo73;->b()Z

    goto :goto_1ff

    :cond_1f3
    iget-object p1, p1, Lzqi;->c:Lxd5;

    const p4, 0x7f0a05f8

    invoke-virtual {p1, p4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Lo73;->o(Landroid/view/View;)V

    :cond_1ff
    :goto_1ff
    sget-object p1, Lqk0;->g:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    :cond_204
    :goto_204
    if-eqz p3, :cond_20b

    sget-object p0, Lph0;->c:Lph0;

    invoke-virtual {v8, p0}, Lx5f;->f0(Lph0;)V

    :cond_20b
    return-void

    :pswitch_data_20c
    .packed-switch 0x0
        :pswitch_1d9
        :pswitch_1b0
        :pswitch_1b0
        :pswitch_1a7
        :pswitch_19e
        :pswitch_184
        :pswitch_14b
        :pswitch_132
        :pswitch_12d
        :pswitch_123
        :pswitch_119
        :pswitch_10f
        :pswitch_10f
        :pswitch_10f
        :pswitch_f9
        :pswitch_f9
        :pswitch_f9
        :pswitch_f9
        :pswitch_e5
        :pswitch_d1
        :pswitch_c7
        :pswitch_bd
        :pswitch_aa
        :pswitch_a0
        :pswitch_91
        :pswitch_91
        :pswitch_87
        :pswitch_7d
        :pswitch_73
        :pswitch_67
        :pswitch_53
        :pswitch_1b0
        :pswitch_1b
        :pswitch_1b
        :pswitch_49
        :pswitch_3f
        :pswitch_33
        :pswitch_27
        :pswitch_1b
        :pswitch_1d
    .end packed-switch
.end method

.method public final w(Landroid/view/View;Ltaf;Z)Z
    .registers 7

    sget-object v0, Ltaf;->f:Ltaf;

    iget-object v1, p0, Ldbf;->a:Lhv3;

    const/4 v2, 0x1

    if-ne p2, v0, :cond_2c

    sget-object p2, Lqk0;->C:Lqk0;

    invoke-virtual {p0, p2}, Ldbf;->A(Lqk0;)V

    iget-object p0, v1, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget p2, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lxw;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    iget-object v0, v0, Lhx3;->q:Lfx3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljbn;

    invoke-direct {p2, p3, v0}, Lxw;-><init>(Landroid/content/Context;Ljbn;)V

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/BrowserActivity;->A1(Lo73;Landroid/view/View;)V

    return v2

    :cond_2c
    sget-object v0, Ltaf;->i:Ltaf;

    if-ne p2, v0, :cond_34

    invoke-virtual {p0, p1}, Ldbf;->a(Landroid/view/View;)V

    return v2

    :cond_34
    if-eqz p3, :cond_41

    sget-object p2, Lph0;->d:Lph0;

    iget-object p0, p0, Ldbf;->b:Lx5f;

    invoke-virtual {p0, p2}, Lx5f;->f0(Lph0;)V

    invoke-virtual {v1, p1}, Lhv3;->u(Landroid/view/View;)V

    return v2

    :cond_41
    sget-object p1, Ltaf;->a:Ltaf;

    if-ne p2, p1, :cond_73

    iget-object p1, p0, Ldbf;->q:Lgbf;

    iget-object p1, p1, Lgbf;->s:Lay;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzqi;

    iget-object p2, p1, Lzqi;->a:Lmri;

    invoke-virtual {p2}, Lo73;->k()Z

    move-result p3

    if-eqz p3, :cond_61

    invoke-virtual {p2}, Lo73;->k()Z

    move-result p1

    if-eqz p1, :cond_6d

    invoke-virtual {p2}, Lo73;->b()Z

    goto :goto_6d

    :cond_61
    iget-object p1, p1, Lzqi;->c:Lxd5;

    const p3, 0x7f0a05f8

    invoke-virtual {p1, p3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Lo73;->o(Landroid/view/View;)V

    :cond_6d
    :goto_6d
    sget-object p1, Lqk0;->g:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    return v2

    :cond_73
    const/4 p0, 0x0

    return p0
.end method

.method public final x(Z)V
    .registers 7

    iget-object v0, p0, Ldbf;->q:Lgbf;

    iget-object v1, v0, Lgbf;->s:Lay;

    iget-object v2, v0, Lgbf;->i:Landroid/view/View;

    const/4 v3, 0x0

    if-nez p1, :cond_4a

    iget-object p1, v0, Lgbf;->t:Lbpd;

    invoke-virtual {p1}, Lbpd;->y()Lupm;

    move-result-object p1

    invoke-interface {p1}, Lczj;->i()Z

    move-result p1

    if-nez p1, :cond_79

    iget-boolean p1, p0, Ldbf;->p:Z

    const/4 v4, 0x1

    if-eqz p1, :cond_30

    iput-boolean v3, p0, Ldbf;->p:Z

    iget-object p1, p0, Ldbf;->o:Lcbf;

    if-eqz p1, :cond_23

    invoke-virtual {v2, p1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_23
    new-instance p1, Lcbf;

    invoke-direct {p1, p0, v4}, Lcbf;-><init>(Ldbf;B)V

    iput-object p1, p0, Ldbf;->o:Lcbf;

    const-wide/16 v0, 0xdc

    invoke-virtual {v2, p1, v0, v1}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    return-void

    :cond_30
    invoke-virtual {v0, v4}, Lgbf;->m(Z)V

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzqi;

    iget-object p1, p0, Lzqi;->a:Lmri;

    invoke-virtual {p1}, Lo73;->k()Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-virtual {p1}, Lo73;->b()Z

    :cond_44
    iget-object p0, p0, Lzqi;->b:Lmrk;

    invoke-virtual {p0}, Lmrk;->b()V

    return-void

    :cond_4a
    iget-object p1, p0, Ldbf;->o:Lcbf;

    const/4 v4, 0x0

    if-eqz p1, :cond_54

    invoke-virtual {v2, p1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-object v4, p0, Ldbf;->o:Lcbf;

    :cond_54
    iput-boolean v3, p0, Ldbf;->p:Z

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzqi;

    iget-object p0, p0, Lzqi;->b:Lmrk;

    invoke-virtual {p0}, Lmrk;->f()V

    iget-object p0, v0, Lgbf;->b:Lz43;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzqi;

    iget-object p1, p0, Lzqi;->b:Lmrk;

    invoke-virtual {p1}, Lmrk;->d()Z

    move-result p1

    if-nez p1, :cond_79

    iget-object p0, p0, Lzqi;->b:Lmrk;

    invoke-virtual {p0, v4}, Lmrk;->h(Lbsi;)V

    :cond_79
    return-void
.end method

.method public final y()Z
    .registers 7

    iget-object p0, p0, Ldbf;->q:Lgbf;

    iget-object v0, p0, Lgbf;->i:Landroid/view/View;

    iget-object v1, p0, Lgbf;->j:Lvbf;

    invoke-virtual {v1}, Lvbf;->p()Z

    move-result v1

    iget-object v2, p0, Lgbf;->t:Lbpd;

    const/4 v3, 0x0

    if-nez v1, :cond_3d

    invoke-virtual {v2}, Lbpd;->y()Lupm;

    move-result-object v1

    sget-object v4, Lhbf;->b:Lhbf;

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v4}, Lgbf;->l(Lbsi;Lhbf;)V

    invoke-virtual {v2}, Lbpd;->y()Lupm;

    move-result-object p0

    if-ne p0, v1, :cond_27

    invoke-virtual {v2}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lczj;->f()V

    return v3

    :cond_27
    invoke-interface {v1}, Lupm;->a()Lwpm;

    move-result-object v1

    invoke-interface {v1}, Lwpm;->L()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    new-instance v2, Lg00;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v1, v3}, Lg00;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v2, v0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    const/4 p0, 0x1

    return p0

    :cond_3d
    invoke-virtual {v2}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lczj;->f()V

    return v3
.end method

.method public final z(Lebf;)V
    .registers 4

    iget-object v0, p0, Ldbf;->q:Lgbf;

    iget-boolean v0, v0, Lgbf;->e:Z

    sget-object v1, Lijm;->b:Lijm;

    if-nez v0, :cond_18

    new-instance v0, Lqvl;

    invoke-direct {v0, p1}, Lqvl;-><init>(Lebf;)V

    iput-object v0, p0, Ldbf;->m:Loim;

    iget-object p0, p0, Ldbf;->g:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_18
    new-instance v0, Lxq3;

    invoke-direct {v0, p1}, Lxq3;-><init>(Lebf;)V

    iput-object v0, p0, Ldbf;->m:Loim;

    iget-object p0, p0, Ldbf;->h:Lnej;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
