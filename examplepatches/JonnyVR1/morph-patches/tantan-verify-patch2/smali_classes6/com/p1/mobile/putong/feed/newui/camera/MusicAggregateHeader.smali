.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/animation/ObjectAnimator;

.field public h:Ll/rv10;

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/data/Music;


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

.method public static synthetic a(IILandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-static {p2, p0, p1}, Ll/bsj0;->o(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->m(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->o(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->l(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->q(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yv10;->a(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->z(Landroid/widget/TextView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->k()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->j()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->b:Lv/VDraweeView;

    .line 2
    .line 3
    new-instance v1, Ll/sv10;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/sv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    const-string v2, "rotation"

    .line 10
    .line 11
    invoke-static {v0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->g:Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    const-wide/16 v1, 0x4b0

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->g:Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->g:Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    const/4 v0, -0x1

    .line 35
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method public final synthetic l(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->a:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "#aa383e46"

    .line 5
    .line 6
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v1, Ll/wv10;

    .line 15
    .line 16
    const/16 v2, 0x18

    .line 17
    .line 18
    invoke-direct {v1, v0, v2}, Ll/wv10;-><init>(II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/xv10;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/xv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->j:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->s(Lcom/p1/mobile/putong/data/Music;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->j:Lcom/p1/mobile/putong/data/Music;

    .line 7
    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->h:Ll/rv10;

    .line 15
    .line 16
    new-instance v1, Ll/tv10;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/tv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1, v1}, Ll/rv10;->K(Lcom/p1/mobile/putong/data/Music;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->i()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->h()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->j:Lcom/p1/mobile/putong/data/Music;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Music;->owner:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    const/4 v3, 0x2

    .line 11
    const-string v4, "mute_list"

    .line 12
    .line 13
    invoke-static {v0, v1, v4, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->h()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->i:Ll/y20;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->j:Lcom/p1/mobile/putong/data/Music;

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    iput v0, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->t()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/data/Music;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->j:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "default"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->d:Landroid/widget/TextView;

    .line 17
    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v4, "@"

    .line 21
    .line 22
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->e:Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->h()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->B1:I

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->d:Landroid/widget/TextView;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->f:Landroid/widget/TextView;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->e:Landroid/widget/TextView;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->d:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->f:Landroid/widget/TextView;

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->f:Landroid/widget/TextView;

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->b:Lv/VDraweeView;

    .line 90
    .line 91
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 97
    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 99
    .line 100
    new-instance v1, Ll/uv10;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/uv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p1, v1}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->t()V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->d:Landroid/widget/TextView;

    .line 112
    .line 113
    new-instance v0, Ll/vv10;

    .line 114
    .line 115
    invoke-direct {v0, p0}, Ll/vv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/data/Music;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    iput v0, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput v1, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->h()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->E2()V

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->t()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final t()V
    .locals 3

    .line 1
    sget v0, Ll/lbc0;->v6:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->g:Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->c:Landroid/widget/ImageView;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v1, v2}, Landroid/view/View;->setRotation(F)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->j:Lcom/p1/mobile/putong/data/Music;

    .line 15
    .line 16
    iget v1, v1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    if-eq v1, v2, :cond_1

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    if-eq v1, v2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget v0, Ll/lbc0;->u6:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    sget v0, Ll/lbc0;->t6:I

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->g:Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->c:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
