.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/TextView;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/uzh;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->i:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->i:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->i:Ljava/util/List;

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method private synthetic k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array v0, p2, [Ll/tfj0$a;

    .line 3
    .line 4
    const-string v1, "e_fast_state_post"

    .line 5
    .line 6
    const-string v2, "p_moment_post"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 12
    .line 13
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->q2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/BubbleInfo;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 v0, 0x2738

    .line 18
    .line 19
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public R(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->i0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/j4h;->h()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->h:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget v2, Ll/k9c0;->g:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->h:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->e:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const/4 v3, 0x1

    .line 71
    invoke-virtual {v0, v1, v2, v3}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->j0()V

    .line 75
    .line 76
    .line 77
    new-instance v0, Ll/ehh;

    .line 78
    .line 79
    invoke-direct {v0, p0, p1}, Ll/ehh;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;Lcom/p1/mobile/android/app/Act;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->m0()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public i0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fhh;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->g:Lv/VDraweeView;

    .line 10
    .line 11
    sget v1, Ll/lbc0;->X1:I

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->f:Lv/VDraweeView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->g:Lv/VDraweeView;

    .line 14
    .line 15
    sget v0, Ll/lbc0;->X1:I

    .line 16
    .line 17
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v2, 0x1

    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 44
    .line 45
    new-instance v2, Landroid/graphics/drawable/shapes/OvalShape;

    .line 46
    .line 47
    invoke-direct {v2}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-direct {v0, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 51
    .line 52
    .line 53
    :try_start_0
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 58
    .line 59
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catch_0
    move-exception v1

    .line 76
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "#FFFFFF"

    .line 81
    .line 82
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->f:Lv/VDraweeView;

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_1
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 99
    .line 100
    new-instance v1, Landroid/graphics/drawable/shapes/OvalShape;

    .line 101
    .line 102
    invoke-direct {v1}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    const-string v2, "#000000"

    .line 113
    .line 114
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->f:Lv/VDraweeView;

    .line 122
    .line 123
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 124
    .line 125
    .line 126
    :goto_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->g:Lv/VDraweeView;

    .line 129
    .line 130
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 131
    .line 132
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 133
    .line 134
    sget v1, Ll/qa00;->n:I

    .line 135
    .line 136
    invoke-virtual {v0, p0, p1, v1, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public m0()V
    .locals 6

    .line 1
    invoke-static {}, Ll/d5i;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/d5i;->a()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    new-instance v1, Lv/VText;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->j:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-direct {v1, v2}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    sget v3, Ll/bnl0;->e:I

    .line 29
    .line 30
    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    const/high16 v0, 0x41500000    # 13.0f

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 42
    .line 43
    .line 44
    const/high16 v0, 0x41200000    # 10.0f

    .line 45
    .line 46
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    const/high16 v3, 0x41400000    # 12.0f

    .line 51
    .line 52
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 65
    .line 66
    .line 67
    const/4 v2, -0x1

    .line 68
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const/4 v3, 0x1

    .line 76
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Lcom/p1/mobile/android/ui/bubble/a;

    .line 80
    .line 81
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->j:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    invoke-direct {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->j:Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    sget v4, Ll/k9c0;->n:I

    .line 101
    .line 102
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    filled-new-array {v2}, [I

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    const-wide/16 v4, 0x1388

    .line 115
    .line 116
    invoke-virtual {v1, v4, v5}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 125
    .line 126
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 127
    .line 128
    or-int/2addr v2, v3

    .line 129
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {}, Ll/d5i;->i()V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->f:Lv/VDraweeView;

    .line 149
    .line 150
    invoke-virtual {v1, v0, p0}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    :cond_1
    :goto_0
    return-void
.end method
