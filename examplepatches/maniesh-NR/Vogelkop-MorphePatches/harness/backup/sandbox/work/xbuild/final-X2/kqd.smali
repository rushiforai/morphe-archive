.class public final synthetic Lkqd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltqd;
.implements Ltya;
.implements Lm94;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lnbd;
.implements Lg94;
.implements Lwqe;
.implements Ln5o;
.implements Li82;
.implements Lcom/opera/android/notifications/NotificationBridge$Callback;
.implements Lm9n;
.implements Lekj;
.implements Lo9n;
.implements Ljz3;
.implements Lykj;
.implements Lhxj;
.implements Lvlf;
.implements Lii2;
.implements Lcom/opera/android/browser/SimpleUrlLoader$MimeTypeFilter;
.implements Lb27;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lkqd;->a:B

    iput-object p1, p0, Lkqd;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lvhe;Lpqo;)V
    .registers 3

    const/4 p1, 0x7

    iput-byte p1, p0, Lkqd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lkqd;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Llz3;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lcom/opera/android/bubbleview/BubbleView;
    .registers 11

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Ltjf;

    iget-object v0, p0, Ltjf;->e:Lsjf;

    invoke-virtual {p1, v0}, Llz3;->a(Lkz3;)V

    const p1, 0x7f0d030b

    const/4 v0, 0x0

    invoke-virtual {p2, p1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0046

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/google/android/material/button/MaterialButton;

    const/4 v1, 0x0

    if-eqz p3, :cond_c5

    const p2, 0x7f0a0231

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v2, :cond_c5

    const p2, 0x7f0a026e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v3, :cond_c5

    const p2, 0x7f0a050e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v3, :cond_c5

    const p2, 0x7f0a06b5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_c5

    const p2, 0x7f0a0adc

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_c5

    const p2, 0x7f0a06c5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_c5

    check-cast p1, Lcom/opera/android/bubbleview/BubbleView;

    iget-object p0, p0, Ltjf;->c:Lx1p;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p0, p2}, Lx1p;->A(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_73

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_73
    invoke-virtual {p0, p2}, Lx1p;->B(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v4, :cond_7f

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_7f
    invoke-virtual {p0, p2}, Lx1p;->z(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v4, :cond_8b

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_8b
    invoke-virtual {p0, p2}, Lx1p;->v(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_b9

    invoke-virtual {p3, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lx1p;->u()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_b9

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-static {v3, p2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_b9

    invoke-virtual {p3, p2}, Lcom/google/android/material/button/MaterialButton;->D(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lx1p;->o()Z

    move-result p2

    if-nez p2, :cond_b9

    iget-object p2, p3, Lcom/google/android/material/button/MaterialButton;->i:Landroid/content/res/ColorStateList;

    if-eqz p2, :cond_b9

    iput-object v1, p3, Lcom/google/android/material/button/MaterialButton;->i:Landroid/content/res/ColorStateList;

    invoke-virtual {p3, v0}, Lcom/google/android/material/button/MaterialButton;->K(Z)V

    :cond_b9
    invoke-virtual {p0}, Lx1p;->x()Z

    move-result p0

    if-nez p0, :cond_c4

    const/16 p0, 0x8

    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_c4
    return-object p1

    :cond_c5
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 12

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/readlater/MigrationWorker;

    iget-object v0, p0, Lcom/opera/android/readlater/MigrationWorker;->f:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsyd;

    iget-object v1, p0, Lcom/opera/android/readlater/MigrationWorker;->e:Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lglh;

    new-instance v1, Lesg;

    const/16 v2, 0x18

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, p1, v3}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v2, Lwyd;

    move v4, v3

    iget-object v3, v0, Lsyd;->a:Landroid/content/Context;

    move v5, v4

    iget-object v4, v0, Lsyd;->b:Lcom/opera/android/settings/SettingsManager;

    move v7, v5

    iget-object v5, v0, Lsyd;->d:Ljava/util/concurrent/ExecutorService;

    move v8, v7

    new-instance v7, Lpad;

    const/16 v9, 0x17

    invoke-direct {v7, v9, v0, v1, v8}, Lpad;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-direct/range {v2 .. v7}, Lwyd;-><init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Ljava/util/concurrent/ExecutorService;Lglh;Lpad;)V

    iget-object v0, v0, Lsyd;->e:Lbpd;

    iget-object v1, v0, Lbpd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1, v2}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    iget-object v1, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast v1, Lwyd;

    if-nez v1, :cond_53

    iget-object v1, v0, Lbpd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwyd;

    iput-object v1, v0, Lbpd;->b:Ljava/lang/Object;

    if-eqz v1, :cond_53

    invoke-virtual {v1}, Lwyd;->run()V

    :cond_53
    new-instance v0, Luyd;

    const/4 v1, 0x1

    invoke-direct {v0, v2, v1}, Luyd;-><init>(Lwyd;B)V

    iget-object p0, p0, Lcom/opera/android/readlater/MigrationWorker;->g:Lbx1;

    invoke-virtual {p1, v0, p0}, Ll94;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b(Lhjm;)V
    .registers 3

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lpgf;

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_d

    sget-object p1, Lnl0;->d:Lnl0;

    invoke-virtual {p0, p1}, Lpgf;->c(Lnl0;)V

    :cond_d
    return-void
.end method

.method public final c()Lixj;
    .registers 9

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lq2f;

    new-instance v0, Lixj;

    iget-object v1, p0, Lq2f;->f:Lcom/opera/android/bar/OmniButtonView;

    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iget-object v3, p0, Lq2f;->f:Lcom/opera/android/bar/OmniButtonView;

    if-eqz v3, :cond_34

    invoke-virtual {v3, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v3

    if-eqz v3, :cond_34

    new-instance v3, Landroid/graphics/Rect;

    iget v4, v2, Landroid/graphics/Rect;->left:I

    iget v5, p0, Lq2f;->c:I

    add-int/2addr v4, v5

    iget v6, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v6, v5

    iget v7, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v7, v5

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v5

    invoke-direct {v3, v4, v6, v7, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    :goto_32
    move-object v2, v3

    goto :goto_36

    :cond_34
    const/4 v3, 0x0

    goto :goto_32

    :goto_36
    iget-object p0, p0, Lq2f;->f:Lcom/opera/android/bar/OmniButtonView;

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v5

    const/16 v6, 0xc0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Lixj;-><init>(ILandroid/graphics/Rect;IIZI)V

    return-object v0
.end method

.method public final d(Loqe;)Lj82;
    .registers 3

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lvue;

    instance-of v0, p1, Lere;

    if-nez v0, :cond_11

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lvue;->t(Loqe;Z)I

    move-result v0

    if-nez v0, :cond_11

    const/4 p0, 0x0

    return-object p0

    :cond_11
    iget-object p0, p0, Liu8;->f:Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1, p0, v0}, Lpue;->e(Loqe;Ljava/lang/String;Z)Lpue;

    move-result-object p0

    return-object p0
.end method

.method public final e(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lkqd;->a:B

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lpce;

    check-cast p2, Ljava/util/Collection;

    check-cast p2, Ljava/util/List;

    new-instance v0, Loce;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Loce;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, p2}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object p0

    return-object p0

    :pswitch_18
    check-cast p0, Lb10;

    invoke-virtual {p0, p2}, Lb10;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x4
        :pswitch_18
    .end packed-switch
.end method

.method public final f(I)V
    .registers 4

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lmyf;

    invoke-virtual {p0}, Lmyf;->d()V

    const/4 v0, 0x0

    iput-object v0, p0, Lmyf;->f:Lpi2;

    const/4 v1, 0x1

    if-eq p1, v1, :cond_18

    const/4 v0, 0x2

    if-eq p1, v0, :cond_13

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1f

    :cond_13
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lmyf;->b(I)V

    return-void

    :cond_18
    invoke-virtual {p0}, Lmyf;->a()V

    iget-object p1, p0, Lmyf;->a:Ljxl;

    if-nez p1, :cond_20

    :cond_1f
    return-void

    :cond_20
    invoke-virtual {p1, p0, v1, v1}, Ljxl;->a(Lmyf;ZI)V

    iput-object v0, p0, Lmyf;->a:Ljxl;

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lkqd;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_b0

    move-object v4, p0

    check-cast v4, Lktf;

    check-cast p1, Ljava/lang/Void;

    :try_start_d
    iget-object p0, v4, Lktf;->b:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    new-instance p1, Lfvh;

    invoke-direct {p1}, Lfvh;-><init>()V

    sget-object v0, Lktf;->g:Lhra;

    iput-object v0, p1, Lfvh;->a:Lhra;

    const-string v0, "User-Agent"

    invoke-static {}, Lcqp;->i0()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lkvh;

    invoke-direct {v0, p1}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {p0, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    new-instance v2, Ls2e;

    const-class v5, Lktf;

    const-string v6, "processResponse"

    const-string v7, "processResponse-IoAF18A(Lokhttp3/Response;)Ljava/lang/Object;"

    const/4 v8, 0x0

    const/16 v9, 0x19

    const/4 v3, 0x1

    invoke-direct/range {v2 .. v9}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v7, Lw5f;

    const/16 p1, 0xc

    invoke-direct {v7, p1}, Lw5f;-><init>(B)V

    const-wide/16 v9, 0x0

    const/16 v11, 0x70

    const/4 v8, 0x1

    move-object v5, p0

    move-object v6, v2

    invoke-static/range {v5 .. v11}, Lvtp;->R(Lokhttp3/internal/connection/RealCall;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;IJI)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt0i;

    iget-object p0, p0, Lt0i;->a:Ljava/lang/Object;
    :try_end_55
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_55} :catch_56

    goto :goto_66

    :catch_56
    move-exception v0

    move-object p0, v0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Ljava/lang/Exception;

    const-string v0, "Cancelled"

    invoke-direct {p1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p0, Lq0i;

    invoke-direct {p0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :goto_66
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1

    :sswitch_6c
    check-cast p0, Lx77;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    if-eqz p1, :cond_81

    invoke-static {p0}, Lq9n;->H(Landroid/view/View;)Z

    goto :goto_84

    :cond_81
    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    :goto_84
    return-object v1

    :sswitch_85
    check-cast p0, Lh6f;

    check-cast p1, Landroid/util/Pair;

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {p0, v0, p1}, Lh6f;->d(ZZ)V

    return-object v1

    :sswitch_9d
    check-cast p0, Lhd;

    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string p1, "npt_unsent_fcm_token"

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_b0
    .sparse-switch
        0x9 -> :sswitch_9d
        0xc -> :sswitch_85
        0xe -> :sswitch_6c
    .end sparse-switch
.end method

.method public final h(Lxkg;Lnod;)V
    .registers 3

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lop5;

    invoke-interface {p0, p1}, Lop5;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method public final i(Ljava/lang/String;)Z
    .registers 3

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lt2g;

    const-string v0, "application/octet-stream"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1b

    check-cast p0, Lv2g;

    iget-object p0, p0, Lv2g;->b:Lkqd;

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    const/4 v0, 0x0

    iput-object v0, p0, Lx79;->c:Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lx79;->T(Z)V

    :cond_1b
    return p1
.end method

.method public final j()V
    .registers 1

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lgbf;

    invoke-virtual {p0}, Lgbf;->n()V

    return-void
.end method

.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaIntroView;

    sget p1, Lcom/opera/android/custom_views/OperaIntroView;->F:I

    iget-object p1, p0, Lcom/opera/android/custom_views/OperaIntroView;->y:Lnli;

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaIntroView;->B()F

    move-result p0

    iput p0, p1, Lnli;->a:F

    const/high16 p0, 0x3f800000    # 1.0f

    iput p0, p1, Lnli;->b:F

    return-object p1
.end method

.method public final l(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lkqd;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_f0

    check-cast p0, Lpqo;

    check-cast p1, Ljava/lang/String;

    invoke-static {p1, p0}, Lpoo;->a(Ljava/lang/String;Lpqo;)Luuj;

    move-result-object p1

    if-eqz p1, :cond_8b

    iget v0, p1, Luuj;->a:I

    iget-object p1, p1, Luuj;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    sget-object v2, Lbm;->d:Lbm;

    if-eqz v0, :cond_21

    invoke-static {v0}, Lbm;->d(I)Lbm;

    move-result-object v1

    goto :goto_2a

    :cond_21
    if-eqz p1, :cond_29

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2a

    :cond_29
    move-object v1, v2

    :cond_2a
    :goto_2a
    if-ne v1, v2, :cond_38

    iget-object p0, p0, Lpqo;->a:Ljava/lang/String;

    new-instance p1, Let2;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Let2;-><init>(Ljava/lang/String;B)V

    invoke-static {p1}, Lgxo;->a(Ljava/lang/Runnable;)V

    goto :goto_8b

    :cond_38
    if-nez v1, :cond_8b

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lvho;

    iget-object v0, p1, Lvho;->a:Lw06;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, v0, Ln06;

    if-eqz v0, :cond_8b

    invoke-virtual {p1}, Lvho;->b()Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p1, Lvho;->e:Lpqo;

    iget-object v1, v1, Lpqo;->a:Ljava/lang/String;

    invoke-static {v1}, Lvtp;->r(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lsjo;->a:Ljava/util/List;

    sget-object v3, Lphf;->a:Lx79;

    iget-object v4, v3, Lx79;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    const-string v5, "ad_config"

    invoke-virtual {v4, v5, p0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4, v2, p0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v1}, Lvtp;->k(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, v3, Lx79;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    invoke-virtual {v3, v5, p0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-wide/16 v3, 0x0

    invoke-interface {p0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    if-eqz v0, :cond_88

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-ne p0, v2, :cond_88

    iget-wide v0, p1, Lvho;->d:J

    cmp-long p0, v3, v0

    if-eqz p0, :cond_8b

    :cond_88
    invoke-static {p1}, Lvtp;->s(Lvho;)V

    :cond_8b
    :goto_8b
    return-void

    :pswitch_8c
    check-cast p0, Lcie;

    check-cast p1, Lqio;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p1, Llio;

    if-nez v0, :cond_c4

    move-object v0, p1

    check-cast v0, Lmio;

    iget-object v0, v0, Lmio;->a:Ljava/lang/Object;

    check-cast v0, Lvho;

    if-eqz v0, :cond_ba

    iget-object v2, v0, Lvho;->b:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_ba

    iget-object v2, v0, Lvho;->a:Lw06;

    invoke-virtual {v0}, Lvho;->a()Llho;

    move-result-object v0

    invoke-virtual {p0, v1, v2, v0, v1}, Lcie;->f(Lpqo;Lw06;Llho;Lfio;)Z

    move-result v0

    if-eqz v0, :cond_ba

    iget-object v0, p0, Lbzo;->b:Lbn;

    invoke-interface {v0}, Lbn;->i()V

    goto :goto_c1

    :cond_ba
    iget-object v0, p0, Lbzo;->b:Lbn;

    sget-object v1, Lbm;->m:Lbm;

    invoke-interface {v0, v1}, Lbn;->m(Lbm;)V

    :goto_c1
    invoke-virtual {p0}, Lcie;->i()V

    :cond_c4
    instance-of v0, p1, Llio;

    if-eqz v0, :cond_ef

    check-cast p1, Llio;

    iget-object p1, p1, Llio;->a:Ljava/lang/Exception;

    check-cast p1, Lzno;

    iget-object p1, p1, Lzno;->a:Lbm;

    sget-object v0, Laie;->c:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_e7

    const/4 v1, 0x2

    if-eq v0, v1, :cond_e7

    const/4 v1, 0x3

    if-eq v0, v1, :cond_e7

    const/4 v1, 0x4

    if-eq v0, v1, :cond_e7

    const/4 v1, 0x5

    if-ne v0, v1, :cond_ef

    :cond_e7
    iget-object v0, p0, Lbzo;->b:Lbn;

    invoke-interface {v0, p1}, Lbn;->m(Lbm;)V

    invoke-virtual {p0}, Lcie;->i()V

    :cond_ef
    return-void

    :pswitch_data_f0
    .packed-switch 0x6
        :pswitch_8c
    .end packed-switch
.end method

.method public final m(Landroid/view/View;Lg3o;Lsv2;)Lg3o;
    .registers 4

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    iget-object p1, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p1}, Ld3o;->k()Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->d:I

    iput p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->i:I

    invoke-virtual {p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->O()V

    return-object p2
.end method

.method public final n(Ljava/lang/String;)Z
    .registers 4

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lta7;

    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "blacklisted_news_domains"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    if-nez p0, :cond_13

    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    :cond_13
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final o(Luya;)V
    .registers 4

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Ltxd;

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    iget v1, p0, Ltxd;->c:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Ltxd;->c:I

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_14

    invoke-virtual {p0, p1}, Ltxd;->d(Luya;)V

    return-void

    :goto_12
    :try_start_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_14

    throw p0

    :catchall_14
    move-exception p0

    goto :goto_12
.end method

.method public final onDone()V
    .registers 1

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/notifications/NotificationBridge$TrampolineActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lu85;

    check-cast p1, Lqop;

    invoke-virtual {p0, p1}, Lu85;->h(Lqop;)V

    return-void
.end method

.method public final p(Z)V
    .registers 7

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lq4g;

    iget-object v0, p0, Lq4g;->v:Lw3g;

    if-eqz p1, :cond_25

    iget-object p1, p0, Lq4g;->u:La4g;

    iget-object v1, p1, La4g;->a:Ljava/util/List;

    invoke-static {v1, v0}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v2

    iget-wide v3, p1, La4g;->b:J

    invoke-static {v3, v4, v2}, LJ/N;->MvKxovNE(JI)V

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object p1, p0, Lq4g;->C:Lp4g;

    if-eqz p1, :cond_1f

    invoke-interface {p1, v0}, Lp4g;->s(Lw3g;)V

    :cond_1f
    invoke-virtual {p0}, Lryl;->g0()V

    const/4 p1, 0x0

    iput-object p1, p0, Lq4g;->C:Lp4g;

    :cond_25
    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 5

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lywf;

    iget-object p1, p0, Lywf;->d:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "text_wrap"

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "reader_mode_text_wrap"

    if-eq p2, v0, :cond_24

    invoke-virtual {p0}, Lywf;->g()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-virtual {p1, p2, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_38

    :cond_1a
    invoke-virtual {p0}, Lywf;->e()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_38

    invoke-static {p1, p2}, LJ/N;->MeievuP3(Ljava/lang/Object;Z)V

    goto :goto_38

    :cond_24
    invoke-virtual {p0}, Lywf;->g()Z

    move-result p2

    if-eqz p2, :cond_2f

    const/4 p2, -0x1

    invoke-virtual {p1, p2, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_38

    :cond_2f
    invoke-virtual {p0}, Lywf;->e()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_38

    invoke-static {p1}, LJ/N;->M3MkeCX1(Ljava/lang/Object;)V

    :cond_38
    :goto_38
    invoke-virtual {p0}, Lywf;->h()V

    iget-object p1, p0, Lywf;->f:Ly83;

    if-nez p1, :cond_40

    const/4 p1, 0x0

    :cond_40
    iget-object p1, p1, Ly83;->g:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/slider/Slider;

    invoke-virtual {p1}, Lcom/google/android/material/slider/Slider;->z0()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Lywf;->j(I)V

    return-void
.end method
