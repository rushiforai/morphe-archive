.class public final synthetic Lq02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lq02;->a:B

    iput-object p1, p0, Lq02;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lq02;->a:B

    const/4 v1, 0x1

    const/16 v2, 0x1a

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object p0, p0, Lq02;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_256

    check-cast p0, Lot2;

    iget-object p0, p0, Lot2;->b:Lgjm;

    new-instance v0, Lo5g;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v4}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_19
    check-cast p0, Lwr2;

    iget-object v0, p0, Lwr2;->s:Lcom/opera/android/autofill/AutofillManager;

    iget-object p0, p0, Lwr2;->r:Lbv1;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lab;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v2}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/autofill/AutofillManager;->d(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_2d
    check-cast p0, Las2;

    sget-object v0, Ljd6;->a:Ljd6;

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Las2;->b(Ltw7;)V

    return-void

    :pswitch_3a
    check-cast p0, Lkr2;

    invoke-virtual {p0, v4}, Ltjf;->a(Z)V

    return-void

    :pswitch_40
    check-cast p0, Lmr2;

    iget-object v0, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    new-instance v1, Lab;

    invoke-direct {v1, p0, v2}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/autofill/AutofillManager;->c(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_4d
    check-cast p0, Lpt1;

    iget-object v0, p0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object v0

    if-eqz v0, :cond_67

    iget-object p0, p0, Lpt1;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v1, Lgf;

    const/16 v2, 0xf

    invoke-direct {v1, v0, v2}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_67
    return-void

    :pswitch_68
    check-cast p0, Llq2;

    iget-object v0, p0, Llq2;->e:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object v0, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->b:Lhuh;

    iget v1, v0, Lhuh;->a:F

    invoke-virtual {v0, v1}, Lhuh;->a(F)F

    move-result v1

    iget v2, p0, Llq2;->a:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_86

    iget v1, v0, Lhuh;->b:F

    invoke-virtual {v0, v1}, Lhuh;->a(F)F

    move-result v0

    iget v1, p0, Llq2;->b:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_8b

    :cond_86
    iget-object p0, p0, Llq2;->d:Lq02;

    invoke-virtual {p0}, Lq02;->run()V

    :cond_8b
    return-void

    :pswitch_8c
    check-cast p0, Lb4g;

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p0

    if-eqz p0, :cond_a3

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    invoke-virtual {p0}, Lo66;->j()Z

    move-result v0

    if-eqz v0, :cond_a3

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    :cond_a3
    return-void

    :pswitch_a4
    check-cast p0, Lrn9;

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lbxk;

    const-string v2, "WebContentsAccessibilityImpl.AutoDisableAccessibilityHandler.onDisabled"

    invoke-static {v2, v3}, Lorg/chromium/base/TraceEvent;->h(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v0, Lbxk;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;

    iget-object v5, v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->A:Lj8;

    iget v6, v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->M:I

    if-nez v6, :cond_bb

    move v6, v1

    goto :goto_bc

    :cond_bb
    move v6, v4

    :goto_bc
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v7, "AccessibilityHistogramRecorder.onDisabledCalled"

    invoke-static {v7, v3}, Lorg/chromium/base/TraceEvent;->h(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    iget-wide v10, v5, Lj8;->h:J

    if-eqz v6, :cond_d9

    const-string v3, "Accessibility.Android.AutoDisableV2.EnabledTime.Initial"

    sub-long v10, v8, v10

    invoke-static {v10, v11, v3}, Lioh;->z(JLjava/lang/String;)V

    const-string v3, "Accessibility.Android.AutoDisableV2.DisableCalled.Initial"

    invoke-static {v3, v1}, Lioh;->t(Ljava/lang/String;Z)V

    goto :goto_e5

    :cond_d9
    const-string v3, "Accessibility.Android.AutoDisableV2.EnabledTime.Successive"

    sub-long v10, v8, v10

    invoke-static {v10, v11, v3}, Lioh;->z(JLjava/lang/String;)V

    const-string v3, "Accessibility.Android.AutoDisableV2.DisableCalled.Successive"

    invoke-static {v3, v1}, Lioh;->t(Ljava/lang/String;Z)V

    :goto_e5
    iput-wide v8, v5, Lj8;->i:J

    const-string v3, "Accessibility.Android.Usage.NativeInit"

    iget-wide v10, v5, Lj8;->h:J

    sub-long/2addr v8, v10

    invoke-static {v8, v9, v3}, Lioh;->z(JLjava/lang/String;)V

    const-wide/16 v8, -0x1

    iput-wide v8, v5, Lj8;->h:J

    invoke-static {v7}, Lorg/chromium/base/TraceEvent;->k(Ljava/lang/String;)V

    iget-wide v5, v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->e:J

    invoke-static {v5, v6}, LJ/N;->MOP_btw0(J)V

    iget-object v3, v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->F:Ligi;

    invoke-virtual {v3}, Ligi;->u()V

    iget-object v3, v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->D:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    iput-boolean v1, v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->L:Z

    invoke-static {v2}, Lorg/chromium/base/TraceEvent;->k(Ljava/lang/String;)V

    iput-boolean v4, p0, Lrn9;->b:Z

    return-void

    :pswitch_10d
    check-cast p0, Lwl2;

    iget-object p0, p0, Lwl2;->a:Ldg2;

    invoke-virtual {p0}, Ldg2;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_115
    check-cast p0, Ltl2;

    iget-object p0, p0, Ltl2;->b:Ldg2;

    invoke-virtual {p0}, Ldg2;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_11d
    check-cast p0, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_12a

    check-cast p0, Landroid/graphics/drawable/Animatable;

    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->start()V

    :cond_12a
    return-void

    :pswitch_12b
    check-cast p0, Lli2;

    iput-object v3, p0, Lli2;->i:Lih4;

    invoke-virtual {p0}, Lli2;->r()V

    return-void

    :pswitch_133
    check-cast p0, Lijc;

    new-instance v0, Lt40;

    invoke-direct {v0, v2}, Lt40;-><init>(B)V

    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lijc;->i(ILfjc;)V

    return-void

    :pswitch_13f
    check-cast p0, Lhh2;

    iget-object p0, p0, Lhh2;->a:La64;

    invoke-static {p0, v3}, Lsgb;->k(Lnx5;Ljava/util/concurrent/CancellationException;)V

    return-void

    :pswitch_147
    check-cast p0, Lqf2;

    iget-object v0, p0, Lqf2;->d:Ljava/lang/Object;

    check-cast v0, Ltn;

    iget-boolean v0, v0, Ltn;->a:Z

    if-eqz v0, :cond_15b

    iget-object p0, p0, Lqf2;->b:Ljava/lang/Object;

    check-cast p0, Lmi8;

    iget-object p0, p0, Lmi8;->a:Lqi8;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, v4}, Lqi8;->V0(IZ)V

    :cond_15b
    return-void

    :pswitch_15c
    check-cast p0, Ltn;

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Lqf2;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void

    :pswitch_16a
    check-cast p0, Lxe2;

    iget-object v0, p0, Lxe2;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_16f
    iget-boolean v1, p0, Lxe2;->m:Z

    if-eqz v1, :cond_175

    monitor-exit v0

    goto :goto_19b

    :cond_175
    iget-wide v1, p0, Lxe2;->l:J

    const-wide/16 v3, 0x1

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lxe2;->l:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_184

    monitor-exit v0

    goto :goto_19b

    :cond_184
    if-gez v1, :cond_197

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    iget-object v2, p0, Lxe2;->a:Ljava/lang/Object;

    monitor-enter v2
    :try_end_18e
    .catchall {:try_start_16f .. :try_end_18e} :catchall_19e

    :try_start_18e
    iput-object v1, p0, Lxe2;->n:Ljava/lang/IllegalStateException;

    monitor-exit v2
    :try_end_191
    .catchall {:try_start_18e .. :try_end_191} :catchall_195

    :try_start_191
    monitor-exit v0
    :try_end_192
    .catchall {:try_start_191 .. :try_end_192} :catchall_19e

    goto :goto_19b

    :goto_193
    :try_start_193
    monitor-exit v2
    :try_end_194
    .catchall {:try_start_193 .. :try_end_194} :catchall_195

    :try_start_194
    throw p0

    :catchall_195
    move-exception p0

    goto :goto_193

    :cond_197
    invoke-virtual {p0}, Lxe2;->a()V

    monitor-exit v0

    :goto_19b
    return-void

    :goto_19c
    monitor-exit v0
    :try_end_19d
    .catchall {:try_start_194 .. :try_end_19d} :catchall_19e

    throw p0

    :catchall_19e
    move-exception p0

    goto :goto_19c

    :pswitch_1a0
    check-cast p0, Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lxqe;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0xf731400

    sub-long/2addr v2, v4

    iget-object v0, p0, Lxqe;->g:Ljava/util/List;

    if-nez v0, :cond_1b7

    iget-object v0, p0, Lxqe;->a:Li32;

    invoke-virtual {v0}, Lldk;->i()V

    :cond_1b7
    iget-object v0, p0, Lxqe;->g:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const-wide/16 v5, 0x3e8

    div-long/2addr v2, v5

    new-instance v5, Lvqe;

    invoke-direct {v5, v4, v2, v3}, Lvqe;-><init>(Ljava/util/ArrayList;J)V

    invoke-static {v0, v5}, Lsfe;->A0(Ljava/lang/Iterable;Lsrg;)Z

    move-result v2

    if-eqz v2, :cond_1db

    invoke-virtual {p0, v0}, Lxqe;->o(Ljava/util/List;)V

    invoke-virtual {p0, v4}, Lxqe;->l(Ljava/util/List;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    invoke-virtual {p0, v1}, Lxqe;->k(Z)V

    :cond_1db
    return-void

    :pswitch_1dc
    check-cast p0, Lqdc;

    sget-object v0, Locc;->ON_DESTROY:Locc;

    invoke-virtual {p0, v0}, Lqdc;->e(Locc;)V

    return-void

    :pswitch_1e4
    check-cast p0, Lt42;

    iget-object p0, p0, Lt42;->v:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lz5i;->f0(Landroid/content/Context;)V

    return-void

    :pswitch_1ec
    check-cast p0, Lq2;

    invoke-virtual {p0}, Lq2;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_1f2
    check-cast p0, Lb22;

    iget-object p0, p0, Lb22;->v:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lz5i;->f0(Landroid/content/Context;)V

    return-void

    :pswitch_1fa
    check-cast p0, Lgka;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lgka;->n(Ltw7;)V

    return-void

    :pswitch_207
    check-cast p0, Lgka;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lgka;->n(Ltw7;)V

    return-void

    :pswitch_214
    check-cast p0, Lgka;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lgka;->n(Ltw7;)V

    return-void

    :pswitch_221
    check-cast p0, Lfka;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lfka;->n(Ltw7;)V

    return-void

    :pswitch_22e
    check-cast p0, Lfka;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lfka;->n(Ltw7;)V

    return-void

    :pswitch_23b
    check-cast p0, Lfka;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lfka;->n(Ltw7;)V

    return-void

    :pswitch_248
    check-cast p0, Lr02;

    iput-object v3, p0, Lr02;->c:Loml;

    invoke-virtual {p0}, Lr02;->i()V

    iget-object p0, p0, Lr02;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->clear()V

    return-void

    nop

    :pswitch_data_256
    .packed-switch 0x0
        :pswitch_248
        :pswitch_23b
        :pswitch_22e
        :pswitch_221
        :pswitch_214
        :pswitch_207
        :pswitch_1fa
        :pswitch_1f2
        :pswitch_1ec
        :pswitch_1e4
        :pswitch_1dc
        :pswitch_1a0
        :pswitch_16a
        :pswitch_15c
        :pswitch_147
        :pswitch_13f
        :pswitch_133
        :pswitch_12b
        :pswitch_11d
        :pswitch_115
        :pswitch_10d
        :pswitch_a4
        :pswitch_8c
        :pswitch_68
        :pswitch_4d
        :pswitch_40
        :pswitch_3a
        :pswitch_2d
        :pswitch_19
    .end packed-switch
.end method
