.class public Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->j0(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->j0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->j0(Landroid/content/Context;)V

    return-void
.end method

.method private j0(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->h0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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


# virtual methods
.method public h0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/o2i;->b(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final i0(FI)I
    .locals 0

    .line 1
    const/high16 p0, 0x437f0000    # 255.0f

    .line 2
    .line 3
    mul-float/2addr p1, p0

    .line 4
    float-to-int p0, p1

    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/16 p1, 0xff

    .line 11
    .line 12
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    shl-int/lit8 p0, p0, 0x18

    .line 17
    .line 18
    const p1, 0xffffff

    .line 19
    .line 20
    .line 21
    and-int/2addr p1, p2

    .line 22
    add-int/2addr p0, p1

    .line 23
    return p0
.end method

.method public k0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->d:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/lbc0;->G0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    const v2, 0x3e99999a    # 0.3f

    .line 14
    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 29
    .line 30
    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    .line 31
    .line 32
    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 36
    .line 37
    .line 38
    :try_start_0
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v4, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 43
    .line 44
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    check-cast v4, Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {p0, v2, v4}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->i0(FI)I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catch_0
    move-exception v3

    .line 65
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    const-string v5, "#FFFFFF"

    .line 70
    .line 71
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    invoke-virtual {p0, v2, v5}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->i0(FI)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    .line 81
    .line 82
    invoke-static {v3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->d:Landroid/view/View;

    .line 86
    .line 87
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_0
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 92
    .line 93
    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    .line 94
    .line 95
    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-direct {v0, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    const-string v4, "#000000"

    .line 106
    .line 107
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    invoke-virtual {p0, v2, v4}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->i0(FI)I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 116
    .line 117
    .line 118
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->d:Landroid/view/View;

    .line 119
    .line 120
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 121
    .line 122
    .line 123
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_1

    .line 128
    .line 129
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 130
    .line 131
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->e:Lv/VDraweeView;

    .line 132
    .line 133
    iget-object v3, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 134
    .line 135
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 136
    .line 137
    sget v4, Ll/qa00;->x:I

    .line 138
    .line 139
    invoke-virtual {v0, v2, v3, v4, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->e:Lv/VDraweeView;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->f:Landroid/widget/TextView;

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 150
    .line 151
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    :cond_1
    return-void
.end method
