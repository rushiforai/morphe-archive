.class public Ll/u2y;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/u2y;->g:Z

    .line 11
    .line 12
    iput-object p1, p0, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 13
    .line 14
    iput-object p2, p0, Ll/u2y;->e:Ljava/util/List;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic q(Ll/u2y;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/u2y;->t(Landroid/view/View;FF)V

    return-void
.end method

.method public static bridge synthetic r(Ll/u2y;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/u2y;->g:Z

    return p0
.end method

.method public static s(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->Ge:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 13
    .line 14
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->I(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->M()V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2y;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2y;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    move-object p2, p0

    .line 10
    check-cast p2, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 11
    .line 12
    const/4 p3, 0x1

    .line 13
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->x(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-virtual {p0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u2y;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 10
    .line 11
    iget-object v1, p0, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {v1, p1}, Ll/u2y;->s(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 26
    .line 27
    .line 28
    return-object p2

    .line 29
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Ll/kec0;->s3:I

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    new-instance p1, Ll/t2y;

    .line 49
    .line 50
    invoke-direct {p1, p0}, Ll/t2y;-><init>(Ll/u2y;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnViewTapListener(Ll/fp50;)V

    .line 54
    .line 55
    .line 56
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 57
    .line 58
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-object p2
.end method

.method public final synthetic t(Landroid/view/View;FF)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ll/u2y;->g:Z

    .line 2
    .line 3
    iget-object p2, p0, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/c30;->m()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Ll/u2y;->g:Z

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/c30;->G()V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Ll/u2y;->g:Z

    .line 27
    .line 28
    :goto_0
    invoke-static {}, Ll/bnl0;->F0()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iget-object p2, p0, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getActionBarHeight()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    add-int/2addr p1, p2

    .line 39
    iget-object p2, p0, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/app/PutongAct;->statusHeaderView:Landroid/view/View;

    .line 42
    .line 43
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    iget-object p2, p0, Ll/u2y;->f:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/app/PutongAct;->statusHeaderView:Landroid/view/View;

    .line 52
    .line 53
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    iget-boolean p3, p0, Ll/u2y;->g:Z

    .line 58
    .line 59
    if-eqz p3, :cond_1

    .line 60
    .line 61
    neg-int p1, p1

    .line 62
    int-to-float p1, p1

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    const/4 p1, 0x0

    .line 65
    :goto_1
    invoke-virtual {p2, p1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 70
    .line 71
    .line 72
    :cond_2
    const/4 p1, 0x2

    .line 73
    new-array p1, p1, [F

    .line 74
    .line 75
    fill-array-data p1, :array_0

    .line 76
    .line 77
    .line 78
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance p2, Ll/u2y$a;

    .line 83
    .line 84
    invoke-direct {p2, p0}, Ll/u2y$a;-><init>(Ll/u2y;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 88
    .line 89
    .line 90
    iget-boolean p2, p0, Ll/u2y;->g:Z

    .line 91
    .line 92
    const-wide/16 v0, 0xc8

    .line 93
    .line 94
    if-eqz p2, :cond_3

    .line 95
    .line 96
    move-wide p2, v0

    .line 97
    goto :goto_2

    .line 98
    :cond_3
    const-wide/16 p2, 0x96

    .line 99
    .line 100
    :goto_2
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 101
    .line 102
    .line 103
    iget-boolean p0, p0, Ll/u2y;->g:Z

    .line 104
    .line 105
    if-eqz p0, :cond_4

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_4
    const-wide/16 v0, 0x0

    .line 109
    .line 110
    :goto_3
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    nop

    .line 115
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
