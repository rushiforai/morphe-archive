.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/zld0;",
        ">;"
    }
.end annotation


# static fields
.field public static final c:I

.field public static final d:I


# instance fields
.field public a:I

.field public b:Ll/zld0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x43850000    # 266.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->c:I

    .line 8
    .line 9
    const/high16 v0, 0x42700000    # 60.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->d:I

    .line 16
    .line 17
    return-void
.end method

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
    invoke-static {}, Ll/pae;->b()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->a:I

    .line 9
    .line 10
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

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    invoke-static {}, Ll/pae;->b()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->a:I

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

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    invoke-static {}, Ll/pae;->b()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->a:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->f(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

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

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->b:Ll/zld0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p1, v0}, Ll/j5g0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 27
    .line 28
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    int-to-float v2, v2

    .line 35
    mul-float/2addr v1, v2

    .line 36
    float-to-int v1, v1

    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 38
    .line 39
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/high16 v4, 0x42d00000    # 104.0f

    .line 46
    .line 47
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    sub-int/2addr v3, v5

    .line 52
    int-to-float v3, v3

    .line 53
    mul-float/2addr v2, v3

    .line 54
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    int-to-float v3, v3

    .line 59
    add-float/2addr v2, v3

    .line 60
    float-to-int v2, v2

    .line 61
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->C()Landroid/widget/FrameLayout$LayoutParams;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 66
    .line 67
    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 68
    .line 69
    const/high16 v1, 0x3f000000    # 0.5f

    .line 70
    .line 71
    invoke-interface {v0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->e(FF)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0, v3, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->c(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Landroid/widget/FrameLayout$LayoutParams;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 75
    .line 76
    .line 77
    return-object v0
.end method

.method public final c(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Landroid/widget/FrameLayout$LayoutParams;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/fld0;

    .line 6
    .line 7
    invoke-direct {v0, p0, p3}, Ll/fld0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->setOnClickListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c$a;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    instance-of p3, p1, Landroid/view/View;

    .line 14
    .line 15
    if-eqz p3, :cond_1

    .line 16
    .line 17
    check-cast p1, Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public d(Ll/zld0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->b:Ll/zld0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-static {}, Ll/pae;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V
    .locals 7

    .line 1
    new-instance v0, Ll/hne0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer$a;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;)V

    .line 11
    .line 12
    .line 13
    const-string p1, "sticker"

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    const/4 v3, 0x1

    .line 24
    const-string v4, "Room_sticker"

    .line 25
    .line 26
    const-string v5, "Room_sticker"

    .line 27
    .line 28
    invoke-virtual/range {v0 .. v6}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/hne0$a;->t()Ll/hne0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p2, p1, Ll/hne0;->a:Ll/uoe0;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p2, Ll/uoe0;->D:Z

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->b:Ll/zld0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zld0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->d(Ll/zld0;)V

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

.method public onLayout(ZIIII)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    check-cast p4, Landroid/widget/FrameLayout$LayoutParams;

    .line 25
    .line 26
    iget p5, p4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 27
    .line 28
    iget p4, p4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 29
    .line 30
    div-int/lit8 v0, p2, 0x2

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->a:I

    .line 37
    .line 38
    sub-int/2addr v1, v2

    .line 39
    sub-int v1, p2, v1

    .line 40
    .line 41
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-ge p5, v0, :cond_0

    .line 46
    .line 47
    add-int v0, p4, p3

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    sget v2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->c:I

    .line 54
    .line 55
    sub-int/2addr v1, v2

    .line 56
    if-le v0, v1, :cond_0

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result p4

    .line 62
    sub-int/2addr p4, v2

    .line 63
    sub-int/2addr p4, p3

    .line 64
    :cond_0
    add-int v0, p4, p3

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    sget v2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->d:I

    .line 71
    .line 72
    sub-int/2addr v1, v2

    .line 73
    if-le v0, v1, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    sub-int/2addr p0, v2

    .line 80
    sub-int p4, p0, p3

    .line 81
    .line 82
    :cond_1
    add-int/2addr p2, p5

    .line 83
    add-int/2addr p3, p4

    .line 84
    invoke-virtual {p1, p5, p4, p2, p3}, Landroid/view/View;->layout(IIII)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    move-object v0, p0

    .line 89
    move v1, p1

    .line 90
    move v2, p2

    .line 91
    move v3, p3

    .line 92
    move v4, p4

    .line 93
    move v5, p5

    .line 94
    invoke-super/range {v0 .. v5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 95
    .line 96
    .line 97
    return-void
.end method
