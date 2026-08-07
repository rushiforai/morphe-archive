.class public Ll/xs3;
.super Ll/tz0;
.source "SourceFile"


# instance fields
.field public y:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    sget v6, Ll/obc0;->d7:I

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move-object v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/tz0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-boolean p0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isClosed:Z

    .line 14
    .line 15
    iput-boolean p0, v0, Ll/xs3;->y:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const-string p0, "\u7f51\u7edc\u5f02\u5e38"

    .line 10
    .line 11
    invoke-static {p0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/kf2;->g4()V

    .line 16
    .line 17
    .line 18
    iget-boolean p1, p0, Ll/xs3;->y:Z

    .line 19
    .line 20
    xor-int/lit8 v0, p1, 0x1

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/xs3;->y:Z

    .line 23
    .line 24
    iget-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->c(ZZ)V

    .line 30
    .line 31
    .line 32
    iget-boolean p1, p0, Ll/xs3;->y:Z

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    const-string p1, "\u5df2\u5c4f\u853d\u5176\u4ed6\u7528\u6237\u9001\u793c\u52a8\u6548"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const-string p1, "\u5df2\u6062\u590d\u5176\u4ed6\u7528\u6237\u9001\u793c\u52a8\u6548"

    .line 40
    .line 41
    :goto_0
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-boolean p1, p0, Ll/xs3;->y:Z

    .line 45
    .line 46
    invoke-static {p1}, Ll/asj;->b(Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    sget-object p1, Ll/htd0;->e:Ll/htd0;

    .line 50
    .line 51
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Ll/ifv;

    .line 56
    .line 57
    iget-object p1, p1, Ll/ifv;->k:Ll/jxd0;

    .line 58
    .line 59
    iget-boolean p0, p0, Ll/xs3;->y:Z

    .line 60
    .line 61
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "giftResourceStatus"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xs3;->n4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/tz0;->n4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->d:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 17
    .line 18
    iget-boolean v1, p0, Ll/xs3;->y:Z

    .line 19
    .line 20
    xor-int/2addr v0, v1

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->c(ZZ)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Ll/htd0;->e:Ll/htd0;

    .line 26
    .line 27
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ll/ifv;

    .line 32
    .line 33
    iget-object p1, p1, Ll/ifv;->k:Ll/jxd0;

    .line 34
    .line 35
    iget-boolean p0, p0, Ll/xs3;->y:Z

    .line 36
    .line 37
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method
