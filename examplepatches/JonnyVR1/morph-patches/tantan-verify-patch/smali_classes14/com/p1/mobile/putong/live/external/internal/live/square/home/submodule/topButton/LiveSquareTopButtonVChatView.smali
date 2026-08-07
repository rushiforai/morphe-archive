.class public Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVChatView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m6u;->a(Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVChatView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVChatView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVChatView;->c:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Ll/tq8;->w()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    const/high16 v1, 0x42100000    # 36.0f

    .line 30
    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 36
    .line 37
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 42
    .line 43
    const/high16 v1, 0x41200000    # 10.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVChatView;->c:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-static {}, Ll/mbs;->h()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    sget v0, Ll/nbc0;->h0:I

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    sget v0, Ll/nbc0;->g0:I

    .line 63
    .line 64
    :goto_0
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonVChatView;->c:Lv/VDraweeView;

    .line 69
    .line 70
    sget v1, Ll/nbc0;->k0:I

    .line 71
    .line 72
    invoke-virtual {p0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 73
    .line 74
    .line 75
    const/high16 p0, 0x42000000    # 32.0f

    .line 76
    .line 77
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 82
    .line 83
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 88
    .line 89
    const/high16 p0, 0x40c00000    # 6.0f

    .line 90
    .line 91
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 96
    .line 97
    return-void
.end method
