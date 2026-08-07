.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kl70;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    if-ne v0, v2, :cond_1

    .line 15
    .line 16
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->v(Lcom/p1/mobile/putong/data/Media;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v3, 0x2

    .line 31
    if-ne v0, v3, :cond_2

    .line 32
    .line 33
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 38
    .line 39
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 44
    .line 45
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->z(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 54
    .line 55
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 60
    .line 61
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 66
    .line 67
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->w(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final u(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    instance-of p0, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 7
    .line 8
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p0, p1, p2, v0}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    instance-of p0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p1, p2, v0}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->u(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 13
    .line 14
    const/high16 v1, -0x3e600000    # -20.0f

    .line 15
    .line 16
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 24
    .line 25
    const/high16 v1, 0x40800000    # 4.0f

    .line 26
    .line 27
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 35
    .line 36
    const/high16 v1, -0x3f200000    # -7.0f

    .line 37
    .line 38
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 46
    .line 47
    const/high16 v1, 0x41a00000    # 20.0f

    .line 48
    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->a:Lv/VDraweeView;

    .line 57
    .line 58
    const/high16 v1, 0x41900000    # 18.0f

    .line 59
    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->a:Lv/VDraweeView;

    .line 68
    .line 69
    const/high16 v1, 0x41000000    # 8.0f

    .line 70
    .line 71
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->d:Lv/VImage;

    .line 79
    .line 80
    const/high16 v2, 0x42080000    # 34.0f

    .line 81
    .line 82
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 90
    .line 91
    const/high16 v2, -0x3f800000    # -4.0f

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Landroid/view/View;->setRotation(F)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 97
    .line 98
    const/high16 v2, 0x40400000    # 3.0f

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Landroid/view/View;->setRotation(F)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->a:Lv/VDraweeView;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 109
    .line 110
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->u(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 114
    .line 115
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->u(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->a:Lv/VDraweeView;

    .line 119
    .line 120
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->u(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final z(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 15
    .line 16
    const/high16 v1, -0x3ee00000    # -10.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 26
    .line 27
    const/high16 v1, 0x40800000    # 4.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 37
    .line 38
    const/high16 v1, 0x41e00000    # 28.0f

    .line 39
    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 48
    .line 49
    const/high16 v1, 0x41000000    # 8.0f

    .line 50
    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 59
    .line 60
    const/high16 v2, -0x3f800000    # -4.0f

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/view/View;->setRotation(F)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->c:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->u(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->b:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/PicPostDlgView;->u(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
