.class public Ll/b8e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/MonetizationMsg;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->msgType:Lcom/p1/mobile/putong/core/data/CoinRechargeType;

    .line 11
    .line 12
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->msgVal:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "url"

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/CoinRechargeType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoinRechargeType;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->openType:Lcom/p1/mobile/putong/core/data/OpenH5Type;

    .line 23
    .line 24
    const-string v0, "browser"

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/OpenH5Type;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/OpenH5Type;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-ne p1, v0, :cond_0

    .line 31
    .line 32
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Landroid/content/Intent;

    .line 37
    .line 38
    const-string v1, "android.intent.action.VIEW"

    .line 39
    .line 40
    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/4 v5, 0x1

    .line 48
    const/4 v6, 0x1

    .line 49
    const/4 v2, 0x0

    .line 50
    const/4 v4, 0x1

    .line 51
    move-object v1, p0

    .line 52
    invoke-static/range {v1 .. v6}, Ll/xwa;->A(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string p1, "hideNotch"

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    move-object v1, p0

    .line 67
    const-string p0, ""

    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    invoke-static {v1, p0, p1}, Ll/a5i0;->A1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void
.end method


# virtual methods
.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/lqb;->w4()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/z7e0;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Ll/z7e0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/a8e0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/a8e0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method
