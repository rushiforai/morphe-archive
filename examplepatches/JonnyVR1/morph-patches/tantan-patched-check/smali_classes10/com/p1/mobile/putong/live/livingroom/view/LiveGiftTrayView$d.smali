.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->H0(Ll/y20;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->q0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->z0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->R:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->R:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->svg:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->R:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->svg:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->z(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 51
    .line 52
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->u(I)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 57
    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    iget-object p1, v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->w()V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->p:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 79
    .line 80
    const/16 v1, 0x12c

    .line 81
    .line 82
    if-ne p1, v1, :cond_2

    .line 83
    .line 84
    invoke-static {}, Ll/i9n;->b()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-nez p1, :cond_2

    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->p:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 93
    .line 94
    const-string v1, "https://auto.tancdn.com/v1/raw/e9fdcb78-6e0b-4ab8-b94c-05227d3b49fd10.so"

    .line 95
    .line 96
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    iget-object p1, v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 103
    .line 104
    const/4 v1, 0x0

    .line 105
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 109
    .line 110
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->n0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    if-eqz p1, :cond_3

    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->n0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Landroid/animation/ValueAnimator;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 123
    .line 124
    .line 125
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 126
    .line 127
    const/16 v1, 0x190

    .line 128
    .line 129
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->w0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;ZI)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;->a:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 133
    .line 134
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p0}, Ll/muj;->D(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method
