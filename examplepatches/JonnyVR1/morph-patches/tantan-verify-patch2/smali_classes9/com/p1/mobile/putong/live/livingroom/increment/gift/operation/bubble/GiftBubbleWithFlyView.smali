.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;",
            ">;"
        }
    .end annotation
.end field

.field public final c:[I

.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b:Ljava/util/List;

    .line 10
    .line 11
    const/16 p1, -0x24

    .line 12
    .line 13
    const/16 v0, 0x14

    .line 14
    .line 15
    const/16 v1, 0x10

    .line 16
    .line 17
    const/16 v2, -0x10

    .line 18
    .line 19
    filled-new-array {v1, v2, p1, v0}, [I

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->c:[I

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->d:I

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b:Ljava/util/List;

    const/16 p1, -0x24

    const/16 p2, 0x14

    const/16 v0, 0x10

    const/16 v1, -0x10

    .line 31
    filled-new-array {v0, v1, p1, p2}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->c:[I

    const/4 p1, 0x0

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->d:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b:Ljava/util/List;

    const/16 p1, -0x24

    const/16 p2, 0x14

    const/16 p3, 0x10

    const/16 v0, -0x10

    .line 35
    filled-new-array {p3, v0, p1, p2}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->c:[I

    const/4 p1, 0x0

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->d:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;)V

    return-void
.end method

.method private getReleaseFlyView()Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b:Ljava/util/List;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    instance-of v1, p0, Landroid/widget/FrameLayout;

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    check-cast p0, Landroid/widget/FrameLayout;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-object v0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wnj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;Z[I)V
    .locals 9

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E0()Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    invoke-virtual {p2}, Ll/jjs;->c()Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->getReleaseFlyView()Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/high16 p3, 0x42500000    # 52.0f

    .line 26
    .line 27
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 32
    .line 33
    invoke-direct {v3, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    const/4 p3, 0x0

    .line 37
    aget p3, v1, p3

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    div-int/2addr v4, v0

    .line 44
    add-int/2addr p3, v4

    .line 45
    sget v4, Ll/qa00;->r:I

    .line 46
    .line 47
    sub-int/2addr p3, v4

    .line 48
    iput p3, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 49
    .line 50
    const/4 p3, 0x1

    .line 51
    aget v1, v1, p3

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    div-int/2addr v5, v0

    .line 58
    add-int/2addr v1, v5

    .line 59
    sub-int/2addr v1, v4

    .line 60
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->a:Landroid/widget/FrameLayout;

    .line 63
    .line 64
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->c:[I

    .line 68
    .line 69
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->d:I

    .line 70
    .line 71
    new-instance v8, Ll/vnj;

    .line 72
    .line 73
    invoke-direct {v8, p0, v2}, Ll/vnj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;)V

    .line 74
    .line 75
    .line 76
    move-object v3, p1

    .line 77
    move-object v4, p2

    .line 78
    move-object v5, p4

    .line 79
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftLongPressFlyView;->A(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;[I[IILl/x20;)V

    .line 80
    .line 81
    .line 82
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->d:I

    .line 83
    .line 84
    add-int/2addr p1, p3

    .line 85
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->d:I

    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/bubble/GiftBubbleWithFlyView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
