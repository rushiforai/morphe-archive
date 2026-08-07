.class public Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public final e:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public g:I

.field public h:J

.field public i:I

.field public final synthetic j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/Stack;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->e:Ljava/util/Stack;

    .line 12
    .line 13
    new-instance p1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->g:I

    .line 22
    .line 23
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->h:J

    .line 26
    .line 27
    const/4 p1, -0x1

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->i:I

    .line 29
    .line 30
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ll/nl4;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    return-void
.end method

.method public static synthetic q(Ll/pf60;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Integer;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->A()V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Lcom/p1/mobile/putong/core/ui/PictureView;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->D(Lcom/p1/mobile/putong/core/ui/PictureView;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Lcom/p1/mobile/putong/core/ui/PictureView;ILjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->C(Lcom/p1/mobile/putong/core/ui/PictureView;ILjava/lang/Integer;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->H(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public final synthetic A()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->J(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/core/ui/PictureView;ILjava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x64

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->d:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->I(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic D(Lcom/p1/mobile/putong/core/ui/PictureView;ZLandroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->T()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p3, -0x1

    .line 6
    const/4 v0, 0x1

    .line 7
    if-ne p1, p3, :cond_0

    .line 8
    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 10
    .line 11
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 12
    .line 13
    invoke-virtual {p3}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-lez p3, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sub-int/2addr p1, v0

    .line 28
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    if-ne p1, v0, :cond_1

    .line 33
    .line 34
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 35
    .line 36
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 37
    .line 38
    invoke-virtual {p3}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->getCount()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    sub-int/2addr v1, v0

    .line 47
    if-ge p3, v1, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    add-int/2addr p1, v0

    .line 58
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    if-nez p1, :cond_3

    .line 63
    .line 64
    if-eqz p2, :cond_2

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    instance-of p1, p1, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 73
    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 83
    .line 84
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 95
    .line 96
    const-string p3, "profile_frag_picture"

    .line 97
    .line 98
    const/4 v1, 0x0

    .line 99
    invoke-static {p2, p0, p3, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 108
    .line 109
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 114
    .line 115
    .line 116
    :cond_3
    return-void
.end method

.method public final synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->f0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->z()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H(ILandroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "invisible_photo_location"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string p2, "invisible_photo_is_thumbnail"

    .line 12
    .line 13
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p2, "e_invisible_photo_upload"

    .line 24
    .line 25
    const-string v0, "p_suggest_user_profile_info_view"

    .line 26
    .line 27
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "from_profile_upload_photo"

    .line 37
    .line 38
    invoke-static {p0, p1}, Ll/we60;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->Y(Lcom/p1/mobile/putong/data/Media;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->K(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public J(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v3, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 18
    .line 19
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 20
    .line 21
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-lez v3, :cond_0

    .line 26
    .line 27
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->h:J

    .line 28
    .line 29
    sub-long v3, v0, v3

    .line 30
    .line 31
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    .line 32
    .line 33
    .line 34
    move-result-wide v3

    .line 35
    const-wide/16 v5, 0x12c

    .line 36
    .line 37
    cmp-long v3, v3, v5

    .line 38
    .line 39
    if-gez v3, :cond_0

    .line 40
    .line 41
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->i:I

    .line 42
    .line 43
    if-ne v2, v3, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->h:J

    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->getCount()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->g:I

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 57
    .line 58
    .line 59
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->i:I

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 62
    .line 63
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r:Z

    .line 64
    .line 65
    if-nez p1, :cond_1

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->x()V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public final K(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

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
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->g:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->g:I

    .line 8
    .line 9
    const/4 p0, -0x2

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Ll/cf60;->getItemPosition(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ne p2, v0, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->W(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    move-object p2, p3

    .line 18
    check-cast p2, Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    instance-of p1, p3, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->e:Ljava/util/Stack;

    .line 28
    .line 29
    check-cast p3, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 30
    .line 31
    invoke-virtual {p0, p3}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 12

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CUSTOM:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v3, " onInstantiateItem"

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    instance-of v2, v2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 36
    .line 37
    const/4 v4, -0x1

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    new-instance v0, Landroid/widget/FrameLayout;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 52
    .line 53
    invoke-direct {v1, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/aia0;->m()Ll/aia0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 64
    .line 65
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    new-instance v3, Ll/fl4;

    .line 70
    .line 71
    invoke-direct {v3, p0}, Ll/fl4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v0, v2, v3}, Ll/aia0;->A(Landroid/view/ViewGroup;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    return-object v0

    .line 88
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->e:Ljava/util/Stack;

    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    const/4 v5, 0x0

    .line 95
    if-nez v2, :cond_1

    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->e:Ljava/util/Stack;

    .line 98
    .line 99
    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 107
    .line 108
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    sget v6, Ll/kec0;->Ge:I

    .line 117
    .line 118
    invoke-virtual {v2, v6, p1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 123
    .line 124
    :goto_0
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 125
    .line 126
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 139
    .line 140
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 141
    .line 142
    .line 143
    move-result-object v8

    .line 144
    invoke-virtual {v7, v8}, Ll/xu90;->a(Lcom/p1/mobile/putong/data/User;)I

    .line 145
    .line 146
    .line 147
    move-result v7

    .line 148
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 149
    .line 150
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 151
    .line 152
    .line 153
    move-result-object v8

    .line 154
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v8

    .line 158
    const/4 v9, 0x1

    .line 159
    if-eqz v8, :cond_2

    .line 160
    .line 161
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 162
    .line 163
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 164
    .line 165
    .line 166
    move-result-object v8

    .line 167
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 168
    .line 169
    .line 170
    move-result v8

    .line 171
    if-nez v8, :cond_2

    .line 172
    .line 173
    invoke-virtual {v2, v9}, Lcom/p1/mobile/putong/core/ui/PictureView;->setShowPetTag(Z)V

    .line 174
    .line 175
    .line 176
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 177
    .line 178
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 179
    .line 180
    .line 181
    move-result-object v8

    .line 182
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    invoke-virtual {v2, v8}, Lcom/p1/mobile/putong/core/ui/PictureView;->setIsFemale(Z)V

    .line 187
    .line 188
    .line 189
    :cond_2
    const/16 v8, 0x8

    .line 190
    .line 191
    if-eq v7, v4, :cond_4

    .line 192
    .line 193
    iget-object v10, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 194
    .line 195
    invoke-static {v10}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Z

    .line 196
    .line 197
    .line 198
    move-result v10

    .line 199
    if-eqz v10, :cond_3

    .line 200
    .line 201
    iget-object v10, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->A:Landroid/widget/LinearLayout;

    .line 202
    .line 203
    invoke-virtual {v10, v8}, Landroid/view/View;->setVisibility(I)V

    .line 204
    .line 205
    .line 206
    iget-object v10, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->B:Landroid/view/View;

    .line 207
    .line 208
    invoke-virtual {v10, v8}, Landroid/view/View;->setVisibility(I)V

    .line 209
    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_3
    iget-object v8, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->A:Landroid/widget/LinearLayout;

    .line 213
    .line 214
    invoke-virtual {v8, v5}, Landroid/view/View;->setVisibility(I)V

    .line 215
    .line 216
    .line 217
    iget-object v8, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->B:Landroid/view/View;

    .line 218
    .line 219
    invoke-virtual {v8, v5}, Landroid/view/View;->setVisibility(I)V

    .line 220
    .line 221
    .line 222
    :goto_1
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 223
    .line 224
    .line 225
    move-result-object v8

    .line 226
    iget-object v10, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->C:Landroid/widget/ImageView;

    .line 227
    .line 228
    invoke-virtual {v8, v7, v10}, Ll/xu90;->i(ILandroid/widget/ImageView;)V

    .line 229
    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_4
    iget-object v7, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->A:Landroid/widget/LinearLayout;

    .line 233
    .line 234
    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 235
    .line 236
    .line 237
    iget-object v7, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->B:Landroid/view/View;

    .line 238
    .line 239
    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 240
    .line 241
    .line 242
    :goto_2
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 243
    .line 244
    invoke-static {v7}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 245
    .line 246
    .line 247
    move-result-object v7

    .line 248
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v2, v7}, Lcom/p1/mobile/putong/core/ui/PictureView;->setFrom(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    iget-object v8, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 254
    .line 255
    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 256
    .line 257
    .line 258
    move-result-object v8

    .line 259
    check-cast v8, Ll/wlj;

    .line 260
    .line 261
    iget-object v10, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 262
    .line 263
    invoke-static {v10}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 264
    .line 265
    .line 266
    move-result-object v10

    .line 267
    invoke-virtual {v10}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 268
    .line 269
    .line 270
    move-result-object v10

    .line 271
    sget v11, Ll/c9c0;->P:I

    .line 272
    .line 273
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 274
    .line 275
    .line 276
    move-result-object v10

    .line 277
    invoke-virtual {v8, v10}, Ll/wlj;->A(Landroid/graphics/drawable/Drawable;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v2, v9, v5}, Lcom/p1/mobile/putong/core/ui/PictureView;->J(ZZ)V

    .line 281
    .line 282
    .line 283
    iget-object v8, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 284
    .line 285
    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 286
    .line 287
    .line 288
    move-result-object v8

    .line 289
    check-cast v8, Ll/wlj;

    .line 290
    .line 291
    sget-object v10, Ll/h1e0;->i:Ll/h1e0;

    .line 292
    .line 293
    invoke-virtual {v8, v10}, Ll/wlj;->w(Ll/h1e0;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/PictureView;->k0()V

    .line 297
    .line 298
    .line 299
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 300
    .line 301
    iput-boolean v5, v8, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r:Z

    .line 302
    .line 303
    const-string v8, "live_profile_voice_mask_mode"

    .line 304
    .line 305
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v8

    .line 309
    if-eqz v8, :cond_5

    .line 310
    .line 311
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 312
    .line 313
    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object v4

    .line 317
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 318
    .line 319
    invoke-virtual {p0, v2, v4, v5}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->I(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 320
    .line 321
    .line 322
    goto :goto_4

    .line 323
    :cond_5
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 324
    .line 325
    invoke-static {v8}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 326
    .line 327
    .line 328
    move-result-object v8

    .line 329
    invoke-static {v8}, Ll/vmf;->f(Lcom/p1/mobile/putong/data/User;)Z

    .line 330
    .line 331
    .line 332
    move-result v8

    .line 333
    if-eqz v8, :cond_7

    .line 334
    .line 335
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 336
    .line 337
    iput-boolean v9, v4, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r:Z

    .line 338
    .line 339
    sget-object v8, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 340
    .line 341
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 346
    .line 347
    invoke-virtual {v8, v4}, Ll/p6w;->C(Ljava/lang/String;)Z

    .line 348
    .line 349
    .line 350
    move-result v4

    .line 351
    if-eqz v4, :cond_6

    .line 352
    .line 353
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 354
    .line 355
    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v4

    .line 359
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 360
    .line 361
    invoke-virtual {p0, v2, v4, v5}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->I(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 362
    .line 363
    .line 364
    goto :goto_3

    .line 365
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 366
    .line 367
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 368
    .line 369
    .line 370
    move-result-object v4

    .line 371
    iget-object v10, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 372
    .line 373
    invoke-static {v10}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 374
    .line 375
    .line 376
    move-result-object v10

    .line 377
    iget-object v10, v10, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 378
    .line 379
    invoke-virtual {v8, v10}, Ll/p6w;->F(Ljava/lang/String;)Lrx/c;

    .line 380
    .line 381
    .line 382
    move-result-object v8

    .line 383
    invoke-virtual {p0, v4, v8}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 384
    .line 385
    .line 386
    move-result-object v4

    .line 387
    new-instance v8, Ll/gl4;

    .line 388
    .line 389
    invoke-direct {v8}, Ll/gl4;-><init>()V

    .line 390
    .line 391
    .line 392
    invoke-virtual {v4, v8}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 393
    .line 394
    .line 395
    move-result-object v4

    .line 396
    new-instance v8, Ll/hl4;

    .line 397
    .line 398
    invoke-direct {v8, p0, v2, p2}, Ll/hl4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Lcom/p1/mobile/putong/core/ui/PictureView;I)V

    .line 399
    .line 400
    .line 401
    invoke-static {v8}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 402
    .line 403
    .line 404
    move-result-object v8

    .line 405
    invoke-virtual {v4, v8}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 406
    .line 407
    .line 408
    :goto_3
    const-string v4, "from_voice_buzz"

    .line 409
    .line 410
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    move-result v4

    .line 414
    if-nez v4, :cond_8

    .line 415
    .line 416
    iget-object v4, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->d:Landroid/widget/LinearLayout;

    .line 417
    .line 418
    invoke-static {v4, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 419
    .line 420
    .line 421
    goto :goto_4

    .line 422
    :cond_7
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->f:Ljava/util/List;

    .line 423
    .line 424
    invoke-interface {v7, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    move-result-object v7

    .line 428
    check-cast v7, Lcom/p1/mobile/putong/data/Media;

    .line 429
    .line 430
    invoke-virtual {p0, v2, v7, v4}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->I(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 431
    .line 432
    .line 433
    :cond_8
    :goto_4
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 434
    .line 435
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 436
    .line 437
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 438
    .line 439
    invoke-static {v7}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;

    .line 440
    .line 441
    .line 442
    move-result-object v7

    .line 443
    iget-object v7, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 444
    .line 445
    invoke-virtual {v4, v7}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 446
    .line 447
    .line 448
    move-result-object v4

    .line 449
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 450
    .line 451
    .line 452
    move-result v7

    .line 453
    if-eqz v7, :cond_9

    .line 454
    .line 455
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 456
    .line 457
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 458
    .line 459
    invoke-virtual {v7}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 460
    .line 461
    .line 462
    move-result-object v7

    .line 463
    invoke-virtual {v4, v7}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 464
    .line 465
    .line 466
    move-result v4

    .line 467
    if-eqz v4, :cond_9

    .line 468
    .line 469
    iget-object v4, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->d:Landroid/widget/LinearLayout;

    .line 470
    .line 471
    invoke-static {v4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 472
    .line 473
    .line 474
    :cond_9
    new-instance v4, Ll/il4;

    .line 475
    .line 476
    invoke-direct {v4, p0, v2, v6}, Ll/il4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    .line 477
    .line 478
    .line 479
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 480
    .line 481
    .line 482
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 483
    .line 484
    .line 485
    move-result-object v4

    .line 486
    invoke-virtual {v2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 487
    .line 488
    .line 489
    const/4 v4, 0x0

    .line 490
    invoke-virtual {v2, v4}, Landroid/view/View;->setPivotX(F)V

    .line 491
    .line 492
    .line 493
    invoke-virtual {v2, v4}, Landroid/view/View;->setPivotY(F)V

    .line 494
    .line 495
    .line 496
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 497
    .line 498
    .line 499
    const/4 p1, 0x0

    .line 500
    invoke-virtual {v2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 501
    .line 502
    .line 503
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 504
    .line 505
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;

    .line 506
    .line 507
    .line 508
    move-result-object v4

    .line 509
    invoke-static {v4}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 510
    .line 511
    .line 512
    move-result-object v4

    .line 513
    sget v6, Ll/kec0;->u9:I

    .line 514
    .line 515
    invoke-virtual {v4, v6, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 516
    .line 517
    .line 518
    move-result-object p1

    .line 519
    invoke-virtual {v2, p1, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 520
    .line 521
    .line 522
    invoke-static {p1, v5}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 523
    .line 524
    .line 525
    sget v4, Ll/adc0;->c:I

    .line 526
    .line 527
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 528
    .line 529
    .line 530
    move-result-object v4

    .line 531
    sget v5, Ll/adc0;->d:I

    .line 532
    .line 533
    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 534
    .line 535
    .line 536
    move-result-object v5

    .line 537
    sget v6, Ll/adc0;->f:I

    .line 538
    .line 539
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 540
    .line 541
    .line 542
    move-result-object p1

    .line 543
    new-instance v6, Ll/jl4;

    .line 544
    .line 545
    invoke-direct {v6, p0}, Ll/jl4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)V

    .line 546
    .line 547
    .line 548
    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 549
    .line 550
    .line 551
    new-instance v5, Ll/kl4;

    .line 552
    .line 553
    invoke-direct {v5, p0}, Ll/kl4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)V

    .line 554
    .line 555
    .line 556
    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 557
    .line 558
    .line 559
    invoke-static {p1, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 560
    .line 561
    .line 562
    sget v4, Ll/qa00;->S:I

    .line 563
    .line 564
    invoke-static {p1, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 565
    .line 566
    .line 567
    new-instance v4, Ll/ll4;

    .line 568
    .line 569
    invoke-direct {v4, p0}, Ll/ll4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)V

    .line 570
    .line 571
    .line 572
    invoke-virtual {p1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 573
    .line 574
    .line 575
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 576
    .line 577
    .line 578
    move-result-object p1

    .line 579
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object p1

    .line 583
    invoke-virtual {p1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object p1

    .line 587
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Ljava/lang/String;)V

    .line 588
    .line 589
    .line 590
    invoke-static {}, Ll/gra;->u2()Z

    .line 591
    .line 592
    .line 593
    move-result p1

    .line 594
    if-eqz p1, :cond_a

    .line 595
    .line 596
    iget-object p1, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->z:Lv/VButton;

    .line 597
    .line 598
    new-instance v0, Ll/ml4;

    .line 599
    .line 600
    invoke-direct {v0, p0, p2}, Ll/ml4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;I)V

    .line 601
    .line 602
    .line 603
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 604
    .line 605
    .line 606
    :cond_a
    return-object v2
.end method

.method public z(I)Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v0, v2, :cond_2

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    instance-of v3, v2, Ljava/lang/Integer;

    .line 33
    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    check-cast v2, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-ne v2, p1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    return-object v1
.end method
