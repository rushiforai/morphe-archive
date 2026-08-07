.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/las;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/p4;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;

.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;

.field public d:Ll/was;

.field public e:Ll/zas;

.field public f:Ll/bbs;

.field public g:Ll/las;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/las<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    new-array p1, p1, [Ll/p4;

    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 15
    new-array p1, p1, [Ll/p4;

    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->a:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 17
    new-array p1, p1, [Ll/p4;

    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->a:Ljava/util/ArrayList;

    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic b(Landroid/view/View;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static f(Landroid/view/View;ZJLl/x20;)Landroid/animation/AnimatorSet;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    neg-int v1, v1

    .line 21
    int-to-float v1, v1

    .line 22
    const/high16 v2, 0x40000000    # 2.0f

    .line 23
    .line 24
    div-float/2addr v1, v2

    .line 25
    const/4 v2, 0x2

    .line 26
    new-array v3, v2, [F

    .line 27
    .line 28
    aput v1, v3, v0

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    const/4 v4, 0x0

    .line 32
    aput v4, v3, v1

    .line 33
    .line 34
    sget-object v5, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 35
    .line 36
    invoke-static {p0, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const-wide/16 v5, 0x190

    .line 41
    .line 42
    invoke-virtual {v3, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    .line 48
    .line 49
    invoke-direct {p1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, p1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    .line 57
    .line 58
    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, p1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    new-array p1, v2, [F

    .line 65
    .line 66
    fill-array-data p1, :array_0

    .line 67
    .line 68
    .line 69
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 70
    .line 71
    invoke-static {p0, v5, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-wide/16 v6, 0x12c

    .line 76
    .line 77
    invoke-virtual {p1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    .line 80
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 81
    .line 82
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 86
    .line 87
    .line 88
    const/high16 v6, 0x40800000    # 4.0f

    .line 89
    .line 90
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    int-to-float v6, v6

    .line 95
    new-array v7, v2, [F

    .line 96
    .line 97
    aput v4, v7, v0

    .line 98
    .line 99
    aput v6, v7, v1

    .line 100
    .line 101
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 102
    .line 103
    invoke-static {p0, v0, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-wide/16 v6, 0x1f4

    .line 108
    .line 109
    invoke-virtual {v0, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 110
    .line 111
    .line 112
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 113
    .line 114
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 118
    .line 119
    .line 120
    new-array v1, v2, [F

    .line 121
    .line 122
    fill-array-data v1, :array_1

    .line 123
    .line 124
    .line 125
    invoke-static {p0, v5, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 130
    .line 131
    .line 132
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 133
    .line 134
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 138
    .line 139
    .line 140
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 141
    .line 142
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v4, p1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, p2, p3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1, p2, p3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p1, v3}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 170
    .line 171
    .line 172
    new-instance p1, Ll/ebs;

    .line 173
    .line 174
    invoke-direct {p1, p0}, Ll/ebs;-><init>(Landroid/view/View;)V

    .line 175
    .line 176
    .line 177
    new-instance p2, Ll/fbs;

    .line 178
    .line 179
    invoke-direct {p2, p0, p4}, Ll/fbs;-><init>(Landroid/view/View;Ll/x20;)V

    .line 180
    .line 181
    .line 182
    invoke-static {v2, p1, p2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 186
    .line 187
    .line 188
    return-object v2

    .line 189
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/las;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->g:Ll/las;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;-><init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;

    .line 11
    .line 12
    invoke-direct {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;-><init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;

    .line 16
    .line 17
    new-instance v0, Ll/was;

    .line 18
    .line 19
    invoke-direct {v0, p1, p0}, Ll/was;-><init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->d:Ll/was;

    .line 23
    .line 24
    new-instance v0, Ll/zas;

    .line 25
    .line 26
    invoke-direct {v0, p1, p0}, Ll/zas;-><init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->e:Ll/zas;

    .line 30
    .line 31
    new-instance v0, Ll/bbs;

    .line 32
    .line 33
    invoke-direct {v0, p1, p0}, Ll/bbs;-><init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->f:Ll/bbs;

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->d:Ll/was;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->e:Ll/zas;

    .line 45
    .line 46
    const/4 v4, 0x5

    .line 47
    new-array v4, v4, [Ll/p4;

    .line 48
    .line 49
    const/4 v5, 0x0

    .line 50
    aput-object p1, v4, v5

    .line 51
    .line 52
    const/4 p1, 0x1

    .line 53
    aput-object v1, v4, p1

    .line 54
    .line 55
    const/4 p1, 0x2

    .line 56
    aput-object v2, v4, p1

    .line 57
    .line 58
    const/4 p1, 0x3

    .line 59
    aput-object v3, v4, p1

    .line 60
    .line 61
    const/4 p1, 0x4

    .line 62
    aput-object v0, v4, p1

    .line 63
    .line 64
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->a:Ljava/util/ArrayList;

    .line 69
    .line 70
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/dbs;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/dbs;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(JLcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->g:Ll/las;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-wide v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->ENTER_EFFECT_V0:J

    .line 7
    .line 8
    cmp-long v0, p1, v0

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;

    .line 13
    .line 14
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    sget-wide v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->ENTER_EFFECT_V1:J

    .line 19
    .line 20
    cmp-long v0, p1, v0

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;

    .line 25
    .line 26
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    sget-wide v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->ENTER_EFFECT_V2:J

    .line 31
    .line 32
    cmp-long v0, p1, v0

    .line 33
    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->d:Ll/was;

    .line 37
    .line 38
    invoke-virtual {p0, p3}, Ll/was;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    sget-wide v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->ENTER_EFFECT_V3:J

    .line 43
    .line 44
    cmp-long v0, p1, v0

    .line 45
    .line 46
    if-nez v0, :cond_5

    .line 47
    .line 48
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ll/p6s;->E1()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_4

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->f:Ll/bbs;

    .line 59
    .line 60
    invoke-virtual {p0, p3}, Ll/bbs;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->e:Ll/zas;

    .line 65
    .line 66
    invoke-virtual {p0, p3}, Ll/zas;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_5
    sget-wide v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->ENTER_EFFECT_V4:J

    .line 71
    .line 72
    cmp-long p1, p1, v0

    .line 73
    .line 74
    if-nez p1, :cond_6

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->f:Ll/bbs;

    .line 77
    .line 78
    invoke-virtual {p0, p3}, Ll/bbs;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;

    .line 83
    .line 84
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/cbs;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/cbs;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/las;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->c(Ll/las;)V

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
