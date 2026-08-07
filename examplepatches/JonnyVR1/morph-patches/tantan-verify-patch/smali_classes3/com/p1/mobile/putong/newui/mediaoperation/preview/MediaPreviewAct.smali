.class public Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Lcom/p1/mobile/putong/data/Media;

.field public E:Z

.field public c:Lv/VPager;

.field public d:Lv/VFrame;

.field public e:Landroid/widget/ImageView;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VRecyclerView;

.field public i:Lv/VText;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VButton;

.field public l:Ll/s0y;

.field public m:Ljava/lang/String;

.field public n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

.field public o:Z

.field public p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

.field public q:Lcom/p1/mobile/putong/data/Media;

.field public r:I

.field public s:I

.field public t:Ll/ko20;

.field public u:Ll/fme0;

.field public v:Ljava/lang/String;

.field public w:I

.field public x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r:I

    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->s:I

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 23
    .line 24
    return-void
.end method

.method private C2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->k:Lv/VButton;

    .line 2
    .line 3
    new-instance v1, Ll/j1y;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/j1y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->e:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/s1y;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/s1y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f:Lv/VText;

    .line 22
    .line 23
    new-instance v1, Ll/u1y;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/u1y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static H2(Landroid/content/Context;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;-><init>(Landroid/content/Context;Ll/q2y;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method private synthetic L2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->w2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic M2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->z2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N2(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->I2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r:I

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p0, p1, v2, v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f3(Lcom/p1/mobile/putong/data/Media;ZLjava/util/List;I)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->a3(Z)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r:I

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-virtual {p0, p1, v2, v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f3(Lcom/p1/mobile/putong/data/Media;ZLjava/util/List;I)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->a3(Z)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->W2()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private synthetic Q2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->R2(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic Z1(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ll/p1y;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/p1y;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->V2(Ll/vg60;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method private b3(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/vg60;

    .line 16
    .line 17
    new-instance v2, Ll/q1y;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/q1y;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-direct {v0, p1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 34
    .line 35
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 43
    .line 44
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 45
    .line 46
    new-instance v1, Ll/r1y;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/r1y;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 61
    .line 62
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->v2(Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->S2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->T2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->Q2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Ll/ewi;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->U2(Ll/ewi;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h2(Ll/v2i0;)Ll/ewi;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ewi;->b(Ll/v2i0;)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->L2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->M2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->N2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static bridge synthetic o2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)Ll/fme0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->u:Ll/fme0;

    return-object p0
.end method

.method public static bridge synthetic p2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->D:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method

.method public static bridge synthetic q2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->g3(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method private r()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->C2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->h:Lv/VRecyclerView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    move v1, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v1, v3

    .line 21
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->g:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->g3(Lcom/p1/mobile/putong/data/Media;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->t:Ll/ko20;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/cf60;->notifyDataSetChanged()V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->s:I

    .line 40
    .line 41
    if-lez v0, :cond_1

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 44
    .line 45
    invoke-virtual {v1, v0, v3}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    move v0, v3

    .line 54
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-ge v0, v1, :cond_3

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 69
    .line 70
    iget-object v4, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v5, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 73
    .line 74
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v4, :cond_2

    .line 81
    .line 82
    iget-object v4, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 83
    .line 84
    invoke-virtual {v4, v0, v3}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 85
    .line 86
    .line 87
    iput-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->D:Lcom/p1/mobile/putong/data/Media;

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    :goto_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A:Z

    .line 94
    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Lv/VPager;->setScrollble(Z)V

    .line 100
    .line 101
    .line 102
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->d3()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->Z2()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->u2()V

    .line 109
    .line 110
    .line 111
    iget v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->w:I

    .line 112
    .line 113
    const/16 v1, 0xa

    .line 114
    .line 115
    if-eq v0, v1, :cond_7

    .line 116
    .line 117
    const/16 v1, 0xb

    .line 118
    .line 119
    if-ne v0, v1, :cond_5

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_5
    const/16 v1, 0xd

    .line 123
    .line 124
    if-ne v0, v1, :cond_6

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->j:Landroid/widget/TextView;

    .line 127
    .line 128
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->j:Landroid/widget/TextView;

    .line 132
    .line 133
    const-string v0, "\u56fe\u7247\u5c06\u4f7f\u7528\u9650\u65f6\u5feb\u62cd\u6a21\u5f0f\u53d1\u9001"

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    :cond_6
    return-void

    .line 139
    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->j:Landroid/widget/TextView;

    .line 140
    .line 141
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->j:Landroid/widget/TextView;

    .line 145
    .line 146
    const-string v0, "\u56fe\u7247\u5c06\u4f7f\u7528\u4ee5\u56fe\u6362\u56fe\u6a21\u5f0f\u53d1\u9001"

    .line 147
    .line 148
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method private w2()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->l:Ll/s0y;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->l:Ll/s0y;

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->w:I

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 18
    .line 19
    iget-object v3, v3, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->reportMap:Ljava/util/Map;

    .line 20
    .line 21
    invoke-interface {v0, v1, v2, v3}, Ll/s0y;->e(ILjava/lang/String;Ljava/util/Map;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->s2()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->D:Lcom/p1/mobile/putong/data/Media;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->addSelectedMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move v0, v1

    .line 51
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->l:Ll/s0y;

    .line 52
    .line 53
    if-nez v2, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 61
    .line 62
    invoke-interface {v2, v1, v3, v4}, Ll/s0y;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    :goto_1
    if-nez v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->z2()V

    .line 69
    .line 70
    .line 71
    :cond_3
    if-eqz v0, :cond_4

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->clearAllSelectedMedia()V

    .line 76
    .line 77
    .line 78
    :cond_4
    return-void
.end method


# virtual methods
.method public A2()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 4
    .line 5
    return-object p0
.end method

.method public B2()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "selectedMedias"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    const-string v2, "initialShowIndex"

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iput v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->s:I

    .line 21
    .line 22
    const-string v2, "maxCount"

    .line 23
    .line 24
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iput v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r:I

    .line 29
    .line 30
    const-string v2, "MediaPickerParamsObject"

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 37
    .line 38
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 39
    .line 40
    const-string v2, "selectedMedia"

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 47
    .line 48
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 49
    .line 50
    const-string v2, "showAllPhotoInPhone"

    .line 51
    .line 52
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->o:Z

    .line 57
    .line 58
    const-string v2, "filterPhoto"

    .line 59
    .line 60
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->y:Z

    .line 65
    .line 66
    const-string v2, "disableScroll"

    .line 67
    .line 68
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A:Z

    .line 73
    .line 74
    const-string v2, "filterVideo"

    .line 75
    .line 76
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->z:Z

    .line 81
    .line 82
    const-string v2, "selectFolder"

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->m:Ljava/lang/String;

    .line 89
    .line 90
    const-string v2, "needPassThrough"

    .line 91
    .line 92
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->E:Z

    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 99
    .line 100
    iget v2, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 101
    .line 102
    iput v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->w:I

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->submitButtonTitle:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->v:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 109
    .line 110
    new-instance v2, Ll/vg60;

    .line 111
    .line 112
    iget-object v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 113
    .line 114
    const/4 v4, 0x0

    .line 115
    invoke-direct {v2, v3, v4}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 116
    .line 117
    .line 118
    iput-object v2, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->clearAllSelectedMedia()V

    .line 123
    .line 124
    .line 125
    if-nez v1, :cond_0

    .line 126
    .line 127
    new-instance v1, Ljava/util/ArrayList;

    .line 128
    .line 129
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .line 131
    .line 132
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->K2()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_1

    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 139
    .line 140
    .line 141
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 142
    .line 143
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->addAllSelectedMedia(Ljava/util/List;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final D2()V
    .locals 2

    .line 1
    new-instance v0, Ll/fme0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fme0;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->u:Ll/fme0;

    .line 7
    .line 8
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->h:Lv/VRecyclerView;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->h:Lv/VRecyclerView;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->u:Ll/fme0;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 30
    .line 31
    new-instance v1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/ko20;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/ko20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->t:Ll/ko20;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->t:Ll/ko20;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final E2(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->l:Ll/s0y;

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p1, v0, :cond_3

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p1, v0, :cond_2

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x7

    .line 15
    if-eq p1, v0, :cond_0

    .line 16
    .line 17
    const/16 v0, 0xa

    .line 18
    .line 19
    if-eq p1, v0, :cond_1

    .line 20
    .line 21
    const/16 v0, 0xb

    .line 22
    .line 23
    if-eq p1, v0, :cond_1

    .line 24
    .line 25
    const/16 v0, 0xd

    .line 26
    .line 27
    if-eq p1, v0, :cond_1

    .line 28
    .line 29
    const/16 v0, 0xe

    .line 30
    .line 31
    if-eq p1, v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 35
    .line 36
    invoke-interface {p1}, Ll/bn5;->d()Ll/s0y;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->l:Ll/s0y;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 44
    .line 45
    invoke-interface {p1}, Ll/bn5;->P4()Ll/s0y;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->l:Ll/s0y;

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 53
    .line 54
    invoke-interface {p1}, Ll/bn5;->R0()Ll/s0y;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->l:Ll/s0y;

    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 62
    .line 63
    invoke-interface {p1}, Ll/bn5;->j0()Ll/s0y;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->l:Ll/s0y;

    .line 68
    .line 69
    :cond_4
    :goto_0
    return-void
.end method

.method public F2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->B2()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->w:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->E2(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final I2()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final K2()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxVideoSelectCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxImageSelectCount()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-ne p0, v1, :cond_2

    .line 29
    .line 30
    :cond_1
    return v1

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final synthetic R2(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->B:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->b3(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->B:Z

    .line 11
    .line 12
    return-void
.end method

.method public final synthetic S2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T2(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r:I

    .line 10
    .line 11
    if-lt p1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->I2()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget v0, Lcom/p1/mobile/putong/common/R$string;->T:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r:I

    .line 30
    .line 31
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->croppedMap:Ljava/util/Map;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->c(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1}, Ll/oki;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 76
    .line 77
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 78
    .line 79
    .line 80
    const/4 v1, 0x1

    .line 81
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 82
    .line 83
    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 87
    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    iget-boolean v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->croppingNewStyle:Z

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    const/4 v0, 0x0

    .line 94
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 95
    .line 96
    iget v2, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->imageCropProportion:F

    .line 97
    .line 98
    iget v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->imageCropWidth:I

    .line 99
    .line 100
    invoke-static {p0, p1, v2, v1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;FIZ)Landroid/content/Intent;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const/16 v0, 0x6000

    .line 105
    .line 106
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final synthetic U2(Ll/ewi;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/ewi;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->m:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic V2(Ll/vg60;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->B:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Ll/l1y;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/l1y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/ewi;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    new-instance p1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 35
    .line 36
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    new-instance v1, Ll/vg60;

    .line 47
    .line 48
    invoke-direct {v1, p1, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 49
    .line 50
    .line 51
    iput-object v1, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object v0, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 55
    .line 56
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 65
    .line 66
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 67
    .line 68
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 73
    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    new-instance v1, Ll/vg60;

    .line 77
    .line 78
    iget-object p1, p1, Ll/ewi;->c:Ll/vg60;

    .line 79
    .line 80
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 81
    .line 82
    new-instance v3, Ll/n1y;

    .line 83
    .line 84
    invoke-direct {v3}, Ll/n1y;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {p1, v3}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-direct {v1, p1, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 92
    .line 93
    .line 94
    iput-object v1, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    iget-object v0, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 98
    .line 99
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 100
    .line 101
    iget-object p1, p1, Ll/ewi;->c:Ll/vg60;

    .line 102
    .line 103
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 104
    .line 105
    new-instance v1, Ll/o1y;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/o1y;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 115
    .line 116
    .line 117
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 118
    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 120
    .line 121
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->v2(Ljava/util/List;)V

    .line 124
    .line 125
    .line 126
    const/4 p1, 0x1

    .line 127
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->B:Z

    .line 128
    .line 129
    return-void
.end method

.method public final W2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMinImageSelectCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v0, v1, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->s2()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    :cond_1
    const/4 v0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    const/4 v0, 0x0

    .line 36
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c3(Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->u:Ll/fme0;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final X2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->b3(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/bvx;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v2}, Ll/bvx;-><init>(Landroid/content/Context;ZZ)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-virtual {v1, v2, v3, v0}, Landroidx/loader/app/a;->c(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ll/bvx;->r()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/w1y;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/w1y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final Z2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->i:Lv/VText;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/common/R$string;->a:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->i:Lv/VText;

    .line 15
    .line 16
    new-instance v1, Ll/a2y;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/a2y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->showPreviewEditBtn()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->i:Lv/VText;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->i:Lv/VText;

    .line 61
    .line 62
    sget v1, Lcom/p1/mobile/putong/common/R$string;->x:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->i:Lv/VText;

    .line 68
    .line 69
    new-instance v1, Ll/c2y;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/c2y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final a3(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/cbc0;->D0:I

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f:Lv/VText;

    .line 11
    .line 12
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget p1, Ll/cbc0;->B0:I

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f:Lv/VText;

    .line 24
    .line 25
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final c3(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->k:Lv/VButton;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->k:Lv/VButton;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->k:Lv/VButton;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget v1, Ll/b9c0;->i:I

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget v1, Ll/b9c0;->g:I

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->d3()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public checkRunningCondition()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->ensurePlugin()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/toh0;->t(Landroid/content/Intent;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final d3()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->v:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedImageMedias:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->k:Lv/VButton;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->v:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->v:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedImageMedias:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "%s %d"

    .line 42
    .line 43
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public final e3()V
    .locals 4

    .line 1
    new-instance v0, Ll/bvx;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v0, v1, v2, v2}, Ll/bvx;-><init>(Landroid/content/Context;ZZ)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-virtual {v1, v2, v3, v0}, Landroidx/loader/app/a;->c(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ll/bvx;->r()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->k:Ll/qcj;

    .line 41
    .line 42
    invoke-static {v1}, Ll/bvx;->n(Ll/qcj;)Lrx/c$d;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/g2y;

    .line 51
    .line 52
    invoke-direct {v1}, Ll/g2y;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/i2y;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/i2y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public ensurePlugin()Z
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 10
    .line 11
    const-string v0, "account"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/dg00;->z(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-static {}, Ll/uqb0;->J0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public final f3(Lcom/p1/mobile/putong/data/Media;ZLjava/util/List;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Media;",
            "Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p2, :cond_1

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 6
    .line 7
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->unCheckMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    :goto_0
    move p1, v1

    .line 11
    goto :goto_2

    .line 12
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-ne p4, p2, :cond_3

    .line 17
    .line 18
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/common/R$string;->H0:I

    .line 23
    .line 24
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget p2, Lcom/p1/mobile/putong/common/R$string;->T:I

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :goto_1
    move p1, v0

    .line 54
    goto :goto_2

    .line 55
    :cond_3
    invoke-interface {p3, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-nez p2, :cond_0

    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->addSelectedMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->h:Lv/VRecyclerView;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    if-eqz p3, :cond_4

    .line 78
    .line 79
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->C:Z

    .line 80
    .line 81
    if-nez p0, :cond_4

    .line 82
    .line 83
    move v0, v1

    .line 84
    :cond_4
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    return p1
.end method

.method public final g3(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/y1y;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/y1y;-><init>(Lcom/p1/mobile/putong/data/Media;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-ltz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->a3(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->a3(Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public h3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->e3()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->o:Z

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->v2(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->X2()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->F2()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->h3()V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/e2y;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/e2y;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->z2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCropImageResult(Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->containsInMedias(Lcom/p1/mobile/putong/data/Media;Ljava/util/List;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r:I

    .line 45
    .line 46
    invoke-virtual {p0, v0, v2, v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f3(Lcom/p1/mobile/putong/data/Media;ZLjava/util/List;I)Z

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->a3(Z)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->croppedMap:Ljava/util/Map;

    .line 55
    .line 56
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 57
    .line 58
    new-instance v4, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper$a;

    .line 59
    .line 60
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-eq v6, v2, :cond_2

    .line 73
    .line 74
    move v6, v2

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    const/4 v6, 0x0

    .line 77
    :goto_0
    invoke-direct {v4, v5, v6}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper$a;-><init>(Ljava/lang/String;Z)V

    .line 78
    .line 79
    .line 80
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    .line 84
    .line 85
    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 89
    .line 90
    invoke-static {p1, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 91
    .line 92
    .line 93
    iget p1, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 94
    .line 95
    iget v1, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 96
    .line 97
    filled-new-array {p1, v1}, [I

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    move-object v1, v0

    .line 102
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 103
    .line 104
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 105
    .line 106
    invoke-direct {v2, p1}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 107
    .line 108
    .line 109
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->croppedMap:Ljava/util/Map;

    .line 114
    .line 115
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->c(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 122
    .line 123
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;

    .line 130
    .line 131
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_3

    .line 136
    .line 137
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->setPicture(Lcom/p1/mobile/putong/data/Picture;)V

    .line 138
    .line 139
    .line 140
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->W2()V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "selectedMedia"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v1, "MediaPickerParamsObject"

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->mediaPreviewPageId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->mediaPreviewPageId:Ljava/lang/String;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    instance-of p0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const-string p0, "p_video_moment_preview_view"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    const-string p0, "p_picture_moment_preview_view"

    .line 44
    .line 45
    return-object p0
.end method

.method public r2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/r2y;->b(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final s2()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->n:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->canClickSubmitInPreviewWhenNoSelectedMedia(Lcom/p1/mobile/putong/data/Media;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->K2()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public shouldSwitchToGradientColoredStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public shouldWrapContentViewWithTransparentHeader()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final u2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->K2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->h:Lv/VRecyclerView;

    .line 8
    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->C:Z

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->f:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final v2(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->t:Ll/ko20;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->D2()V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->y2()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->r()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->W2()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final y2()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    iget-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->z:Z

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    iget-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->y:Z

    .line 43
    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    return-void
.end method

.method public z2()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "extra_images"

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->E:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const/16 v1, 0x22b

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, -0x1

    .line 23
    :goto_0
    invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
