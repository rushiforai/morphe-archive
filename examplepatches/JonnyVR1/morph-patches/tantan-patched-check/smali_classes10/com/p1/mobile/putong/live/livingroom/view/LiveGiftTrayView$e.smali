.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->setIntlFlyMicListener(Landroid/animation/ObjectAnimator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->m0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Ll/y20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    const/4 p1, 0x2

    .line 36
    new-array v0, p1, [I

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    aget v2, v0, v1

    .line 47
    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    div-int/2addr v3, p1

    .line 57
    add-int/2addr v2, v3

    .line 58
    aput v2, v0, v1

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    aget v2, v0, v1

    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    div-int/2addr v3, p1

    .line 72
    add-int/2addr v2, v3

    .line 73
    aput v2, v0, v1

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 86
    .line 87
    if-nez p1, :cond_0

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 94
    .line 95
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 100
    .line 101
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->id:I

    .line 102
    .line 103
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->startPosition:[I

    .line 104
    .line 105
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->receiveUserId:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 114
    .line 115
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->receiveUserId:Ljava/lang/String;

    .line 122
    .line 123
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 124
    .line 125
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->m0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Ll/y20;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    :cond_2
    return-void
.end method
