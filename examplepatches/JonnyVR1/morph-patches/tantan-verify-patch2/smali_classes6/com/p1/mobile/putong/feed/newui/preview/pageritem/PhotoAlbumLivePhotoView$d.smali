.class public Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ie80$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->B()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/ie80$b;

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ll/ie80$b;->a(Ljava/lang/Exception;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->g(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    int-to-float v0, p1

    .line 10
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 11
    .line 12
    div-float/2addr v0, v1

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->j(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v1, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 20
    .line 21
    div-float/2addr v0, v1

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d:Lv/VProgressBar;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getMax()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    mul-float/2addr v0, v1

    .line 32
    float-to-int v0, v0

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d:Lv/VProgressBar;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->g:Lv/VProgressBar;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->f:Lv/VText;

    .line 50
    .line 51
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->m(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 59
    .line 60
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ll/ie80$b;

    .line 79
    .line 80
    invoke-interface {v0, p1}, Ll/ie80$b;->b(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/ie80$b;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/ie80$b;->c()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/ie80$b;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/ie80$b;->d()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public e()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->k(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/high16 v2, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v3, 0xc8

    .line 22
    .line 23
    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->c:Lv/VLinear;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 56
    .line 57
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const/4 v2, 0x0

    .line 76
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 85
    .line 86
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->g(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_0

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d:Lv/VProgressBar;

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->g:Lv/VProgressBar;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 119
    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d:Lv/VProgressBar;

    .line 121
    .line 122
    const/16 v1, 0x8

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->e:Lv/VLinear;

    .line 130
    .line 131
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 132
    .line 133
    .line 134
    :cond_0
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->j(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->i(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Landroid/view/Surface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onComplete()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/ie80$b;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/ie80$b;->onComplete()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->k(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->g(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->e:Lv/VLinear;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d:Lv/VProgressBar;

    .line 25
    .line 26
    const/16 v1, 0x8

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ll/ie80$b;

    .line 52
    .line 53
    invoke-interface {v0}, Ll/ie80$b;->onPause()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    cmpl-float v0, v0, v1

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-wide/16 v2, 0xc8

    .line 27
    .line 28
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 33
    .line 34
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->c:Lv/VLinear;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 61
    .line 62
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const/high16 v1, 0x3f800000    # 1.0f

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 91
    .line 92
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 100
    .line 101
    .line 102
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->g(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_1

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d:Lv/VProgressBar;

    .line 113
    .line 114
    const/4 v1, 0x0

    .line 115
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 119
    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->e:Lv/VLinear;

    .line 121
    .line 122
    const/16 v1, 0x8

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 125
    .line 126
    .line 127
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 128
    .line 129
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_2

    .line 142
    .line 143
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Ll/ie80$b;

    .line 148
    .line 149
    invoke-interface {v0}, Ll/ie80$b;->onResume()V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_2
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/ie80$b;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/ie80$b;->onStart()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method
