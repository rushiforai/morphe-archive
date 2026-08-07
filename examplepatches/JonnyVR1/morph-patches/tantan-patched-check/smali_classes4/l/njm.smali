.class public Ll/njm;
.super Ll/h11;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/njm$c;
    }
.end annotation


# static fields
.field public static final h:I


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VLinear;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public g:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/kec0;->Y6:I

    .line 2
    .line 3
    sput v0, Ll/njm;->h:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/h11;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/njm;->g:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/njm;->c(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 11
    .line 12
    invoke-direct {p1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 13
    .line 14
    .line 15
    const/high16 v1, 0x41200000    # 10.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    invoke-virtual {p1, v1}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/wlj;

    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ll/wlj;

    .line 47
    .line 48
    sget v1, Ll/dbc0;->V0:I

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Ll/wlj;->z(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 54
    .line 55
    const/16 v1, 0xa

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->setVideoViewRadius(I)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 61
    .line 62
    const/4 p1, 0x1

    .line 63
    invoke-virtual {p0, p1, v0, p1, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->L(ZZZZ)V

    .line 64
    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 21
    .line 22
    iput-boolean v0, v1, Lcom/p1/mobile/putong/core/ui/PictureView;->M:Z

    .line 23
    .line 24
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget-object v3, p0, Ll/njm;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 29
    .line 30
    const/4 v4, 0x2

    .line 31
    if-lt v1, v4, :cond_1

    .line 32
    .line 33
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/njm;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 37
    .line 38
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/njm;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput v0, p0, Ll/njm;->g:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput v2, p0, Ll/njm;->g:I

    .line 65
    .line 66
    :goto_0
    iget-object v0, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/njm;->c:Landroid/view/View;

    .line 72
    .line 73
    new-instance v1, Ll/njm$a;

    .line 74
    .line 75
    invoke-direct {v1, p0, p1}, Ll/njm$a;-><init>(Ll/njm;Lcom/p1/mobile/putong/data/User;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/njm;->d:Landroid/view/View;

    .line 82
    .line 83
    new-instance v1, Ll/njm$b;

    .line 84
    .line 85
    invoke-direct {v1, p0, p2, p1}, Ll/njm$b;-><init>(Ll/njm;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/h11;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->d()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ojm;->a(Ll/njm;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
