.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/content/Context;

.field public c:Landroid/view/animation/PathInterpolator;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Landroid/view/animation/PathInterpolator;

    .line 12
    .line 13
    const v0, 0x3dcccccd    # 0.1f

    .line 14
    .line 15
    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    const/high16 v2, 0x3e800000    # 0.25f

    .line 19
    .line 20
    invoke-direct {p1, v2, v0, v2, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->c:Landroid/view/animation/PathInterpolator;

    .line 24
    .line 25
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

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->a:Ljava/util/List;

    .line 28
    new-instance p1, Landroid/view/animation/PathInterpolator;

    const p2, 0x3dcccccd    # 0.1f

    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x3e800000    # 0.25f

    invoke-direct {p1, v1, p2, v1, v0}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->c:Landroid/view/animation/PathInterpolator;

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

    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->a:Ljava/util/List;

    .line 31
    new-instance p1, Landroid/view/animation/PathInterpolator;

    const p2, 0x3dcccccd    # 0.1f

    const/high16 p3, 0x3f800000    # 1.0f

    const/high16 v0, 0x3e800000    # 0.25f

    invoke-direct {p1, v0, p2, v0, p3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->c:Landroid/view/animation/PathInterpolator;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->e(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->d(Ll/bkj0;)V

    return-void
.end method


# virtual methods
.method public final c()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public final synthetic d(Ll/bkj0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->h(Ll/bkj0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public doFrame(J)V
    .locals 11

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v4, 0x1

    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;

    .line 25
    .line 26
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;)I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-ne v5, v4, :cond_0

    .line 31
    .line 32
    move v2, v4

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 35
    .line 36
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->a:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_4

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;

    .line 57
    .line 58
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;)I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-ne v5, v4, :cond_2

    .line 63
    .line 64
    iget-wide v5, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->h:J

    .line 65
    .line 66
    sub-long v7, p1, v5

    .line 67
    .line 68
    long-to-float v7, v7

    .line 69
    iget-wide v8, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->i:J

    .line 70
    .line 71
    sub-long v5, v8, v5

    .line 72
    .line 73
    long-to-float v5, v5

    .line 74
    div-float/2addr v7, v5

    .line 75
    cmp-long v5, p1, v8

    .line 76
    .line 77
    if-lez v5, :cond_3

    .line 78
    .line 79
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;I)V

    .line 80
    .line 81
    .line 82
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 85
    .line 86
    iget-object v6, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->D3(Lcom/p1/mobile/putong/data/User;)V

    .line 89
    .line 90
    .line 91
    :cond_3
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->c:Landroid/view/animation/PathInterpolator;

    .line 92
    .line 93
    invoke-virtual {v5, v7}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    const/high16 v6, 0x3f800000    # 1.0f

    .line 98
    .line 99
    invoke-static {v6, v5}, Ljava/lang/Math;->min(FF)F

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    iget-object v7, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 104
    .line 105
    iget v8, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->d:I

    .line 106
    .line 107
    int-to-float v9, v8

    .line 108
    iget v10, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->e:I

    .line 109
    .line 110
    sub-int/2addr v10, v8

    .line 111
    int-to-float v8, v10

    .line 112
    mul-float/2addr v8, v5

    .line 113
    add-float/2addr v9, v8

    .line 114
    invoke-virtual {v7, v9}, Landroid/view/View;->setTranslationX(F)V

    .line 115
    .line 116
    .line 117
    iget-object v7, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 118
    .line 119
    iget v8, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->f:I

    .line 120
    .line 121
    int-to-float v9, v8

    .line 122
    iget v10, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->g:I

    .line 123
    .line 124
    sub-int/2addr v10, v8

    .line 125
    int-to-float v8, v10

    .line 126
    mul-float/2addr v8, v5

    .line 127
    add-float/2addr v9, v8

    .line 128
    invoke-virtual {v7, v9}, Landroid/view/View;->setTranslationY(F)V

    .line 129
    .line 130
    .line 131
    iget-object v7, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 132
    .line 133
    iget v8, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->j:F

    .line 134
    .line 135
    sub-float v8, v6, v8

    .line 136
    .line 137
    mul-float/2addr v8, v5

    .line 138
    sub-float v8, v6, v8

    .line 139
    .line 140
    invoke-virtual {v7, v8}, Landroid/view/View;->setScaleX(F)V

    .line 141
    .line 142
    .line 143
    iget-object v7, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 144
    .line 145
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->j:F

    .line 146
    .line 147
    sub-float v3, v6, v3

    .line 148
    .line 149
    mul-float/2addr v3, v5

    .line 150
    sub-float/2addr v6, v3

    .line 151
    invoke-virtual {v7, v6}, Landroid/view/View;->setScaleY(F)V

    .line 152
    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_4
    if-eqz v2, :cond_5

    .line 156
    .line 157
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 162
    .line 163
    .line 164
    :cond_5
    return-void
.end method

.method public final synthetic e(Ll/bkj0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->h(Ll/bkj0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public f(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->b:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->Y:Lrx/subjects/b;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/bvq;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/bvq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->Z:Lrx/subjects/b;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/cvq;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/cvq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final h(Ll/bkj0;Z)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->c()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->b:Landroid/content/Context;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 15
    .line 16
    const/high16 v2, 0x42700000    # 60.0f

    .line 17
    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-direct {v1, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 27
    .line 28
    .line 29
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 30
    .line 31
    invoke-virtual {p0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->a:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    move-object v2, v0

    .line 40
    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 v3, 0x4

    .line 50
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 54
    .line 55
    const/high16 v3, 0x3f800000    # 1.0f

    .line 56
    .line 57
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->c(Lcom/p1/mobile/putong/data/User;)V

    .line 70
    .line 71
    .line 72
    if-nez p2, :cond_2

    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 76
    .line 77
    .line 78
    move-result-wide v7

    .line 79
    iget-object p2, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p2, Ljava/lang/Integer;

    .line 82
    .line 83
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast p1, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    const/high16 p1, 0x41000000    # 8.0f

    .line 96
    .line 97
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    const/high16 p1, 0x42440000    # 49.0f

    .line 102
    .line 103
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    const-wide/16 p1, 0x190

    .line 108
    .line 109
    add-long v9, v7, p1

    .line 110
    .line 111
    invoke-virtual/range {v2 .. v10}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->d(IIIIJJ)V

    .line 112
    .line 113
    .line 114
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout$a;I)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->g()V

    .line 118
    .line 119
    .line 120
    return-void
.end method
