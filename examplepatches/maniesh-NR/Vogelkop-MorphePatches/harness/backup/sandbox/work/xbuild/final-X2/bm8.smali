.class public final synthetic Lbm8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;
.implements Lnl5;
.implements Ln5o;
.implements Lm9n;
.implements Lbcf;
.implements Lwf3;
.implements Ldwa;
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lii2;
.implements Lmm9;
.implements Louh;
.implements Lcom/google/android/gms/tasks/Continuation;
.implements Llva;
.implements Ltam;
.implements Lv2p;
.implements Lqnb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lbm8;->a:B

    iput-object p1, p0, Lbm8;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final X(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Leof;

    const-string v0, "FinishAccountSetupAuthPortalFragment_request"

    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_f

    invoke-virtual {p0, p1}, Leof;->run(Ljava/lang/Object;)V

    :cond_f
    return-void
.end method

.method public final a(Ld5j;)V
    .registers 2

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lj3e;

    invoke-virtual {p0, p1}, Lj3e;->a(Ld5j;)V

    return-void
.end method

.method public final accept(Ljava/lang/Object;)V
    .registers 12

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lga6;

    check-cast p1, Lvho;

    invoke-virtual {p1}, Lvho;->a()Llho;

    move-result-object v0

    iget-object v0, v0, Llho;->j:Ldro;

    sget-object v1, Ldro;->b:Ldro;

    if-ne v0, v1, :cond_56

    iget-object v0, p1, Lvho;->a:Lw06;

    sget-object v1, Lw06;->h:Lw06;

    sget-object v2, Lw06;->b:Lw06;

    if-eq v0, v2, :cond_1a

    if-ne v0, v1, :cond_56

    :cond_1a
    invoke-virtual {p1}, Lvho;->a()Llho;

    move-result-object p1

    iget-object p1, p1, Llho;->a:Lxho;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lchb;

    new-instance v0, Lzgb;

    const/4 v3, 0x3

    invoke-direct {v0, p0, v3}, Lzgb;-><init>(Lchb;B)V

    iget-object v5, p1, Lxho;->c:Ljava/lang/String;

    iget-object p0, p1, Lxho;->a:Lw06;

    if-eq p0, v2, :cond_32

    if-ne p0, v1, :cond_51

    :cond_32
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_51

    sget-object p0, Lfip;->a:Ljava/util/HashMap;

    new-instance v9, Lsmo;

    const/4 p0, 0x2

    invoke-direct {v9, v0, p0}, Lsmo;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lphf;->a:Lx79;

    iget-object p0, p0, Lx79;->a:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Landroid/content/Context;

    const/16 v6, 0x20

    const/16 v7, 0x20

    sget-object v8, Lvhp;->b:Lvhp;

    invoke-static/range {v4 .. v9}, Lfip;->a(Landroid/content/Context;Ljava/lang/String;IILvhp;Lzhp;)V

    return-void

    :cond_51
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lzgb;->l(Ljava/lang/Object;)V

    :cond_56
    return-void
.end method

.method public final b(I)V
    .registers 3

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lim8;

    const/4 v0, 0x1

    if-eq p1, v0, :cond_8

    const/4 v0, 0x0

    :cond_8
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lim8;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lcd5;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, v0}, Lxob;->j0(Ljava/lang/Object;)Z

    return-void
.end method

.method public final e(J)J
    .registers 11

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lu69;

    iget v0, p0, Lu69;->e:I

    int-to-long v0, v0

    mul-long/2addr p1, v0

    const-wide/32 v0, 0xf4240

    div-long v2, p1, v0

    iget-wide p0, p0, Lu69;->j:J

    const-wide/16 v0, 0x1

    sub-long v6, p0, v0

    const-wide/16 v4, 0x0

    invoke-static/range {v2 .. v7}, Ltym;->j(JJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public final f(I)V
    .registers 7

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    iget v0, p0, Lrma;->b:I

    if-eqz v0, :cond_b

    const/4 v1, 0x5

    if-eq v0, v1, :cond_c

    :cond_b
    return-void

    :cond_c
    const/4 v0, 0x0

    iput v0, p0, Lrma;->b:I

    const/4 v0, 0x0

    iput-object v0, p0, Lrma;->i:Ljava/lang/Object;

    iget-object v1, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v1, Lq65;

    invoke-virtual {v1}, Ln1;->S()V

    iget-object v1, p0, Lrma;->d:Ljava/lang/Object;

    check-cast v1, Lbf9;

    invoke-virtual {v1}, Lbf9;->q()Lpc9;

    move-result-object v2

    if-eqz v2, :cond_2d

    new-instance v3, Ldg7;

    const/16 v4, 0x1a

    invoke-direct {v3, v2, v4}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0, v3}, Lbf9;->p(Ljava/lang/Long;Lcom/opera/api/Callback;)Lih4;

    :cond_2d
    iget-object p0, p0, Lrma;->f:Ljava/lang/Object;

    check-cast p0, Lcd9;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Loc4;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Loc4;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p0, v0}, Lcd9;->z0(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lbm8;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_b4

    check-cast p0, Ltu;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Ltu;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :sswitch_12
    check-cast p0, Luab;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Luab;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_30
    :goto_30
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_54

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ApplicationInfo;

    iget v5, v4, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v6, 0x1

    and-int/2addr v5, v6

    if-eq v5, v6, :cond_43

    move v6, v0

    :cond_43
    if-nez p1, :cond_49

    if-eqz v6, :cond_49

    move-object v5, v1

    goto :goto_4e

    :cond_49
    new-instance v5, Lwt1;

    invoke-direct {v5, p0, v4}, Lwt1;-><init>(Landroid/content/pm/PackageManager;Landroid/content/pm/ApplicationInfo;)V

    :goto_4e
    if-eqz v5, :cond_30

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_30

    :cond_54
    new-instance p0, Lau9;

    const/4 p1, 0x4

    invoke-direct {p0, p1}, Lau9;-><init>(B)V

    invoke-static {p0, v3}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :sswitch_5f
    check-cast p0, Lcd9;

    check-cast p1, Landroid/graphics/Bitmap;

    if-nez p1, :cond_67

    iput-object v1, p0, Lcd9;->s:Ljava/lang/String;

    :cond_67
    iput-object p1, p0, Lcd9;->r:Landroid/graphics/Bitmap;

    iput-object v1, p0, Lcd9;->q:Loml;

    const/4 p1, 0x2

    iput p1, p0, Lcd9;->n:I

    iput-object v1, p0, Lcd9;->t:Ljava/lang/String;

    invoke-virtual {p0}, Lcd9;->y0()V

    return-object v1

    :sswitch_74
    check-cast p0, Lmgh;

    check-cast p1, Ljava/lang/Long;

    iget-object p0, p0, Lmgh;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    if-eqz p0, :cond_81

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_81
    return-object v1

    :sswitch_82
    check-cast p0, Lrn9;

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lrq8;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_9c

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lnq8;

    :try_start_90
    iget-object v2, p0, Lnq8;->a:Ljava/lang/String;

    iget-object p0, p0, Lnq8;->c:Ljava/lang/String;

    invoke-static {p1, v2, p0}, Lx7d;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Loq8;

    move-result-object v1
    :try_end_98
    .catch Lorg/json/JSONException; {:try_start_90 .. :try_end_98} :catch_98

    :catch_98
    invoke-virtual {v0, v1}, Lrq8;->b(Loq8;)V

    goto :goto_a3

    :cond_9c
    iget-boolean p0, p0, Lrn9;->b:Z

    if-eqz p0, :cond_a3

    invoke-virtual {v0, v1}, Lrq8;->b(Loq8;)V

    :cond_a3
    :goto_a3
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :sswitch_a6
    check-cast p0, Lr9i;

    check-cast p1, Ljava/lang/Void;

    :try_start_aa
    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-static {p0}, Ls29;->i(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1
    :try_end_b2
    .catch Ljava/io/IOException; {:try_start_aa .. :try_end_b2} :catch_b2

    :catch_b2
    return-object v1

    nop

    :sswitch_data_b4
    .sparse-switch
        0x2 -> :sswitch_a6
        0x3 -> :sswitch_82
        0xb -> :sswitch_74
        0xd -> :sswitch_5f
        0x19 -> :sswitch_12
    .end sparse-switch
.end method

.method public final h(JLg1g;)V
    .registers 4

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lwn9;

    iget-object p0, p0, Lwn9;->K:[Lhyl;

    invoke-static {p1, p2, p3, p0}, Lrm5;->m(JLg1g;[Lhyl;)V

    return-void
.end method

.method public final j()V
    .registers 2

    iget-byte v0, p0, Lbm8;->a:B

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_1e

    check-cast p0, Lx79;

    iget-object p0, p0, Lx79;->a:Ljava/lang/Object;

    check-cast p0, Lcan;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcan;->b(Z)V

    return-void

    :sswitch_12
    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :sswitch_18
    check-cast p0, Lar8;

    invoke-virtual {p0}, Lar8;->p0()V

    return-void

    :sswitch_data_1e
    .sparse-switch
        0x4 -> :sswitch_18
        0xf -> :sswitch_12
    .end sparse-switch
.end method

.method public final k(Lcom/opera/hype/image/editor/TextBoxEditText;)Luam;
    .registers 4

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Llxa;

    new-instance v0, Lw7j;

    iget-object v1, p0, Llxa;->h:Loam;

    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object p0

    invoke-direct {v0, p1, v1, p0}, Lw7j;-><init>(Lcom/opera/hype/image/editor/TextBoxEditText;Loam;Lnx5;)V

    return-object v0
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 11

    iget-byte p1, p0, Lbm8;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_fa

    check-cast p0, Lywa;

    sget-object p1, Lywa;->g:[Lxtb;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f07026f

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070277

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    new-instance v2, Lso5;

    invoke-direct {v2}, Lso5;-><init>()V

    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object v3

    iget-object v3, v3, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2, v3}, Lso5;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iget-object v3, p2, Lg3o;->a:Ld3o;

    const/16 v4, 0x207

    invoke-virtual {v3, v4}, Ld3o;->i(I)Lr9b;

    move-result-object v3

    iget v5, v3, Lr9b;->b:I

    add-int/2addr p1, v5

    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object v5

    iget-object v5, v5, Lora;->d:Landroid/widget/ViewSwitcher;

    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v5

    const/4 v6, 0x3

    invoke-virtual {v2, v5, v6, p1}, Lso5;->n(III)V

    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object v5

    iget-object v5, v5, Lora;->b:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v5

    invoke-virtual {v2, v5, v6, p1}, Lso5;->n(III)V

    iget p1, v3, Lr9b;->d:I

    add-int/2addr v1, p1

    sget-object p1, Lnsl;->l:Lh58;

    invoke-static {p1, p1}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object p1

    :goto_5f
    invoke-virtual {p1}, Lw4;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_86

    invoke-virtual {p1}, Lw4;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnsl;

    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object v6

    iget-object v6, v6, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget v5, v5, Lnsl;->a:I

    sget-object v7, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v6, v5}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    check-cast v5, Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v5

    const/4 v6, 0x4

    invoke-virtual {v2, v5, v6, v1}, Lso5;->n(III)V

    goto :goto_5f

    :cond_86
    invoke-virtual {p0}, Lywa;->h0()Lora;

    move-result-object p0

    iget-object p0, p0, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2, p0}, Lso5;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p1, 0x24

    if-lt p0, p1, :cond_9b

    new-instance p0, Lt2o;

    invoke-direct {p0, p2}, Lt2o;-><init>(Lg3o;)V

    goto :goto_c8

    :cond_9b
    const/16 p1, 0x23

    if-lt p0, p1, :cond_a5

    new-instance p0, Ls2o;

    invoke-direct {p0, p2}, Ls2o;-><init>(Lg3o;)V

    goto :goto_c8

    :cond_a5
    const/16 p1, 0x22

    if-lt p0, p1, :cond_af

    new-instance p0, Lr2o;

    invoke-direct {p0, p2}, Lr2o;-><init>(Lg3o;)V

    goto :goto_c8

    :cond_af
    const/16 p1, 0x1f

    if-lt p0, p1, :cond_b9

    new-instance p0, Lq2o;

    invoke-direct {p0, p2}, Lq2o;-><init>(Lg3o;)V

    goto :goto_c8

    :cond_b9
    const/16 p1, 0x1e

    if-lt p0, p1, :cond_c3

    new-instance p0, Lp2o;

    invoke-direct {p0, p2}, Lp2o;-><init>(Lg3o;)V

    goto :goto_c8

    :cond_c3
    new-instance p0, Lo2o;

    invoke-direct {p0, p2}, Lo2o;-><init>(Lg3o;)V

    :goto_c8
    iget p1, v3, Lr9b;->a:I

    iget p2, v3, Lr9b;->c:I

    invoke-static {p1, v0, p2, v0}, Lr9b;->c(IIII)Lr9b;

    move-result-object p1

    invoke-virtual {p0, v4, p1}, Lu2o;->d(ILr9b;)V

    invoke-virtual {p0}, Lo2o;->b()Lg3o;

    move-result-object p0

    return-object p0

    :pswitch_d8
    check-cast p0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;

    sget p1, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;->c:I

    const/16 p1, 0x287

    iget-object v1, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v1, p1}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget v1, p1, Lr9b;->b:I

    iput v1, p0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;->a:I

    iget-object v2, p0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;->b:Landroid/view/View;

    if-eqz v2, :cond_ef

    invoke-virtual {v2, v0, v1, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    :cond_ef
    iget v1, p1, Lr9b;->a:I

    iget v2, p1, Lr9b;->c:I

    iget p1, p1, Lr9b;->d:I

    invoke-virtual {p0, v1, v0, v2, p1}, Landroid/view/View;->setPadding(IIII)V

    return-object p2

    nop

    :pswitch_data_fa
    .packed-switch 0x6
        :pswitch_d8
    .end packed-switch
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 2

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lg89;

    iget-object p0, p0, Lg89;->o:Ljdj;

    sget-object p1, Lznm;->a:Lznm;

    invoke-virtual {p0, p1}, Ljdj;->i(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final run()V
    .registers 5

    iget-byte v0, p0, Lbm8;->a:B

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    check-cast p0, Lmnb;

    iget-object v0, p0, Lmnb;->d:Lpnb;

    iget-object v1, v0, Lpnb;->f:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x1

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object p0, p0, Lmnb;->a:Lc2n;

    iget-object v1, v0, Lpnb;->o:Lqqm;

    invoke-virtual {p0, v0, v1}, Lc2n;->onResponseStarted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;)V

    :cond_1c
    return-void

    :pswitch_1d
    check-cast p0, Ltom;

    invoke-virtual {p0}, Ltom;->close()V

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x1c
        :pswitch_1d
    .end packed-switch
.end method

.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_3d

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    if-eqz v0, :cond_3d

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3d

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FID_ALREADY_USED:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3d

    iget-object p1, p0, Lx79;->c:Ljava/lang/Object;

    check-cast p1, Ly49;

    check-cast p1, Lx49;

    iget-object p1, p1, Lx49;->c:Lesg;

    invoke-virtual {p1}, Lesg;->s()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    invoke-virtual {p0}, Lx79;->R()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    :cond_3d
    return-object p1
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-object p0, p0, Lbm8;->b:Ljava/lang/Object;

    check-cast p0, Ldm8;

    iget-object p0, p0, Ldm8;->s:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "page_menu_show_open_in_external_app"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method
