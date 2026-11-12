.class public final synthetic Lva2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lla2;
.implements Ln5o;
.implements Lykj;
.implements Lcom/opera/android/autofill/AutofillManager$AutofillCallback;
.implements Ltj9;
.implements Lxjj;
.implements Lqcf;
.implements Lm9n;
.implements Lpnn;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Llkm;
.implements Lbcf;
.implements Lnl5;
.implements Lvwh;
.implements Lm94;
.implements Ltya;
.implements Lvlf;
.implements Lyjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lva2;->a:B

    iput-object p1, p0, Lva2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final R(Ljava/util/ArrayList;)V
    .registers 2

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lgn3;

    iget-object p0, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-static {p1}, Lalo;->j(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/h;->e(Ljava/util/AbstractList;)V

    return-void
.end method

.method public final a(Landroid/app/Dialog;)V
    .registers 2

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    iget-object p0, p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->l:Ld5o;

    iget-object p0, p0, Ld5o;->a:Ljava/lang/Object;

    check-cast p0, Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Lmi;

    iget-object p0, p0, Lmi;->D:Lxm5;

    invoke-virtual {p0, p1}, Lxm5;->v(Landroid/app/Dialog;)V

    return-void
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 10

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lwg4;

    iget-object v0, p0, Lwg4;->n:Lcf4;

    invoke-virtual {v0}, Lcf4;->f()V

    iget-object v0, p0, Lwg4;->o:Lzyk;

    invoke-virtual {v0}, Lzyk;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lwg4;->o:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8i;

    iget-object v1, v0, Lf8i;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1c
    iget-object v2, v0, Lf8i;->b:Lc8i;

    invoke-virtual {v2}, Landroid/view/OrientationEventListener;->disable()V

    iget-object v2, v0, Lf8i;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->clear()V

    const/4 v2, -0x1

    iput v2, v0, Lf8i;->d:I
    :try_end_29
    .catchall {:try_start_1c .. :try_end_29} :catchall_2b

    monitor-exit v1

    goto :goto_2e

    :catchall_2b
    move-exception p0

    monitor-exit v1

    throw p0

    :cond_2e
    :goto_2e
    iget-object v0, p0, Lwg4;->a:Lhf4;

    iget-object v1, v0, Lhf4;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_33
    iget-object v2, v0, Lhf4;->b:Ljava/util/LinkedHashMap;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    iget-object v3, v0, Lhf4;->d:Lo94;

    if-eqz v2, :cond_43

    if-nez v3, :cond_41

    sget-object v3, Lq0b;->c:Lq0b;

    :cond_41
    monitor-exit v1

    goto :goto_ab

    :cond_43
    if-nez v3, :cond_71

    new-instance v2, Ll94;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    new-instance v3, Lbyh;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, v2, Ll94;->c:Lbyh;

    new-instance v3, Lo94;

    invoke-direct {v3, v2}, Lo94;-><init>(Ll94;)V

    iput-object v3, v2, Ll94;->b:Lo94;

    const-class v4, Lvep;

    iput-object v4, v2, Ll94;->a:Ljava/lang/Object;
    :try_end_5c
    .catchall {:try_start_33 .. :try_end_5c} :catchall_bc

    :try_start_5c
    iget-object v4, v0, Lhf4;->a:Ljava/lang/Object;

    monitor-enter v4
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_5f} :catch_6b
    .catchall {:try_start_5c .. :try_end_5f} :catchall_bc

    :try_start_5f
    iput-object v2, v0, Lhf4;->e:Ll94;

    monitor-exit v4
    :try_end_62
    .catchall {:try_start_5f .. :try_end_62} :catchall_69

    :try_start_62
    const-string v4, "CameraRepository-deinit"

    iput-object v4, v2, Ll94;->a:Ljava/lang/Object;
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_66} :catch_6b
    .catchall {:try_start_62 .. :try_end_66} :catchall_bc

    goto :goto_6f

    :goto_67
    :try_start_67
    monitor-exit v4
    :try_end_68
    .catchall {:try_start_67 .. :try_end_68} :catchall_69

    :try_start_68
    throw v2
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_69} :catch_6b
    .catchall {:try_start_68 .. :try_end_69} :catchall_bc

    :catchall_69
    move-exception v2

    goto :goto_67

    :catch_6b
    move-exception v2

    :try_start_6c
    invoke-virtual {v3, v2}, Lo94;->a(Ljava/lang/Throwable;)Z

    :goto_6f
    iput-object v3, v0, Lhf4;->d:Lo94;

    :cond_71
    iget-object v2, v0, Lhf4;->c:Ljava/util/HashSet;

    iget-object v4, v0, Lhf4;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v2, v0, Lhf4;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_86
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lzd4;

    invoke-interface {v4}, Lzd4;->release()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v5

    new-instance v6, Lbi2;

    const/16 v7, 0x1b

    invoke-direct {v6, v0, v4, v7}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {}, Ln97;->a()Ln97;

    move-result-object v4

    invoke-interface {v5, v6, v4}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_86

    :cond_a5
    iget-object v0, v0, Lhf4;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    monitor-exit v1
    :try_end_ab
    .catchall {:try_start_6c .. :try_end_ab} :catchall_bc

    :goto_ab
    new-instance v0, Lbi2;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, p1, v1}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lwg4;->d:Ljava/util/concurrent/Executor;

    invoke-interface {v3, v0, p0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    const-string p0, "CameraX shutdownInternal"

    return-object p0

    :goto_ba
    :try_start_ba
    monitor-exit v1
    :try_end_bb
    .catchall {:try_start_ba .. :try_end_bb} :catchall_bc

    throw p0

    :catchall_bc
    move-exception p0

    goto :goto_ba
.end method

.method public final b(I)V
    .registers 6

    iget-byte v0, p0, Lva2;->a:B

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    check-cast p0, Lwo3;

    const/4 v0, 0x1

    if-ne p1, v0, :cond_25

    iget-object p1, p0, Lwo3;->t:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v2, "toolbar_bottom_actions"

    invoke-interface {v1, v2}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v1, v2}, Ly9j;->remove(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    :cond_1e
    iget-object p0, p0, Lwo3;->I:Lnp1;

    if-nez p0, :cond_23

    const/4 p0, 0x0

    :cond_23
    iput-boolean v0, p0, Lnp1;->a:Z

    :cond_25
    return-void

    :pswitch_26
    check-cast p0, Lth3;

    iget-object v0, p0, Lth3;->i:Lr1j;

    new-instance v1, Lbr;

    const/4 v2, 0x5

    invoke-direct {v1, p0, p1, v2}, Lbr;-><init>(Ljava/lang/Object;IB)V

    check-cast v0, Lorg/chromium/base/task/TaskRunnerImpl;

    invoke-virtual {v0, v1}, Lorg/chromium/base/task/TaskRunnerImpl;->r(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_36
    .packed-switch 0xf
        :pswitch_26
    .end packed-switch
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 11

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lyw;

    new-instance v0, Lal4;

    const v1, 0x7f0d007c

    const/4 v2, 0x0

    invoke-static {p1, v1, p1, v2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f0a01c8

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_3f

    const v1, 0x7f0a074c

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v6, :cond_3f

    const v1, 0x7f0a0ad7

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_3f

    new-instance v3, Lvs;

    move-object v4, p1

    check-cast v4, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/4 v8, 0x4

    invoke-direct/range {v3 .. v8}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, p0, v3}, Lal4;-><init>(Lyw;Lvs;)V

    return-object v0

    :cond_3f
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final d(I)V
    .registers 14

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lmr2;

    iget-object v0, p0, Lmr2;->y:Lfr2;

    iget-object v1, p0, Lmr2;->t:Lgw;

    iget-object v2, p0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    const/4 v3, 0x0

    if-nez v0, :cond_e

    move-object v0, v3

    :cond_e
    iget-object v4, p0, Lmr2;->x:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lfr2;->b(Ljava/lang/String;)I

    move-result v0

    iget-object v4, p0, Lmr2;->y:Lfr2;

    if-nez v4, :cond_19

    move-object v4, v3

    :cond_19
    invoke-virtual {v4, p1}, Lfr2;->a(I)Lgr2;

    move-result-object p1

    iget-object v4, p1, Lgr2;->a:Ljava/lang/String;

    const-string v5, "SELECT_BUTTON"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2a

    iput-object v3, p0, Lmr2;->x:Ljava/lang/String;

    return-void

    :cond_2a
    const-string v5, "ADD_BUTTON"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    sget-object v5, Lyp2;->d:Lyp2;

    sget-object v6, Lyp2;->c:Lyp2;

    sget-object v7, Lyp2;->a:Lyp2;

    const/16 v8, 0x1003

    if-eqz v4, :cond_92

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    iget-object v4, p0, Lmr2;->r:Lorm;

    new-instance v9, Lir2;

    invoke-direct {v9, p0}, Lir2;-><init>(Lmr2;)V

    iget-object v10, p0, Lmr2;->u:Lcr2;

    if-nez v10, :cond_4a

    move-object v10, v3

    :cond_4a
    iget-object v10, v10, Lcr2;->i:Landroid/view/View;

    check-cast v10, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v10}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lkp2;

    invoke-static {v10}, Lyi4;->n(Ljava/lang/String;)Lcom/opera/android/autofill/Address;

    move-result-object v10

    invoke-direct {v11, v4, v2, v1, v10}, Lkp2;-><init>(Lorm;Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V

    iput-object v9, v11, Liq2;->F:Les2;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result v2

    if-nez v2, :cond_77

    iput-object v1, v11, Liq2;->K:Ljava/util/HashSet;

    :cond_77
    invoke-static {v11, v8}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v1

    invoke-virtual {v1, p1}, Lzhj;->c(Landroid/content/Context;)V

    iget-object p1, p0, Lmr2;->w:Lro9;

    if-nez p1, :cond_83

    move-object p1, v3

    :cond_83
    iget-object p0, p0, Lmr2;->y:Lfr2;

    if-eqz p0, :cond_88

    move-object v3, p0

    :cond_88
    invoke-virtual {v3, v0}, Lfr2;->a(I)Lgr2;

    move-result-object p0

    iget-object p0, p0, Lgr2;->b:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0, p0}, Lro9;->a0(ILjava/lang/CharSequence;)V

    return-void

    :cond_92
    iget-object v4, p1, Lgr2;->c:Lcom/opera/android/autofill/Address;

    if-eqz v4, :cond_e2

    invoke-static {v2, v4}, Lqbe;->W(Lcom/opera/android/autofill/AutofillManager;Lcom/opera/android/autofill/Address;)I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_a5

    iget-object p1, p1, Lgr2;->a:Ljava/lang/String;

    iput-object p1, p0, Lmr2;->x:Ljava/lang/String;

    invoke-virtual {p0}, Lmr2;->M0()V

    return-void

    :cond_a5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    iget-object v9, p0, Lmr2;->A:Lhr2;

    new-instance v10, Lds2;

    invoke-direct {v10, v2, v1, v4}, Lds2;-><init>(Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v10}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result v2

    if-nez v2, :cond_c6

    iput-object v1, v10, Liq2;->K:Ljava/util/HashSet;

    :cond_c6
    iput-object v9, v10, Liq2;->F:Les2;

    invoke-static {v10, v8}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v1

    invoke-virtual {v1, p1}, Lzhj;->c(Landroid/content/Context;)V

    iget-object p1, p0, Lmr2;->w:Lro9;

    if-nez p1, :cond_d4

    move-object p1, v3

    :cond_d4
    iget-object p0, p0, Lmr2;->y:Lfr2;

    if-eqz p0, :cond_d9

    move-object v3, p0

    :cond_d9
    invoke-virtual {v3, v0}, Lfr2;->a(I)Lgr2;

    move-result-object p0

    iget-object p0, p0, Lgr2;->b:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0, p0}, Lro9;->a0(ILjava/lang/CharSequence;)V

    :cond_e2
    return-void
.end method

.method public final e(II)V
    .registers 4

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/AspectRatioViewPager;

    sget v0, Lcom/opera/android/widget/AspectRatioViewPager;->d:I

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/widget/AspectRatioViewPager;->s(II)V

    return-void
.end method

.method public final f(Lo93;)V
    .registers 3

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lcx3;

    iget-object p0, p0, Lcx3;->c:Ldx3;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lfd2;

    invoke-interface {p0, p1}, Lfd2;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final h(Lpc;)Lxc;
    .registers 4

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lyo3;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2a

    const/4 v1, 0x5

    if-eq v0, v1, :cond_27

    const/16 v1, 0x1c

    if-eq v0, v1, :cond_15

    iget-object p0, p1, Lpc;->a:Lxc;

    return-object p0

    :cond_15
    iget-object p0, p0, Lyo3;->e:Ljt3;

    iget-object p0, p0, Ljt3;->f:Lfd;

    sget-object p1, Lpc;->m:Lpc;

    invoke-virtual {p0, p1}, Lfd;->e(Lpc;)Ljf;

    move-result-object p0

    if-eqz p0, :cond_24

    sget-object p0, Lxc;->J:Lxc;

    return-object p0

    :cond_24
    sget-object p0, Lxc;->K:Lxc;

    return-object p0

    :cond_27
    sget-object p0, Lxc;->K:Lxc;

    return-object p0

    :cond_2a
    sget-object p0, Lxc;->L:Lxc;

    return-object p0
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 9

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lws2;

    check-cast p1, Lru2;

    check-cast p2, Lzs2;

    iget p0, p0, Lws2;->f:I

    iget-object v0, p2, Lzs2;->c:Lor2;

    iput-object p1, p2, Lzs2;->d:Lru2;

    iget-object v1, p1, Lru2;->c:Ljava/lang/String;

    iget-object v2, p1, Lru2;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1e

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_27

    :cond_1e
    iget-object v3, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v3, Landroid/widget/Space;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_27
    invoke-static {v1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xa

    if-eq p0, v3, :cond_3e

    const/4 v3, 0x5

    if-ne p0, v3, :cond_41

    :cond_3e
    move-object v5, v2

    move-object v2, v1

    move-object v1, v5

    :cond_41
    iget-object p0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    iget-object v3, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    invoke-static {p0, v1}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p0, p2, Lzs2;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget p1, p1, Lru2;->d:I

    invoke-static {p0, p1}, Lj14;->b0(Lcom/opera/android/browser/chromium/ChromiumContent;I)Llxh;

    move-result-object p0

    if-eqz p0, :cond_70

    iget-object p1, v0, Lor2;->c:Landroid/view/View;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p0, 0x0

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_70
    return-void
.end method

.method public final j()V
    .registers 1

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lz43;

    invoke-virtual {p0}, Lz43;->d()V

    return-void
.end method

.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lig2;

    iget p0, p0, Lig2;->K:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final l(La4g;)V
    .registers 5

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Ljh3;

    iget-object v0, p0, Ljh3;->v:Ld83;

    iget-object v1, v0, Ld83;->b:Ljava/lang/Object;

    check-cast v1, La4g;

    if-eq v1, p1, :cond_32

    iput-object p1, v0, Ld83;->b:Ljava/lang/Object;

    iget-object v1, v0, Ld83;->d:Ljava/lang/Object;

    check-cast v1, Lwth;

    const/4 v2, 0x0

    if-eqz v1, :cond_19

    iput-object v2, v1, Lwth;->b:Ljava/lang/Object;

    iput-object v2, v0, Ld83;->d:Ljava/lang/Object;

    :cond_19
    if-nez p1, :cond_1e

    iput-object v2, v0, Ld83;->c:Ljava/util/List;

    goto :goto_2f

    :cond_1e
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, v0, Ld83;->b:Ljava/lang/Object;

    check-cast v2, La4g;

    iget-object v2, v2, La4g;->a:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Ld83;->c:Ljava/util/List;

    :goto_2f
    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    :cond_32
    iget-object p0, p0, Ljh3;->G:Lyz7;

    iget-boolean v0, p0, Lyz7;->d:Z

    if-nez v0, :cond_3d

    if-eqz p1, :cond_3d

    invoke-virtual {p0}, Lyz7;->c()V

    :cond_3d
    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 9

    iget-byte p1, p0, Lva2;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_5c

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0700a5

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object v1

    if-eqz v1, :cond_2f

    const/16 v0, 0x287

    iget-object v1, v1, Lg3o;->a:Ld3o;

    invoke-virtual {v1, v0}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v1, v0, Lr9b;->a:I

    iget v2, v0, Lr9b;->c:I

    iget v0, v0, Lr9b;->d:I

    move v5, v1

    move v1, v0

    move v0, v5

    goto :goto_31

    :cond_2f
    move v1, v0

    move v2, v1

    :goto_31
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v4, :cond_45

    move-object v4, v3

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    add-int/2addr v0, p1

    iput v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr p1, v2

    iput p1, v4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {p0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_45
    invoke-static {v1, p0}, Lp37;->p0(ILandroid/view/View;)V

    return-object p2

    :pswitch_49
    check-cast p0, Lcom/opera/android/bar/BottomBar;

    sget-boolean p1, Lcom/opera/android/bar/BottomBar;->r:Z

    const/16 p1, 0x8a

    iget-object v1, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v1, p1}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->d:I

    invoke-virtual {p0, v0, v0, v0, p1}, Landroid/view/View;->setPadding(IIII)V

    return-object p2

    nop

    :pswitch_data_5c
    .packed-switch 0x14
        :pswitch_49
    .end packed-switch
.end method

.method public final m(I)V
    .registers 4

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lim3;

    iput p1, p0, Lim3;->y:I

    iget-object v0, p0, Lim3;->z:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "bookmarks_sort_order"

    invoke-static {p1}, Lfki;->i(I)I

    move-result p1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Lim3;->x:Lgn3;

    iget-object p1, p1, Lgn3;->s:Lxm3;

    if-eqz p1, :cond_2c

    iget p0, p0, Lim3;->y:I

    iput p0, p1, Lxm3;->i:I

    invoke-virtual {p1}, Lxm3;->J()V

    :cond_2c
    return-void
.end method

.method public final o(Luya;)V
    .registers 7

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Ligi;

    const-string v0, "Failed to acquire latest image"

    const/4 v1, 0x0

    const/4 v2, 0x2

    :try_start_8
    invoke-interface {p1}, Luya;->e()Lqya;

    move-result-object p1

    iget-object v3, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v3, Ls1h;

    if-eqz p1, :cond_16

    invoke-virtual {p0, p1}, Ligi;->Y(Lqya;)V

    return-void

    :cond_16
    if-eqz v3, :cond_61

    iget p1, v3, Ls1h;->a:I

    new-instance v3, Lgwa;

    invoke-direct {v3, v2, v0, v1}, Lgwa;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lxug;->i()V

    iget-object v3, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v3, Ls1h;

    if-eqz v3, :cond_61

    iget v4, v3, Ls1h;->a:I

    if-ne v4, p1, :cond_61

    iget-object p1, v3, Ls1h;->f:Lxwh;

    invoke-static {}, Lxug;->i()V

    iget-boolean p1, p1, Lxwh;->f:Z

    if-nez p1, :cond_61

    invoke-static {}, Lxug;->i()V
    :try_end_38
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_38} :catch_39

    throw v1

    :catch_39
    move-exception p1

    iget-object v3, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v3, Ls1h;

    if-eqz v3, :cond_61

    iget v3, v3, Ls1h;->a:I

    new-instance v4, Lgwa;

    invoke-direct {v4, v2, v0, p1}, Lgwa;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lxug;->i()V

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Ls1h;

    if-eqz p0, :cond_61

    iget p1, p0, Ls1h;->a:I

    if-ne p1, v3, :cond_61

    iget-object p0, p0, Ls1h;->f:Lxwh;

    invoke-static {}, Lxug;->i()V

    iget-boolean p0, p0, Lxwh;->f:Z

    if-nez p0, :cond_61

    invoke-static {}, Lxug;->i()V

    throw v1

    :cond_61
    return-void
.end method

.method public final onAdded(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Lva2;->a:B

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_32

    check-cast p0, Lnp2;

    iget-object p0, p0, Lnp2;->y:Lorm;

    sget-object p1, Lg80;->d:Lg80;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->y(Lg80;)V

    return-void

    :pswitch_13
    check-cast p0, Lmp2;

    iget-object p0, p0, Lmr2;->r:Lorm;

    sget-object p1, Lg80;->c:Lg80;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->y(Lg80;)V

    return-void

    :pswitch_1f
    check-cast p0, Lkp2;

    iget-object v0, p0, Liq2;->F:Les2;

    if-eqz v0, :cond_28

    invoke-interface {v0, p1}, Les2;->onAdded(Ljava/lang/String;)V

    :cond_28
    iget-object p0, p0, Lkp2;->L:Lorm;

    sget-object p1, Lg80;->b:Lg80;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->y(Lg80;)V

    return-void

    :pswitch_data_32
    .packed-switch 0x4
        :pswitch_1f
        :pswitch_13
    .end packed-switch
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 2

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lcn7;

    invoke-virtual {p0}, Lcn7;->run()V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 3

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lhu5;

    check-cast p1, Lcom/google/android/gms/auth/blockstore/RetrieveBytesResponse;

    invoke-virtual {p1}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesResponse;->getBlockstoreDataMap()Ljava/util/Map;

    move-result-object p1

    const-string v0, "com.google.android.gms.auth.blockstore.DEFAULT_BYTES_DATA_KEY"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/auth/blockstore/RetrieveBytesResponse$BlockstoreData;

    if-nez p1, :cond_1b

    const/4 p1, 0x0

    new-array p1, p1, [B

    invoke-virtual {p0, p1}, Lhu5;->run(Ljava/lang/Object;)V

    return-void

    :cond_1b
    invoke-virtual {p1}, Lcom/google/android/gms/auth/blockstore/RetrieveBytesResponse$BlockstoreData;->getBytes()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lhu5;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lzk4;

    invoke-virtual {p0}, Lzk4;->I0()Ldl4;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "automatic_card_save_ask"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method
