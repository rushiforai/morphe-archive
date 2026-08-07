.class public final Ll/u4l;
.super Ll/yw80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/yw80<",
        "Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideWealthIconView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u0010\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000eH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0011J#\u0010\u0017\u001a\u00020\u000b2\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u00132\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/u4l;",
        "Ll/yw80;",
        "Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideWealthIconView;",
        "Ll/kv80;",
        "listener",
        "<init>",
        "(Ll/kv80;)V",
        "",
        "o",
        "()I",
        "itemView",
        "",
        "Q",
        "(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideWealthIconView;)V",
        "Ll/vx80;",
        "presenter",
        "K",
        "(Ll/vx80;)V",
        "R",
        "Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;",
        "wealthLogoResponse",
        "",
        "throwable",
        "P",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;Ljava/lang/Throwable;)V",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/kv80;)V
    .locals 1
    .param p1    # Ll/kv80;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    invoke-direct {p0, v0, p1}, Ll/yw80;-><init>(ILl/kv80;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static N(Ll/u4l;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Ll/u4l;->P(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;Ljava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static O(Ll/u4l;Ll/vx80;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;->canHide:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/u4l;->R(Ll/vx80;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p2, p1}, Ll/u4l;->P(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public K(Ll/vx80;)V
    .locals 2
    .param p1    # Ll/vx80;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/yw80;->K(Ll/vx80;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LivePrivacyApiProvider;->getHideWealthIconRight()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/s4l;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/s4l;-><init>(Ll/u4l;Ll/vx80;)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ll/t4l;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/t4l;-><init>(Ll/u4l;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const p0, 0xa925

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 7
    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 9
    .line 10
    if-ne v0, p0, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    if-eqz p2, :cond_1

    .line 18
    .line 19
    instance-of p1, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 24
    .line 25
    iget p1, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 26
    .line 27
    if-ne p1, p0, :cond_1

    .line 28
    .line 29
    iget-object p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideWealthIconView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideWealthIconView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideWealthIconView;->i0(Ll/u4l;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final R(Ll/vx80;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p1, Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "hide_wealth_icon"

    .line 13
    .line 14
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->D0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideWealthIconView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u4l;->Q(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideWealthIconView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
