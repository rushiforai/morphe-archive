.class public final Lxt2;
.super Lgcf;
.source "SourceFile"


# instance fields
.field public final synthetic Y:B

.field public final Z:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 28
    iput-byte p2, p0, Lxt2;->Y:B

    iput-object p1, p0, Lxt2;->Z:Ljava/lang/Object;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lgcf;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Lkcf;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lxt2;->Y:B

    .line 30
    iget-boolean v0, p1, Lkcf;->c:Z

    .line 31
    invoke-direct {p0, v0}, Lgcf;-><init>(Z)V

    .line 32
    iput-object p1, p0, Lxt2;->Z:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lml6;)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Lxt2;->Y:B

    invoke-virtual {p1}, Lml6;->e()Z

    move-result v0

    invoke-direct {p0, v0}, Lgcf;-><init>(Z)V

    iput-object p1, p0, Lxt2;->Z:Ljava/lang/Object;

    new-instance v0, Lo5f;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lml6;->c:Ljava/util/Set;

    invoke-static {p0, v0}, Lb5j;->f(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    move-result-object p0

    iput-object p0, p1, Lml6;->c:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lqf5;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lxt2;->Y:B

    iput-object p1, p0, Lxt2;->Z:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 29
    invoke-direct {p0, p1}, Lgcf;-><init>(Z)V

    return-void
.end method

.method private final m()V
    .registers 1

    return-void
.end method

.method private final q(Ljz2;)V
    .registers 2

    return-void
.end method

.method private final r(Ljz2;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final handleOnBackCancelled()V
    .registers 2

    iget-byte v0, p0, Lxt2;->Y:B

    iget-object p0, p0, Lxt2;->Z:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_2a

    return-void

    :sswitch_8
    check-cast p0, Lml6;

    iget-object v0, p0, Lml6;->b:Lz8b;

    if-eqz v0, :cond_1b

    iget-object v0, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v0, Lgz2;

    if-eqz v0, :cond_1b

    iget-object v0, v0, Lgz2;->f:Lq2;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Lq2;->invoke()Ljava/lang/Object;

    :cond_1b
    const/4 v0, 0x0

    iput-object v0, p0, Lml6;->b:Lz8b;

    return-void

    :sswitch_1f
    check-cast p0, Lkcf;

    invoke-virtual {p0}, Lkcf;->c()Licf;

    move-result-object p0

    invoke-virtual {p0}, Lbke;->a()V

    :sswitch_28
    return-void

    nop

    :sswitch_data_2a
    .sparse-switch
        0x1 -> :sswitch_28
        0x3 -> :sswitch_1f
        0x7 -> :sswitch_8
    .end sparse-switch
.end method

.method public final handleOnBackPressed()V
    .registers 6

    iget-byte v0, p0, Lxt2;->Y:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lxt2;->Z:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_140

    check-cast v4, Lcom/opera/android/webapps/WebappActivity;

    invoke-virtual {v4}, Ldx3;->S()Leq9;

    move-result-object p0

    iget-object p0, p0, Leq9;->a:Ld37;

    invoke-virtual {p0}, Ld37;->p()Z

    move-result p0

    if-eqz p0, :cond_27

    iget-object p0, v4, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget p0, p0, Lryn;->l:I

    const/4 v0, 0x4

    if-eq p0, v0, :cond_27

    invoke-virtual {v4}, Ldx3;->S()Leq9;

    move-result-object p0

    invoke-virtual {p0}, Leq9;->b()V

    goto :goto_78

    :cond_27
    invoke-virtual {v4}, Lcom/opera/android/webapps/WebappActivity;->f0()Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object p0

    if-eqz p0, :cond_78

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iget-boolean v0, v0, Lnp1;->a:Z

    if-eqz v0, :cond_3b

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->stop()V

    goto :goto_78

    :cond_3b
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_5f

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/NavigationController;->f()Z

    move-result v0

    if-eqz v0, :cond_5f

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_78

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->f()Z

    move-result v0

    if-eqz v0, :cond_78

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->e()V

    goto :goto_78

    :cond_5f
    invoke-virtual {v4}, Ldx3;->W()Lk6l;

    move-result-object p0

    if-eqz p0, :cond_71

    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v3, :cond_71

    iget-object v0, p0, Lk6l;->o:Lb2l;

    if-nez v0, :cond_75

    :cond_71
    invoke-virtual {v4, v3}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    goto :goto_78

    :cond_75
    invoke-virtual {p0, v0}, Lk6l;->k(Lb2l;)V

    :cond_78
    :goto_78
    return-void

    :pswitch_79
    check-cast v4, Lcom/opera/android/uninstall/UninstallActivity;

    iget-object p0, v4, Lcom/opera/android/uninstall/UninstallActivity;->c:Lpad;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Ll24;

    if-eqz p0, :cond_86

    invoke-interface {p0}, Ll24;->u()Z

    :cond_86
    return-void

    :pswitch_87
    check-cast v4, Lh51;

    invoke-virtual {v4, p0}, Lh51;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_8d
    check-cast v4, Lml6;

    invoke-virtual {v4}, Lml6;->d()V

    return-void

    :pswitch_93
    check-cast v4, Lt5d;

    iget-object p0, v4, Lt5d;->u:Lpad;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Ll24;

    if-eqz p0, :cond_a1

    invoke-interface {p0}, Ll24;->u()Z

    move-result v2

    :cond_a1
    if-nez v2, :cond_a6

    invoke-virtual {v4, v3}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    :cond_a6
    return-void

    :pswitch_a7
    check-cast v4, Lywa;

    invoke-virtual {v4}, Lywa;->g0()Llxa;

    move-result-object p0

    invoke-virtual {p0}, Llxa;->g()V

    return-void

    :pswitch_b1
    check-cast v4, Lcom/opera/android/FullscreenWebActivity;

    iget-object p0, v4, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    if-eqz p0, :cond_bb

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v1

    :cond_bb
    invoke-virtual {v4, v1}, Lcom/opera/android/FullscreenWebActivity;->o0(Lorg/chromium/content_public/browser/NavigationController;)Z

    move-result p0

    if-nez p0, :cond_c4

    invoke-virtual {v4}, Landroid/app/Activity;->finish()V

    :cond_c4
    return-void

    :pswitch_c5
    check-cast v4, Lkcf;

    invoke-virtual {v4}, Lkcf;->d()V

    return-void

    :pswitch_cb
    check-cast v4, Lc76;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    if-eqz p0, :cond_122

    iget-object v0, p0, Lbl9;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    iget-object v2, p0, Lbl9;->g:Ljava/lang/Object;

    check-cast v2, Lzm9;

    if-nez v2, :cond_122

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v2

    if-le v2, v3, :cond_122

    new-instance v2, Lmn9;

    invoke-direct {v2, v1, v3, v1}, Lmn9;-><init>(Ls65;ZLx65;)V

    iget-object v1, p0, Lbl9;->g:Ljava/lang/Object;

    check-cast v1, Lzm9;

    if-eqz v1, :cond_f5

    invoke-virtual {v1, v3}, Lzm9;->b(Z)V

    :cond_f5
    iput-boolean v3, p0, Lbl9;->b:Z

    iput-object v2, p0, Lbl9;->g:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    iget-object v3, p0, Lbl9;->c:Ljava/lang/Object;

    check-cast v3, Landroidx/fragment/app/w;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Landroidx/fragment/app/a;

    invoke-direct {v4, v3}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    invoke-virtual {v4, v0}, Landroidx/fragment/app/a;->o(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;

    invoke-virtual {p0, v4}, Lbl9;->a(Landroidx/fragment/app/a;)V

    new-instance v3, Liv;

    invoke-direct {v3, p0, v2, v1}, Liv;-><init>(Lbl9;Lmn9;Landroidx/fragment/app/Fragment;)V

    iput-object v0, v2, Lzm9;->c:Ljava/lang/Object;

    iput-object v1, v2, Lzm9;->b:Ljava/lang/Object;

    iput-object v3, v2, Lzm9;->d:Ljava/lang/Object;

    :cond_122
    return-void

    :pswitch_123
    check-cast v4, Lqf5;

    iget-object p0, v4, Lqf5;->c:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_12b
    check-cast v4, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    iget-object p0, v4, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->m:Lpad;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Ll24;

    if-eqz p0, :cond_139

    invoke-interface {p0}, Ll24;->u()Z

    move-result v2

    :cond_139
    if-nez v2, :cond_13e

    invoke-virtual {v4}, Landroid/app/Activity;->finish()V

    :cond_13e
    return-void

    nop

    :pswitch_data_140
    .packed-switch 0x0
        :pswitch_12b
        :pswitch_123
        :pswitch_cb
        :pswitch_c5
        :pswitch_b1
        :pswitch_a7
        :pswitch_93
        :pswitch_8d
        :pswitch_87
        :pswitch_79
    .end packed-switch
.end method

.method public final handleOnBackProgressed(Ljz2;)V
    .registers 9

    iget-byte v0, p0, Lxt2;->Y:B

    iget-object p0, p0, Lxt2;->Z:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_42

    return-void

    :sswitch_8
    check-cast p0, Lml6;

    new-instance v0, Liz2;

    iget v1, p1, Ljz2;->c:F

    iget v2, p1, Ljz2;->d:I

    if-eqz v2, :cond_1b

    const/4 v3, 0x1

    if-eq v2, v3, :cond_18

    sget-object v2, Lhz2;->a:Lhz2;

    goto :goto_1d

    :cond_18
    sget-object v2, Lhz2;->c:Lhz2;

    goto :goto_1d

    :cond_1b
    sget-object v2, Lhz2;->b:Lhz2;

    :goto_1d
    iget v3, p1, Ljz2;->a:F

    iget p1, p1, Ljz2;->b:F

    invoke-direct {v0, v1, v2, v3, p1}, Liz2;-><init>(FLhz2;FF)V

    invoke-virtual {p0, v0}, Lml6;->g(Liz2;)V

    return-void

    :sswitch_28
    check-cast p0, Lkcf;

    invoke-virtual {p0}, Lkcf;->c()Licf;

    move-result-object p0

    iget v2, p1, Ljz2;->a:F

    iget v3, p1, Ljz2;->b:F

    iget v1, p1, Ljz2;->c:F

    iget v4, p1, Ljz2;->d:I

    iget-wide v5, p1, Ljz2;->e:J

    new-instance v0, Lwje;

    invoke-direct/range {v0 .. v6}, Lwje;-><init>(FFFIJ)V

    invoke-virtual {p0, v0}, Lbke;->c(Lwje;)V

    :sswitch_40
    return-void

    nop

    :sswitch_data_42
    .sparse-switch
        0x1 -> :sswitch_40
        0x3 -> :sswitch_28
        0x7 -> :sswitch_8
    .end sparse-switch
.end method

.method public final handleOnBackStarted(Ljz2;)V
    .registers 11

    iget-byte v0, p0, Lxt2;->Y:B

    const/4 v1, 0x1

    iget-object p0, p0, Lxt2;->Z:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_66

    return-void

    :sswitch_9
    check-cast p0, Lml6;

    new-instance v0, Liz2;

    iget v2, p1, Ljz2;->c:F

    iget v3, p1, Ljz2;->d:I

    if-eqz v3, :cond_1b

    if-eq v3, v1, :cond_18

    sget-object v1, Lhz2;->a:Lhz2;

    goto :goto_1d

    :cond_18
    sget-object v1, Lhz2;->c:Lhz2;

    goto :goto_1d

    :cond_1b
    sget-object v1, Lhz2;->b:Lhz2;

    :goto_1d
    iget v3, p1, Ljz2;->a:F

    iget p1, p1, Ljz2;->b:F

    invoke-direct {v0, v2, v1, v3, p1}, Liz2;-><init>(FLhz2;FF)V

    iget-object p1, p0, Lml6;->a:Ljava/util/Set;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lxvg;->o(Ljava/lang/Iterable;)Lgz2;

    move-result-object p1

    if-eqz p1, :cond_3c

    new-instance v1, Lz8b;

    invoke-direct {v1, v0, p1}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v1, p0, Lml6;->b:Lz8b;

    iget-object p0, p1, Lgz2;->d:Lxm6;

    if-eqz p0, :cond_3c

    invoke-virtual {p0, v0}, Lxm6;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3c
    return-void

    :sswitch_3d
    check-cast p0, Lkcf;

    invoke-virtual {p0}, Lkcf;->c()Licf;

    move-result-object p0

    iget v4, p1, Ljz2;->a:F

    iget v5, p1, Ljz2;->b:F

    iget v3, p1, Ljz2;->c:F

    iget v6, p1, Ljz2;->d:I

    iget-wide v7, p1, Ljz2;->e:J

    new-instance v2, Lwje;

    invoke-direct/range {v2 .. v8}, Lwje;-><init>(FFFIJ)V

    iget-object p1, p0, Lbke;->a:Lxje;

    if-eqz p1, :cond_60

    iget-boolean v0, p0, Lbke;->b:Z

    if-nez v0, :cond_65

    invoke-virtual {p1, p0, v2}, Lxje;->d(Lbke;Lwje;)V

    iput-boolean v1, p0, Lbke;->b:Z

    goto :goto_65

    :cond_60
    const-string p0, "This input is not added to any dispatcher."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_65
    :goto_65
    :sswitch_65
    return-void

    :sswitch_data_66
    .sparse-switch
        0x1 -> :sswitch_65
        0x3 -> :sswitch_3d
        0x7 -> :sswitch_9
    .end sparse-switch
.end method
