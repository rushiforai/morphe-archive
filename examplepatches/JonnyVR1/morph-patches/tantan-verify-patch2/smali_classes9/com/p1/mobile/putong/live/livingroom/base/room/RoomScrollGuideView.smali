.class public Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;

.field public b:Lv/VImage;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Ll/kcg0;

.field public f:Ll/rgd0;

.field public g:Ll/ogd0;

.field public h:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->l(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->i()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->j()V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eld0;->a(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->e:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->f:Ll/rgd0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/rgd0;->z()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public g(Ll/rgd0;Ll/ogd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->f:Ll/rgd0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->g:Ll/ogd0;

    .line 4
    .line 5
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic i()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->f:Ll/rgd0;

    .line 2
    .line 3
    const/high16 v0, -0x3cea0000    # -150.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    invoke-virtual {p0, v0}, Ll/rgd0;->x(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->c:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->b:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->a:Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->c:Lv/VImage;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->b:Lv/VImage;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->a:Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;

    .line 29
    .line 30
    const/high16 v1, 0x42dc0000    # 110.0f

    .line 31
    .line 32
    invoke-virtual {v0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;->a(FF)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->m()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->c:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->b:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->a:Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 18
    .line 19
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->c:Lv/VImage;

    .line 23
    .line 24
    const/high16 v0, -0x3d240000    # -110.0f

    .line 25
    .line 26
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    int-to-float v3, v3

    .line 31
    const/4 v10, 0x2

    .line 32
    new-array v9, v10, [F

    .line 33
    .line 34
    const/4 v11, 0x0

    .line 35
    const/4 v12, 0x0

    .line 36
    aput v12, v9, v11

    .line 37
    .line 38
    aput v3, v9, v1

    .line 39
    .line 40
    const-string v3, "translationY"

    .line 41
    .line 42
    const-wide/16 v4, 0x0

    .line 43
    .line 44
    const-wide/16 v6, 0x12c

    .line 45
    .line 46
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v13

    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->b:Lv/VImage;

    .line 51
    .line 52
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    int-to-float v0, v0

    .line 57
    new-array v9, v10, [F

    .line 58
    .line 59
    aput v12, v9, v11

    .line 60
    .line 61
    aput v0, v9, v1

    .line 62
    .line 63
    const-string v3, "translationY"

    .line 64
    .line 65
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->a:Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;

    .line 70
    .line 71
    new-array v9, v10, [F

    .line 72
    .line 73
    fill-array-data v9, :array_0

    .line 74
    .line 75
    .line 76
    const-string v3, "topProgress"

    .line 77
    .line 78
    const-wide/16 v6, -0x1

    .line 79
    .line 80
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    new-instance v2, Ll/cld0;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/cld0;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->a:Lcom/p1/mobile/putong/live/livingroom/view/ScrollGuideView;

    .line 93
    .line 94
    new-array v9, v10, [F

    .line 95
    .line 96
    fill-array-data v9, :array_1

    .line 97
    .line 98
    .line 99
    const-string v3, "bottomProgress"

    .line 100
    .line 101
    const-wide/16 v6, 0x12c

    .line 102
    .line 103
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    new-instance v3, Ll/dld0;

    .line 108
    .line 109
    invoke-direct {v3, p0}, Ll/dld0;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v2, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    .line 116
    .line 117
    new-instance v4, Ll/yjg;

    .line 118
    .line 119
    invoke-direct {v4}, Ll/yjg;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    .line 126
    .line 127
    invoke-virtual {v3, v13}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h:Landroid/animation/AnimatorSet;

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    nop

    .line 149
    :array_0
    .array-data 4
        0x42dc0000    # 110.0f
        0x0
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :array_1
    .array-data 4
        0x42dc0000    # 110.0f
        0x0
    .end array-data
.end method

.method public n(I)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/ald0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ald0;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->e:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->g:Ll/ogd0;

    .line 19
    .line 20
    int-to-double v1, p1

    .line 21
    const-wide v3, 0x3fe3333333333333L    # 0.6

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    add-double/2addr v1, v3

    .line 27
    double-to-long v1, v1

    .line 28
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    const-wide/16 v3, 0x0

    .line 31
    .line 32
    invoke-static {v3, v4, v1, v2, p1}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/bld0;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/bld0;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->e:Ll/kcg0;

    .line 66
    .line 67
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->f()V

    .line 11
    .line 12
    .line 13
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
