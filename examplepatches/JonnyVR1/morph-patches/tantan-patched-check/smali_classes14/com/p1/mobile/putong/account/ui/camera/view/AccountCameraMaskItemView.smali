.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/ImageView;


# direct methods
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->c(Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hi;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c(Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/fi;->c:Ll/y20;

    .line 2
    .line 3
    new-instance p4, Ll/pf60;

    .line 4
    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-direct {p4, p2, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->k()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/account/data/CameraSticker;Ll/fi;Ljava/util/HashMap;ILcom/p1/mobile/putong/account/data/CameraSticker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            "Ll/fi;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/animation/Animator;",
            ">;I",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ")Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v2, p5, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->cId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p5, p5, Lcom/p1/mobile/putong/account/data/CameraSticker;->cId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p5

    .line 29
    if-eqz p5, :cond_1

    .line 30
    .line 31
    iget-object p5, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->c:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p5, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object p5, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->c:Landroid/view/View;

    .line 39
    .line 40
    const/16 v1, 0x8

    .line 41
    .line 42
    invoke-virtual {p5, v1}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget-object p5, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;

    .line 46
    .line 47
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Ll/pj;->e()Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, p1, v2}, Ll/pj;->h(Lcom/p1/mobile/putong/account/data/CameraSticker;Lcom/p1/mobile/putong/account/data/CameraSticker;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-static {p5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    sget-object p5, Ll/uqb0;->G:Ll/fsb0;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->a:Lv/VDraweeView;

    .line 69
    .line 70
    iget-object v2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->icon:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p5, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1, p3, p4}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->e(Lcom/p1/mobile/putong/account/data/CameraSticker;Ljava/util/HashMap;I)V

    .line 76
    .line 77
    .line 78
    new-instance p3, Ll/gi;

    .line 79
    .line 80
    invoke-direct {p3, p0, p2, p1, p4}, Ll/gi;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    return v0
.end method

.method public final e(Lcom/p1/mobile/putong/account/data/CameraSticker;Ljava/util/HashMap;I)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/animation/Animator;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p3, v0}, Landroid/view/View;->setRotation(F)V

    .line 5
    .line 6
    .line 7
    iget-boolean p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    const/4 v1, 0x1

    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    iget p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 14
    .line 15
    if-eq p3, v1, :cond_1

    .line 16
    .line 17
    :cond_0
    iget p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 18
    .line 19
    if-ne p3, v0, :cond_2

    .line 20
    .line 21
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 22
    .line 23
    invoke-static {p3}, Ll/gt0;->e(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    iget-boolean p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 27
    .line 28
    const/4 v2, 0x2

    .line 29
    const/4 v3, 0x0

    .line 30
    if-nez p3, :cond_3

    .line 31
    .line 32
    iget p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 33
    .line 34
    if-ne p3, v1, :cond_3

    .line 35
    .line 36
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 37
    .line 38
    sget v0, Ll/bbc0;->T:I

    .line 39
    .line 40
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 44
    .line 45
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    iget p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 50
    .line 51
    if-ne p3, v2, :cond_5

    .line 52
    .line 53
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 54
    .line 55
    sget v0, Ll/bbc0;->R:I

    .line 56
    .line 57
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 61
    .line 62
    new-instance v10, Landroid/view/animation/LinearInterpolator;

    .line 63
    .line 64
    invoke-direct {v10}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 65
    .line 66
    .line 67
    new-array v11, v2, [F

    .line 68
    .line 69
    fill-array-data v11, :array_0

    .line 70
    .line 71
    .line 72
    const-string v5, "rotation"

    .line 73
    .line 74
    const-wide/16 v6, 0x0

    .line 75
    .line 76
    const-wide/16 v8, 0x320

    .line 77
    .line 78
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Landroid/animation/Animator;

    .line 101
    .line 102
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {p2, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-object v0, p3

    .line 111
    check-cast v0, Landroid/animation/ObjectAnimator;

    .line 112
    .line 113
    const/4 v1, -0x1

    .line 114
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 118
    .line 119
    invoke-static {v0, p3}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 123
    .line 124
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 129
    .line 130
    if-ne p3, v0, :cond_6

    .line 131
    .line 132
    sget p3, Ll/bbc0;->S:I

    .line 133
    .line 134
    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d:Landroid/widget/ImageView;

    .line 138
    .line 139
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_6
    const/16 p0, 0x8

    .line 144
    .line 145
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 146
    .line 147
    .line 148
    :goto_0
    iget p0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 149
    .line 150
    if-eq p0, v2, :cond_7

    .line 151
    .line 152
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {p2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    check-cast p0, Landroid/animation/Animator;

    .line 159
    .line 160
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_7

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 167
    .line 168
    .line 169
    :cond_7
    return-void

    .line 170
    nop

    .line 171
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
