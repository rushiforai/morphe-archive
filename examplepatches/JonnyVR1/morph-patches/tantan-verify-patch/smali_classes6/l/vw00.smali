.class public Ll/vw00;
.super Ll/lb2;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# instance fields
.field public e:Ll/ie80;

.field public f:Ll/ie80;

.field public g:Ll/z3h;

.field public h:Ll/ie80$c;

.field public i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;",
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
    iput-object p1, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vw00;->j:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q(Ll/vw00;Lcom/p1/mobile/putong/data/Media;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw00;->w(Lcom/p1/mobile/putong/data/Media;)Z

    move-result p0

    return p0
.end method

.method public static synthetic r(Ll/vw00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vw00;->x()V

    return-void
.end method

.method public static synthetic s(Ll/vw00;Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw00;->y(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V

    return-void
.end method

.method public static bridge synthetic t(Ll/vw00;)Ll/ie80$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw00;->h:Ll/ie80$c;

    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/feed/ui/PlayerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vw00;->f:Ll/ie80;

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
    iget-object v0, p0, Ll/vw00;->f:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ie80;->release()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/vw00;->e:Ll/ie80;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/vw00;->e:Ll/ie80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ie80;->release()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public D(Ll/z3h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vw00;->g:Ll/z3h;

    .line 2
    .line 3
    return-void
.end method

.method public E()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vw00;->f:Ll/ie80;

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
    iget-object v0, p0, Ll/vw00;->f:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/vw00;->e:Ll/ie80;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/vw00;->e:Ll/ie80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw00;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

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
    check-cast p1, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

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
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    instance-of p2, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    move-object p2, p0

    .line 17
    check-cast p2, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 4
    .line 5
    iget v1, v1, Ll/ax00;->b:I

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->d:Ll/cx00;

    .line 8
    .line 9
    iget-object v0, v0, Ll/cx00;->b:Lv/VPager;

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->reset()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 31
    .line 32
    iget v0, v0, Ll/ax00;->b:I

    .line 33
    .line 34
    if-eq v0, p1, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Ll/vw00;->f:Ll/ie80;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/vw00;->f:Ll/ie80;

    .line 45
    .line 46
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Ll/vw00;->e:Ll/ie80;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Ll/vw00;->e:Ll/ie80;

    .line 58
    .line 59
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object p0, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 65
    .line 66
    iput p1, p0, Ll/ax00;->b:I

    .line 67
    .line 68
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vw00;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p2}, Ll/vw00;->u(Lcom/p1/mobile/putong/data/Media;I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/data/Media;I)Landroid/view/View;
    .locals 3

    .line 1
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    new-instance p2, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;

    .line 6
    .line 7
    iget-object v0, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 8
    .line 9
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    move-object v0, p1

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->M(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/sw00;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/sw00;-><init>(Ll/vw00;Lcom/p1/mobile/putong/data/Media;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->setOnLongPressListener(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Ll/tw00;

    .line 28
    .line 29
    invoke-direct {p1, p0, p2}, Ll/tw00;-><init>(Ll/vw00;Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->setOnTapListener(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 38
    .line 39
    iget-boolean p1, p1, Ll/ax00;->c:Z

    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 44
    .line 45
    iget-object p0, p0, Ll/vw00;->g:Ll/z3h;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;->setOnDragDismissListenler(Ll/am50;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-object p2

    .line 51
    :cond_1
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 52
    .line 53
    if-eqz p2, :cond_3

    .line 54
    .line 55
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 56
    .line 57
    new-instance p2, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 58
    .line 59
    iget-object v0, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 60
    .line 61
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ll/vw00;->A(Lcom/p1/mobile/putong/feed/ui/PlayerView;)V

    .line 65
    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setProgressBarsEnabled(Z)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/vw00;->v(Ljava/lang/String;)Ll/ie80;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const-string v1, "moments"

    .line 78
    .line 79
    invoke-interface {v0, v1}, Ll/ie80;->a(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/vw00;->v(Ljava/lang/String;)Ll/ie80;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ll/bnl0;->y0()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-static {}, Ll/bnl0;->w0()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-static {}, Ll/bnl0;->F0()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    sub-int/2addr v1, v2

    .line 107
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->z(II)V

    .line 108
    .line 109
    .line 110
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_2

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {p1}, Ll/uqb0;->S0(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_2
    new-instance p1, Ll/vw00$a;

    .line 134
    .line 135
    invoke-direct {p1, p0}, Ll/vw00$a;-><init>(Ll/vw00;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->x(Ll/ie80$b;)V

    .line 139
    .line 140
    .line 141
    return-object p2

    .line 142
    :cond_3
    const/4 p0, 0x0

    .line 143
    return-object p0
.end method

.method public v(Ljava/lang/String;)Ll/ie80;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "http"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/vw00;->e:Ll/ie80;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ll/re80;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/re80;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/vw00;->e:Ll/ie80;

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/vw00;->e:Ll/ie80;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p1, p0, Ll/vw00;->f:Ll/ie80;

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    new-instance p1, Ll/ye80;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/ye80;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/vw00;->f:Ll/ie80;

    .line 39
    .line 40
    :cond_2
    iget-object p0, p0, Ll/vw00;->f:Ll/ie80;

    .line 41
    .line 42
    return-object p0
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    iget-object p0, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p0, p1, v0}, Ll/k3h;->N0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 17
    .line 18
    .line 19
    return v2
.end method

.method public final synthetic x()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/vw00;->z(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V
    .locals 3

    .line 1
    new-instance v0, Ll/uw00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uw00;-><init>(Ll/vw00;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/vw00;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
