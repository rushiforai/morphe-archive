.class public Ll/ukp0$a;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ukp0;-><init>(Ll/i6t;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ukp0;


# direct methods
.method public constructor <init>(Ll/ukp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 4

    .line 1
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 10
    .line 11
    invoke-static {v2}, Ll/ukp0;->b(Ll/ukp0;)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    cmpl-float v2, v0, v2

    .line 17
    .line 18
    if-gtz v2, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 21
    .line 22
    invoke-static {v2}, Ll/ukp0;->b(Ll/ukp0;)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-float v2, v2

    .line 27
    cmpl-float v2, v1, v2

    .line 28
    .line 29
    if-lez v2, :cond_4

    .line 30
    .line 31
    :cond_0
    iget-object v2, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 32
    .line 33
    iget-boolean v3, v2, Ll/ukp0;->a:Z

    .line 34
    .line 35
    if-eqz v3, :cond_4

    .line 36
    .line 37
    cmpl-float v0, v0, v1

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    if-lez v0, :cond_2

    .line 41
    .line 42
    cmpl-float v0, p3, v1

    .line 43
    .line 44
    if-ltz v0, :cond_1

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->LEFT2RIGHT:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->RIGHT2LEFT:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    cmpl-float v0, p4, v1

    .line 53
    .line 54
    if-ltz v0, :cond_3

    .line 55
    .line 56
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->UP2DOWN:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->DOWN2UP:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 60
    .line 61
    :goto_0
    invoke-static {v2}, Ll/ukp0;->a(Ll/ukp0;)Ll/i6t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;->voiceVirtualLiveViewGestureDetect()Ll/v3f$d;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    iput-boolean v1, v0, Ll/ukp0;->a:Z

    .line 82
    .line 83
    :cond_4
    iget-object v0, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 84
    .line 85
    invoke-static {v0}, Ll/ukp0;->b(Ll/ukp0;)I

    .line 86
    .line 87
    .line 88
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    iget-object v4, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 18
    .line 19
    invoke-static {v4}, Ll/ukp0;->c(Ll/ukp0;)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    int-to-float v4, v4

    .line 24
    cmpl-float v4, v2, v4

    .line 25
    .line 26
    if-gtz v4, :cond_0

    .line 27
    .line 28
    iget-object v4, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 29
    .line 30
    invoke-static {v4}, Ll/ukp0;->c(Ll/ukp0;)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    int-to-float v4, v4

    .line 35
    cmpl-float v4, v3, v4

    .line 36
    .line 37
    if-lez v4, :cond_4

    .line 38
    .line 39
    :cond_0
    iget-object v4, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 40
    .line 41
    iget-boolean v4, v4, Ll/ukp0;->a:Z

    .line 42
    .line 43
    if-eqz v4, :cond_4

    .line 44
    .line 45
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    cmpl-float v2, v2, v3

    .line 54
    .line 55
    if-ltz v2, :cond_2

    .line 56
    .line 57
    cmpl-float v0, v4, v0

    .line 58
    .line 59
    if-ltz v0, :cond_1

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->LEFT2RIGHT:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->RIGHT2LEFT:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    cmpl-float v0, v5, v1

    .line 68
    .line 69
    if-ltz v0, :cond_3

    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->UP2DOWN:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->DOWN2UP:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 75
    .line 76
    :goto_0
    iget-object v1, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 77
    .line 78
    invoke-static {v1}, Ll/ukp0;->a(Ll/ukp0;)Ll/i6t;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;->voiceVirtualLiveViewGestureDetect()Ll/v3f$d;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    iput-boolean v1, v0, Ll/ukp0;->a:Z

    .line 99
    .line 100
    :cond_4
    iget-object v0, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 101
    .line 102
    invoke-static {v0}, Ll/ukp0;->c(Ll/ukp0;)I

    .line 103
    .line 104
    .line 105
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    return p0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ukp0$a;->a:Ll/ukp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ukp0;->a(Ll/ukp0;)Ll/i6t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;->voiceVirtualLiveViewGestureDetect()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;->TAP:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseEvent$GestureIntention;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method
