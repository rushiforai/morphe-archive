.class public Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/yyr;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Ll/yyr;

.field public d:Z

.field public e:Landroid/view/View;

.field public f:Z

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->g:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->g:I

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zyr;->a(Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/yyr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->c:Ll/yyr;

    .line 2
    .line 3
    return-void
.end method

.method public c(ZI)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    move v2, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    move v2, v0

    .line 14
    :goto_0
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->e(Z)V

    .line 15
    .line 16
    .line 17
    if-nez p1, :cond_4

    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->f:Z

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->f:Z

    .line 25
    .line 26
    const/4 p1, 0x2

    .line 27
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->a:Lv/VDraweeView;

    .line 32
    .line 33
    if-nez p1, :cond_3

    .line 34
    .line 35
    sget p1, Ll/obc0;->e3:I

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_3
    sget p1, Ll/obc0;->E3:I

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->f:Z

    .line 48
    .line 49
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->g:I

    .line 50
    .line 51
    if-ne p1, p2, :cond_5

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_5
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->g:I

    .line 55
    .line 56
    if-ne p2, v1, :cond_6

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->a:Lv/VDraweeView;

    .line 59
    .line 60
    sget p2, Ll/obc0;->G4:I

    .line 61
    .line 62
    invoke-static {p1, p2}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_6
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->d:Z

    .line 67
    .line 68
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->a:Lv/VDraweeView;

    .line 69
    .line 70
    if-eqz p1, :cond_7

    .line 71
    .line 72
    sget p1, Ll/obc0;->E3:I

    .line 73
    .line 74
    invoke-static {p2, p1}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_7
    sget p1, Ll/obc0;->J1:I

    .line 79
    .line 80
    invoke-static {p2, p1}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 81
    .line 82
    .line 83
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->c:Ll/yyr;

    .line 84
    .line 85
    new-instance p2, Ll/ts10;

    .line 86
    .line 87
    const/16 v0, 0x320

    .line 88
    .line 89
    invoke-direct {p2, v0}, Ll/ts10;-><init>(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, p2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_8

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->a:Lv/VDraweeView;

    .line 105
    .line 106
    sget p1, Ll/obc0;->G4:I

    .line 107
    .line 108
    invoke-static {p0, p1}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 109
    .line 110
    .line 111
    :cond_8
    :goto_2
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->a:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->i()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    const-string p2, "context_single_room"

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->a:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-static {p2, v0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->i()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->f(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->c(ZI)V

    .line 4
    .line 5
    .line 6
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->g:I

    .line 7
    .line 8
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->e:Landroid/view/View;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yyr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->b(Ll/yyr;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->c(ZI)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setOfficialShowMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPlayerMaskView(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->e:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method
