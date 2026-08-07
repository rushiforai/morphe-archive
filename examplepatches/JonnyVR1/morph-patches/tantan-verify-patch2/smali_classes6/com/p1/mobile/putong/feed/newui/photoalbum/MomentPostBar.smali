.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/ProgressBar;

.field public g:Ll/wyd0;

.field public h:F

.field public i:Lcom/p1/mobile/putong/feed/data/Moment;

.field public j:I

.field public k:F

.field public l:F

.field public m:F

.field public n:Landroid/animation/Animator;

.field public o:Landroid/animation/ValueAnimator;

.field public p:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public r:Z

.field public s:I

.field public t:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wyd0;

    .line 5
    .line 6
    const-string v0, "current_post_moment_id"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    .line 13
    .line 14
    const p1, 0x3f4ccccd    # 0.8f

    .line 15
    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->h:F

    .line 18
    .line 19
    new-instance p1, Ll/eq00;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Ll/eq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x12c

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->t:Ll/y20;

    .line 31
    .line 32
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

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    new-instance p1, Ll/wyd0;

    const-string p2, "current_post_moment_id"

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    const p1, 0x3f4ccccd    # 0.8f

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->h:F

    .line 36
    new-instance p1, Ll/eq00;

    invoke-direct {p1, p0}, Ll/eq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    const/16 p2, 0x12c

    .line 37
    invoke-static {p2, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->t:Ll/y20;

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

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    new-instance p1, Ll/wyd0;

    const-string p2, "current_post_moment_id"

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    const p1, 0x3f4ccccd    # 0.8f

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->h:F

    .line 41
    new-instance p1, Ll/eq00;

    invoke-direct {p1, p0}, Ll/eq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    const/16 p2, 0x12c

    .line 42
    invoke-static {p2, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->t:Ll/y20;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->r(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->t(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->u()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->w(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->s(Landroid/view/View;)V

    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->t:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->z(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/high16 v1, 0x42400000    # 48.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final B()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->a:Lv/VText;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final C()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 4
    .line 5
    sget v1, Ll/lbc0;->e2:I

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public D()V
    .locals 0

    .line 1
    return-void
.end method

.method public E(Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->p:Ll/y20;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->q:Ll/y20;

    .line 4
    .line 5
    return-void
.end method

.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mq00;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final i(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public j(Ll/pf60;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x6

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_2

    .line 13
    .line 14
    :cond_0
    const/4 v2, 0x4

    .line 15
    if-eq v0, v2, :cond_2

    .line 16
    .line 17
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_2

    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->A()V

    .line 30
    .line 31
    .line 32
    :cond_2
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    if-eq v0, v2, :cond_3

    .line 38
    .line 39
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->s:I

    .line 40
    .line 41
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->q(I)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-nez v4, :cond_3

    .line 46
    .line 47
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->f:Landroid/widget/ProgressBar;

    .line 52
    .line 53
    invoke-virtual {v4}, Landroid/widget/ProgressBar;->getProgress()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    iput v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->j:I

    .line 58
    .line 59
    if-eqz v0, :cond_9

    .line 60
    .line 61
    const/4 v4, 0x1

    .line 62
    if-eq v0, v4, :cond_8

    .line 63
    .line 64
    const/4 p1, 0x2

    .line 65
    const/4 v5, 0x0

    .line 66
    if-eq v0, p1, :cond_7

    .line 67
    .line 68
    const/4 p1, 0x3

    .line 69
    if-eq v0, p1, :cond_6

    .line 70
    .line 71
    if-eq v0, v2, :cond_5

    .line 72
    .line 73
    const/4 p1, 0x5

    .line 74
    const-wide/16 v1, 0x0

    .line 75
    .line 76
    if-eq v0, p1, :cond_4

    .line 77
    .line 78
    :goto_0
    move-wide v7, v1

    .line 79
    move v10, v3

    .line 80
    move-object v11, v5

    .line 81
    goto :goto_1

    .line 82
    :cond_4
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->j:I

    .line 83
    .line 84
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->z(Z)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    new-instance p1, Ll/pf60;

    .line 89
    .line 90
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-direct {p1, v0, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p1}, Ll/cn40;->A0(Ll/pf60;)V

    .line 98
    .line 99
    .line 100
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 101
    .line 102
    new-instance v5, Ll/lq00;

    .line 103
    .line 104
    invoke-direct {v5, p0}, Ll/lq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    .line 108
    .line 109
    invoke-virtual {p1}, Ll/wyd0;->clear()Z

    .line 110
    .line 111
    .line 112
    const-wide/16 v1, 0xa

    .line 113
    .line 114
    const/16 v3, 0x1f4

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_6
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->m:F

    .line 118
    .line 119
    float-to-long v1, p1

    .line 120
    const/16 v3, 0x1ef

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_7
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->l:F

    .line 124
    .line 125
    float-to-long v1, p1

    .line 126
    const/16 v3, 0x1db

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :goto_1
    iget v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->j:I

    .line 130
    .line 131
    move-object v6, p0

    .line 132
    invoke-virtual/range {v6 .. v11}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->x(JIILjava/lang/Runnable;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_8
    move-object v6, p0

    .line 137
    iget-object p0, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    iget-object p0, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 147
    .line 148
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-lez p0, :cond_9

    .line 153
    .line 154
    iget-object p0, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 157
    .line 158
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 163
    .line 164
    if-eqz p0, :cond_9

    .line 165
    .line 166
    iget-object p0, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 169
    .line 170
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 175
    .line 176
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 177
    .line 178
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result p0

    .line 182
    if-eqz p0, :cond_9

    .line 183
    .line 184
    iget-object p0, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 185
    .line 186
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 187
    .line 188
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 193
    .line 194
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 195
    .line 196
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    if-nez p0, :cond_9

    .line 203
    .line 204
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 205
    .line 206
    iget-object p1, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 207
    .line 208
    iget-object v0, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 209
    .line 210
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 211
    .line 212
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 217
    .line 218
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 219
    .line 220
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 225
    .line 226
    .line 227
    :cond_9
    :goto_2
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    :goto_0
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->q:Ll/y20;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->p:Ll/y20;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    :goto_0
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->o:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    filled-new-array {v0, v1}, [I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->o:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    const-wide/16 v1, 0xc8

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->o:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    new-instance v1, Ll/gq00;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/gq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->o:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public o(I)V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->r:Z

    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->s:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->d:Landroid/widget/ImageView;

    .line 7
    .line 8
    new-instance v2, Ll/hq00;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/hq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->e:Landroid/widget/ImageView;

    .line 17
    .line 18
    new-instance v2, Ll/iq00;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/iq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->B()V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_5

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->g:Ll/wyd0;

    .line 44
    .line 45
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_4

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const/high16 v2, 0x42400000    # 48.0f

    .line 68
    .line 69
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->q(I)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Ll/cn40;->K()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    const/4 v1, 0x0

    .line 90
    if-eqz p1, :cond_0

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->z(Z)V

    .line 93
    .line 94
    .line 95
    move-object v2, p0

    .line 96
    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->z(Z)V

    .line 98
    .line 99
    .line 100
    const/16 v6, 0x15e

    .line 101
    .line 102
    const/4 v7, 0x0

    .line 103
    const-wide/16 v3, 0x0

    .line 104
    .line 105
    const/4 v5, 0x0

    .line 106
    move-object v2, p0

    .line 107
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->x(JIILjava/lang/Runnable;)V

    .line 108
    .line 109
    .line 110
    :goto_0
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-gtz p0, :cond_1

    .line 119
    .line 120
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 121
    .line 122
    iget-object p1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 123
    .line 124
    sget v0, Ll/lbc0;->e2:I

    .line 125
    .line 126
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_1

    .line 130
    .line 131
    :cond_1
    iget-object p0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 134
    .line 135
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 140
    .line 141
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Video;

    .line 142
    .line 143
    if-eqz p1, :cond_2

    .line 144
    .line 145
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 146
    .line 147
    iget-object p1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 148
    .line 149
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 150
    .line 151
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 152
    .line 153
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 158
    .line 159
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 166
    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_2
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Audio;

    .line 170
    .line 171
    if-eqz p1, :cond_3

    .line 172
    .line 173
    check-cast p0, Lcom/p1/mobile/putong/data/Audio;

    .line 174
    .line 175
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->p(Lcom/p1/mobile/putong/data/Audio;)V

    .line 176
    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_3
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 180
    .line 181
    if-eqz p0, :cond_6

    .line 182
    .line 183
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 184
    .line 185
    iget-object p1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 186
    .line 187
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 188
    .line 189
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 190
    .line 191
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 196
    .line 197
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 202
    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_4
    move-object v2, p0

    .line 206
    goto :goto_1

    .line 207
    :cond_5
    move-object v2, p0

    .line 208
    invoke-static {}, Ll/cn40;->Z()Lrx/subjects/a;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    check-cast p0, Ll/pf60;

    .line 217
    .line 218
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-eqz p1, :cond_6

    .line 223
    .line 224
    iget-object p1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 225
    .line 226
    check-cast p1, Ljava/lang/Integer;

    .line 227
    .line 228
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    const/4 v0, 0x6

    .line 233
    if-eq p1, v0, :cond_6

    .line 234
    .line 235
    iget-object p1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 236
    .line 237
    check-cast p1, Ljava/lang/Integer;

    .line 238
    .line 239
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    const/4 v0, 0x4

    .line 244
    if-eq p1, v0, :cond_6

    .line 245
    .line 246
    iget-object p1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 247
    .line 248
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    if-eqz p1, :cond_6

    .line 253
    .line 254
    iget-object p1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 255
    .line 256
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 257
    .line 258
    iput-object p1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 259
    .line 260
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->j(Ll/pf60;)V

    .line 261
    .line 262
    .line 263
    new-instance p0, Ll/jq00;

    .line 264
    .line 265
    invoke-direct {p0, v2}, Ll/jq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v2, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 269
    .line 270
    .line 271
    :cond_6
    :goto_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->h()Lcom/p1/mobile/android/app/Act;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-static {}, Ll/cn40;->Z()Lrx/subjects/a;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    new-instance p1, Ll/kq00;

    .line 284
    .line 285
    invoke-direct {p1, v2}, Ll/kq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 289
    .line 290
    .line 291
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->m()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->D()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/data/Audio;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->a:Lv/VText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->a:Lv/VText;

    .line 15
    .line 16
    iget p1, p1, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 17
    .line 18
    float-to-int p1, p1

    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v1, "%s\'\'"

    .line 28
    .line 29
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 37
    .line 38
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v0, "#ff6a31"

    .line 42
    .line 43
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 48
    .line 49
    .line 50
    const/high16 v0, 0x40000000    # 2.0f

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
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->a:Lv/VText;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final q(I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-static {}, Ll/cmg;->s()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v2, "anonymous"

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    const/16 v0, 0xe

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 27
    .line 28
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    return v3

    .line 35
    :cond_1
    return v1

    .line 36
    :cond_2
    if-ne p1, v3, :cond_3

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 41
    .line 42
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_3

    .line 47
    .line 48
    return v3

    .line 49
    :cond_3
    return v1
.end method

.method public final synthetic r(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->t:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u()V
    .locals 6

    .line 1
    const/16 v4, 0x15e

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const-wide/16 v1, 0x0

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    move-object v0, p0

    .line 8
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->x(JIILjava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/hdc0;->Z0:I

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->l()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget v0, Ll/hdc0;->Y0:I

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-ne v0, p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->k()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final synthetic w(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->j:I

    .line 12
    .line 13
    return-void
.end method

.method public x(JIILjava/lang/Runnable;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->n:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->n:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    cmp-long v0, p1, v0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->f:Landroid/widget/ProgressBar;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v1, p4}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const-string v0, "progress"

    .line 27
    .line 28
    filled-new-array {p3, p4}, [I

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-static {v1, v0, p3}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 37
    .line 38
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 39
    .line 40
    .line 41
    const-wide/16 v4, 0x0

    .line 42
    .line 43
    move-wide v6, p1

    .line 44
    invoke-static/range {v2 .. v7}, Ll/gt0;->k(Landroid/animation/Animator;Landroid/view/animation/Interpolator;JJ)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->n:Landroid/animation/Animator;

    .line 49
    .line 50
    check-cast p1, Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    new-instance p2, Ll/fq00;

    .line 53
    .line 54
    invoke-direct {p2, p0}, Ll/fq00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_2

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->n:Landroid/animation/Animator;

    .line 67
    .line 68
    invoke-static {p1, p5}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->n:Landroid/animation/Animator;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->B()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->s:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->q(I)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 v0, 0x0

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-lez p1, :cond_3

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 43
    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 55
    .line 56
    iget v0, p1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    cmpl-float v1, v0, v1

    .line 60
    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    const v0, 0x461c4000    # 10000.0f

    .line 64
    .line 65
    .line 66
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->h:F

    .line 67
    .line 68
    mul-float v2, v0, v1

    .line 69
    .line 70
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->k:F

    .line 71
    .line 72
    const v2, 0x3e99999a    # 0.3f

    .line 73
    .line 74
    .line 75
    mul-float/2addr v2, v0

    .line 76
    mul-float/2addr v2, v1

    .line 77
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->l:F

    .line 78
    .line 79
    const v2, 0x3dcccccd    # 0.1f

    .line 80
    .line 81
    .line 82
    mul-float/2addr v0, v2

    .line 83
    mul-float/2addr v0, v1

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->m:F

    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_7

    .line 93
    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_7

    .line 103
    .line 104
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    const/high16 p1, 0x43480000    # 200.0f

    .line 119
    .line 120
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->k:F

    .line 121
    .line 122
    const/high16 p1, 0x42200000    # 40.0f

    .line 123
    .line 124
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->l:F

    .line 125
    .line 126
    const/high16 p1, 0x41200000    # 10.0f

    .line 127
    .line 128
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->m:F

    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 131
    .line 132
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-lez p1, :cond_6

    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 143
    .line 144
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 149
    .line 150
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 151
    .line 152
    if-eqz v1, :cond_4

    .line 153
    .line 154
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->b:Lv/VDraweeView;

    .line 157
    .line 158
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 159
    .line 160
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 167
    .line 168
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {p1, v1, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 173
    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_4
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Audio;

    .line 177
    .line 178
    if-eqz v0, :cond_5

    .line 179
    .line 180
    check-cast p1, Lcom/p1/mobile/putong/data/Audio;

    .line 181
    .line 182
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->p(Lcom/p1/mobile/putong/data/Audio;)V

    .line 183
    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->C()V

    .line 187
    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->C()V

    .line 191
    .line 192
    .line 193
    :cond_7
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->A()V

    .line 194
    .line 195
    .line 196
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->k:F

    .line 197
    .line 198
    float-to-long v1, p1

    .line 199
    const/16 v4, 0x15e

    .line 200
    .line 201
    const/4 v5, 0x0

    .line 202
    const/4 v3, 0x0

    .line 203
    move-object v0, p0

    .line 204
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->x(JIILjava/lang/Runnable;)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public z(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->h()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->U1:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->h()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->T1:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->d:Landroid/widget/ImageView;

    .line 30
    .line 31
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->e:Landroid/widget/ImageView;

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
