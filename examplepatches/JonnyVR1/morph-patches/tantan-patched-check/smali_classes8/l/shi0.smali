.class public Ll/shi0;
.super Ll/wc00;
.source "SourceFile"


# static fields
.field public static i:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public h:Lcom/p1/mobile/putong/data/User;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/shi0;->i:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/shi0;->j:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/shi0;->k:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/shi0;->l:Lrx/subjects/a;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/wc00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    sput-object p2, Ll/shi0;->k:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sput-object p2, Ll/shi0;->i:Lrx/subjects/b;

    .line 15
    .line 16
    sget-object p2, Ll/shi0;->l:Lrx/subjects/a;

    .line 17
    .line 18
    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p2, p3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    sget-object p2, Ll/shi0;->i:Lrx/subjects/b;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance p3, Ll/tgi0;

    .line 30
    .line 31
    invoke-direct {p3, p0}, Ll/tgi0;-><init>(Ll/shi0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    sget-object p2, Ll/shi0;->k:Lrx/subjects/a;

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    new-instance p3, Ll/ugi0;

    .line 48
    .line 49
    invoke-direct {p3, p0}, Ll/ugi0;-><init>(Ll/shi0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    if-eqz p2, :cond_0

    .line 62
    .line 63
    new-instance p2, Ll/vgi0;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Ll/vgi0;-><init>(Ll/shi0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public static F0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 4
    .param p0    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    const-string v0, "otherId"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "callback"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 13
    const/4 v2, 0x0

    .line 14
    :try_start_1
    const-string v3, "isSuperLike"

    .line 15
    .line 16
    invoke-virtual {p1, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception p1

    .line 22
    :try_start_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    move p1, v2

    .line 29
    :goto_0
    const/4 v3, 0x1

    .line 30
    if-ne p1, v3, :cond_0

    .line 31
    .line 32
    move v2, v3

    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {v3, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v0, Ll/hhi0;

    .line 54
    .line 55
    invoke-direct {v0, p0, v2, v1}, Ll/hhi0;-><init>(Ll/xc00;ZLjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :catch_1
    move-exception p0

    .line 67
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p0}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    :goto_1
    return-void
.end method

.method public static synthetic K(Ll/xc00;Ll/uxj0;)V
    .locals 2

    .line 1
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "isSingle"

    .line 7
    .line 8
    const-string v1, "true"

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    sub-int/2addr v0, v1

    .line 27
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "\u8d2d\u4e70\u6210\u529f"

    .line 32
    .line 33
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "purchaseSuccessCallback"

    .line 41
    .line 42
    filled-new-array {p1}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic L(Ll/shi0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/shi0;->r0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic M(Ll/xc00;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "isSingle"

    .line 7
    .line 8
    const-string v1, "false"

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    sub-int/2addr v0, v1

    .line 27
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "purchaseSuccessCallback"

    .line 36
    .line 37
    filled-new-array {p1}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic N(Ll/shi0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/shi0;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Ll/xc00;Lorg/json/JSONObject;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/shi0;->F0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P()V
    .locals 1

    .line 1
    const-string v0, "\u53d1\u9001\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 2
    .line 3
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Q(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/joa;->H3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    invoke-static {}, Ll/o2c;->e()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    const-string v0, "gender"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    goto :goto_0

    .line 20
    :catch_0
    const-string v0, ""

    .line 21
    .line 22
    :goto_0
    new-instance v1, Ll/sxa0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "selected_users_card"

    .line 29
    .line 30
    invoke-direct {v1, v2, v3}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ll/sxa0;->J(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/fhi0;

    .line 37
    .line 38
    invoke-direct {v0, p1, p0}, Ll/fhi0;-><init>(Ll/xc00;Lorg/json/JSONObject;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x3

    .line 42
    invoke-virtual {v1, p0, v0}, Ll/sxa0;->K(ILl/x20;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-static {}, Ll/o2c;->g()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    new-instance p0, Ll/sxa0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string v0, "other"

    .line 59
    .line 60
    invoke-direct {p0, p1, v0}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const/4 p1, 0x4

    .line 64
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p0, p1, v0}, Ll/sxa0;->K(ILl/x20;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-static {}, Ll/o2c;->f()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    invoke-static {p1, p0}, Ll/shi0;->F0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void

    .line 79
    :cond_3
    invoke-static {p1, p0}, Ll/shi0;->F0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static synthetic R(Ll/shi0;Lorg/json/JSONObject;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/shi0;->t0(Lorg/json/JSONObject;Ll/xc00;)V

    return-void
.end method

.method public static synthetic S(Ll/xc00;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v5, Ll/ihi0;

    .line 6
    .line 7
    invoke-direct {v5, p0, p2}, Ll/ihi0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v6, Ll/jhi0;

    .line 11
    .line 12
    invoke-direct {v6}, Ll/jhi0;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v4, "p_selected_users"

    .line 17
    .line 18
    move v3, p1

    .line 19
    move-object v1, p3

    .line 20
    invoke-static/range {v0 .. v6}, Ll/o2c;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/y20;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SVIP_PICKS_MEMBERSHIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_PICKS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_PICKS_MEMBERSHIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic U(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/dkb;->b8(Z)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string v1, "callback"

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const-string v0, "true"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string v0, "false"

    .line 26
    .line 27
    :goto_0
    filled-new-array {v0}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {p1, p0, v0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic V(Z)V
    .locals 1

    .line 1
    sget-object v0, Ll/shi0;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic X(Lorg/json/JSONObject;Ll/xc00;Ljava/util/List;)V
    .locals 5

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "cardId"

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 48
    .line 49
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    iget-object v3, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 56
    .line 57
    instance-of v4, v3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 58
    .line 59
    if-eqz v4, :cond_0

    .line 60
    .line 61
    check-cast v3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v3, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_0

    .line 70
    .line 71
    iget-object p0, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast p0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->content:Lcom/p1/mobile/putong/data/OMSAdCardContent;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardContent;->literatureCardGuide:Lcom/p1/mobile/putong/data/OmsLiteratureCardGuide;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    const/4 p0, 0x0

    .line 81
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsLiteratureCardGuide;->literatureConfigs:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_3

    .line 98
    .line 99
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    check-cast v3, Lcom/p1/mobile/putong/data/LiteratureConfig;

    .line 104
    .line 105
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    if-eqz v4, :cond_2

    .line 110
    .line 111
    iget-object v3, v3, Lcom/p1/mobile/putong/data/LiteratureConfig;->id:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v3}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->i(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    if-eqz v3, :cond_2

    .line 118
    .line 119
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_3
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsLiteratureCardGuide;->literatureConfigs:Ljava/util/List;

    .line 124
    .line 125
    new-instance v1, Lorg/json/JSONObject;

    .line 126
    .line 127
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 128
    .line 129
    .line 130
    const-string v2, "literatureCardGuide"

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OmsLiteratureCardGuide;->toJson()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 137
    .line 138
    .line 139
    const-string p0, "selected_count"

    .line 140
    .line 141
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_4

    .line 146
    .line 147
    const/4 p2, 0x0

    .line 148
    goto :goto_2

    .line 149
    :cond_4
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    :goto_2
    invoke-virtual {v1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    const/4 v1, 0x1

    .line 169
    sub-int/2addr p2, v1

    .line 170
    invoke-virtual {p0, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    filled-new-array {p0}, [Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-interface {p1, v0, p0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    .line 184
    .line 185
    :catch_0
    :cond_5
    return-void
.end method

.method public static synthetic Y(Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    new-instance p2, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "success"

    .line 7
    .line 8
    const-string v1, "true"

    .line 9
    .line 10
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    sub-int/2addr v0, v1

    .line 27
    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p2}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-interface {p0, p1, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic Z(Ll/shi0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/shi0;->w0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a0(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {}, Ll/o2c;->c()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {v0}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {p1, p0, v0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic b0(Ll/shi0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/shi0;->s0()V

    return-void
.end method

.method public static synthetic c0(Ll/xc00;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "isSingle"

    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_PICKS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    if-ne p1, v2, :cond_0

    .line 11
    .line 12
    const-string p1, "true"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p1, "false"

    .line 16
    .line 17
    :goto_0
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :catch_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x1

    .line 33
    sub-int/2addr v0, v1

    .line 34
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "purchaseSuccessCallback"

    .line 43
    .line 44
    filled-new-array {p1}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic d0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/o2c;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/sxa0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "complete_profile"

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v1, v2}, Ll/sxa0;->K(ILl/x20;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/ghi0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/ghi0;-><init>(Ll/xc00;Lorg/json/JSONObject;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public static synthetic e0(Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    const-string v1, "data"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1, p0}, Ll/dkb;->pa(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreData;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    :catch_0
    return-void
.end method

.method public static synthetic f0(Ll/xc00;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/o2c;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/sxa0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "other"

    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x4

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, p0, v1}, Ll/sxa0;->K(ILl/x20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic g0(Ll/shi0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/shi0;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h0(Ll/xc00;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 2

    .line 1
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "isSingle"

    .line 7
    .line 8
    const-string v1, "false"

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    :catch_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    sub-int/2addr v0, v1

    .line 27
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "\u8d2d\u4e70\u6210\u529f"

    .line 32
    .line 33
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "purchaseSuccessCallback"

    .line 41
    .line 42
    filled-new-array {p1}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic i0(Ll/shi0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/shi0;->q0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->fromSign:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/ahi0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/ahi0;-><init>(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method


# virtual methods
.method public final A0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p0, Ll/s5y;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/s5y;-><init>(Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/s5y;->e()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final B0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Ll/qhi0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/qhi0;-><init>(Ll/shi0;Lorg/json/JSONObject;Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final C0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/wgi0;

    .line 6
    .line 7
    invoke-direct {p1, p2}, Ll/wgi0;-><init>(Lorg/json/JSONObject;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 18
    .line 19
    const-string p1, "e_artowrk_multiple_choice_card"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final D0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/shi0;->G0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final E0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/shi0;->G0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final G0(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    new-instance v0, Ll/ygi0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/ygi0;-><init>(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final H0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    new-instance p2, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p2, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "\u4fee\u6539\u672a\u4fdd\u5b58"

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 p2, 0x0

    .line 17
    invoke-virtual {p1, p2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string p2, "\u662f\u5426\u4fdd\u5b58\u5df2\u4fee\u6539\u7684\u5185\u5bb9\uff1f"

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "\u4e0d\u4fdd\u5b58"

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "\u4fdd\u5b58"

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/dhi0;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Ll/dhi0;-><init>(Ll/shi0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance p2, Ll/khi0;

    .line 49
    .line 50
    invoke-direct {p2, p0}, Ll/khi0;-><init>(Ll/shi0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final I0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    new-instance p2, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p2, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "\u7167\u7247\u672a\u52a0\u8f7d\u5b8c\u6210"

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 p2, 0x0

    .line 17
    invoke-virtual {p1, p2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string p2, "\u672a\u52a0\u8f7d\u5b8c\u6210\u7684\u7167\u7247\u5c06\u4e0d\u88ab\u4fdd\u5b58"

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "\u7b49\u5f85\u52a0\u8f7d"

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "\u653e\u5f03\u4fdd\u5b58"

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/xgi0;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Ll/xgi0;-><init>(Ll/shi0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final J0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/shi0;->G0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final K0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/shi0;->G0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final L0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    :try_start_0
    const-string v0, "textContent"

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    goto :goto_0

    .line 10
    :catch_0
    move-object v0, p1

    .line 11
    :goto_0
    new-instance v1, Landroid/text/SpannableString;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/bsj0;->j:Ll/qcj;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/String;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    xor-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p2, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final k0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    :try_start_0
    const-string p0, "isChange"

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    goto :goto_0

    .line 8
    :catch_0
    const-string p0, ""

    .line 9
    .line 10
    :goto_0
    sget-object p1, Ll/shi0;->l:Lrx/subjects/a;

    .line 11
    .line 12
    const-string p2, "true"

    .line 13
    .line 14
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final l0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "id"

    .line 11
    .line 12
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public final m0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->l(Ljava/lang/String;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/zgi0;

    .line 26
    .line 27
    invoke-direct {v0, p2, p1}, Ll/zgi0;-><init>(Lorg/json/JSONObject;Ll/xc00;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public n0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    new-instance p0, Ll/phi0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Ll/phi0;-><init>(Lorg/json/JSONObject;Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    :catch_0
    return-void
.end method

.method public final o0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 8
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/shi0;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p1, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Ll/shi0;->h:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Lorg/json/JSONArray;

    .line 16
    .line 17
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_4

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    new-instance v3, Lorg/json/JSONObject;

    .line 45
    .line 46
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 50
    .line 51
    const-string v5, "video"

    .line 52
    .line 53
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    const-string v5, "videoUrl"

    .line 58
    .line 59
    const-string v6, "imgUrl"

    .line 60
    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    :try_start_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v3, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v3, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 79
    .line 80
    const-string v7, "image"

    .line 81
    .line 82
    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_3

    .line 87
    .line 88
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v3, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    .line 92
    .line 93
    const-string v2, ""

    .line 94
    .line 95
    invoke-virtual {v3, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 96
    .line 97
    .line 98
    :cond_3
    :goto_1
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_4
    const-string v0, "userId"

    .line 103
    .line 104
    iget-object v2, p0, Ll/shi0;->h:Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    const-string v0, "pictures"

    .line 112
    .line 113
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 114
    .line 115
    .line 116
    :catch_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0, p2, p1}, Ll/wc00;->H(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public p0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    new-instance p0, Ll/sgi0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Ll/sgi0;-><init>(Lorg/json/JSONObject;Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    :catch_0
    return-void
.end method

.method public final synthetic q0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wc00;->x()Ll/ad00;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, ""

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p1}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "tantan_swipe_showKeyboard"

    .line 27
    .line 28
    invoke-virtual {p0, v0, p1}, Ll/ad00;->d(Ljava/lang/String;[Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic r0(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wc00;->x()Ll/ad00;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "tantan_swipe_travelDialogSave"

    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ll/ad00;->d(Ljava/lang/String;[Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic s0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/shi0;->h:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic t0(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 2

    .line 1
    const-string v0, "otherId"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    const-string v0, "from"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "hasVagueCards"

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const-string v1, "rollingBottom"

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    invoke-static {}, Ll/joa;->H3()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ll/o2c;->e()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    new-instance p0, Ll/sxa0;

    .line 39
    .line 40
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v0, "selected_users_swipe_up"

    .line 45
    .line 46
    invoke-direct {p0, p1, v0}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/bhi0;

    .line 50
    .line 51
    invoke-direct {p1, p2}, Ll/bhi0;-><init>(Ll/xc00;)V

    .line 52
    .line 53
    .line 54
    const/4 p2, 0x3

    .line 55
    invoke-virtual {p0, p2, p1}, Ll/sxa0;->K(ILl/x20;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-static {}, Ll/joa;->H3()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    invoke-static {}, Ll/o2c;->f()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    :cond_1
    invoke-static {}, Ll/joa;->H3()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    if-eqz p1, :cond_4

    .line 78
    .line 79
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 86
    .line 87
    new-instance v0, Ll/chi0;

    .line 88
    .line 89
    invoke-direct {v0, p2}, Ll/chi0;-><init>(Ll/xc00;)V

    .line 90
    .line 91
    .line 92
    const-string p2, "p_picks_view,pull"

    .line 93
    .line 94
    invoke-interface {p1, p0, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    const-string p1, "clickMask"

    .line 99
    .line 100
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_4

    .line 105
    .line 106
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 107
    .line 108
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iget-object p0, p0, Ll/wc00;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 113
    .line 114
    new-instance v0, Ll/ehi0;

    .line 115
    .line 116
    invoke-direct {v0, p2}, Ll/ehi0;-><init>(Ll/xc00;)V

    .line 117
    .line 118
    .line 119
    const-string p2, "p_picks_view,e_picks_card,click_like"

    .line 120
    .line 121
    invoke-interface {p1, p0, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    return-void
.end method

.method public final synthetic u0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wc00;->x()Ll/ad00;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "tantan_swipe_travelDialogSave"

    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ll/ad00;->d(Ljava/lang/String;[Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public v(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p2, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p2, "getMarriageState"

    .line 17
    .line 18
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v2, 0x12

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p2, "androidTravelIsChange"

    .line 31
    .line 32
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-nez p2, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v2, 0x11

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p2, "getUserInfo"

    .line 45
    .line 46
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-nez p2, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v2, 0x10

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p2, "saveLiteratureData"

    .line 59
    .line 60
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-nez p2, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 v2, 0xf

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p2, "pickUpImageDialog"

    .line 73
    .line 74
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-nez p2, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 v2, 0xe

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p2, "scrollCardLeft"

    .line 87
    .line 88
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-nez p2, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 v2, 0xd

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p2, "purchaseMonitoring"

    .line 101
    .line 102
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-nez p2, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 v2, 0xc

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p2, "travelImageCancel"

    .line 115
    .line 116
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-nez p2, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 v2, 0xb

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p2, "getLiteratureData"

    .line 129
    .line 130
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-nez p2, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 v2, 0xa

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p2, "h5Loading"

    .line 143
    .line 144
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    if-nez p2, :cond_9

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 v2, 0x9

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p2, "completeInform"

    .line 157
    .line 158
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    if-nez p2, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 v2, 0x8

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p2, "clickLikeButton"

    .line 171
    .line 172
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    if-nez p2, :cond_b

    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_b
    const/4 v2, 0x7

    .line 180
    goto :goto_0

    .line 181
    :sswitch_c
    const-string p2, "travelCancelDialog"

    .line 182
    .line 183
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    if-nez p2, :cond_c

    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_c
    const/4 v2, 0x6

    .line 191
    goto :goto_0

    .line 192
    :sswitch_d
    const-string p2, "travelCompleteDialog"

    .line 193
    .line 194
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    if-nez p2, :cond_d

    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_d
    const/4 v2, 0x5

    .line 202
    goto :goto_0

    .line 203
    :sswitch_e
    const-string p2, "getPicksViewButtonStyle"

    .line 204
    .line 205
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p2

    .line 209
    if-nez p2, :cond_e

    .line 210
    .line 211
    goto :goto_0

    .line 212
    :cond_e
    const/4 v2, 0x4

    .line 213
    goto :goto_0

    .line 214
    :sswitch_f
    const-string p2, "travelIntroductCancel"

    .line 215
    .line 216
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-nez p2, :cond_f

    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_f
    const/4 v2, 0x3

    .line 224
    goto :goto_0

    .line 225
    :sswitch_10
    const-string p2, "purchasePopup"

    .line 226
    .line 227
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result p2

    .line 231
    if-nez p2, :cond_10

    .line 232
    .line 233
    goto :goto_0

    .line 234
    :cond_10
    const/4 v2, 0x2

    .line 235
    goto :goto_0

    .line 236
    :sswitch_11
    const-string p2, "verifyWords"

    .line 237
    .line 238
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result p2

    .line 242
    if-nez p2, :cond_11

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_11
    move v2, v1

    .line 246
    goto :goto_0

    .line 247
    :sswitch_12
    const-string p2, "scrollCardRight"

    .line 248
    .line 249
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result p2

    .line 253
    if-nez p2, :cond_12

    .line 254
    .line 255
    goto :goto_0

    .line 256
    :cond_12
    move v2, v0

    .line 257
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 258
    .line 259
    .line 260
    return v0

    .line 261
    :pswitch_0
    invoke-virtual {p0, p1, p4}, Ll/shi0;->p0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 262
    .line 263
    .line 264
    return v1

    .line 265
    :pswitch_1
    invoke-virtual {p0, p1, p4}, Ll/shi0;->k0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 266
    .line 267
    .line 268
    return v1

    .line 269
    :pswitch_2
    invoke-virtual {p0, p1, p4}, Ll/shi0;->o0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 270
    .line 271
    .line 272
    return v1

    .line 273
    :pswitch_3
    invoke-virtual {p0, p1, p4}, Ll/shi0;->C0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 274
    .line 275
    .line 276
    return v1

    .line 277
    :pswitch_4
    invoke-virtual {p0, p1, p4}, Ll/shi0;->A0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 278
    .line 279
    .line 280
    return v1

    .line 281
    :pswitch_5
    invoke-virtual {p0, p1, p4}, Ll/shi0;->D0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 282
    .line 283
    .line 284
    return v1

    .line 285
    :pswitch_6
    invoke-virtual {p0, p1, p4}, Ll/shi0;->y0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 286
    .line 287
    .line 288
    return v1

    .line 289
    :pswitch_7
    invoke-virtual {p0, p1, p4}, Ll/shi0;->J0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 290
    .line 291
    .line 292
    return v1

    .line 293
    :pswitch_8
    invoke-virtual {p0, p1, p4}, Ll/shi0;->m0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 294
    .line 295
    .line 296
    return v1

    .line 297
    :pswitch_9
    invoke-virtual {p0, p1, p4}, Ll/shi0;->z0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 298
    .line 299
    .line 300
    return v1

    .line 301
    :pswitch_a
    invoke-virtual {p0, p1, p4}, Ll/shi0;->l0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 302
    .line 303
    .line 304
    return v1

    .line 305
    :pswitch_b
    invoke-virtual {p0, p1, p4}, Ll/shi0;->x0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 306
    .line 307
    .line 308
    return v1

    .line 309
    :pswitch_c
    invoke-virtual {p0, p1, p4}, Ll/shi0;->H0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 310
    .line 311
    .line 312
    return v1

    .line 313
    :pswitch_d
    invoke-virtual {p0, p1, p4}, Ll/shi0;->I0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 314
    .line 315
    .line 316
    return v1

    .line 317
    :pswitch_e
    invoke-virtual {p0, p1, p4}, Ll/shi0;->n0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 318
    .line 319
    .line 320
    return v1

    .line 321
    :pswitch_f
    invoke-virtual {p0, p1, p4}, Ll/shi0;->K0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 322
    .line 323
    .line 324
    return v1

    .line 325
    :pswitch_10
    invoke-virtual {p0, p1, p4}, Ll/shi0;->B0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 326
    .line 327
    .line 328
    return v1

    .line 329
    :pswitch_11
    invoke-virtual {p0, p1, p4}, Ll/shi0;->L0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 330
    .line 331
    .line 332
    return v1

    .line 333
    :pswitch_12
    invoke-virtual {p0, p1, p4}, Ll/shi0;->E0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 334
    .line 335
    .line 336
    return v1

    .line 337
    :sswitch_data_0
    .sparse-switch
        -0x75b8af61 -> :sswitch_12
        -0x7492fa50 -> :sswitch_11
        -0x4fbd8bd5 -> :sswitch_10
        -0x16849532 -> :sswitch_f
        -0x15be48a2 -> :sswitch_e
        0x74a619b -> :sswitch_d
        0x2010d09c -> :sswitch_c
        0x298bcd51 -> :sswitch_b
        0x2fef8e02 -> :sswitch_a
        0x34b4dbaf -> :sswitch_9
        0x44bbf591 -> :sswitch_8
        0x49a6a83b -> :sswitch_7
        0x4a41f829 -> :sswitch_6
        0x4ec5b524 -> :sswitch_5
        0x50c38a47 -> :sswitch_4
        0x651dd778 -> :sswitch_3
        0x6bf3248f -> :sswitch_2
        0x6cc4c303 -> :sswitch_1
        0x722bce31 -> :sswitch_0
    .end sparse-switch

    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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

.method public final synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/shi0;->G0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic w0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wc00;->x()Ll/ad00;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "tantan_swipe_travelDialogSave"

    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ll/ad00;->d(Ljava/lang/String;[Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public x0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p0, Ll/rhi0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Ll/rhi0;-><init>(Lorg/json/JSONObject;Ll/xc00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final y0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/ela;->C3()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p2, Ll/lhi0;

    .line 18
    .line 19
    invoke-direct {p2, p1}, Ll/lhi0;-><init>(Ll/xc00;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 34
    .line 35
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->On()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    new-instance v0, Ll/mhi0;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/mhi0;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    new-instance v0, Ll/nhi0;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/nhi0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p2, Ll/ohi0;

    .line 66
    .line 67
    invoke-direct {p2, p1}, Ll/ohi0;-><init>(Ll/xc00;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final z0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/webview/HolidayMaskMkWebAct;->c2()V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method
