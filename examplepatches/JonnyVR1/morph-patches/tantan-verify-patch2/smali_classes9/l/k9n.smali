.class public Ll/k9n;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Landroid/widget/FrameLayout;

.field public j:Lcom/tantan/library/svga/SVGAnimationView;

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/k9n;->i:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/k9n;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k9n;->M3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;)V

    return-void
.end method

.method public static bridge synthetic K3(Ll/k9n;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method

.method public static bridge synthetic L3(Ll/k9n;)Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k9n;->i:Landroid/widget/FrameLayout;

    return-object p0
.end method


# virtual methods
.method public final M3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/k9n;->k:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/k9n;->i:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    iget-object p0, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;->a:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p0, Ll/k9n;->k:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/k9n;->i:Landroid/widget/FrameLayout;

    .line 49
    .line 50
    iget-object v2, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    new-instance v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 56
    .line 57
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    invoke-direct {v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 63
    .line 64
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 65
    .line 66
    const v2, 0x43bb8000    # 375.0f

    .line 67
    .line 68
    .line 69
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    const/high16 v3, 0x43b80000    # 368.0f

    .line 74
    .line 75
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-direct {v0, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 80
    .line 81
    .line 82
    iget-object v2, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 83
    .line 84
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    .line 86
    .line 87
    const/16 v2, 0x50

    .line 88
    .line 89
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 90
    .line 91
    invoke-static {}, Ll/bnl0;->w0()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    int-to-float v2, v2

    .line 96
    iget v3, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;->c:F

    .line 97
    .line 98
    sub-float/2addr v2, v3

    .line 99
    const/high16 v3, 0x431e0000    # 158.0f

    .line 100
    .line 101
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    int-to-float v3, v3

    .line 106
    sub-float/2addr v2, v3

    .line 107
    float-to-int v2, v2

    .line 108
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 109
    .line 110
    iget-object v0, p0, Ll/k9n;->i:Landroid/widget/FrameLayout;

    .line 111
    .line 112
    iget-object v2, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 113
    .line 114
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;->b:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    new-instance v0, Ll/k9n$a;

    .line 140
    .line 141
    invoke-direct {v0, p0}, Ll/k9n$a;-><init>(Ll/k9n;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget-object p0, p0, Ll/k9n;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 149
    .line 150
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->TraysViewEvent:Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$TraysViewEvent;->notifyTrayRewardAnimPlay()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/j9n;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/j9n;-><init>(Ll/k9n;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
