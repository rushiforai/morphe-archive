.class public Ll/d3l;
.super Ll/yw80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/yw80<",
        "Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideAvatarSettingView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/kv80;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0, p1}, Ll/yw80;-><init>(ILl/kv80;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic N(Ll/d3l;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d3l;->R(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O(Ll/d3l;Ll/vx80;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3l;->T(Ll/vx80;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)V

    return-void
.end method

.method private R(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0xa4d8

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public K(Ll/vx80;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LivePrivacyApiProvider;->getHideAvatarEnable()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/b3l;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/b3l;-><init>(Ll/d3l;Ll/vx80;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/c3l;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/c3l;-><init>(Ll/d3l;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public P(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->T:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Q(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->U:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final S(Ll/vx80;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p1, Landroid/os/Bundle;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v0, "enter_hide_avatar_config"

    .line 20
    .line 21
    invoke-virtual {p1, v0, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 22
    .line 23
    .line 24
    const-string p2, "hide_avatar"

    .line 25
    .line 26
    invoke-static {p0, p2, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic T(Ll/vx80;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d3l;->S(Ll/vx80;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideAvatarSettingView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideAvatarSettingView;->j0(Ll/d3l;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->B0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideAvatarSettingView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d3l;->U(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideAvatarSettingView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
