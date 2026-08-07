.class public Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;
.super Lcom/tencent/could/huiyansdk/fragments/BaseFragment;
.source "SourceFile"


# instance fields
.field public a:Lcom/tencent/could/huiyansdk/turing/a;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/tencent/could/huiyansdk/view/HudView;

.field public h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

.field public i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

.field public volatile j:Z

.field public k:I

.field public l:Z

.field public volatile m:Z

.field public volatile n:Z

.field public volatile o:Z

.field public p:Lcom/tencent/could/huiyansdk/utils/h;

.field public q:Lcom/tencent/could/aicamare/CameraHolder;

.field public r:Lcom/tencent/could/huiyansdk/view/b;

.field public s:Z

.field public volatile t:Z

.field public volatile u:Z

.field public v:Landroid/graphics/drawable/AnimationDrawable;

.field public w:I

.field public volatile x:Z

.field public volatile y:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->j:Z

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->k:I

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->l:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->m:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->n:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->o:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->s:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->t:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->u:Z

    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->w:I

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->x:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->y:Z

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic V3(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;JZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(JZ)V

    return-void
.end method

.method public static synthetic W3(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e()V

    return-void
.end method

.method public static synthetic X3(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->f()V

    return-void
.end method

.method public static synthetic Y3(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Landroid/graphics/ColorMatrixColorFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Landroid/graphics/ColorMatrixColorFilter;)V

    return-void
.end method

.method public static synthetic Z3(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->d()V

    return-void
.end method

.method private a(F)V
    .locals 6

    const/high16 v0, 0x40800000    # 4.0f

    cmpg-float v0, p1, v0

    const/4 v1, 0x1

    const-string v2, ""

    const/4 v3, 0x0

    if-gez v0, :cond_0

    .line 360
    sget v0, Lcom/tencent/could/huiyansdk/R$string;->txy_light_low:I

    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    move-result-object v0

    move v4, v1

    goto :goto_0

    :cond_0
    move-object v0, v2

    move v4, v3

    :goto_0
    const/high16 v5, 0x436b0000    # 235.0f

    cmpl-float p1, p1, v5

    if-lez p1, :cond_1

    .line 361
    sget p1, Lcom/tencent/could/huiyansdk/R$string;->txy_light_strong:I

    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    move-result-object v0

    move p1, v1

    move v4, p1

    goto :goto_1

    :cond_1
    move p1, v3

    .line 362
    :goto_1
    iget-object v5, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->d:Landroid/widget/TextView;

    if-nez v5, :cond_2

    goto :goto_3

    .line 363
    :cond_2
    iget-boolean v5, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->t:Z

    if-eqz v4, :cond_5

    if-eqz v5, :cond_3

    goto :goto_3

    .line 364
    :cond_3
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->p:Lcom/tencent/could/huiyansdk/utils/h;

    invoke-virtual {v2, v0}, Lcom/tencent/could/huiyansdk/utils/h;->a(Ljava/lang/String;)V

    if-eqz p1, :cond_4

    .line 365
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 366
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->LIGHT_TOO_STRONG:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    invoke-virtual {p1, v0, v1}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Z)V

    goto :goto_2

    .line 367
    :cond_4
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 368
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->LIGHT_TOO_LOW:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    invoke-virtual {p1, v0, v1}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Z)V

    .line 369
    :goto_2
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->t:Z

    return-void

    :cond_5
    if-nez v5, :cond_6

    :goto_3
    return-void

    .line 370
    :cond_6
    iput-boolean v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->t:Z

    .line 371
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->p:Lcom/tencent/could/huiyansdk/utils/h;

    invoke-virtual {p0, v2}, Lcom/tencent/could/huiyansdk/utils/h;->a(Ljava/lang/String;)V

    return-void
.end method

.method private a(I)V
    .locals 2

    .line 403
    :try_start_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-nez p0, :cond_0

    return-void

    .line 404
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 405
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/4 v1, -0x1

    if-ne p1, v1, :cond_1

    const/high16 p1, -0x40800000    # -1.0f

    .line 406
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    goto :goto_0

    :cond_1
    if-gtz p1, :cond_2

    const/4 p1, 0x1

    :cond_2
    int-to-float p1, p1

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr p1, v1

    .line 407
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 408
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 409
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 410
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "set current screen brightness error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 411
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x2

    .line 412
    const-string v1, "AuthingFragment"

    invoke-virtual {p1, v0, v1, p0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private a(JZ)V
    .locals 1

    .line 378
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/k$b;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 379
    invoke-virtual {v0, p1, p2}, Lcom/tencent/could/huiyansdk/utils/k;->a(J)V

    .line 380
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    const/4 p2, 0x4

    if-eqz p1, :cond_1

    if-eqz p3, :cond_0

    const/4 p3, 0x0

    goto :goto_0

    :cond_0
    move p3, p2

    .line 381
    :goto_0
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 382
    :cond_1
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 383
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    if-nez p1, :cond_2

    goto :goto_1

    .line 384
    :cond_2
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isShowCountdown()Z

    move-result p1

    if-nez p1, :cond_3

    .line 385
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    :goto_1
    return-void
.end method

.method private a(Landroid/graphics/ColorMatrixColorFilter;)V
    .locals 2

    .line 392
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    if-eqz v0, :cond_0

    .line 393
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;->a:Landroid/graphics/Paint;

    if-eqz v1, :cond_0

    .line 394
    iput-object p1, v0, Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;->b:Landroid/graphics/ColorMatrixColorFilter;

    .line 395
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 396
    :cond_0
    iget-boolean p1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->j:Z

    if-eqz p1, :cond_1

    return-void

    :cond_1
    const/4 p1, 0x1

    .line 397
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->j:Z

    .line 398
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->p:Lcom/tencent/could/huiyansdk/utils/h;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/utils/h;->a(Ljava/lang/String;)V

    .line 399
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->m()V

    .line 400
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 401
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->REFLECT_CHECK:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 402
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;Z)V

    return-void
.end method

.method private synthetic a(Landroid/view/View;)V
    .locals 0

    const/4 p1, 0x0

    .line 359
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Z)V

    return-void
.end method

.method private a(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V
    .locals 2

    const/4 v0, 0x1

    .line 386
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Z)V

    .line 387
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorMsg()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 388
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 389
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "local auth fail! code: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " msg: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorMsg()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x2

    .line 391
    const-string v1, "AuthingFragment"

    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const-string v0, ">>>first found the face. start AuthTimeOutMs"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const-string v2, "AuthingFragment"

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 15
    .line 16
    const-string p1, "error state"

    .line 17
    .line 18
    invoke-virtual {p0, v3, v2, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_0
    invoke-virtual {p0, p2}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_1
    invoke-virtual {p0, p2}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_2
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->j()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_3
    iput-boolean v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->n:Z

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->o:Z

    .line 37
    .line 38
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 39
    .line 40
    invoke-virtual {p0, v3, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :pswitch_4
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->n:Z

    .line 45
    .line 46
    iput-boolean v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->o:Z

    .line 47
    .line 48
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 49
    .line 50
    const-string p2, ">>>entry long check, start LongCheckTimeOutMs"

    .line 51
    .line 52
    invoke-virtual {p1, v3, v2, p2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getLongCheckTimeOutMs()J

    .line 62
    .line 63
    .line 64
    move-result-wide v0

    .line 65
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowLongCheckTimeout()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(JZ)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :pswitch_5
    iput-boolean v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->m:Z

    .line 78
    .line 79
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 80
    .line 81
    const-string p2, ">>>enter other action. start AuthTimeOutMs"

    .line 82
    .line 83
    invoke-virtual {p1, v3, v2, p2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getAuthTimeOutMs()J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowActionTimeout()Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(JZ)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :pswitch_6
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 109
    .line 110
    invoke-virtual {p0, v3, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :pswitch_7
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i()V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :pswitch_8
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h()V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :pswitch_9
    iget-boolean p1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->u:Z

    .line 123
    .line 124
    if-nez p1, :cond_4

    .line 125
    .line 126
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 127
    .line 128
    const-string p2, ">>>start auth and get live info"

    .line 129
    .line 130
    invoke-virtual {p1, v3, v2, p2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getPlatformContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 142
    .line 143
    if-eqz p2, :cond_0

    .line 144
    .line 145
    invoke-virtual {p2}, Lcom/tencent/could/aicamare/CameraHolder;->getCurrentCamera()Landroid/hardware/Camera;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    iput-object p2, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentCamera:Landroid/hardware/Camera;

    .line 150
    .line 151
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 152
    .line 153
    invoke-virtual {p2}, Lcom/tencent/could/aicamare/CameraHolder;->getCameraId()I

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    iput p2, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentCameraId:I

    .line 158
    .line 159
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 160
    .line 161
    invoke-virtual {p2}, Lcom/tencent/could/aicamare/CameraHolder;->getCurrentRotate()I

    .line 162
    .line 163
    .line 164
    move-result p2

    .line 165
    iput p2, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentRotateState:I

    .line 166
    .line 167
    sget-object p2, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 168
    .line 169
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    iput-object p2, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentAppContext:Landroid/content/Context;

    .line 174
    .line 175
    :cond_0
    new-instance p2, Lcom/tencent/could/huiyansdk/fragments/g;

    .line 176
    .line 177
    invoke-direct {p2, p0}, Lcom/tencent/could/huiyansdk/fragments/g;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 178
    .line 179
    .line 180
    iput-object p2, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->reflectListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;

    .line 181
    .line 182
    new-instance p2, Lcom/tencent/could/huiyansdk/fragments/h;

    .line 183
    .line 184
    invoke-direct {p2, p0}, Lcom/tencent/could/huiyansdk/fragments/h;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 185
    .line 186
    .line 187
    iput-object p2, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->baseFunctionListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTBaseFunctionListener;

    .line 188
    .line 189
    sget-object p2, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 190
    .line 191
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 195
    .line 196
    iput-object v0, p2, Lcom/tencent/could/huiyansdk/manager/b;->n:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 197
    .line 198
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 199
    .line 200
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 201
    .line 202
    .line 203
    sget-object v2, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 204
    .line 205
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    .line 207
    .line 208
    iget-object v4, v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 209
    .line 210
    if-eqz v4, :cond_1

    .line 211
    .line 212
    const-string v5, ""

    .line 213
    .line 214
    const-string v6, "GetConfigUseTime"

    .line 215
    .line 216
    invoke-interface {v4, v6, v3, v1, v5}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V

    .line 217
    .line 218
    .line 219
    :cond_1
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/helper/b;->b()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    new-instance v4, Lcom/tencent/could/huiyansdk/helper/a;

    .line 224
    .line 225
    invoke-direct {v4, v2}, Lcom/tencent/could/huiyansdk/helper/a;-><init>(Lcom/tencent/could/huiyansdk/helper/b;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v2, p1, v1, v4}, Lcom/tencent/could/huiyansdk/helper/b;->a(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;)I

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-eqz p1, :cond_2

    .line 233
    .line 234
    new-instance p2, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    const-string v0, "YtSDKKitFramework init error ! code: "

    .line 237
    .line 238
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    const/16 p2, 0xd3

    .line 249
    .line 250
    invoke-static {p2, p1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 251
    .line 252
    .line 253
    goto :goto_0

    .line 254
    :cond_2
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b()Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;->ACTION_REFLECT_MODE:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 259
    .line 260
    if-eq p1, v0, :cond_3

    .line 261
    .line 262
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 263
    .line 264
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->START_AUTH:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 265
    .line 266
    invoke-virtual {p1, v0, v3}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;Z)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 270
    .line 271
    .line 272
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/AuthState;->START_CAMERA_PREVIEW:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 273
    .line 274
    const/4 v0, 0x0

    .line 275
    invoke-virtual {p2, p1, v0}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 276
    .line 277
    .line 278
    :cond_3
    :goto_0
    iput-boolean v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->u:Z

    .line 279
    .line 280
    return-void

    .line 281
    :cond_4
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 282
    .line 283
    const-string p1, "has started auth and got live info"

    .line 284
    .line 285
    invoke-virtual {p0, v3, v2, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    return-void

    .line 289
    :pswitch_a
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 290
    .line 291
    const-string p2, ">>>start prepare event"

    .line 292
    .line 293
    invoke-virtual {p1, v3, v2, p2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 297
    .line 298
    if-nez p2, :cond_5

    .line 299
    .line 300
    const/4 p0, 0x2

    .line 301
    const-string p2, "loadingFrontAnimatorView is null!"

    .line 302
    .line 303
    invoke-virtual {p1, p0, v2, p2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :cond_5
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 308
    .line 309
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 310
    .line 311
    if-eqz p1, :cond_6

    .line 312
    .line 313
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnStart()Z

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    if-eqz p1, :cond_6

    .line 318
    .line 319
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 320
    .line 321
    const/16 p1, 0x8

    .line 322
    .line 323
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 324
    .line 325
    .line 326
    return-void

    .line 327
    :cond_6
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 328
    .line 329
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b()V

    .line 330
    .line 331
    .line 332
    return-void

    .line 333
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Z)Z
    .locals 0

    .line 358
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->y:Z

    return p1
.end method

.method public static synthetic a4(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Landroid/view/View;)V

    return-void
.end method

.method private b(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->s:Z

    .line 2
    .line 3
    const-string v1, "AuthingFragment"

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 9
    .line 10
    const-string p1, "error dialog had showing!"

    .line 11
    .line 12
    invoke-virtual {p0, v2, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_8

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    goto/16 :goto_3

    .line 29
    .line 30
    :cond_1
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->r:Lcom/tencent/could/huiyansdk/view/b;

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    if-nez v3, :cond_2

    .line 34
    .line 35
    new-instance v3, Lcom/tencent/could/huiyansdk/view/b;

    .line 36
    .line 37
    invoke-direct {v3, v0, v4}, Lcom/tencent/could/huiyansdk/view/b;-><init>(Landroid/content/Context;I)V

    .line 38
    .line 39
    .line 40
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->r:Lcom/tencent/could/huiyansdk/view/b;

    .line 41
    .line 42
    :cond_2
    const/4 v3, 0x1

    .line 43
    iput-boolean v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->s:Z

    .line 44
    .line 45
    sget-object v5, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 46
    .line 47
    iput-boolean v3, v5, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorMsg()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p0, p1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    iget-object v6, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->r:Lcom/tencent/could/huiyansdk/view/b;

    .line 68
    .line 69
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v7, Landroid/graphics/Point;

    .line 77
    .line 78
    invoke-direct {v7}, Landroid/graphics/Point;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v7}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v6}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    iget-object v8, v5, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 93
    .line 94
    if-nez v8, :cond_4

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    invoke-virtual {v8}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode()Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    :goto_0
    iget v8, v7, Landroid/graphics/Point;->x:I

    .line 102
    .line 103
    if-eqz v4, :cond_5

    .line 104
    .line 105
    int-to-float v4, v8

    .line 106
    const v8, 0x3ea3d70a    # 0.32f

    .line 107
    .line 108
    .line 109
    mul-float/2addr v4, v8

    .line 110
    float-to-int v4, v4

    .line 111
    iput v4, v6, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 112
    .line 113
    iget v4, v7, Landroid/graphics/Point;->y:I

    .line 114
    .line 115
    int-to-float v4, v4

    .line 116
    const v7, 0x3f333333    # 0.7f

    .line 117
    .line 118
    .line 119
    mul-float/2addr v4, v7

    .line 120
    float-to-int v4, v4

    .line 121
    iput v4, v6, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_5
    int-to-float v4, v8

    .line 125
    const v8, 0x3f4ccccd    # 0.8f

    .line 126
    .line 127
    .line 128
    mul-float/2addr v4, v8

    .line 129
    float-to-int v4, v4

    .line 130
    iput v4, v6, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 131
    .line 132
    iget v4, v7, Landroid/graphics/Point;->y:I

    .line 133
    .line 134
    int-to-float v4, v4

    .line 135
    const v7, 0x3ecccccd    # 0.4f

    .line 136
    .line 137
    .line 138
    mul-float/2addr v4, v7

    .line 139
    float-to-int v4, v4

    .line 140
    iput v4, v6, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 141
    .line 142
    :goto_1
    invoke-virtual {v0, v6}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->r:Lcom/tencent/could/huiyansdk/view/b;

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorMsg()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    iput v4, v0, Lcom/tencent/could/huiyansdk/view/b;->b:I

    .line 156
    .line 157
    iput-object v6, v0, Lcom/tencent/could/huiyansdk/view/b;->c:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v4, v0, Lcom/tencent/could/huiyansdk/view/b;->a:Landroid/widget/TextView;

    .line 160
    .line 161
    if-eqz v4, :cond_6

    .line 162
    .line 163
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    :cond_6
    iget-boolean v4, v5, Lcom/tencent/could/huiyansdk/api/j;->d:Z

    .line 167
    .line 168
    if-eqz v4, :cond_7

    .line 169
    .line 170
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 171
    .line 172
    const-string v4, "ErrorInfoDialog"

    .line 173
    .line 174
    const-string v5, "activity has exit, do not need show!"

    .line 175
    .line 176
    invoke-virtual {v0, v2, v4, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_7
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 181
    .line 182
    .line 183
    :goto_2
    invoke-virtual {p0, v3}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Z)V

    .line 184
    .line 185
    .line 186
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 187
    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    const-string v3, "showErrorDialog error code:"

    .line 191
    .line 192
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v3, " msg: "

    .line 203
    .line 204
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorMsg()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p0, v2, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_8
    :goto_3
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 223
    .line 224
    const-string v0, "activity is null or is finishing by create ErrorInfoDialog"

    .line 225
    .line 226
    invoke-virtual {p0, v2, v1, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    .line 230
    .line 231
    .line 232
    move-result p0

    .line 233
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorMsg()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-static {p0, p1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method public static synthetic b(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Z)Z
    .locals 0

    .line 282
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->x:Z

    return p1
.end method

.method public static synthetic b4(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(I)V

    return-void
.end method

.method public static synthetic c4(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(F)V

    return-void
.end method

.method private d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v1, v0, Landroid/view/View;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Landroid/view/View;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 16
    .line 17
    invoke-interface {v0}, Lcom/tencent/could/huiyansdk/turing/a;->a()V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->l:Z

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic d4(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    return-void
.end method

.method private e()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/could/aicamare/CameraHolder;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/could/aicamare/CameraHolder;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 13
    .line 14
    new-instance v1, Lcom/tencent/could/huiyansdk/fragments/d;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/tencent/could/huiyansdk/fragments/d;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/tencent/could/aicamare/CameraHolder;->setLoggerCallBack(Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 23
    .line 24
    new-instance v1, Lcom/tencent/could/huiyansdk/fragments/e;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Lcom/tencent/could/huiyansdk/fragments/e;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/tencent/could/aicamare/CameraHolder;->setEventListener(Lcom/tencent/could/aicamare/callback/CameraEventListener;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;-><init>()V

    .line 35
    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setMainThread(Z)V

    .line 39
    .line 40
    .line 41
    sget-object v2, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/api/j;->d()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    const/16 v3, 0x500

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setPreWidth(I)V

    .line 52
    .line 53
    .line 54
    const/16 v4, 0x2d0

    .line 55
    .line 56
    invoke-virtual {v0, v4}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setPreHeight(I)V

    .line 57
    .line 58
    .line 59
    sget-object v5, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 60
    .line 61
    invoke-virtual {v5, v4, v3}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a(II)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const/16 v3, 0x280

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setPreWidth(I)V

    .line 68
    .line 69
    .line 70
    const/16 v4, 0x1e0

    .line 71
    .line 72
    invoke-virtual {v0, v4}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setPreHeight(I)V

    .line 73
    .line 74
    .line 75
    sget-object v5, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 76
    .line 77
    invoke-virtual {v5, v4, v3}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a(II)V

    .line 78
    .line 79
    .line 80
    :goto_0
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    const/16 v3, 0x1e

    .line 85
    .line 86
    if-eqz v2, :cond_5

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getPackageTest()Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    sget-object v5, Lcom/tencent/could/huiyansdk/enums/PackageTest;->BIG:Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 93
    .line 94
    if-eq v4, v5, :cond_3

    .line 95
    .line 96
    sget-object v5, Lcom/tencent/could/huiyansdk/enums/PackageTest;->MEDIUM:Lcom/tencent/could/huiyansdk/enums/PackageTest;

    .line 97
    .line 98
    if-ne v4, v5, :cond_2

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    const/16 v3, 0xf

    .line 102
    .line 103
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setMinFps(I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setMaxFps(I)V

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_3
    :goto_1
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setMinFps(I)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setMaxFps(I)V

    .line 114
    .line 115
    .line 116
    :goto_2
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera()Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setBackCamera(Z)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera()Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_4

    .line 128
    .line 129
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getZoomLevel()Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setZoom(Lcom/tencent/could/aicamare/enums/CameraZoom;)V

    .line 134
    .line 135
    .line 136
    :cond_4
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isMustDiffMinAndMaxFps()Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setMustDiffMinAndMaxFps(Z)V

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_5
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setMinFps(I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setMaxFps(I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, v1}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setBackCamera(Z)V

    .line 151
    .line 152
    .line 153
    :goto_3
    const/4 v3, 0x1

    .line 154
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setByteDataBuffer(Z)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v1}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setSupportZoom(Z)V

    .line 158
    .line 159
    .line 160
    if-eqz v2, :cond_6

    .line 161
    .line 162
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode()Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    invoke-virtual {v0, v1}, Lcom/tencent/could/aicamare/entity/CameraConfig;->setLand(Z)V

    .line 167
    .line 168
    .line 169
    :cond_6
    sget-object v1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 176
    .line 177
    invoke-virtual {v3, v2, v0}, Lcom/tencent/could/aicamare/CameraHolder;->initCameraHolder(Landroid/content/Context;Lcom/tencent/could/aicamare/entity/CameraConfig;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 181
    .line 182
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 183
    .line 184
    invoke-interface {v0, v2}, Lcom/tencent/could/huiyansdk/turing/a;->setCameraHolder(Lcom/tencent/could/aicamare/CameraHolder;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 192
    .line 193
    if-eqz p0, :cond_7

    .line 194
    .line 195
    if-eqz v0, :cond_7

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/tencent/could/aicamare/CameraHolder;->openCamera(Landroid/content/Context;)V

    .line 198
    .line 199
    .line 200
    sget-object p0, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 201
    .line 202
    new-instance v0, Landroid/os/HandlerThread;

    .line 203
    .line 204
    const-string v1, "turing"

    .line 205
    .line 206
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->l:Landroid/os/HandlerThread;

    .line 210
    .line 211
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 212
    .line 213
    .line 214
    new-instance v0, Lcom/tencent/could/huiyansdk/turing/e;

    .line 215
    .line 216
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/turing/f;->l:Landroid/os/HandlerThread;

    .line 217
    .line 218
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-direct {v0, p0, v1}, Lcom/tencent/could/huiyansdk/turing/e;-><init>(Lcom/tencent/could/huiyansdk/turing/f;Landroid/os/Looper;)V

    .line 223
    .line 224
    .line 225
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 226
    .line 227
    :cond_7
    return-void
.end method

.method public static synthetic e4(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->g()V

    return-void
.end method

.method private f()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/CameraHolder;->release()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/turing/f;->b()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Z)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isAutoScreenBrightness()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, -0x1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->k:I

    .line 31
    .line 32
    if-eq v1, v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(I)V

    .line 35
    .line 36
    .line 37
    iput v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->k:I

    .line 38
    .line 39
    :cond_1
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/d$b;->a:Lcom/tencent/could/huiyansdk/manager/d;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/d;->a()V

    .line 42
    .line 43
    .line 44
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    move v1, v3

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isWaitingUserCompare()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    :goto_0
    if-eqz v1, :cond_c

    .line 56
    .line 57
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 58
    .line 59
    if-nez v1, :cond_3

    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 63
    .line 64
    if-eqz v1, :cond_6

    .line 65
    .line 66
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    .line 67
    .line 68
    if-eqz v4, :cond_4

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getLoadingStageBgColor()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eq v4, v2, :cond_4

    .line 75
    .line 76
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getLoadingStageBgColor()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 83
    .line 84
    .line 85
    :cond_4
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    .line 86
    .line 87
    if-eqz v4, :cond_6

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getContextResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    sget v6, Lcom/tencent/could/huiyansdk/R$string;->txy_wait_for_result:I

    .line 94
    .line 95
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getLoadingStageTipsColor()I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    iget-object v5, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    .line 107
    .line 108
    if-eq v4, v2, :cond_5

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getLoadingStageTipsColor()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getContextResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    sget v2, Lcom/tencent/could/huiyansdk/R$color;->txy_black:I

    .line 123
    .line 124
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    .line 130
    .line 131
    :cond_6
    :goto_1
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->d:Landroid/widget/TextView;

    .line 132
    .line 133
    const/4 v2, 0x4

    .line 134
    if-eqz v1, :cond_7

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    :cond_7
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 140
    .line 141
    if-eqz v1, :cond_8

    .line 142
    .line 143
    sget v4, Lcom/tencent/could/huiyansdk/R$id;->txy_auth_common_background_views:I

    .line 144
    .line 145
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 153
    .line 154
    sget v4, Lcom/tencent/could/huiyansdk/R$id;->txy_cancel_txt_btn:I

    .line 155
    .line 156
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 161
    .line 162
    .line 163
    :cond_8
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 164
    .line 165
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 166
    .line 167
    .line 168
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/api/j;->h:Lcom/tencent/could/huiyansdk/api/c;

    .line 169
    .line 170
    if-eqz v0, :cond_9

    .line 171
    .line 172
    invoke-interface {v0}, Lcom/tencent/could/huiyansdk/api/c;->getWaitingAnimation()Landroid/graphics/drawable/AnimationDrawable;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->v:Landroid/graphics/drawable/AnimationDrawable;

    .line 177
    .line 178
    :cond_9
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->v:Landroid/graphics/drawable/AnimationDrawable;

    .line 179
    .line 180
    if-nez v0, :cond_a

    .line 181
    .line 182
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 183
    .line 184
    const-string v0, "AuthingFragment"

    .line 185
    .line 186
    const-string v1, "animationDrawable is null!"

    .line 187
    .line 188
    const/4 v2, 0x2

    .line 189
    invoke-virtual {p0, v2, v0, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_a
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 194
    .line 195
    if-eqz v0, :cond_b

    .line 196
    .line 197
    instance-of v1, v0, Landroid/view/View;

    .line 198
    .line 199
    if-eqz v1, :cond_b

    .line 200
    .line 201
    check-cast v0, Landroid/view/View;

    .line 202
    .line 203
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 204
    .line 205
    .line 206
    :cond_b
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 207
    .line 208
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->v:Landroid/graphics/drawable/AnimationDrawable;

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 211
    .line 212
    .line 213
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->v:Landroid/graphics/drawable/AnimationDrawable;

    .line 214
    .line 215
    invoke-virtual {p0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_c
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->closeCurrentFragment()V

    .line 220
    .line 221
    .line 222
    return-void
.end method

.method public static synthetic f4(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Lcom/tencent/could/huiyansdk/entity/CompareResult;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    return-void
.end method

.method private g()V
    .locals 3

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/k$b;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/utils/k;->b:Lcom/tencent/could/huiyansdk/callback/c;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iput-object v2, v0, Lcom/tencent/could/huiyansdk/utils/k;->b:Lcom/tencent/could/huiyansdk/callback/c;

    .line 9
    .line 10
    :cond_0
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/utils/k;->a:Landroid/os/CountDownTimer;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/os/CountDownTimer;->cancel()V

    .line 15
    .line 16
    .line 17
    iput-object v2, v0, Lcom/tencent/could/huiyansdk/utils/k;->a:Landroid/os/CountDownTimer;

    .line 18
    .line 19
    :cond_1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/16 v0, 0x8

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_2
    return-void
.end method

.method public static synthetic g4(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Lcom/tencent/could/huiyansdk/entity/CompareResult;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 372
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_1

    .line 373
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->l:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 374
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c()V

    .line 375
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 376
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 377
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    check-cast p0, Landroid/view/View;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .locals 4

    .line 352
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v1, ">>>local auth fail"

    const/4 v2, 0x1

    .line 353
    const-string v3, "AuthingFragment"

    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 354
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->m()V

    .line 355
    instance-of v0, p1, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    if-eqz v0, :cond_0

    .line 356
    check-cast p1, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 357
    new-instance v0, Ll/fe1;

    invoke-direct {v0, p0, p1}, Ll/fe1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public final a(Z)V
    .locals 6

    .line 333
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const/4 v1, 0x1

    .line 334
    const-string v2, "AuthingFragment"

    const-string v3, "user cancel the auth check."

    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    const-string p1, "PrivacyDialog"

    :goto_0
    move-object v5, p1

    goto :goto_2

    .line 335
    :cond_0
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 336
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/manager/b;->a:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 337
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "cancelAuthCheckByUser current state is "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 338
    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 339
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/AuthState;->AUTH_FAIL:Lcom/tencent/could/huiyansdk/enums/AuthState;

    invoke-virtual {p1, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-ltz v1, :cond_1

    .line 340
    const-string p1, "user cancel the auth check, but current state is error!"

    const/4 v1, 0x2

    .line 341
    invoke-virtual {v0, v1, v2, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 342
    :cond_1
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/AuthState;->AUTH_END:Lcom/tencent/could/huiyansdk/enums/AuthState;

    invoke-virtual {p1, v0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-ltz v0, :cond_2

    const-string p1, "WaitingPage"

    goto :goto_0

    .line 343
    :cond_2
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/AuthState;->START_CAMERA_PREVIEW:Lcom/tencent/could/huiyansdk/enums/AuthState;

    invoke-virtual {p1, v0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result p1

    if-ltz p1, :cond_3

    const-string p1, "AuthCheckPage"

    goto :goto_0

    .line 344
    :cond_3
    :goto_1
    const-string p1, "PreparePage"

    goto :goto_0

    :goto_2
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 345
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    if-eqz p1, :cond_4

    .line 346
    const-string v0, "AuthCheckStage"

    const-string v1, "UserCancelAuth"

    const-string v2, ""

    invoke-interface {p1, v0, v1, v2}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    :cond_4
    sget-object p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 348
    iget-object v0, p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    if-eqz v0, :cond_5

    .line 349
    const-string v1, "UserCancel"

    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V

    .line 350
    :cond_5
    sget p1, Lcom/tencent/could/huiyansdk/R$string;->txt_user_cancel_check:I

    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0xd4

    .line 351
    invoke-static {p1, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    return-void
.end method

.method public final b()V
    .locals 4

    .line 241
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    sget v1, Lcom/tencent/could/huiyansdk/R$id;->txy_camera_gather_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/tencent/could/huiyansdk/turing/a;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 242
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    sget v1, Lcom/tencent/could/huiyansdk/R$id;->txy_cancel_txt_btn:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Ll/ie1;

    invoke-direct {v2, p0}, Ll/ie1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 243
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 244
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    sget v2, Lcom/tencent/could/huiyansdk/R$id;->txy_camera_prepare_img:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 245
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    sget v2, Lcom/tencent/could/huiyansdk/R$id;->txy_auth_feed_back_txt:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    .line 246
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    sget v2, Lcom/tencent/could/huiyansdk/R$id;->txy_auth_feed_back_extra_tip_txt:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->d:Landroid/widget/TextView;

    .line 247
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    sget v2, Lcom/tencent/could/huiyansdk/R$id;->txy_auth_loading_front_animator_view:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 248
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    sget v2, Lcom/tencent/could/huiyansdk/R$id;->txy_count_down_txt_view:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 249
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->f:Landroid/widget/TextView;

    .line 250
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    sget v1, Lcom/tencent/could/huiyansdk/R$id;->txy_hud_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/tencent/could/huiyansdk/view/HudView;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->g:Lcom/tencent/could/huiyansdk/view/HudView;

    .line 251
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 252
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 253
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowDebugView()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->g:Lcom/tencent/could/huiyansdk/view/HudView;

    if-eqz v0, :cond_0

    .line 254
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 255
    :cond_0
    new-instance v0, Lcom/tencent/could/huiyansdk/utils/h;

    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/utils/h;-><init>()V

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->p:Lcom/tencent/could/huiyansdk/utils/h;

    .line 256
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->d:Landroid/widget/TextView;

    .line 257
    iget-object v3, v0, Lcom/tencent/could/huiyansdk/utils/h;->e:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Collection;->clear()V

    .line 258
    iput-object v2, v0, Lcom/tencent/could/huiyansdk/utils/h;->c:Landroid/widget/TextView;

    .line 259
    iget-object v2, v0, Lcom/tencent/could/huiyansdk/utils/h;->a:Landroid/os/HandlerThread;

    if-nez v2, :cond_1

    .line 260
    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "showTips"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v2, v0, Lcom/tencent/could/huiyansdk/utils/h;->a:Landroid/os/HandlerThread;

    .line 261
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 262
    new-instance v2, Lcom/tencent/could/huiyansdk/utils/g;

    iget-object v3, v0, Lcom/tencent/could/huiyansdk/utils/h;->a:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lcom/tencent/could/huiyansdk/utils/g;-><init>(Lcom/tencent/could/huiyansdk/utils/h;Landroid/os/Looper;)V

    iput-object v2, v0, Lcom/tencent/could/huiyansdk/utils/h;->b:Landroid/os/Handler;

    .line 263
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/utils/h;->b()V

    .line 264
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    sget v2, Lcom/tencent/could/huiyansdk/R$string;->txy_face_preparing3:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 265
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 266
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/k$b;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 267
    new-instance v2, Lcom/tencent/could/huiyansdk/fragments/c;

    invoke-direct {v2, p0}, Lcom/tencent/could/huiyansdk/fragments/c;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 268
    iput-object v2, v0, Lcom/tencent/could/huiyansdk/utils/k;->b:Lcom/tencent/could/huiyansdk/callback/c;

    .line 269
    :cond_2
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->s:Z

    .line 270
    iput v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->w:I

    return-void
.end method

.method public final b(I)V
    .locals 1

    .line 284
    new-instance v0, Ll/ne1;

    invoke-direct {v0, p0, p1}, Ll/ne1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;I)V

    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b(JZ)V
    .locals 1

    .line 271
    new-instance v0, Ll/me1;

    invoke-direct {v0, p0, p1, p2, p3}, Ll/me1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;JZ)V

    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b(Landroid/graphics/ColorMatrixColorFilter;)V
    .locals 1

    .line 283
    new-instance v0, Ll/le1;

    invoke-direct {v0, p0, p1}, Ll/le1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Landroid/graphics/ColorMatrixColorFilter;)V

    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b(Ljava/lang/Object;)V
    .locals 1

    .line 272
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->m()V

    .line 273
    instance-of v0, p1, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    if-eqz v0, :cond_2

    .line 274
    check-cast p1, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 275
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 276
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 277
    :cond_0
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isShowErrorDialog()Z

    move-result v0

    :goto_0
    if-nez v0, :cond_1

    .line 278
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    move-result p0

    .line 279
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorMsg()Ljava/lang/String;

    move-result-object p1

    .line 280
    invoke-static {p0, p1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    return-void

    .line 281
    :cond_1
    new-instance v0, Ll/he1;

    invoke-direct {v0, p0, p1}, Ll/he1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_2
    return-void
.end method

.method public final b(Z)V
    .locals 1

    .line 285
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    if-eqz p0, :cond_3

    const/4 v0, 0x0

    .line 286
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->l:Z

    if-eqz p1, :cond_0

    const/16 p1, 0x8

    .line 287
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 288
    :cond_0
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b:Landroid/animation/ValueAnimator;

    if-nez p1, :cond_1

    goto :goto_0

    .line 289
    :cond_1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 290
    :cond_2
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 291
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_3
    :goto_0
    return-void
.end method

.method public backPopEvent()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->backPopEvent()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideAvatarGuideFrame()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 20
    .line 21
    const/16 v0, 0x8

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 28
    .line 29
    const v1, 0x3f6f5c29    # 0.935f

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 47
    .line 48
    sget v0, Lcom/tencent/could/huiyansdk/R$drawable;->txy_huiyan_head_guide_frame:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public exit()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->exit()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/api/j;->d:Z

    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic getDefaultViewModelCreationExtras()Ll/cvb;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-super {p0}, Landroidx/lifecycle/e;->getDefaultViewModelCreationExtras()Ll/cvb;

    move-result-object p0

    return-object p0
.end method

.method public final h()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string v1, ">>>start camera preview(get light data ok)"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const-string v3, "AuthingFragment"

    .line 7
    .line 8
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/je1;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/je1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final i()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string v1, ">>>start auth action"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const-string v3, "AuthingFragment"

    .line 7
    .line 8
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/oe1;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/oe1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final j()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string v1, ">>>start auth end."

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const-string v3, "AuthingFragment"

    .line 7
    .line 8
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->m()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/ge1;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/ge1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final k()V
    .locals 7

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/d$b;->a:Lcom/tencent/could/huiyansdk/manager/d;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "LightSensor"

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    const-string v1, "context is null"

    .line 15
    .line 16
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-boolean v4, v0, Lcom/tencent/could/huiyansdk/manager/d;->c:Z

    .line 21
    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v4, 0x1

    .line 26
    iput-boolean v4, v0, Lcom/tencent/could/huiyansdk/manager/d;->c:Z

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v4, "sensor"

    .line 33
    .line 34
    invoke-virtual {v1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Landroid/hardware/SensorManager;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/d;->a:Landroid/hardware/SensorManager;

    .line 41
    .line 42
    const-string v4, " \u5149\u7ebf\u4f20\u611f\u5668\u4e0d\u53ef\u7528~"

    .line 43
    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 47
    .line 48
    invoke-virtual {v1, v3, v2, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v5, 0x5

    .line 53
    invoke-virtual {v1, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    new-instance v4, Lcom/tencent/could/huiyansdk/manager/d$a;

    .line 60
    .line 61
    invoke-direct {v4, v0}, Lcom/tencent/could/huiyansdk/manager/d$a;-><init>(Lcom/tencent/could/huiyansdk/manager/d;)V

    .line 62
    .line 63
    .line 64
    iput-object v4, v0, Lcom/tencent/could/huiyansdk/manager/d;->b:Lcom/tencent/could/huiyansdk/manager/d$a;

    .line 65
    .line 66
    iget-object v5, v0, Lcom/tencent/could/huiyansdk/manager/d;->a:Landroid/hardware/SensorManager;

    .line 67
    .line 68
    const/4 v6, 0x3

    .line 69
    invoke-virtual {v5, v4, v1, v6}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 74
    .line 75
    invoke-virtual {v1, v3, v2, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    new-instance v1, Ll/ee1;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/ee1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 81
    .line 82
    .line 83
    iget-object v4, v0, Lcom/tencent/could/huiyansdk/manager/d;->b:Lcom/tencent/could/huiyansdk/manager/d$a;

    .line 84
    .line 85
    if-eqz v4, :cond_4

    .line 86
    .line 87
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/d;->d:Lcom/tencent/could/huiyansdk/manager/d$c;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_4
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 91
    .line 92
    const-string v1, "\u8bbe\u5907\u65e0\u5149\u7ebf\u4f20\u611f\u5668\u6216\u8005\u672a\u8c03\u7528start()\u65b9\u6cd5"

    .line 93
    .line 94
    invoke-virtual {v0, v3, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :goto_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v1, "AuthingFragment"

    .line 102
    .line 103
    if-nez v0, :cond_5

    .line 104
    .line 105
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 106
    .line 107
    const-string v0, "can not get activity!"

    .line 108
    .line 109
    invoke-virtual {p0, v3, v1, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_5
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v2, "screen_brightness"

    .line 118
    .line 119
    invoke-static {v0, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->k:I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    return-void

    .line 126
    :catch_0
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 127
    .line 128
    const-string v0, "can not get screen brightness"

    .line 129
    .line 130
    invoke-virtual {p0, v3, v1, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "AuthingFragment"

    .line 5
    .line 6
    const-string v3, "start prepare auth"

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->y:Z

    .line 12
    .line 13
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 14
    .line 15
    new-instance v1, Ll/ke1;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/ke1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    iput-boolean p0, v0, Lcom/tencent/could/huiyansdk/manager/b;->s:Z

    .line 22
    .line 23
    sget-object p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v2, -0x1

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    const-string p0, "AuthStateManager"

    .line 33
    .line 34
    const-string v3, "context is null!"

    .line 35
    .line 36
    invoke-static {p0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget v3, Lcom/tencent/could/huiyansdk/R$color;->txy_feedback_txt_red:I

    .line 45
    .line 46
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    iput v3, v0, Lcom/tencent/could/huiyansdk/manager/b;->o:I

    .line 51
    .line 52
    sget v3, Lcom/tencent/could/huiyansdk/R$color;->txy_black:I

    .line 53
    .line 54
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    iput v3, v0, Lcom/tencent/could/huiyansdk/manager/b;->p:I

    .line 59
    .line 60
    sget v3, Lcom/tencent/could/huiyansdk/R$color;->txy_auth_bg_red_error:I

    .line 61
    .line 62
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    iput v3, v0, Lcom/tencent/could/huiyansdk/manager/b;->q:I

    .line 67
    .line 68
    sget v3, Lcom/tencent/could/huiyansdk/R$color;->txy_auth_bg_green_tip:I

    .line 69
    .line 70
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    iput p0, v0, Lcom/tencent/could/huiyansdk/manager/b;->r:I

    .line 75
    .line 76
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 79
    .line 80
    if-nez p0, :cond_1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackErrorColor()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eq v3, v2, :cond_2

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackErrorColor()I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    iput v3, v0, Lcom/tencent/could/huiyansdk/manager/b;->o:I

    .line 94
    .line 95
    :cond_2
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackTxtColor()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eq v3, v2, :cond_3

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackTxtColor()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    iput v3, v0, Lcom/tencent/could/huiyansdk/manager/b;->p:I

    .line 106
    .line 107
    :cond_3
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthCircleErrorColor()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eq v3, v2, :cond_4

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthCircleErrorColor()I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    iput v3, v0, Lcom/tencent/could/huiyansdk/manager/b;->q:I

    .line 118
    .line 119
    :cond_4
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthCircleCorrectColor()I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    if-eq v3, v2, :cond_5

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthCircleCorrectColor()I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    iput p0, v0, Lcom/tencent/could/huiyansdk/manager/b;->r:I

    .line 130
    .line 131
    :cond_5
    :goto_0
    iput-object v1, v0, Lcom/tencent/could/huiyansdk/manager/b;->b:Lcom/tencent/could/huiyansdk/callback/a;

    .line 132
    .line 133
    sget-object p0, Lcom/tencent/could/huiyansdk/enums/AuthState;->PREPARE:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 134
    .line 135
    const/4 v1, 0x0

    .line 136
    invoke-virtual {v0, p0, v1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    iput v2, v0, Lcom/tencent/could/huiyansdk/manager/b;->i:I

    .line 140
    .line 141
    iput v2, v0, Lcom/tencent/could/huiyansdk/manager/b;->j:I

    .line 142
    .line 143
    const/4 p0, 0x3

    .line 144
    iput p0, v0, Lcom/tencent/could/huiyansdk/manager/b;->k:I

    .line 145
    .line 146
    sget-object p0, Lcom/tencent/could/huiyansdk/enums/AuthState;->AUTH_ACTION:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 147
    .line 148
    invoke-virtual {v0, p0, v1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    new-instance v0, Ll/de1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/de1;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->u:Z

    .line 6
    .line 7
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 8
    .line 9
    const-string p1, "on attach."

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    const-string v1, "AuthingFragment"

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 12
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 2
    .line 3
    const/16 v1, 0x14

    .line 4
    .line 5
    if-nez v0, :cond_18

    .line 6
    .line 7
    sget v0, Lcom/tencent/could/huiyansdk/R$layout;->txy_huiyan_fragment_authing:I

    .line 8
    .line 9
    sget-object v2, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const/4 v4, 0x0

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    sget v0, Lcom/tencent/could/huiyansdk/R$layout;->txy_huiyan_fragment_authing_land:I

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v3, v4

    .line 29
    :goto_0
    iget-object v5, v2, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 30
    .line 31
    const/4 v6, -0x1

    .line 32
    if-eqz v5, :cond_1

    .line 33
    .line 34
    if-nez v3, :cond_1

    .line 35
    .line 36
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthLayoutResId()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    if-eq v7, v6, :cond_1

    .line 41
    .line 42
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthLayoutResId()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    :cond_1
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/api/j;->c()Z

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    if-eqz v7, :cond_2

    .line 51
    .line 52
    sget v0, Lcom/tencent/could/huiyansdk/R$layout;->txy_private_huiyan_fragment_authing_720_bot:I

    .line 53
    .line 54
    if-eqz v5, :cond_2

    .line 55
    .line 56
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthWithLongCheck720LayoutResId()I

    .line 57
    .line 58
    .line 59
    move-result v7

    .line 60
    if-eq v7, v6, :cond_2

    .line 61
    .line 62
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthWithLongCheck720LayoutResId()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    :cond_2
    if-eqz v5, :cond_3

    .line 67
    .line 68
    if-eqz v3, :cond_3

    .line 69
    .line 70
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getLandAuthLayoutResId()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eq v3, v6, :cond_3

    .line 75
    .line 76
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getLandAuthLayoutResId()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    :cond_3
    invoke-virtual {p1, v0, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a()V

    .line 90
    .line 91
    .line 92
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 93
    .line 94
    new-instance v3, Lcom/tencent/could/huiyansdk/fragments/f;

    .line 95
    .line 96
    invoke-direct {v3, p0}, Lcom/tencent/could/huiyansdk/fragments/f;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 97
    .line 98
    .line 99
    iput-object v3, v0, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    .line 100
    .line 101
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 102
    .line 103
    sget v3, Lcom/tencent/could/huiyansdk/R$id;->txy_auth_layout_bg:I

    .line 104
    .line 105
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    .line 112
    .line 113
    iget-object v0, v2, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 114
    .line 115
    if-nez v0, :cond_4

    .line 116
    .line 117
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Light:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getPageColorStyle()Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    :goto_1
    sget-object v3, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Light:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 125
    .line 126
    if-ne v0, v3, :cond_5

    .line 127
    .line 128
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getContextResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    sget v5, Lcom/tencent/could/huiyansdk/R$color;->txy_white:I

    .line 135
    .line 136
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_5
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->fragmentView:Landroid/view/View;

    .line 145
    .line 146
    sget v3, Lcom/tencent/could/huiyansdk/R$id;->txy_cancel_txt_btn:I

    .line 147
    .line 148
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    check-cast v0, Landroid/widget/TextView;

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getContextResources()Landroid/content/res/Resources;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    sget v5, Lcom/tencent/could/huiyansdk/R$color;->txy_white:I

    .line 159
    .line 160
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getContextResources()Landroid/content/res/Resources;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getContextResources()Landroid/content/res/Resources;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b:Landroid/widget/ImageView;

    .line 194
    .line 195
    sget v3, Lcom/tencent/could/huiyansdk/R$drawable;->txy_prepare_face_head_black:I

    .line 196
    .line 197
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    .line 201
    .line 202
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getContextResources()Landroid/content/res/Resources;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    sget v5, Lcom/tencent/could/huiyansdk/R$color;->txy_black:I

    .line 207
    .line 208
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 213
    .line 214
    .line 215
    :goto_2
    sget-object v0, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 216
    .line 217
    iget-object v3, v0, Lcom/tencent/could/huiyansdk/turing/f;->f:Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;

    .line 218
    .line 219
    if-eqz v3, :cond_6

    .line 220
    .line 221
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->reset()V

    .line 222
    .line 223
    .line 224
    :cond_6
    iget-boolean v3, v0, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 225
    .line 226
    const-string v5, "TuringSdkHelper"

    .line 227
    .line 228
    const/4 v7, 0x2

    .line 229
    if-eqz v3, :cond_a

    .line 230
    .line 231
    iget-object v3, v0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 232
    .line 233
    if-nez v3, :cond_7

    .line 234
    .line 235
    goto :goto_5

    .line 236
    :cond_7
    iput-boolean v4, v0, Lcom/tencent/could/huiyansdk/turing/f;->b:Z

    .line 237
    .line 238
    new-instance v3, Lcom/tencent/could/huiyansdk/turing/d;

    .line 239
    .line 240
    invoke-direct {v3, v0}, Lcom/tencent/could/huiyansdk/turing/d;-><init>(Lcom/tencent/could/huiyansdk/turing/f;)V

    .line 241
    .line 242
    .line 243
    iget-boolean v8, v0, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 244
    .line 245
    if-eqz v8, :cond_9

    .line 246
    .line 247
    iget-object v8, v0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 248
    .line 249
    if-nez v8, :cond_8

    .line 250
    .line 251
    goto :goto_3

    .line 252
    :cond_8
    iget-object v5, v0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 253
    .line 254
    iput-object v3, v5, Lcom/tencent/could/huiyansdk/turing/b;->a:Lcom/tencent/could/huiyansdk/turing/c;

    .line 255
    .line 256
    goto :goto_4

    .line 257
    :cond_9
    :goto_3
    sget-object v3, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 258
    .line 259
    const-string v8, "set event listener, turing is not create!"

    .line 260
    .line 261
    invoke-virtual {v3, v7, v5, v8}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    :goto_4
    new-instance v3, Lcom/tencent/could/huiyansdk/manager/f;

    .line 265
    .line 266
    invoke-direct {v3}, Lcom/tencent/could/huiyansdk/manager/f;-><init>()V

    .line 267
    .line 268
    .line 269
    iput-object v3, v0, Lcom/tencent/could/huiyansdk/turing/f;->h:Lcom/tencent/could/huiyansdk/manager/f;

    .line 270
    .line 271
    goto :goto_6

    .line 272
    :cond_a
    :goto_5
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 273
    .line 274
    const-string v3, "init turing sdk logic, turing is not create!"

    .line 275
    .line 276
    invoke-virtual {v0, v7, v5, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    :goto_6
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/b$a;->a:Lcom/tencent/could/huiyansdk/utils/b;

    .line 280
    .line 281
    new-instance v3, Lcom/tencent/could/huiyansdk/utils/i;

    .line 282
    .line 283
    const-string v5, "FrameCreatePool"

    .line 284
    .line 285
    invoke-direct {v3, v1, v5}, Lcom/tencent/could/huiyansdk/utils/i;-><init>(ILjava/lang/String;)V

    .line 286
    .line 287
    .line 288
    iput-object v3, v0, Lcom/tencent/could/huiyansdk/utils/b;->a:Lcom/tencent/could/huiyansdk/utils/i;

    .line 289
    .line 290
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 291
    .line 292
    new-instance v3, Lcom/tencent/could/huiyansdk/utils/i;

    .line 293
    .line 294
    const/16 v5, 0xa

    .line 295
    .line 296
    const-string v8, "ChangeBytePool"

    .line 297
    .line 298
    invoke-direct {v3, v5, v8}, Lcom/tencent/could/huiyansdk/utils/i;-><init>(ILjava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iput-object v3, v0, Lcom/tencent/could/huiyansdk/utils/a;->a:Lcom/tencent/could/huiyansdk/utils/i;

    .line 302
    .line 303
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/api/j;->d()Z

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    if-eqz v0, :cond_b

    .line 308
    .line 309
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 310
    .line 311
    instance-of v3, v0, Lcom/tencent/could/huiyansdk/view/CameraDateGatherView;

    .line 312
    .line 313
    if-eqz v3, :cond_b

    .line 314
    .line 315
    check-cast v0, Lcom/tencent/could/huiyansdk/view/CameraDateGatherView;

    .line 316
    .line 317
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 322
    .line 323
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 324
    .line 325
    int-to-double v8, v3

    .line 326
    const-wide v10, 0x3ff4cccccccccccdL    # 1.3

    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    mul-double/2addr v8, v10

    .line 332
    double-to-int v3, v8

    .line 333
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 334
    .line 335
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 336
    .line 337
    check-cast v3, Lcom/tencent/could/huiyansdk/view/CameraDateGatherView;

    .line 338
    .line 339
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 340
    .line 341
    .line 342
    :cond_b
    iget-object v0, v2, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 343
    .line 344
    if-nez v0, :cond_c

    .line 345
    .line 346
    goto/16 :goto_7

    .line 347
    .line 348
    :cond_c
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    .line 349
    .line 350
    if-eqz v2, :cond_d

    .line 351
    .line 352
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthLayoutBgColor()I

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    if-eq v2, v6, :cond_d

    .line 357
    .line 358
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->h:Lcom/tencent/could/huiyansdk/view/HuiYanReflectLayout;

    .line 359
    .line 360
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getAuthLayoutBgColor()I

    .line 361
    .line 362
    .line 363
    move-result v3

    .line 364
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 365
    .line 366
    .line 367
    :cond_d
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    .line 368
    .line 369
    if-eqz v2, :cond_e

    .line 370
    .line 371
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackTxtColor()I

    .line 372
    .line 373
    .line 374
    move-result v2

    .line 375
    if-eq v2, v6, :cond_e

    .line 376
    .line 377
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    .line 378
    .line 379
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackTxtColor()I

    .line 380
    .line 381
    .line 382
    move-result v3

    .line 383
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 384
    .line 385
    .line 386
    :cond_e
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->d:Landroid/widget/TextView;

    .line 387
    .line 388
    if-eqz v2, :cond_f

    .line 389
    .line 390
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackExtraTipColor()I

    .line 391
    .line 392
    .line 393
    move-result v2

    .line 394
    if-eq v2, v6, :cond_f

    .line 395
    .line 396
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->d:Landroid/widget/TextView;

    .line 397
    .line 398
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getFeedBackExtraTipColor()I

    .line 399
    .line 400
    .line 401
    move-result v3

    .line 402
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 403
    .line 404
    .line 405
    :cond_f
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isTransparentStatusBar()Z

    .line 406
    .line 407
    .line 408
    move-result v2

    .line 409
    if-eqz v2, :cond_11

    .line 410
    .line 411
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->f:Landroid/widget/TextView;

    .line 412
    .line 413
    if-eqz v2, :cond_10

    .line 414
    .line 415
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 420
    .line 421
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 422
    .line 423
    iget-object v5, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->f:Landroid/widget/TextView;

    .line 424
    .line 425
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getTransparentStatusBarMoveHeight()I

    .line 426
    .line 427
    .line 428
    move-result v6

    .line 429
    int-to-float v6, v6

    .line 430
    invoke-static {v5, v6}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 431
    .line 432
    .line 433
    move-result v5

    .line 434
    add-int/2addr v3, v5

    .line 435
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 436
    .line 437
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->f:Landroid/widget/TextView;

    .line 438
    .line 439
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 440
    .line 441
    .line 442
    :cond_10
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 443
    .line 444
    if-eqz v2, :cond_11

    .line 445
    .line 446
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 447
    .line 448
    .line 449
    move-result-object v2

    .line 450
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 451
    .line 452
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 453
    .line 454
    iget-object v5, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 455
    .line 456
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getTransparentStatusBarMoveHeight()I

    .line 457
    .line 458
    .line 459
    move-result v6

    .line 460
    int-to-float v6, v6

    .line 461
    invoke-static {v5, v6}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 462
    .line 463
    .line 464
    move-result v5

    .line 465
    add-int/2addr v3, v5

    .line 466
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 467
    .line 468
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 469
    .line 470
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 471
    .line 472
    .line 473
    :cond_11
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->f:Landroid/widget/TextView;

    .line 474
    .line 475
    const/16 v3, -0xa

    .line 476
    .line 477
    if-eqz v2, :cond_12

    .line 478
    .line 479
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getCancelTxtColor()I

    .line 480
    .line 481
    .line 482
    move-result v2

    .line 483
    if-eq v2, v3, :cond_12

    .line 484
    .line 485
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->f:Landroid/widget/TextView;

    .line 486
    .line 487
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getCancelTxtColor()I

    .line 488
    .line 489
    .line 490
    move-result v5

    .line 491
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 492
    .line 493
    .line 494
    :cond_12
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 495
    .line 496
    if-eqz v2, :cond_13

    .line 497
    .line 498
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getCountDownTxtColor()I

    .line 499
    .line 500
    .line 501
    move-result v2

    .line 502
    if-eq v2, v3, :cond_13

    .line 503
    .line 504
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->e:Landroid/widget/TextView;

    .line 505
    .line 506
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getCountDownTxtColor()I

    .line 507
    .line 508
    .line 509
    move-result v0

    .line 510
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 511
    .line 512
    .line 513
    :cond_13
    :goto_7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    if-nez v0, :cond_14

    .line 518
    .line 519
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 520
    .line 521
    const-string v2, "AuthingFragment"

    .line 522
    .line 523
    const-string v3, "activity is null!"

    .line 524
    .line 525
    invoke-virtual {v0, v7, v2, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    goto :goto_9

    .line 529
    :cond_14
    sget-object v2, Lcom/tencent/could/huiyansdk/permission/c$a;->a:Lcom/tencent/could/huiyansdk/permission/c;

    .line 530
    .line 531
    sget-object v3, Lcom/tencent/could/huiyansdk/utils/f;->a:[Ljava/lang/String;

    .line 532
    .line 533
    new-instance v5, Lcom/tencent/could/huiyansdk/fragments/a;

    .line 534
    .line 535
    invoke-direct {v5, p0}, Lcom/tencent/could/huiyansdk/fragments/a;-><init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V

    .line 536
    .line 537
    .line 538
    iput-object v5, v2, Lcom/tencent/could/huiyansdk/permission/c;->b:Lcom/tencent/could/huiyansdk/permission/a;

    .line 539
    .line 540
    new-instance v2, Ljava/util/ArrayList;

    .line 541
    .line 542
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 543
    .line 544
    .line 545
    :goto_8
    array-length v6, v3

    .line 546
    if-ge v4, v6, :cond_16

    .line 547
    .line 548
    aget-object v6, v3, v4

    .line 549
    .line 550
    invoke-static {v0, v6}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 551
    .line 552
    .line 553
    move-result v6

    .line 554
    if-eqz v6, :cond_15

    .line 555
    .line 556
    aget-object v6, v3, v4

    .line 557
    .line 558
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 559
    .line 560
    .line 561
    :cond_15
    add-int/lit8 v4, v4, 0x1

    .line 562
    .line 563
    goto :goto_8

    .line 564
    :cond_16
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 565
    .line 566
    .line 567
    move-result v3

    .line 568
    new-array v3, v3, [Ljava/lang/String;

    .line 569
    .line 570
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 571
    .line 572
    .line 573
    move-result-object v2

    .line 574
    check-cast v2, [Ljava/lang/String;

    .line 575
    .line 576
    array-length v3, v2

    .line 577
    if-lez v3, :cond_17

    .line 578
    .line 579
    const/16 v3, 0x77

    .line 580
    .line 581
    invoke-static {v0, v2, v3}, Ll/v40;->u(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 582
    .line 583
    .line 584
    goto :goto_9

    .line 585
    :cond_17
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/fragments/a;->b()V

    .line 586
    .line 587
    .line 588
    :cond_18
    :goto_9
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 589
    .line 590
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->d()Z

    .line 591
    .line 592
    .line 593
    move-result v2

    .line 594
    if-eqz v2, :cond_1a

    .line 595
    .line 596
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->c()Z

    .line 597
    .line 598
    .line 599
    move-result v0

    .line 600
    const/16 v2, 0x2bc

    .line 601
    .line 602
    if-eqz v0, :cond_19

    .line 603
    .line 604
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 605
    .line 606
    .line 607
    move-result-object v0

    .line 608
    new-instance v3, Landroid/graphics/Rect;

    .line 609
    .line 610
    const/16 v4, 0xb4

    .line 611
    .line 612
    const/16 v5, 0x44c

    .line 613
    .line 614
    invoke-direct {v3, v1, v4, v2, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 615
    .line 616
    .line 617
    invoke-virtual {v0, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->setDetectRect(Landroid/graphics/Rect;)V

    .line 618
    .line 619
    .line 620
    goto :goto_a

    .line 621
    :cond_19
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 622
    .line 623
    .line 624
    move-result-object v0

    .line 625
    new-instance v3, Landroid/graphics/Rect;

    .line 626
    .line 627
    const/16 v4, 0x118

    .line 628
    .line 629
    const/16 v5, 0x3e8

    .line 630
    .line 631
    invoke-direct {v3, v1, v4, v2, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 632
    .line 633
    .line 634
    invoke-virtual {v0, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->setDetectRect(Landroid/graphics/Rect;)V

    .line 635
    .line 636
    .line 637
    :cond_1a
    :goto_a
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 638
    .line 639
    .line 640
    move-result-object p0

    .line 641
    return-object p0
.end method

.method public onDestroy()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->onDestroy()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 5
    .line 6
    const-string v1, "AuthingFragment"

    .line 7
    .line 8
    const-string v2, "on destroy."

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-virtual {v0, v3, v1, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->u:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->s:Z

    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->r:Lcom/tencent/could/huiyansdk/view/b;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->r:Lcom/tencent/could/huiyansdk/view/b;

    .line 28
    .line 29
    :cond_0
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 34
    .line 35
    :cond_1
    sget-object v1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    sget-object v1, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 41
    .line 42
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/helper/b;->b:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;

    .line 43
    .line 44
    if-eqz v4, :cond_2

    .line 45
    .line 46
    iput-object v2, v1, Lcom/tencent/could/huiyansdk/helper/b;->b:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;

    .line 47
    .line 48
    :cond_2
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->deInit()I

    .line 53
    .line 54
    .line 55
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/d$b;->a:Lcom/tencent/could/huiyansdk/manager/d;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/d;->a()V

    .line 58
    .line 59
    .line 60
    sget-object v1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isAutoScreenBrightness()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    iget v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->k:I

    .line 73
    .line 74
    const/4 v4, -0x1

    .line 75
    if-eq v1, v4, :cond_3

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(I)V

    .line 78
    .line 79
    .line 80
    :cond_3
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/tencent/could/aicamare/CameraHolder;->release()V

    .line 85
    .line 86
    .line 87
    sget-object v1, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/turing/f;->b()V

    .line 90
    .line 91
    .line 92
    :cond_4
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 93
    .line 94
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    .line 95
    .line 96
    if-eqz v4, :cond_5

    .line 97
    .line 98
    iput-object v2, v1, Lcom/tencent/could/huiyansdk/manager/b;->c:Lcom/tencent/could/huiyansdk/callback/b;

    .line 99
    .line 100
    :cond_5
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/manager/b;->b:Lcom/tencent/could/huiyansdk/callback/a;

    .line 101
    .line 102
    if-eqz v4, :cond_6

    .line 103
    .line 104
    iput-object v2, v1, Lcom/tencent/could/huiyansdk/manager/b;->b:Lcom/tencent/could/huiyansdk/callback/a;

    .line 105
    .line 106
    :cond_6
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/manager/b;->l:Lcom/tencent/could/huiyansdk/manager/f;

    .line 107
    .line 108
    if-eqz v4, :cond_7

    .line 109
    .line 110
    iput-object v2, v1, Lcom/tencent/could/huiyansdk/manager/b;->l:Lcom/tencent/could/huiyansdk/manager/f;

    .line 111
    .line 112
    :cond_7
    iput-boolean v0, v1, Lcom/tencent/could/huiyansdk/manager/b;->d:Z

    .line 113
    .line 114
    invoke-virtual {p0, v3}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Z)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->p:Lcom/tencent/could/huiyansdk/utils/h;

    .line 118
    .line 119
    if-eqz p0, :cond_9

    .line 120
    .line 121
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/utils/h;->b:Landroid/os/Handler;

    .line 122
    .line 123
    if-nez v1, :cond_8

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_8
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/utils/h;->b:Landroid/os/Handler;

    .line 127
    .line 128
    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 129
    .line 130
    .line 131
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/utils/h;->b:Landroid/os/Handler;

    .line 132
    .line 133
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/utils/h;->a:Landroid/os/HandlerThread;

    .line 134
    .line 135
    if-eqz v1, :cond_9

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/Thread;->isAlive()Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_9

    .line 142
    .line 143
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/utils/h;->a:Landroid/os/HandlerThread;

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 146
    .line 147
    .line 148
    :cond_9
    :goto_0
    sget-object p0, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 149
    .line 150
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/turing/f;->h:Lcom/tencent/could/huiyansdk/manager/f;

    .line 151
    .line 152
    if-eqz v1, :cond_b

    .line 153
    .line 154
    :goto_1
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/manager/f;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 155
    .line 156
    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-lez v2, :cond_a

    .line 161
    .line 162
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/manager/f;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 163
    .line 164
    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->poll()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    check-cast v2, [B

    .line 169
    .line 170
    sget-object v4, Lcom/tencent/could/huiyansdk/utils/b$a;->a:Lcom/tencent/could/huiyansdk/utils/b;

    .line 171
    .line 172
    invoke-virtual {v4, v2}, Lcom/tencent/could/huiyansdk/utils/b;->a([B)Z

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_a
    iput-boolean v3, v1, Lcom/tencent/could/huiyansdk/manager/f;->j:Z

    .line 177
    .line 178
    iput-boolean v3, v1, Lcom/tencent/could/huiyansdk/manager/f;->k:Z

    .line 179
    .line 180
    iput-boolean v0, v1, Lcom/tencent/could/huiyansdk/manager/f;->p:Z

    .line 181
    .line 182
    iput-boolean v3, v1, Lcom/tencent/could/huiyansdk/manager/f;->q:Z

    .line 183
    .line 184
    :cond_b
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->e:Z

    .line 185
    .line 186
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->d:Z

    .line 187
    .line 188
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->b:Z

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/turing/f;->b()V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onStop()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object v1, Lcom/tencent/could/huiyansdk/utils/f;->a:[Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/tencent/could/huiyansdk/utils/f;->a(Landroid/content/Context;[Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :goto_0
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_8

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isBackgroundStopAuth()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    iget-boolean v1, v0, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 39
    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->y:Z

    .line 47
    .line 48
    if-nez v1, :cond_4

    .line 49
    .line 50
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_4
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 55
    .line 56
    if-eqz v1, :cond_5

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/tencent/could/aicamare/CameraHolder;->release()V

    .line 59
    .line 60
    .line 61
    :cond_5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    if-eqz v1, :cond_7

    .line 66
    .line 67
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->txy_do_not_change_app_in_auth:I

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 74
    .line 75
    if-eqz v0, :cond_6

    .line 76
    .line 77
    const-string v2, "AuthCheckStage"

    .line 78
    .line 79
    const-string v3, "AuthLocalFail"

    .line 80
    .line 81
    invoke-interface {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_6
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 85
    .line 86
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    const/16 v1, 0xd6

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    :cond_7
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_8
    :goto_1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 105
    .line 106
    .line 107
    return-void
.end method
