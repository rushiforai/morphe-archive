.class public Ll/rjs;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

.field public b:Landroid/animation/ObjectAnimator;

.field public c:Landroid/animation/ObjectAnimator;

.field public d:Landroid/animation/ObjectAnimator;

.field public e:Landroid/animation/AnimatorSet;

.field public f:Landroid/animation/AnimatorSet;

.field public g:Landroid/animation/AnimatorSet;

.field public final h:Ll/qul;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/qul;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rjs;->h:Ll/qul;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/rjs;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rjs;->p(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static synthetic b(Ll/rjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rjs;->n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method

.method public static synthetic c(Ll/rjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rjs;->o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1}, Ll/rjs;->e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;->setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/rjs;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;->setBorderColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 24
    .line 25
    return-object p0
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-wide/16 v0, 0x2

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->setGradientDirection(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;->background:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsBgConfig;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsBgConfig;->startColor:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->addColors(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 15
    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;->background:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsBgConfig;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsBgConfig;->endColor:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->addColors(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 22
    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->setTransparency(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 34
    .line 35
    return-object p0
.end method

.method public final f()Landroid/animation/ObjectAnimator;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->d:Lv/VDraweeView;

    .line 4
    .line 5
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 6
    .line 7
    const/16 v1, 0xf

    .line 8
    .line 9
    new-array v1, v1, [F

    .line 10
    .line 11
    fill-array-data v1, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final g()Landroid/animation/ObjectAnimator;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->d:Lv/VDraweeView;

    .line 4
    .line 5
    sget-object v0, Landroid/view/View;->ROTATION_Y:Landroid/util/Property;

    .line 6
    .line 7
    const/16 v1, 0xf

    .line 8
    .line 9
    new-array v1, v1, [F

    .line 10
    .line 11
    fill-array-data v1, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :array_0
    .array-data 4
        0x0
        0x42b40000    # 90.0f
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x42b40000    # 90.0f
        0x0
    .end array-data
.end method

.method public final h(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-wide/16 v0, 0x2

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->setGradientDirection(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;->strokeColor:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->addColors(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;->strokeColor:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->addColors(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 18
    .line 19
    .line 20
    const-wide/16 v0, 0x0

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->setTransparency(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 30
    .line 31
    return-object p0
.end method

.method public final i()Landroid/animation/ObjectAnimator;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 4
    .line 5
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 6
    .line 7
    const/16 v1, 0xd

    .line 8
    .line 9
    new-array v1, v1, [F

    .line 10
    .line 11
    fill-array-data v1, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final j()Landroid/animation/AnimatorSet;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 4
    .line 5
    sget-object v1, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 6
    .line 7
    const/16 v2, 0xd

    .line 8
    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    fill-array-data v3, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 21
    .line 22
    sget-object v3, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 23
    .line 24
    new-array v2, v2, [F

    .line 25
    .line 26
    fill-array-data v2, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v2, p0, Ll/rjs;->e:Landroid/animation/AnimatorSet;

    .line 39
    .line 40
    const/4 v3, 0x2

    .line 41
    new-array v3, v3, [Landroid/animation/Animator;

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    aput-object v0, v3, v4

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    aput-object v1, v3, v0

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/rjs;->e:Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    const-wide/16 v1, 0x1068

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/rjs;->e:Landroid/animation/AnimatorSet;

    .line 60
    .line 61
    return-object p0

    .line 62
    nop

    .line 63
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rjs;->f:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rjs;->k()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/rjs;->m()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final m()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rjs;->g:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rjs;->h:Ll/qul;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/qul;->p(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/rjs;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 8
    .line 9
    const/high16 v0, 0x40800000    # 4.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p1, p0, v0}, Ll/l35;->a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic p(Landroid/graphics/drawable/Drawable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/rjs;->d:Landroid/animation/ObjectAnimator;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/rjs;->i()Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/rjs;->d:Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/rjs;->e:Landroid/animation/AnimatorSet;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/rjs;->j()Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/rjs;->e:Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    :cond_1
    iget-object p1, p0, Ll/rjs;->g:Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 33
    .line 34
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/rjs;->g:Landroid/animation/AnimatorSet;

    .line 38
    .line 39
    iget-object v0, p0, Ll/rjs;->d:Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    iget-object v1, p0, Ll/rjs;->e:Landroid/animation/AnimatorSet;

    .line 42
    .line 43
    const/4 v2, 0x2

    .line 44
    new-array v2, v2, [Landroid/animation/Animator;

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    aput-object v0, v2, v3

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    aput-object v1, v2, v0

    .line 51
    .line 52
    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/rjs;->g:Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    const-wide/16 v0, 0x1068

    .line 58
    .line 59
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/rjs;->g:Landroid/animation/AnimatorSet;

    .line 63
    .line 64
    const-wide/16 v0, 0x258

    .line 65
    .line 66
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object p0, p0, Ll/rjs;->g:Landroid/animation/AnimatorSet;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rjs;->h:Ll/qul;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/qul;->o(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Ll/rjs;->r(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/rjs;->s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/rjs;->k()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rjs;->b:Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rjs;->f()Landroid/animation/ObjectAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/rjs;->b:Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/rjs;->c:Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/rjs;->g()Landroid/animation/ObjectAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/rjs;->c:Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/rjs;->f:Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/rjs;->f:Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    const-wide/16 v1, 0x1068

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/rjs;->f:Landroid/animation/AnimatorSet;

    .line 41
    .line 42
    iget-object v1, p0, Ll/rjs;->b:Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    iget-object v2, p0, Ll/rjs;->c:Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    const/4 v3, 0x2

    .line 47
    new-array v3, v3, [Landroid/animation/Animator;

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    aput-object v1, v3, v4

    .line 51
    .line 52
    const/4 v1, 0x1

    .line 53
    aput-object v2, v3, v1

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/rjs;->f:Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    const-wide/16 v1, 0x258

    .line 61
    .line 62
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/rjs;->f:Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    new-instance v1, Ll/pjs;

    .line 68
    .line 69
    invoke-direct {v1, p0, p1}, Ll/pjs;-><init>(Ll/rjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-object p0, p0, Ll/rjs;->f:Landroid/animation/AnimatorSet;

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/rjs;->m()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->banner:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;->content:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;->content:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    :try_start_0
    iget-object v0, p0, Ll/rjs;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->x:Lv/VText;

    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;->textColor:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    :catch_0
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance v0, Ll/ljs;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/ljs;-><init>(Ll/rjs;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v0, Ll/njs;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/njs;-><init>(Ll/rjs;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method
