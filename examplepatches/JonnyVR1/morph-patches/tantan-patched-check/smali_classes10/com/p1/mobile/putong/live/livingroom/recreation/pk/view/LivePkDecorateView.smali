.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gct;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setDecorateData(Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;)V
    .locals 5

    .line 1
    sget v0, Ll/qa00;->z:I

    .line 2
    .line 3
    sget v1, Ll/qa00;->S:I

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->leftUrl:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const-string v3, "context_single_room"

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->a:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->leftUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v3, v2, v4, v1, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 24
    .line 25
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->a:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {v2, v4}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->rightUrl:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->c:Lv/VDraweeView;

    .line 39
    .line 40
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->rightUrl:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v3, v2, v4, v1, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->c:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 51
    .line 52
    .line 53
    :goto_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/high16 v2, 0x43700000    # 240.0f

    .line 58
    .line 59
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    sub-int/2addr v1, v2

    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->centerUrl:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_2

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->b:Lv/VDraweeView;

    .line 73
    .line 74
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->centerUrl:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v3, v2, v4, v1, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_2
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 81
    .line 82
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->b:Lv/VDraweeView;

    .line 83
    .line 84
    invoke-virtual {v2, v4}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 85
    .line 86
    .line 87
    :goto_2
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->topUrl:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_3

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->d:Lv/VDraweeView;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->topUrl:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v3, p0, p1, v1, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->d:Lv/VDraweeView;

    .line 106
    .line 107
    invoke-virtual {p1, p0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method
