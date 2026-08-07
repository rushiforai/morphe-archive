.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/a3c<",
        "Ll/dw40;",
        ">;>;"
    }
.end annotation


# instance fields
.field public a:Ll/a3c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a3c<",
            "Ll/dw40;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->a:Ll/a3c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/a3c;->e4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->a:Ll/a3c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/a3c;->d4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/a3c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a3c<",
            "Ll/dw40;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->a:Ll/a3c;

    .line 2
    .line 3
    return-void
.end method

.method public d(FZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public i()V
    .locals 13

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->C0()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Ll/yec0;->X:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    move-object v3, v1

    .line 16
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuTag;

    .line 17
    .line 18
    new-instance v1, Ll/b3c;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/b3c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 27
    .line 28
    const/high16 v9, 0x42200000    # 40.0f

    .line 29
    .line 30
    invoke-static {v9}, Ll/bnl0;->w(F)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    const/4 v10, -0x2

    .line 35
    invoke-direct {v1, v10, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 36
    .line 37
    .line 38
    sget v11, Ll/qa00;->j:I

    .line 39
    .line 40
    invoke-virtual {v1, v11}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 41
    .line 42
    .line 43
    sget v4, Ll/obc0;->I8:I

    .line 44
    .line 45
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->ve:I

    .line 46
    .line 47
    int-to-float v6, v11

    .line 48
    const/16 v7, -0x77e9

    .line 49
    .line 50
    const/4 v12, 0x0

    .line 51
    invoke-static {v7, v6, v12}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    const/4 v8, 0x1

    .line 56
    const/4 v6, -0x1

    .line 57
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuTag;->b(IIILandroid/graphics/drawable/Drawable;Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    sget v1, Ll/yec0;->X:I

    .line 64
    .line 65
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    move-object v1, v0

    .line 70
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuTag;

    .line 71
    .line 72
    new-instance v0, Ll/c3c;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/c3c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 81
    .line 82
    invoke-static {v9}, Ll/bnl0;->w(F)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-direct {v0, v10, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 87
    .line 88
    .line 89
    sget v2, Ll/qa00;->i:I

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 92
    .line 93
    .line 94
    sget v2, Ll/obc0;->H8:I

    .line 95
    .line 96
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->U2:I

    .line 97
    .line 98
    const v4, -0x19e6e6e2

    .line 99
    .line 100
    .line 101
    int-to-float v5, v11

    .line 102
    invoke-static {v4, v5, v12}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    const/4 v6, 0x0

    .line 107
    const v4, -0x19000001

    .line 108
    .line 109
    .line 110
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuTag;->b(IIILandroid/graphics/drawable/Drawable;Z)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/a3c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->c(Ll/a3c;)V

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

.method public j(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->i()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->a:Ll/a3c;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_live_bullet_storm_entrance"

    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method
