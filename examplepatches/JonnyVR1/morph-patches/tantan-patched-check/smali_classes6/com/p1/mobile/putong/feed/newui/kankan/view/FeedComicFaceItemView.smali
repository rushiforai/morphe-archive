.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hwg;->b(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/feed/data/CameraSticker;Ljava/util/HashMap;ILcom/p1/mobile/putong/feed/data/CameraSticker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/animation/Animator;",
            ">;I",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
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
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v2, p4, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

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
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->cId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p4, p4, Lcom/p1/mobile/putong/feed/data/CameraSticker;->cId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    if-eqz p4, :cond_1

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    :cond_1
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->a:Lv/VDraweeView;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->icon:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p4, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->d(Lcom/p1/mobile/putong/feed/data/CameraSticker;Ljava/util/HashMap;I)V

    .line 42
    .line 43
    .line 44
    return v0
.end method

.method public final d(Lcom/p1/mobile/putong/feed/data/CameraSticker;Ljava/util/HashMap;I)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/animation/Animator;",
            ">;I)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/16 v4, 0x8

    .line 10
    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v5, 0x0

    .line 18
    invoke-virtual {v3, v5}, Landroid/view/View;->setRotation(F)V

    .line 19
    .line 20
    .line 21
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 22
    .line 23
    const/4 v5, 0x4

    .line 24
    const/4 v6, 0x1

    .line 25
    if-nez v3, :cond_1

    .line 26
    .line 27
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 28
    .line 29
    if-eq v3, v6, :cond_2

    .line 30
    .line 31
    :cond_1
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 32
    .line 33
    if-ne v3, v5, :cond_3

    .line 34
    .line 35
    :cond_2
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-static {v3}, Ll/gt0;->e(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    :cond_3
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 41
    .line 42
    const/4 v7, 0x2

    .line 43
    const/4 v8, 0x0

    .line 44
    if-nez v3, :cond_4

    .line 45
    .line 46
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 47
    .line 48
    if-ne v3, v6, :cond_4

    .line 49
    .line 50
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 51
    .line 52
    sget v4, Ll/lbc0;->f:I

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 58
    .line 59
    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 64
    .line 65
    if-ne v3, v7, :cond_6

    .line 66
    .line 67
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 68
    .line 69
    sget v4, Ll/lbc0;->d:I

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 72
    .line 73
    .line 74
    iget-object v9, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 75
    .line 76
    new-instance v15, Landroid/view/animation/LinearInterpolator;

    .line 77
    .line 78
    invoke-direct {v15}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 79
    .line 80
    .line 81
    new-array v3, v7, [F

    .line 82
    .line 83
    fill-array-data v3, :array_0

    .line 84
    .line 85
    .line 86
    const-string v10, "rotation"

    .line 87
    .line 88
    const-wide/16 v11, 0x0

    .line 89
    .line 90
    const-wide/16 v13, 0x320

    .line 91
    .line 92
    move-object/from16 v16, v3

    .line 93
    .line 94
    invoke-static/range {v9 .. v16}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    if-eqz v4, :cond_5

    .line 109
    .line 110
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    check-cast v4, Landroid/animation/Animator;

    .line 117
    .line 118
    invoke-virtual {v4}, Landroid/animation/Animator;->cancel()V

    .line 119
    .line 120
    .line 121
    :cond_5
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-object v4, v3

    .line 127
    check-cast v4, Landroid/animation/ObjectAnimator;

    .line 128
    .line 129
    const/4 v5, -0x1

    .line 130
    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 131
    .line 132
    .line 133
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 134
    .line 135
    invoke-static {v4, v3}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 136
    .line 137
    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 139
    .line 140
    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_6
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 145
    .line 146
    if-ne v3, v5, :cond_7

    .line 147
    .line 148
    sget v3, Ll/lbc0;->e:I

    .line 149
    .line 150
    invoke-virtual {v6, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 151
    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->b:Landroid/widget/ImageView;

    .line 154
    .line 155
    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_7
    invoke-virtual {v6, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 160
    .line 161
    .line 162
    :goto_0
    iget v0, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 163
    .line 164
    if-eq v0, v7, :cond_8

    .line 165
    .line 166
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Landroid/animation/Animator;

    .line 173
    .line 174
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_8

    .line 179
    .line 180
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 181
    .line 182
    .line 183
    :cond_8
    return-void

    .line 184
    nop

    .line 185
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method
