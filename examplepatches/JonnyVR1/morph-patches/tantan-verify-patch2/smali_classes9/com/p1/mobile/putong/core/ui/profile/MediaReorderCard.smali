.class public Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;
.super Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;,
        Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;
    }
.end annotation


# static fields
.field public static Q0:Ljava/lang/String; = "RepeatPicture"

.field public static R0:Ljava/lang/String; = "NetPictur"


# instance fields
.field public A:Landroid/widget/TextView;

.field public B:Landroid/widget/ImageView;

.field public C:Lv/VFrame_Anim;

.field public D:Landroid/widget/ImageView;

.field public E:Lv/VProgressBar;

.field public E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

.field public F:Lv/VProgressBar;

.field public F0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

.field public G:Landroid/widget/ImageView;

.field public G0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

.field public H:Landroid/widget/ImageView;

.field public H0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

.field public I:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public I0:Ll/l4g0;

.field public J:Ll/kcg0;

.field public J0:Ll/l4g0;

.field public K:Z

.field public K0:J

.field public L:Ljava/lang/String;

.field public L0:Ljava/lang/Runnable;

.field public M:Ljava/lang/String;

.field public M0:Lcom/p1/mobile/putong/data/Media;

.field public N:Lcom/p1/mobile/putong/data/Media;

.field public N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

.field public O:Ll/kcg0;

.field public O0:I

.field public P:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/data/Media;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public P0:Landroid/animation/ObjectAnimator;

.field public Q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public R:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public S:Landroid/view/View;

.field public T:Z

.field public U:Z

.field public V:Z

.field public W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

.field public k0:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

.field public p0:Z

.field public r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

.field public s:Lv/VDraweeView;

.field public t:Landroid/view/View;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;

.field public x:Lv/VText;

.field public y:Landroid/widget/TextView;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I:Lrx/subjects/b;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J:Ll/kcg0;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K:Z

    .line 15
    .line 16
    sget-object v0, Ll/tr90;->h:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q:Ljava/util/List;

    .line 27
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R:Ljava/util/List;

    .line 34
    .line 35
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->T:Z

    .line 36
    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U:Z

    .line 38
    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->V:Z

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->AVATAR:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 44
    .line 45
    const/4 p1, -0x1

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 47
    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I:Lrx/subjects/b;

    const/4 p1, 0x0

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J:Ll/kcg0;

    const/4 p1, 0x0

    .line 52
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K:Z

    .line 53
    sget-object p2, Ll/tr90;->h:Ljava/lang/String;

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L:Ljava/lang/String;

    .line 54
    new-instance p2, Ljava/util/ArrayList;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q:Ljava/util/List;

    .line 55
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R:Ljava/util/List;

    .line 56
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->T:Z

    .line 57
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U:Z

    .line 58
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->V:Z

    .line 59
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->AVATAR:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    const/4 p1, -0x1

    .line 60
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 62
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I:Lrx/subjects/b;

    const/4 p1, 0x0

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J:Ll/kcg0;

    const/4 p1, 0x0

    .line 64
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K:Z

    .line 65
    sget-object p2, Ll/tr90;->h:Ljava/lang/String;

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L:Ljava/lang/String;

    .line 66
    new-instance p2, Ljava/util/ArrayList;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q:Ljava/util/List;

    .line 67
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R:Ljava/util/List;

    .line 68
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->T:Z

    .line 69
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U:Z

    .line 70
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->V:Z

    .line 71
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->AVATAR:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    const/4 p1, -0x1

    .line 72
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0()V

    return-void
.end method

.method public static synthetic E(Ll/bkj0;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 15
    .line 16
    const-string v0, "\u68c0\u6d4b\u5230\u654f\u611f\u4fe1\u606f\uff0c\u4e0a\u4f20\u5931\u8d25"

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/safety/IllegalPictureException;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw p0
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D0()V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->q1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t1(Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->i1(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic J(Ljava/util/List;)Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L(Landroid/view/View;)Landroid/view/ViewPropertyAnimator;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-wide/16 v0, 0xc8

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->o1(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Video;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Z0(Lcom/p1/mobile/putong/data/Video;[I)V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->V0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->l1(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->g1()V

    return-void
.end method

.method public static synthetic S(Landroid/view/View;)Landroid/view/ViewPropertyAnimator;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-wide/16 v0, 0xc8

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->k1(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->e1()V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D0()V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W0(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->b1([I)V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->p1(Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z(Ljava/util/List;)Lcom/p1/mobile/putong/data/Video;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->s1(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Picture;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Y0(Lcom/p1/mobile/putong/data/Picture;[I)V

    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->n1(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->f1()V

    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->a1()V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->X0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Picture;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->ma()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->T0(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic k0(Ljava/util/List;)Lcom/p1/mobile/putong/data/Picture;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0()V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->h1(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->j1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->m1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic p0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "lowquality_reason"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_replace_photo_cancel"

    .line 12
    .line 13
    const-string v1, "p_lowqualityphoto__popup"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->c1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->d1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic v0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S0(Landroid/view/View;)V

    return-void
.end method

.method private w0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c5y;->a(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final A1()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v0}, Ll/dox;->a(I)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {v0}, Ll/dox;->a(I)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    const/4 v6, 0x0

    .line 32
    const/4 v4, 0x0

    .line 33
    move-object v1, p0

    .line 34
    invoke-virtual/range {v1 .. v6}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 35
    .line 36
    .line 37
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 50
    .line 51
    sub-int/2addr v0, p0

    .line 52
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    div-int/lit8 v2, v2, 0x2

    .line 63
    .line 64
    div-int/lit8 p0, p0, 0x2

    .line 65
    .line 66
    sub-int/2addr v2, p0

    .line 67
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    add-int/2addr p0, v2

    .line 74
    iget-object v3, v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    sub-int v3, v0, v3

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {v1, v2, v3, p0, v0}, Landroid/view/View;->layout(IIII)V

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public final B0(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/i4y;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/i4y;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/j4y;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Ll/j4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Picture;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public B1()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gtz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Ll/dox;->b(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {v1}, Ll/dox;->b(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->measure(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    add-int/2addr v2, v3

    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    add-int/2addr v3, v4

    .line 62
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public final C0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Media;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqb0;->R:Ll/s5m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/s5m;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ll/uqb0;->R:Ll/s5m;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p0, p1}, Ll/s5m;->b(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Ll/a4y;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/a4y;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 40
    .line 41
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public C1(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final D0()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/xra;->w()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, ""

    .line 35
    .line 36
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->bp(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->getMediaOperation()Ll/xyl;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    const/4 v1, 0x1

    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-interface {v0, p0, v2, v2, v1}, Ll/xyl;->n0(IZZZ)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public D1(Lcom/p1/mobile/putong/data/Media;ZZ)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 21
    .line 22
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 23
    .line 24
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    const-string v0, "render"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q1(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F1()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P:Ll/a30;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P:Ll/a30;

    .line 43
    .line 44
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-interface {p0, p1, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public E0(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/w30$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/c4y;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/c4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v1, Ll/d4y;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/d4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/w30$b;->F()Ll/w30;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public E1(ILjava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "p_edit_profile_view"

    .line 2
    .line 3
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->F7()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 p2, 0x1

    .line 25
    if-eqz p1, :cond_5

    .line 26
    .line 27
    if-eq p1, p2, :cond_5

    .line 28
    .line 29
    const/4 v0, 0x2

    .line 30
    if-eq p1, v0, :cond_4

    .line 31
    .line 32
    const/4 v0, 0x3

    .line 33
    if-eq p1, v0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    if-eq p1, v0, :cond_2

    .line 37
    .line 38
    const/4 v0, 0x5

    .line 39
    if-eq p1, v0, :cond_1

    .line 40
    .line 41
    const-string p1, ""

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->i4:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->h4:I

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    goto :goto_0

    .line 66
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->g4:I

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    goto :goto_0

    .line 77
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->f4:I

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    goto :goto_0

    .line 88
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->e4:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x:Lv/VText;

    .line 99
    .line 100
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x:Lv/VText;

    .line 104
    .line 105
    invoke-static {}, Ll/xra;->w()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_6

    .line 110
    .line 111
    invoke-static {}, Ll/xra;->m()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_6

    .line 116
    .line 117
    invoke-static {}, Ll/xra;->n()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_6

    .line 122
    .line 123
    invoke-static {}, Ll/xra;->j()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_6

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 130
    .line 131
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-nez p0, :cond_6

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_6
    const/4 p2, 0x0

    .line 139
    :goto_1
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public F0(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ".jpg"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->H1(Landroid/content/Context;)Ljava/io/File;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 37
    .line 38
    .line 39
    :cond_0
    new-instance v2, Ljava/io/File;

    .line 40
    .line 41
    invoke-direct {v2, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 63
    .line 64
    sget-object v3, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 65
    .line 66
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-direct {v1, v3}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance v1, Ll/u4y;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/u4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v1, Ll/v4y;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/v4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->getMediaOperation()Ll/xyl;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {p1, p0, v0}, Ll/xyl;->f2(ILjava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public F1()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move v0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v2

    .line 10
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->k(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->B:Landroid/widget/ImageView;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    instance-of v3, v3, Lcom/p1/mobile/putong/data/Video;

    .line 18
    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-static {}, Ll/xra;->w()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-nez v3, :cond_1

    .line 26
    .line 27
    move v3, v1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v3, v2

    .line 30
    :goto_1
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->H:Landroid/widget/ImageView;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    instance-of v3, v3, Lcom/p1/mobile/putong/data/Video;

    .line 38
    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ll/xra;->w()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    move v3, v1

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move v3, v2

    .line 50
    :goto_2
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->s:Lv/VDraweeView;

    .line 88
    .line 89
    new-instance v3, Ll/u3y;

    .line 90
    .line 91
    invoke-direct {v3, p0}, Ll/u3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v3}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 95
    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 99
    .line 100
    instance-of v3, v0, Lcom/p1/mobile/putong/data/Video;

    .line 101
    .line 102
    if-eqz v3, :cond_4

    .line 103
    .line 104
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 105
    .line 106
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->s:Lv/VDraweeView;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v3, v4, v0}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_4
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 115
    .line 116
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->s:Lv/VDraweeView;

    .line 117
    .line 118
    invoke-virtual {v0, v3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 119
    .line 120
    .line 121
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 122
    .line 123
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_5

    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O:Ll/kcg0;

    .line 130
    .line 131
    if-nez v0, :cond_5

    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 134
    .line 135
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 136
    .line 137
    const-string v3, "normal"

    .line 138
    .line 139
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_5

    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 151
    .line 152
    .line 153
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 154
    .line 155
    const/4 v3, 0x0

    .line 156
    if-nez v0, :cond_6

    .line 157
    .line 158
    const/4 v0, 0x0

    .line 159
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t:Landroid/view/View;

    .line 163
    .line 164
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 165
    .line 166
    .line 167
    :cond_6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ua()Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    const/high16 v4, 0x3f800000    # 1.0f

    .line 180
    .line 181
    if-eqz v0, :cond_7

    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 184
    .line 185
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eqz v0, :cond_7

    .line 190
    .line 191
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 192
    .line 193
    instance-of v5, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 194
    .line 195
    if-eqz v5, :cond_7

    .line 196
    .line 197
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 198
    .line 199
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->isAiFakePic()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_7

    .line 204
    .line 205
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 206
    .line 207
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t:Landroid/view/View;

    .line 211
    .line 212
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 221
    .line 222
    .line 223
    goto/16 :goto_4

    .line 224
    .line 225
    :cond_7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ak()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_8

    .line 238
    .line 239
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fl()Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_a

    .line 252
    .line 253
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 254
    .line 255
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-eqz v0, :cond_a

    .line 260
    .line 261
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 262
    .line 263
    instance-of v5, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 264
    .line 265
    if-eqz v5, :cond_a

    .line 266
    .line 267
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 268
    .line 269
    const-string v5, "WITH_REPEAT_MAIN_PICTURE"

    .line 270
    .line 271
    invoke-static {v5}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-nez v0, :cond_9

    .line 280
    .line 281
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 282
    .line 283
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 284
    .line 285
    const-string v5, "WITH_NET_MAIN_PICTURE"

    .line 286
    .line 287
    invoke-static {v5}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 288
    .line 289
    .line 290
    move-result-object v5

    .line 291
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    if-eqz v0, :cond_a

    .line 296
    .line 297
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 298
    .line 299
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t:Landroid/view/View;

    .line 303
    .line 304
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 313
    .line 314
    .line 315
    goto :goto_4

    .line 316
    :cond_a
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->p0:Z

    .line 317
    .line 318
    if-eqz v0, :cond_b

    .line 319
    .line 320
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 321
    .line 322
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-eqz v0, :cond_b

    .line 327
    .line 328
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 329
    .line 330
    instance-of v5, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 331
    .line 332
    if-eqz v5, :cond_b

    .line 333
    .line 334
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 335
    .line 336
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->isLow()Z

    .line 337
    .line 338
    .line 339
    move-result v0

    .line 340
    if-eqz v0, :cond_b

    .line 341
    .line 342
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 343
    .line 344
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 345
    .line 346
    .line 347
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t:Landroid/view/View;

    .line 348
    .line 349
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 358
    .line 359
    .line 360
    goto :goto_4

    .line 361
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t:Landroid/view/View;

    .line 362
    .line 363
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 372
    .line 373
    .line 374
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 375
    .line 376
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 377
    .line 378
    .line 379
    move-result v0

    .line 380
    if-nez v0, :cond_c

    .line 381
    .line 382
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 383
    .line 384
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result v0

    .line 388
    if-eqz v0, :cond_c

    .line 389
    .line 390
    goto :goto_5

    .line 391
    :cond_c
    move v1, v2

    .line 392
    :goto_5
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->H1()V

    .line 396
    .line 397
    .line 398
    return-void
.end method

.method public final G0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_10

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_10

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto/16 :goto_4

    .line 28
    .line 29
    :cond_0
    invoke-static {}, Ll/xra;->i()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

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
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 50
    .line 51
    const-string v1, "preprocessed"

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    move-object v0, p1

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    new-instance v1, Ljava/io/File;

    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/niw;->d(Ljava/io/File;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 80
    .line 81
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 82
    .line 83
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 84
    .line 85
    const-string v2, "pic_trace_id"

    .line 86
    .line 87
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "pic_trace_type"

    .line 92
    .line 93
    const-string v3, "trimmed"

    .line 94
    .line 95
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    const-string v3, "pic_trace_url"

    .line 100
    .line 101
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v3, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    new-instance v4, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    iget-object v5, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 113
    .line 114
    iget v5, v5, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 115
    .line 116
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v5, "x"

    .line 120
    .line 121
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 125
    .line 126
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 127
    .line 128
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    const-string v4, "pic_trace_resolution"

    .line 136
    .line 137
    invoke-static {v4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    filled-new-array {v1, v2, v3, v0}, [Ll/sfj0$a;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v1, "e_hyper_profile_pic_double_check"

    .line 146
    .line 147
    const-string v2, "p_edit_profile_view"

    .line 148
    .line 149
    invoke-static {v1, v2, v0}, Ll/sfj0;->m(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 150
    .line 151
    .line 152
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 153
    .line 154
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 155
    .line 156
    iget-object v0, v0, Ll/dkb;->H1:Lrx/subjects/b;

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 159
    .line 160
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 166
    .line 167
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_2

    .line 172
    .line 173
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_2

    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 180
    .line 181
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 182
    .line 183
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 184
    .line 185
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 186
    .line 187
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 188
    .line 189
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    const/4 v1, 0x0

    .line 194
    const/4 v2, 0x1

    .line 195
    const/4 v3, 0x0

    .line 196
    if-nez v0, :cond_a

    .line 197
    .line 198
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 199
    .line 200
    if-eqz v0, :cond_a

    .line 201
    .line 202
    move-object v0, p1

    .line 203
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 204
    .line 205
    const-string v4, "WITH_REPEAT_MAIN_PICTURE"

    .line 206
    .line 207
    invoke-static {v4}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 212
    .line 213
    .line 214
    move-result v4

    .line 215
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->p0:Z

    .line 216
    .line 217
    if-eqz v5, :cond_3

    .line 218
    .line 219
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->isLow()Z

    .line 220
    .line 221
    .line 222
    move-result v5

    .line 223
    if-eqz v5, :cond_3

    .line 224
    .line 225
    move v5, v2

    .line 226
    goto :goto_0

    .line 227
    :cond_3
    move v5, v3

    .line 228
    :goto_0
    const-string v6, "WITH_NET_MAIN_PICTURE"

    .line 229
    .line 230
    invoke-static {v6}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 231
    .line 232
    .line 233
    move-result-object v6

    .line 234
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 235
    .line 236
    .line 237
    move-result v6

    .line 238
    const-string v7, "NOT_VERIFICATION"

    .line 239
    .line 240
    invoke-static {v7}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 241
    .line 242
    .line 243
    move-result-object v7

    .line 244
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 245
    .line 246
    .line 247
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ak()Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-eqz v0, :cond_6

    .line 260
    .line 261
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 262
    .line 263
    .line 264
    if-eqz v4, :cond_4

    .line 265
    .line 266
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q0:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M1(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    :goto_1
    move v0, v3

    .line 272
    goto :goto_2

    .line 273
    :cond_4
    if-eqz v5, :cond_5

    .line 274
    .line 275
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L1()V

    .line 276
    .line 277
    .line 278
    goto :goto_1

    .line 279
    :cond_5
    if-eqz v6, :cond_b

    .line 280
    .line 281
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R0:Ljava/lang/String;

    .line 282
    .line 283
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M1(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    goto :goto_1

    .line 287
    :cond_6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fl()Z

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    if-eqz v0, :cond_8

    .line 300
    .line 301
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 302
    .line 303
    .line 304
    if-eqz v4, :cond_7

    .line 305
    .line 306
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q0:Ljava/lang/String;

    .line 307
    .line 308
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M1(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    goto :goto_1

    .line 312
    :cond_7
    if-eqz v5, :cond_b

    .line 313
    .line 314
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L1()V

    .line 315
    .line 316
    .line 317
    goto :goto_1

    .line 318
    :cond_8
    invoke-static {}, Ll/xra;->w()Z

    .line 319
    .line 320
    .line 321
    move-result v0

    .line 322
    if-eqz v0, :cond_9

    .line 323
    .line 324
    if-eqz v5, :cond_9

    .line 325
    .line 326
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M0:Lcom/p1/mobile/putong/data/Media;

    .line 327
    .line 328
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    if-eqz v0, :cond_9

    .line 333
    .line 334
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 335
    .line 336
    .line 337
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M0:Lcom/p1/mobile/putong/data/Media;

    .line 338
    .line 339
    invoke-virtual {p0, v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L1()V

    .line 343
    .line 344
    .line 345
    goto :goto_1

    .line 346
    :cond_9
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 347
    .line 348
    .line 349
    if-eqz v5, :cond_b

    .line 350
    .line 351
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L1()V

    .line 352
    .line 353
    .line 354
    goto :goto_1

    .line 355
    :cond_a
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 356
    .line 357
    .line 358
    :cond_b
    move v0, v2

    .line 359
    :goto_2
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 360
    .line 361
    const-string v5, "normal"

    .line 362
    .line 363
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 364
    .line 365
    .line 366
    move-result v4

    .line 367
    if-eqz v4, :cond_10

    .line 368
    .line 369
    if-eqz v0, :cond_10

    .line 370
    .line 371
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R:Ljava/util/List;

    .line 372
    .line 373
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O:Ll/kcg0;

    .line 377
    .line 378
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G:Landroid/widget/ImageView;

    .line 379
    .line 380
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 381
    .line 382
    .line 383
    new-instance v0, Ll/b4y;

    .line 384
    .line 385
    invoke-direct {v0, p0, p1}, Ll/b4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Media;)V

    .line 386
    .line 387
    .line 388
    const-wide/16 v4, 0x3e8

    .line 389
    .line 390
    invoke-virtual {p0, v0, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 391
    .line 392
    .line 393
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 394
    .line 395
    .line 396
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ee(Lcom/p1/mobile/android/app/Act;)Z

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    xor-int/2addr p1, v2

    .line 413
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 414
    .line 415
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->LIFE_MOMENT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 416
    .line 417
    if-eq v0, v4, :cond_d

    .line 418
    .line 419
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->MARRY_AVATAR:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 420
    .line 421
    if-eq v0, v4, :cond_d

    .line 422
    .line 423
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->MY_LIFT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 424
    .line 425
    if-ne v0, v4, :cond_c

    .line 426
    .line 427
    goto :goto_3

    .line 428
    :cond_c
    move v3, p1

    .line 429
    :cond_d
    :goto_3
    if-eqz v3, :cond_e

    .line 430
    .line 431
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M:Ljava/lang/String;

    .line 432
    .line 433
    const-string v0, "from_explore_card"

    .line 434
    .line 435
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 436
    .line 437
    .line 438
    move-result p1

    .line 439
    if-nez p1, :cond_e

    .line 440
    .line 441
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 442
    .line 443
    .line 444
    move-result-object p1

    .line 445
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 446
    .line 447
    .line 448
    move-result-object p1

    .line 449
    sget v0, Ll/sec0;->Z0:I

    .line 450
    .line 451
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object p1

    .line 455
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 456
    .line 457
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 458
    .line 459
    .line 460
    move-result-object v1

    .line 461
    invoke-direct {v0, v1, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 465
    .line 466
    .line 467
    move-result-object p1

    .line 468
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->MediaReorderCardDone:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 469
    .line 470
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 471
    .line 472
    .line 473
    move-result-object p1

    .line 474
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 475
    .line 476
    .line 477
    move-result-object p1

    .line 478
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 479
    .line 480
    .line 481
    move-result-object v0

    .line 482
    invoke-virtual {v0, p1}, Ll/llb0;->i(Ll/fqe0;)V

    .line 483
    .line 484
    .line 485
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 486
    .line 487
    iget-object p1, p1, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 488
    .line 489
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 490
    .line 491
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result p1

    .line 495
    if-eqz p1, :cond_f

    .line 496
    .line 497
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 498
    .line 499
    iget-object p1, p1, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 500
    .line 501
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 502
    .line 503
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 504
    .line 505
    .line 506
    move-result p0

    .line 507
    invoke-interface {p1, p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;->a(IZ)V

    .line 508
    .line 509
    .line 510
    :cond_f
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 511
    .line 512
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 513
    .line 514
    iget-object p0, p0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 515
    .line 516
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 517
    .line 518
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 519
    .line 520
    .line 521
    :cond_10
    :goto_4
    return-void
.end method

.method public G1()Z
    .locals 3

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {v0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/xyl;->Q1()Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v1, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iget-object v1, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v0, Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K1()V

    .line 65
    .line 66
    .line 67
    return v2

    .line 68
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->u1()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K1()V

    .line 75
    .line 76
    .line 77
    return v2

    .line 78
    :cond_2
    const/4 p0, 0x0

    .line 79
    return p0
.end method

.method public final H0(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O:Ll/kcg0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 12
    .line 13
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 20
    .line 21
    iget-object v2, v2, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 32
    .line 33
    iget-object v2, v2, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-interface {v2, v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;->a(IZ)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 51
    .line 52
    instance-of v2, v2, Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    if-eqz v2, :cond_1

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M0:Lcom/p1/mobile/putong/data/Media;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    invoke-static {}, Ll/xra;->w()Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M0:Lcom/p1/mobile/putong/data/Media;

    .line 74
    .line 75
    const/4 v2, 0x1

    .line 76
    invoke-virtual {p0, v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 77
    .line 78
    .line 79
    :cond_1
    instance-of p0, p1, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 80
    .line 81
    if-eqz p0, :cond_2

    .line 82
    .line 83
    check-cast p1, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public final H1()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_5

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_5

    .line 31
    .line 32
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K:Z

    .line 33
    .line 34
    if-nez v0, :cond_5

    .line 35
    .line 36
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U:Z

    .line 37
    .line 38
    if-eqz v0, :cond_5

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 53
    .line 54
    sget v4, Ll/qa00;->h:I

    .line 55
    .line 56
    invoke-virtual {v0, v4, v1, v4, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 66
    .line 67
    sget v1, Ll/kbc0;->m:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 73
    .line 74
    const-string v1, "\u5c01\u9762"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 80
    .line 81
    const-string v1, "#ffffffff"

    .line 82
    .line 83
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    .line 89
    .line 90
    goto/16 :goto_2

    .line 91
    .line 92
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 95
    .line 96
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_2

    .line 101
    .line 102
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 111
    .line 112
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Ljava/lang/String;

    .line 119
    .line 120
    invoke-interface {v0, v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gh(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    goto :goto_0

    .line 125
    :cond_2
    move-object v0, v3

    .line 126
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    if-eqz v5, :cond_3

    .line 131
    .line 132
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    if-nez v5, :cond_3

    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 141
    .line 142
    const-string v3, "#CC000000"

    .line 143
    .line 144
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 159
    .line 160
    new-instance v1, Ll/o3y;

    .line 161
    .line 162
    invoke-direct {v1, p0}, Ll/o3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 163
    .line 164
    .line 165
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 166
    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->V:Z

    .line 170
    .line 171
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 172
    .line 173
    if-nez v0, :cond_4

    .line 174
    .line 175
    invoke-static {v5, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_4
    const-string v0, "#FFFE7E1D"

    .line 180
    .line 181
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 189
    .line 190
    const-string v5, "\u6dfb\u52a0\u6807\u7b7e"

    .line 191
    .line 192
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    sget v5, Ll/kbc0;->o1:I

    .line 204
    .line 205
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    invoke-virtual {v0, v1, v1, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 218
    .line 219
    .line 220
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 221
    .line 222
    invoke-virtual {v5, v0, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 223
    .line 224
    .line 225
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 226
    .line 227
    sget v3, Ll/qa00;->c:I

    .line 228
    .line 229
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 230
    .line 231
    .line 232
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 233
    .line 234
    sget v3, Ll/qa00;->g:I

    .line 235
    .line 236
    invoke-virtual {v0, v3, v1, v4, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 240
    .line 241
    new-instance v1, Ll/p3y;

    .line 242
    .line 243
    invoke-direct {v1, p0}, Ll/p3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 244
    .line 245
    .line 246
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 247
    .line 248
    .line 249
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 250
    .line 251
    sget v1, Ll/kbc0;->p:I

    .line 252
    .line 253
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 254
    .line 255
    .line 256
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 257
    .line 258
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    const/high16 v1, -0x80000000

    .line 270
    .line 271
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    const/high16 v2, 0x40000000    # 2.0f

    .line 280
    .line 281
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->measure(II)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 297
    .line 298
    .line 299
    move-result v2

    .line 300
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 301
    .line 302
    .line 303
    move-result v3

    .line 304
    add-int/2addr v2, v3

    .line 305
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 306
    .line 307
    .line 308
    move-result v3

    .line 309
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    add-int/2addr v3, v4

    .line 314
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 315
    .line 316
    .line 317
    return-void

    .line 318
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A:Landroid/widget/TextView;

    .line 319
    .line 320
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 321
    .line 322
    .line 323
    return-void
.end method

.method public I0(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->F7()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J1()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public I1(ZZ)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->V:Z

    .line 4
    .line 5
    return-void
.end method

.method public J0(ILcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->s:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/wlj;

    .line 12
    .line 13
    sget p2, Ll/qa00;->i:I

    .line 14
    .line 15
    int-to-float v0, p2

    .line 16
    int-to-float v1, p2

    .line 17
    int-to-float v2, p2

    .line 18
    int-to-float p2, p2

    .line 19
    invoke-static {v0, v1, v2, p2}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p1, p2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J1()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public J1()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->AVATAR:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 4
    .line 5
    const-string v2, "#ff7602"

    .line 6
    .line 7
    const/16 v3, 0x11

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v5, 0x1

    .line 11
    const-string v6, "#FF7602"

    .line 12
    .line 13
    const/4 v7, 0x3

    .line 14
    const/4 v8, 0x0

    .line 15
    const-string v9, "#e2e2e2"

    .line 16
    .line 17
    if-eq v0, v1, :cond_a

    .line 18
    .line 19
    sget-object v10, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->MARRY_AVATAR:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 20
    .line 21
    if-eq v0, v10, :cond_a

    .line 22
    .line 23
    sget-object v10, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->MY_LIFT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 24
    .line 25
    if-ne v0, v10, :cond_0

    .line 26
    .line 27
    goto/16 :goto_3

    .line 28
    .line 29
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->LIFE_MOMENT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 30
    .line 31
    if-ne v0, v1, :cond_1c

    .line 32
    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 34
    .line 35
    if-ltz v0, :cond_1c

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 38
    .line 39
    sget v1, Ll/kbc0;->v1:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    new-instance v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-direct {v0, v1, v4}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-static {}, Ll/xra;->n()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_8

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 80
    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 88
    .line 89
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;->C:Z

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    move v0, v8

    .line 93
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 94
    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    if-lez v1, :cond_3

    .line 98
    .line 99
    if-ge v1, v7, :cond_3

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 104
    .line 105
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 115
    .line 116
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 121
    .line 122
    .line 123
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    .line 124
    .line 125
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 130
    .line 131
    invoke-direct {v0, v1, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 132
    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 135
    .line 136
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 144
    .line 145
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 146
    .line 147
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v0, v1}, Landroid/graphics/PorterDuffColorFilter;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_8

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 162
    .line 163
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 164
    .line 165
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_1

    .line 184
    .line 185
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 186
    .line 187
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 188
    .line 189
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 197
    .line 198
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 199
    .line 200
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 208
    .line 209
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 210
    .line 211
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    if-eqz v0, :cond_4

    .line 216
    .line 217
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 218
    .line 219
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 220
    .line 221
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 226
    .line 227
    .line 228
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 229
    .line 230
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 235
    .line 236
    .line 237
    goto :goto_1

    .line 238
    :cond_5
    if-lez v1, :cond_6

    .line 239
    .line 240
    if-ge v1, v7, :cond_6

    .line 241
    .line 242
    goto :goto_1

    .line 243
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 244
    .line 245
    if-eqz v0, :cond_7

    .line 246
    .line 247
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_7

    .line 252
    .line 253
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 254
    .line 255
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 256
    .line 257
    .line 258
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 259
    .line 260
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 261
    .line 262
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 270
    .line 271
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 272
    .line 273
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 278
    .line 279
    .line 280
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 281
    .line 282
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 290
    .line 291
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 292
    .line 293
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    if-eqz v0, :cond_8

    .line 298
    .line 299
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 300
    .line 301
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 302
    .line 303
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 308
    .line 309
    .line 310
    :cond_8
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 311
    .line 312
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 313
    .line 314
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b(I)V

    .line 315
    .line 316
    .line 317
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 318
    .line 319
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 320
    .line 321
    if-nez p0, :cond_9

    .line 322
    .line 323
    goto :goto_2

    .line 324
    :cond_9
    move v5, v8

    .line 325
    :goto_2
    invoke-static {v0, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 326
    .line 327
    .line 328
    return-void

    .line 329
    :cond_a
    :goto_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->F7()Z

    .line 338
    .line 339
    .line 340
    move-result v0

    .line 341
    if-eqz v0, :cond_1c

    .line 342
    .line 343
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 344
    .line 345
    const/4 v10, -0x1

    .line 346
    if-eq v0, v10, :cond_1c

    .line 347
    .line 348
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->v4()Z

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    iget-object v10, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 361
    .line 362
    if-eqz v0, :cond_b

    .line 363
    .line 364
    sget v0, Ll/kbc0;->A:I

    .line 365
    .line 366
    invoke-virtual {v10, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 367
    .line 368
    .line 369
    goto :goto_4

    .line 370
    :cond_b
    sget v0, Ll/kbc0;->v1:I

    .line 371
    .line 372
    invoke-virtual {v10, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 373
    .line 374
    .line 375
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 376
    .line 377
    if-nez v0, :cond_10

    .line 378
    .line 379
    invoke-static {}, Ll/xra;->m()Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-eqz v0, :cond_c

    .line 384
    .line 385
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->k0:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 386
    .line 387
    sget-object v10, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;->LIFE:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 388
    .line 389
    if-ne v0, v10, :cond_c

    .line 390
    .line 391
    move-object v4, v10

    .line 392
    goto :goto_5

    .line 393
    :cond_c
    invoke-static {}, Ll/xra;->n()Z

    .line 394
    .line 395
    .line 396
    move-result v0

    .line 397
    if-eqz v0, :cond_f

    .line 398
    .line 399
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->k0:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 400
    .line 401
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;->EDIT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 402
    .line 403
    if-ne v0, v4, :cond_d

    .line 404
    .line 405
    goto :goto_5

    .line 406
    :cond_d
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;->DIALOG:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 407
    .line 408
    if-ne v0, v4, :cond_e

    .line 409
    .line 410
    goto :goto_5

    .line 411
    :cond_e
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;->DEFAULT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 412
    .line 413
    :cond_f
    :goto_5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 414
    .line 415
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 416
    .line 417
    .line 418
    move-result-object v10

    .line 419
    invoke-direct {v0, v10, v4}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;)V

    .line 420
    .line 421
    .line 422
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 423
    .line 424
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 425
    .line 426
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 427
    .line 428
    .line 429
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 430
    .line 431
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 432
    .line 433
    .line 434
    :cond_10
    invoke-static {}, Ll/xra;->k()Z

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    if-nez v0, :cond_11

    .line 439
    .line 440
    invoke-static {}, Ll/xra;->l()Z

    .line 441
    .line 442
    .line 443
    move-result v0

    .line 444
    if-eqz v0, :cond_18

    .line 445
    .line 446
    :cond_11
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 451
    .line 452
    if-eqz v0, :cond_12

    .line 453
    .line 454
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 459
    .line 460
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;->C:Z

    .line 461
    .line 462
    goto :goto_6

    .line 463
    :cond_12
    move v0, v8

    .line 464
    :goto_6
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 465
    .line 466
    if-eqz v0, :cond_15

    .line 467
    .line 468
    if-lez v3, :cond_13

    .line 469
    .line 470
    if-ge v3, v7, :cond_13

    .line 471
    .line 472
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 473
    .line 474
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 475
    .line 476
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 477
    .line 478
    .line 479
    move-result v3

    .line 480
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 481
    .line 482
    .line 483
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 484
    .line 485
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 486
    .line 487
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 488
    .line 489
    .line 490
    move-result v3

    .line 491
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 492
    .line 493
    .line 494
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    .line 495
    .line 496
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 497
    .line 498
    .line 499
    move-result v2

    .line 500
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 501
    .line 502
    invoke-direct {v0, v2, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 503
    .line 504
    .line 505
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 506
    .line 507
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 508
    .line 509
    .line 510
    move-result-object v2

    .line 511
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 512
    .line 513
    .line 514
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 515
    .line 516
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 517
    .line 518
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 519
    .line 520
    .line 521
    move-result-object v2

    .line 522
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 523
    .line 524
    .line 525
    move-result-object v2

    .line 526
    invoke-virtual {v0, v2}, Landroid/graphics/PorterDuffColorFilter;->equals(Ljava/lang/Object;)Z

    .line 527
    .line 528
    .line 529
    move-result v2

    .line 530
    if-nez v2, :cond_18

    .line 531
    .line 532
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 533
    .line 534
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 535
    .line 536
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 537
    .line 538
    .line 539
    move-result-object v2

    .line 540
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 541
    .line 542
    .line 543
    move-result-object v2

    .line 544
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 545
    .line 546
    .line 547
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 548
    .line 549
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 550
    .line 551
    invoke-virtual {v0, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 552
    .line 553
    .line 554
    goto/16 :goto_7

    .line 555
    .line 556
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 557
    .line 558
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 559
    .line 560
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 561
    .line 562
    .line 563
    move-result v2

    .line 564
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 565
    .line 566
    .line 567
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 568
    .line 569
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 570
    .line 571
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 572
    .line 573
    .line 574
    move-result v2

    .line 575
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 576
    .line 577
    .line 578
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 579
    .line 580
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 581
    .line 582
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 583
    .line 584
    .line 585
    move-result-object v0

    .line 586
    if-eqz v0, :cond_14

    .line 587
    .line 588
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 589
    .line 590
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 591
    .line 592
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 593
    .line 594
    .line 595
    move-result-object v0

    .line 596
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 597
    .line 598
    .line 599
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 600
    .line 601
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 602
    .line 603
    .line 604
    move-result-object v0

    .line 605
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 606
    .line 607
    .line 608
    goto :goto_7

    .line 609
    :cond_15
    if-lez v3, :cond_16

    .line 610
    .line 611
    if-ge v3, v7, :cond_16

    .line 612
    .line 613
    goto :goto_7

    .line 614
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 615
    .line 616
    if-eqz v0, :cond_17

    .line 617
    .line 618
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 619
    .line 620
    .line 621
    move-result v0

    .line 622
    if-eqz v0, :cond_17

    .line 623
    .line 624
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 625
    .line 626
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 627
    .line 628
    .line 629
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 630
    .line 631
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 632
    .line 633
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 634
    .line 635
    .line 636
    move-result v2

    .line 637
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 638
    .line 639
    .line 640
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 641
    .line 642
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 643
    .line 644
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 645
    .line 646
    .line 647
    move-result v2

    .line 648
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 649
    .line 650
    .line 651
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 652
    .line 653
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 654
    .line 655
    .line 656
    move-result-object v0

    .line 657
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 658
    .line 659
    .line 660
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 661
    .line 662
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 663
    .line 664
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 665
    .line 666
    .line 667
    move-result-object v0

    .line 668
    if-eqz v0, :cond_18

    .line 669
    .line 670
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 671
    .line 672
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 673
    .line 674
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 679
    .line 680
    .line 681
    :cond_18
    :goto_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 682
    .line 683
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 684
    .line 685
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 686
    .line 687
    if-eq v3, v1, :cond_1a

    .line 688
    .line 689
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->MARRY_AVATAR:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 690
    .line 691
    if-ne v3, v1, :cond_19

    .line 692
    .line 693
    goto :goto_8

    .line 694
    :cond_19
    move v1, v8

    .line 695
    goto :goto_9

    .line 696
    :cond_1a
    :goto_8
    move v1, v5

    .line 697
    :goto_9
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c(IZ)V

    .line 698
    .line 699
    .line 700
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 701
    .line 702
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 703
    .line 704
    if-nez p0, :cond_1b

    .line 705
    .line 706
    goto :goto_a

    .line 707
    :cond_1b
    move v5, v8

    .line 708
    :goto_a
    invoke-static {v0, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 709
    .line 710
    .line 711
    :cond_1c
    return-void
.end method

.method public K0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final K1()V
    .locals 4

    .line 1
    new-instance v0, Ll/jgw;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/v3y;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/v3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 10
    .line 11
    .line 12
    new-instance v3, Ll/w3y;

    .line 13
    .line 14
    invoke-direct {v3, p0}, Ll/w3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1, v2, v3}, Ll/jgw;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/jgw;->show()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public L0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method public final L1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->conclusion:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0:Ll/l4g0;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Ll/l4g0;

    .line 24
    .line 25
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "p_lowqualityphoto__popup"

    .line 32
    .line 33
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0:Ll/l4g0;

    .line 37
    .line 38
    :cond_0
    new-instance v0, Ll/jl80$a;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {v0, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    const-string v1, "\u6e29\u99a8\u63d0\u793a"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->conclusion:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/l4y;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/l4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 64
    .line 65
    .line 66
    const-string v2, "\u66f4\u6362\u7167\u7247"

    .line 67
    .line 68
    invoke-virtual {v0, v2, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/m4y;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/m4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 75
    .line 76
    .line 77
    const-string v2, "\u7a0d\u540e\u518d\u8bf4"

    .line 78
    .line 79
    invoke-virtual {v0, v2, v1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/n4y;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/n4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/o4y;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/o4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 102
    .line 103
    .line 104
    :cond_1
    return-void
.end method

.method public final M0()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/xra;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "marryMode"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    return v1

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "data_from_marry"

    .line 32
    .line 33
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    return v1

    .line 40
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v0, "p_edit_life_moment"

    .line 49
    .line 50
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    return v1

    .line 57
    :cond_2
    const-string v0, "p_marriage_profile_edit"

    .line 58
    .line 59
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    return v1

    .line 66
    :cond_3
    const/4 p0, 0x0

    .line 67
    return p0
.end method

.method public final M1(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/l4g0;

    .line 6
    .line 7
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "p_lowqualityphoto__popup"

    .line 14
    .line 15
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0:Ll/l4g0;

    .line 19
    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q0:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->conclusion:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->mapping:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R0:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->conclusion:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->mapping:Ljava/lang/String;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    const-string v0, ""

    .line 67
    .line 68
    move-object p1, v0

    .line 69
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0:Ll/l4g0;

    .line 70
    .line 71
    const-string v2, "lowquality_reason"

    .line 72
    .line 73
    invoke-static {v2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    filled-new-array {v2}, [Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v1, v2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Ll/jl80$a;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-direct {v1, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 91
    .line 92
    .line 93
    const-string v2, "\u6e29\u99a8\u63d0\u793a"

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/p4y;

    .line 104
    .line 105
    invoke-direct {v1, p0, p1}, Ll/p4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-string v2, "\u66f4\u6362\u7167\u7247"

    .line 109
    .line 110
    invoke-virtual {v0, v2, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/r4y;

    .line 115
    .line 116
    invoke-direct {v1, p1}, Ll/r4y;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    const-string p1, "\u7a0d\u540e\u518d\u8bf4"

    .line 120
    .line 121
    invoke-virtual {v0, p1, v1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    new-instance v0, Ll/s4y;

    .line 126
    .line 127
    invoke-direct {v0, p0}, Ll/s4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    new-instance v0, Ll/t4y;

    .line 135
    .line 136
    invoke-direct {v0, p0}, Ll/t4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final synthetic N0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/t4m;->a()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public N1(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C:Lv/VFrame_Anim;

    .line 2
    .line 3
    new-instance v0, Ll/s3y;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/s3y;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/t3y;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/t3y;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, v0, v1}, Lv/VFrame_Anim;->C(Landroid/view/View;Ll/qcj;Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic O0(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    new-instance p0, Landroid/graphics/PorterDuffColorFilter;

    .line 29
    .line 30
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    check-cast p3, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 41
    .line 42
    invoke-direct {p0, p3, v0}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final O1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/y3y;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/y3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/z3y;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/z3y;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J:Ll/kcg0;

    .line 30
    .line 31
    return-void
.end method

.method public final synthetic P0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;->C:Z

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public P1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w:Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;->u()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w:Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerLayout;->t()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Picture;
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    if-ne v0, v1, :cond_6

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 10
    .line 11
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 18
    .line 19
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_6

    .line 24
    .line 25
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 28
    .line 29
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 32
    .line 33
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 38
    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->H0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 40
    .line 41
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ak()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    const-string v0, "repeat"

    .line 54
    .line 55
    const-string v1, "WITH_REPEAT_MAIN_PICTURE"

    .line 56
    .line 57
    if-eqz p2, :cond_2

    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 60
    .line 61
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-eqz p2, :cond_0

    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 68
    .line 69
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-eqz p2, :cond_0

    .line 76
    .line 77
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/Picture;->setLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/Picture;->removeLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 93
    .line 94
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    const-string v2, "WITH_NET_MAIN_PICTURE"

    .line 99
    .line 100
    if-eqz p2, :cond_1

    .line 101
    .line 102
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 103
    .line 104
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 105
    .line 106
    const-string v3, "net"

    .line 107
    .line 108
    invoke-static {p2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    if-eqz p2, :cond_1

    .line 113
    .line 114
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/Picture;->setLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_1
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/Picture;->removeLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 127
    .line 128
    .line 129
    :cond_2
    :goto_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fl()Z

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    if-eqz p2, :cond_4

    .line 142
    .line 143
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 144
    .line 145
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    if-eqz p2, :cond_3

    .line 150
    .line 151
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 152
    .line 153
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    if-eqz p2, :cond_3

    .line 160
    .line 161
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/Picture;->setLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_3
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/Picture;->removeLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 174
    .line 175
    .line 176
    :cond_4
    :goto_2
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->p0:Z

    .line 177
    .line 178
    const-string v0, "WITH_LOW"

    .line 179
    .line 180
    if-eqz p2, :cond_5

    .line 181
    .line 182
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 183
    .line 184
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    if-eqz p2, :cond_5

    .line 189
    .line 190
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 191
    .line 192
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 193
    .line 194
    const-string p2, "low"

    .line 195
    .line 196
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-eqz p0, :cond_5

    .line 201
    .line 202
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Picture;->setLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 207
    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_5
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Picture;->removeLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 215
    .line 216
    .line 217
    :goto_3
    const-string p0, "NOT_VERIFICATION"

    .line 218
    .line 219
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Picture;->removeLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 224
    .line 225
    .line 226
    :cond_6
    return-object p1
.end method

.method public final Q1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 3

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x2

    .line 14
    :goto_0
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p2, v0, v1, v2}, Ll/dkb;->G9(Ljava/lang/String;ILjava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance v0, Ll/k4y;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/k4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Picture;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public R1(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->B1()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic S0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v:Lv/VText;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {v1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->l0:I

    .line 23
    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A1()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic T0(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->b:I

    .line 13
    .line 14
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_e

    .line 23
    .line 24
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 25
    .line 26
    const-string p3, "\u66f4\u6362\u5934\u50cf"

    .line 27
    .line 28
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    goto/16 :goto_3

    .line 35
    .line 36
    :cond_0
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->c:I

    .line 43
    .line 44
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    const/4 p3, 0x1

    .line 53
    const/4 v0, 0x0

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const p2, 0x186af

    .line 65
    .line 66
    .line 67
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->C(I)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_6

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->getMediaOperation()Ll/xyl;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    invoke-interface {p1, p0, v0, p3, v0}, Ll/xyl;->n0(IZZZ)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->k2:I

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    const-string v1, "p_edit_profile_view"

    .line 102
    .line 103
    const-string v2, "p_upload_photos"

    .line 104
    .line 105
    if-nez p1, :cond_9

    .line 106
    .line 107
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 108
    .line 109
    const-string v3, "\u91cd\u65b0\u88c1\u526a\u7167\u7247"

    .line 110
    .line 111
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_2

    .line 116
    .line 117
    goto/16 :goto_1

    .line 118
    .line 119
    :cond_2
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->g:I

    .line 126
    .line 127
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_3

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U1()V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_3
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->d:I

    .line 148
    .line 149
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-nez p1, :cond_7

    .line 158
    .line 159
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 160
    .line 161
    const-string v3, "\u5220\u9664\u8be5\u7167\u7247"

    .line 162
    .line 163
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-nez p1, :cond_7

    .line 168
    .line 169
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 170
    .line 171
    const-string v3, "\u5220\u9664\u8be5\u89c6\u9891"

    .line 172
    .line 173
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_4

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_4
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 181
    .line 182
    const-string p3, "\u7f16\u8f91\u6807\u7b7e"

    .line 183
    .line 184
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-eqz p1, :cond_5

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->y0()V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 195
    .line 196
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-eqz p1, :cond_6

    .line 201
    .line 202
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 203
    .line 204
    iget-object p2, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 205
    .line 206
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 207
    .line 208
    invoke-interface {p1, p2, p0}, Ll/xyl;->g1(Ljava/lang/CharSequence;I)V

    .line 209
    .line 210
    .line 211
    :cond_6
    return-void

    .line 212
    :cond_7
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->getCurPageId()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    if-nez p1, :cond_8

    .line 221
    .line 222
    const-string p1, "add_delete_picture"

    .line 223
    .line 224
    const-string p2, "delete_picture"

    .line 225
    .line 226
    invoke-static {p1, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 231
    .line 232
    .line 233
    move-result p2

    .line 234
    add-int/2addr p2, p3

    .line 235
    const-string v2, "picture_number"

    .line 236
    .line 237
    invoke-static {v2, p2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 238
    .line 239
    .line 240
    move-result-object p2

    .line 241
    filled-new-array {p1, p2}, [Ll/sfj0$a;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    const-string p2, "e_profile_add_delete_photos"

    .line 246
    .line 247
    invoke-static {p2, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 248
    .line 249
    .line 250
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R:Ljava/util/List;

    .line 251
    .line 252
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 253
    .line 254
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    const/4 p1, 0x0

    .line 258
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 259
    .line 260
    const-string p2, "delete"

    .line 261
    .line 262
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q1(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->T1()V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->l()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setIllegalPicture(Z)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p0, p1, p3, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->getCurPageId()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p2

    .line 285
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J1()V

    .line 289
    .line 290
    .line 291
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 292
    .line 293
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 294
    .line 295
    iget-object p0, p0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 296
    .line 297
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 298
    .line 299
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 300
    .line 301
    .line 302
    return-void

    .line 303
    :cond_9
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->getCurPageId()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    if-nez p1, :cond_a

    .line 312
    .line 313
    const-string p1, "e_picture_re_edit_button"

    .line 314
    .line 315
    new-array p2, v0, [Ll/sfj0$a;

    .line 316
    .line 317
    invoke-static {p1, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 318
    .line 319
    .line 320
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 321
    .line 322
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result p1

    .line 326
    if-nez p1, :cond_d

    .line 327
    .line 328
    new-instance p1, Ljava/lang/StringBuilder;

    .line 329
    .line 330
    const-string p2, "MediaReorderCard error: "

    .line 331
    .line 332
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q:Ljava/util/List;

    .line 336
    .line 337
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 338
    .line 339
    .line 340
    move-result p2

    .line 341
    if-ge v0, p2, :cond_c

    .line 342
    .line 343
    if-lez v0, :cond_b

    .line 344
    .line 345
    const-string p2, ", "

    .line 346
    .line 347
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    :cond_b
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q:Ljava/util/List;

    .line 351
    .line 352
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object p2

    .line 356
    check-cast p2, Ljava/lang/String;

    .line 357
    .line 358
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    add-int/lit8 v0, v0, 0x1

    .line 362
    .line 363
    goto :goto_2

    .line 364
    :cond_c
    new-instance p0, Ljava/lang/NullPointerException;

    .line 365
    .line 366
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 374
    .line 375
    .line 376
    return-void

    .line 377
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R:Ljava/util/List;

    .line 378
    .line 379
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 380
    .line 381
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 385
    .line 386
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 387
    .line 388
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F0(Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 392
    .line 393
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 394
    .line 395
    iget-object p0, p0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 396
    .line 397
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 398
    .line 399
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    return-void

    .line 403
    :cond_e
    :goto_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D0()V

    .line 404
    .line 405
    .line 406
    return-void
.end method

.method public final T1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O:Ll/kcg0;

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
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v1}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t:Landroid/view/View;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O:Ll/kcg0;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic U0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->getMediaOperation()Ll/xyl;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-interface {p1, p0, p2}, Ll/xyl;->f2(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public U1()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->a0(Lcom/p1/mobile/putong/data/Media;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const-string v3, "profile"

    .line 15
    .line 16
    const-string v4, "http"

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O1()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/w4y;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/w4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto/16 :goto_1

    .line 53
    .line 54
    :cond_0
    new-instance v0, Ll/i1y;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 57
    .line 58
    filled-new-array {v1}, [Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/4 v4, 0x1

    .line 67
    invoke-direct {v0, v1, v4}, Ll/i1y;-><init>(Ljava/util/List;Z)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Ll/x4y;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/x4y;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/y4y;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/y4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 89
    .line 90
    filled-new-array {v1}, [Lcom/p1/mobile/putong/data/Media;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-static {v3, v1, v2}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->f0(Ljava/lang/String;Ljava/util/List;Ll/qcj;)Lrx/c$d;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    goto :goto_1

    .line 107
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 114
    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v1, Ll/z4y;

    .line 126
    .line 127
    invoke-direct {v1}, Ll/z4y;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    goto :goto_0

    .line 135
    :cond_2
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    new-instance v1, Ll/a5y;

    .line 140
    .line 141
    invoke-direct {v1, p0}, Ll/a5y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ll/b5y;

    .line 149
    .line 150
    invoke-direct {v1}, Ll/b5y;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    :goto_0
    new-instance v1, Ll/k3y;

    .line 158
    .line 159
    invoke-direct {v1, p0}, Ll/k3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 167
    .line 168
    filled-new-array {v1}, [Lcom/p1/mobile/putong/data/Media;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-static {v3, v1, v2}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->f0(Ljava/lang/String;Ljava/util/List;Ll/qcj;)Lrx/c$d;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E:Lv/VProgressBar;

    .line 185
    .line 186
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 187
    .line 188
    .line 189
    const/4 v1, 0x0

    .line 190
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setIllegalPicture(Z)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-nez v2, :cond_3

    .line 198
    .line 199
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S:Landroid/view/View;

    .line 200
    .line 201
    if-eqz v2, :cond_3

    .line 202
    .line 203
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 204
    .line 205
    .line 206
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t:Landroid/view/View;

    .line 207
    .line 208
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    const/high16 v2, 0x3f800000    # 1.0f

    .line 213
    .line 214
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 219
    .line 220
    .line 221
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    new-instance v1, Ll/l3y;

    .line 230
    .line 231
    invoke-direct {v1, p0}, Ll/l3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    new-instance v1, Ll/m3y;

    .line 247
    .line 248
    invoke-direct {v1, p0}, Ll/m3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 249
    .line 250
    .line 251
    new-instance v2, Ll/n3y;

    .line 252
    .line 253
    invoke-direct {v2, p0}, Ll/n3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 254
    .line 255
    .line 256
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O:Ll/kcg0;

    .line 265
    .line 266
    return-void
.end method

.method public final synthetic V0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->H0:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic W0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N1(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->t:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic X0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y0(Lcom/p1/mobile/putong/data/Picture;[I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x1(Lcom/p1/mobile/putong/data/Media;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Z0(Lcom/p1/mobile/putong/data/Video;[I)V
    .locals 4

    .line 1
    new-instance p2, Ll/vel0;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p2, v0}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-wide v0, p2, Ll/vel0;->b:J

    .line 13
    .line 14
    const-wide/16 v2, 0x3e80

    .line 15
    .line 16
    cmp-long p2, v0, v2

    .line 17
    .line 18
    if-ltz p2, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->C2:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-wide/16 v2, 0xbb8

    .line 27
    .line 28
    cmp-long p2, v0, v2

    .line 29
    .line 30
    if-gez p2, :cond_1

    .line 31
    .line 32
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->D2:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x1(Lcom/p1/mobile/putong/data/Media;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic a1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->getMediaOperation()Ll/xyl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {v0, p0, v1}, Ll/xyl;->i0(IZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic b1([I)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Landroid/view/ViewGroup;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 50
    .line 51
    .line 52
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->s:Lv/VDraweeView;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const/4 v1, 0x0

    .line 67
    invoke-virtual {p1, v0, p0, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public final synthetic c1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e1()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x186af

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->C(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->getMediaOperation()Ll/xyl;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/4 v1, 0x1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-interface {v0, p0, v2, v1, v2}, Ll/xyl;->n0(IZZZ)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final synthetic f1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->mapping:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "lowquality_reason"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "e_replace_photo"

    .line 19
    .line 20
    const-string v1, "p_lowqualityphoto__popup"

    .line 21
    .line 22
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic g1()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->mapping:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "lowquality_reason"

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "e_replace_photo_cancel"

    .line 16
    .line 17
    const-string v1, "p_lowqualityphoto__popup"

    .line 18
    .line 19
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public getAddPhotos()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaOperation()Ll/xyl;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v0, v0, Ll/xyl;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/xyl;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileMediaAct;

    .line 32
    .line 33
    return-object p0
.end method

.method public final synthetic h1(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic i1(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic j1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D0()V

    .line 2
    .line 3
    .line 4
    const-string p0, "lowquality_reason"

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    filled-new-array {p0}, [Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "e_replace_photo"

    .line 15
    .line 16
    const-string v0, "p_lowqualityphoto__popup"

    .line 17
    .line 18
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->k(Z)V

    .line 2
    .line 3
    .line 4
    xor-int/lit8 p1, p1, 0x1

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic k1(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic l1(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J0:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m1(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F1()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic n1(Ll/uxj0;)Lrx/c;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "user-profile"

    .line 12
    .line 13
    const-string v0, "profile"

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {p0, v0, p1, v1}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic o1(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ak()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fl()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->p0:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 32
    .line 33
    const-string v1, "normal"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->B0(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->A0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/xra;->j()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 14
    .line 15
    sget v1, Ll/kbc0;->x1:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 28
    .line 29
    sget v2, Ll/qa00;->i:I

    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 35
    .line 36
    const/high16 v2, 0x41100000    # 9.0f

    .line 37
    .line 38
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-static {v1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->B:Landroid/widget/ImageView;

    .line 46
    .line 47
    sget v2, Ll/kbc0;->H0:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->H:Landroid/widget/ImageView;

    .line 53
    .line 54
    sget v2, Ll/kbc0;->H0:I

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->B:Landroid/widget/ImageView;

    .line 60
    .line 61
    sget v2, Ll/qa00;->c:I

    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->B:Landroid/widget/ImageView;

    .line 67
    .line 68
    const/high16 v2, 0x40a00000    # 5.0f

    .line 69
    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 75
    .line 76
    .line 77
    const/4 v1, 0x1

    .line 78
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->s:Lv/VDraweeView;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Ll/wlj;

    .line 88
    .line 89
    sget v2, Ll/qa00;->h:I

    .line 90
    .line 91
    int-to-float v3, v2

    .line 92
    int-to-float v4, v2

    .line 93
    int-to-float v5, v2

    .line 94
    int-to-float v2, v2

    .line 95
    invoke-static {v3, v4, v5, v2}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v1, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->u:Lv/VImage;

    .line 103
    .line 104
    new-instance v2, Ll/j3y;

    .line 105
    .line 106
    invoke-direct {v2, p0}, Ll/j3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E:Lv/VProgressBar;

    .line 113
    .line 114
    invoke-static {v1}, Ll/bnl0;->p0(Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F:Lv/VProgressBar;

    .line 118
    .line 119
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E:Lv/VProgressBar;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 122
    .line 123
    sget v2, Ll/kbc0;->p1:I

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_1

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 143
    .line 144
    sget v2, Ll/kbc0;->B:I

    .line 145
    .line 146
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 150
    .line 151
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 156
    .line 157
    const/16 v2, 0x11

    .line 158
    .line 159
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 160
    .line 161
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 162
    .line 163
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 166
    .line 167
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    .line 169
    .line 170
    :cond_1
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic p1(Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G0(Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L0:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L0:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 18
    .line 19
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic q1(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L0:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x1(Lcom/p1/mobile/putong/data/Media;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic r1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->H0(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public setCardDataType(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->k0:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 2
    .line 3
    return-void
.end method

.method public setCardType(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 2
    .line 3
    return-void
.end method

.method public setChangeAction(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/data/Media;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public setCropPicStateVisibility(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->h()Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->h()Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->e:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->u:Lv/VImage;

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setDataFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setEnableLowPhoto(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->p0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIllegalPicture(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->y:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x4

    .line 10
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setMainPicTag(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public setShouldShowEdit(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->T:Z

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t1(Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I:Lrx/subjects/b;

    .line 4
    .line 5
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "uploadStart"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q1(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 16
    .line 17
    const-string v0, "preprocessed"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "user-profile"

    .line 34
    .line 35
    const-string v0, "profile"

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {p0, v0, p1, v1}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p1, Ll/x3y;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/x3y;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_0
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public u()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K0:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x1f4

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ll/xyl;->P3(I)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K0:J

    .line 39
    .line 40
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 48
    .line 49
    if-nez v0, :cond_5

    .line 50
    .line 51
    invoke-static {}, Ll/xra;->w()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_5

    .line 56
    .line 57
    invoke-static {}, Ll/xra;->k()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 76
    .line 77
    new-instance v3, Ll/q3y;

    .line 78
    .line 79
    invoke-direct {v3, p0}, Ll/q3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Kc(Lcom/p1/mobile/android/app/Act;ILl/x20;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->p0:Z

    .line 87
    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G1()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    :goto_0
    return-void

    .line 97
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D0()V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 102
    .line 103
    if-nez v0, :cond_8

    .line 104
    .line 105
    invoke-static {}, Ll/xra;->m()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_6

    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->k0:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 112
    .line 113
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;->LIFE:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 114
    .line 115
    if-eq v0, v1, :cond_7

    .line 116
    .line 117
    :cond_6
    invoke-static {}, Ll/xra;->n()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_8

    .line 122
    .line 123
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 136
    .line 137
    new-instance v3, Ll/r3y;

    .line 138
    .line 139
    invoke-direct {v3, p0}, Ll/r3y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Kc(Lcom/p1/mobile/android/app/Act;ILl/x20;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->v1()V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final u1()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/xra;->d()Lcom/p1/mobile/putong/core/data/PhotoLowConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v0, v0, Ll/dkb;->G4:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object p0, p0, Ll/dkb;->G4:Ll/byd0;

    .line 33
    .line 34
    invoke-static {}, Ll/pzi0;->o()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    iget-object p0, p0, Ll/dkb;->H4:Ll/vxd0;

    .line 50
    .line 51
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return v1

    .line 59
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    iget-object v0, v0, Ll/dkb;->H4:Ll/vxd0;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez p0, :cond_1

    .line 76
    .line 77
    const/4 p0, 0x2

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/PhotoLowConfig;->count:I

    .line 80
    .line 81
    :goto_0
    if-ge v0, p0, :cond_2

    .line 82
    .line 83
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 86
    .line 87
    iget-object p0, p0, Ll/dkb;->G4:Ll/byd0;

    .line 88
    .line 89
    invoke-static {}, Ll/pzi0;->o()J

    .line 90
    .line 91
    .line 92
    move-result-wide v2

    .line 93
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 103
    .line 104
    iget-object p0, p0, Ll/dkb;->H4:Ll/vxd0;

    .line 105
    .line 106
    invoke-virtual {p0, v1}, Ll/vxd0;->a(I)V

    .line 107
    .line 108
    .line 109
    return v1

    .line 110
    :cond_2
    const/4 p0, 0x0

    .line 111
    return p0
.end method

.method public v1()V
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const-string v2, "normal"

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 19
    .line 20
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U:Z

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 31
    .line 32
    if-lez v1, :cond_0

    .line 33
    .line 34
    const-string v1, "\u7f16\u8f91\u6807\u7b7e"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_4

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 50
    .line 51
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_4

    .line 56
    .line 57
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->T:Z

    .line 58
    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    invoke-static {}, Ll/xra;->w()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 66
    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    instance-of v1, v3, Lcom/p1/mobile/putong/data/Picture;

    .line 70
    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    const-string v1, "\u91cd\u65b0\u88c1\u526a\u7167\u7247"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 79
    .line 80
    if-nez v1, :cond_3

    .line 81
    .line 82
    const-string v1, "\u66f4\u6362\u5934\u50cf"

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    instance-of v1, v3, Lcom/p1/mobile/putong/data/Picture;

    .line 89
    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->k2:I

    .line 97
    .line 98
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 106
    .line 107
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 108
    .line 109
    if-eqz v1, :cond_4

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q:Ljava/util/List;

    .line 117
    .line 118
    const-string v3, "show action dialog"

    .line 119
    .line 120
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->i()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    const/4 v3, 0x1

    .line 128
    if-le v1, v3, :cond_5

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 131
    .line 132
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_5

    .line 137
    .line 138
    goto/16 :goto_2

    .line 139
    .line 140
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 141
    .line 142
    if-eqz v1, :cond_6

    .line 143
    .line 144
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 145
    .line 146
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-eqz v1, :cond_a

    .line 151
    .line 152
    :cond_6
    invoke-static {}, Ll/xra;->w()Z

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    if-nez v1, :cond_a

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 159
    .line 160
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_8

    .line 165
    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 167
    .line 168
    invoke-interface {v1}, Ll/xyl;->getSelfActions()Ljava/util/List;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    if-nez v4, :cond_7

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->b:I

    .line 187
    .line 188
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->c:I

    .line 200
    .line 201
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->b:I

    .line 214
    .line 215
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->c:I

    .line 227
    .line 228
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->getCurPageId()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    const-string v4, "p_upload_photos"

    .line 240
    .line 241
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    const-string v5, "p_edit_profile_view"

    .line 246
    .line 247
    if-nez v1, :cond_9

    .line 248
    .line 249
    const/4 v1, 0x0

    .line 250
    new-array v1, v1, [Ll/sfj0$a;

    .line 251
    .line 252
    const-string v6, "e_edit_profile_add_icon"

    .line 253
    .line 254
    invoke-static {v6, v5, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 255
    .line 256
    .line 257
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->getCurPageId()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    if-nez v1, :cond_a

    .line 266
    .line 267
    const-string v1, "add_delete_picture"

    .line 268
    .line 269
    const-string v4, "add_picture"

    .line 270
    .line 271
    invoke-static {v1, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 276
    .line 277
    .line 278
    move-result v4

    .line 279
    add-int/2addr v4, v3

    .line 280
    const-string v6, "picture_number"

    .line 281
    .line 282
    invoke-static {v6, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 283
    .line 284
    .line 285
    move-result-object v4

    .line 286
    filled-new-array {v1, v4}, [Ll/sfj0$a;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    const-string v4, "e_profile_add_delete_photos"

    .line 291
    .line 292
    invoke-static {v4, v5, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 293
    .line 294
    .line 295
    :cond_a
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 296
    .line 297
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-eqz v1, :cond_b

    .line 302
    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 304
    .line 305
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 306
    .line 307
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    if-nez v1, :cond_b

    .line 312
    .line 313
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O:Ll/kcg0;

    .line 314
    .line 315
    if-nez v1, :cond_b

    .line 316
    .line 317
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->g:I

    .line 322
    .line 323
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    :cond_b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->i()I

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    if-gt v1, v3, :cond_c

    .line 335
    .line 336
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->W:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 337
    .line 338
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;->LIFE_MOMENT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardType;

    .line 339
    .line 340
    if-ne v1, v3, :cond_f

    .line 341
    .line 342
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 343
    .line 344
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 345
    .line 346
    .line 347
    move-result v1

    .line 348
    if-eqz v1, :cond_f

    .line 349
    .line 350
    invoke-static {}, Ll/xra;->w()Z

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    if-eqz v1, :cond_e

    .line 355
    .line 356
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O0:I

    .line 357
    .line 358
    if-lez v1, :cond_f

    .line 359
    .line 360
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 361
    .line 362
    instance-of v3, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 363
    .line 364
    if-eqz v3, :cond_d

    .line 365
    .line 366
    const-string v1, "\u5220\u9664\u8be5\u7167\u7247"

    .line 367
    .line 368
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    goto :goto_3

    .line 372
    :cond_d
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 373
    .line 374
    if-eqz v1, :cond_f

    .line 375
    .line 376
    const-string v1, "\u5220\u9664\u8be5\u89c6\u9891"

    .line 377
    .line 378
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    goto :goto_3

    .line 382
    :cond_e
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->d:I

    .line 387
    .line 388
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 393
    .line 394
    .line 395
    :cond_f
    :goto_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->p0:Z

    .line 396
    .line 397
    if-eqz v1, :cond_12

    .line 398
    .line 399
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 400
    .line 401
    if-nez v1, :cond_10

    .line 402
    .line 403
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->b:I

    .line 408
    .line 409
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v1

    .line 413
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 414
    .line 415
    .line 416
    move-result v1

    .line 417
    if-eqz v1, :cond_10

    .line 418
    .line 419
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->c:I

    .line 424
    .line 425
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    move-result v1

    .line 433
    if-eqz v1, :cond_10

    .line 434
    .line 435
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->G1()Z

    .line 436
    .line 437
    .line 438
    move-result v1

    .line 439
    if-eqz v1, :cond_12

    .line 440
    .line 441
    goto :goto_5

    .line 442
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 443
    .line 444
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 445
    .line 446
    .line 447
    move-result v1

    .line 448
    if-eqz v1, :cond_12

    .line 449
    .line 450
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 451
    .line 452
    instance-of v3, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 453
    .line 454
    if-eqz v3, :cond_12

    .line 455
    .line 456
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 457
    .line 458
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->isLow()Z

    .line 459
    .line 460
    .line 461
    move-result v1

    .line 462
    if-eqz v1, :cond_12

    .line 463
    .line 464
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 465
    .line 466
    .line 467
    move-result v1

    .line 468
    if-nez v1, :cond_11

    .line 469
    .line 470
    invoke-static {}, Ll/xra;->w()Z

    .line 471
    .line 472
    .line 473
    move-result v1

    .line 474
    if-eqz v1, :cond_11

    .line 475
    .line 476
    goto :goto_4

    .line 477
    :cond_11
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 478
    .line 479
    .line 480
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 481
    .line 482
    .line 483
    move-result-object v1

    .line 484
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->g:I

    .line 485
    .line 486
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v1

    .line 490
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 491
    .line 492
    .line 493
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 494
    .line 495
    .line 496
    move-result-object v1

    .line 497
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->d:I

    .line 498
    .line 499
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v1

    .line 503
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 504
    .line 505
    .line 506
    :cond_12
    :goto_4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->o:Z

    .line 507
    .line 508
    if-nez v1, :cond_13

    .line 509
    .line 510
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 511
    .line 512
    .line 513
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 514
    .line 515
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 516
    .line 517
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 518
    .line 519
    .line 520
    move-result v1

    .line 521
    if-nez v1, :cond_13

    .line 522
    .line 523
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->g:I

    .line 528
    .line 529
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    .line 535
    .line 536
    :cond_13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 537
    .line 538
    .line 539
    move-result v1

    .line 540
    if-nez v1, :cond_14

    .line 541
    .line 542
    :goto_5
    return-void

    .line 543
    :cond_14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E0(Ljava/util/ArrayList;)V

    .line 544
    .line 545
    .line 546
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->w(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->D:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCropPicStateVisibility(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public w1(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 1

    .line 1
    new-instance v0, Ll/f4y;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/f4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Picture;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public x0()Lcom/p1/mobile/android/app/Act;
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

.method public x1(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 12
    .line 13
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M0:Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 32
    .line 33
    const-string p1, "onPickMedia"

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q1(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U1()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F1()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->f()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J1()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 59
    .line 60
    invoke-interface {p0}, Ll/xyl;->e1()V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public final y0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 9
    .line 10
    const-string v1, "normal"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->h()Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->h()Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->j:Ljava/lang/Runnable;

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 38
    .line 39
    .line 40
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->x0()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 45
    .line 46
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    new-instance v2, Ll/h4y;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/h4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    invoke-static {v0, v1, p0, v2, p0}, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->w2(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public y1(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->M0:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    const-string p1, "onPickMedia"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q1(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->U1()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->F1()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->f()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->J1()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->m:Ll/xyl;

    .line 45
    .line 46
    invoke-interface {p0}, Ll/xyl;->e1()V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public z0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N0:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 35
    .line 36
    new-instance v3, Landroid/animation/ArgbEvaluator;

    .line 37
    .line 38
    invoke-direct {v3}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v4, "#e2e2e2"

    .line 42
    .line 43
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    const-string v5, "#FF7602"

    .line 52
    .line 53
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    filled-new-array {v4, v5}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    const-string v5, "textColor"

    .line 66
    .line 67
    invoke-static {v2, v5, v3, v4}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    const-wide/16 v3, 0x320

    .line 72
    .line 73
    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    new-instance v3, Ll/e4y;

    .line 80
    .line 81
    invoke-direct {v3, p0, v0, v1}, Ll/e4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 88
    .line 89
    const/4 v1, 0x2

    .line 90
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 94
    .line 95
    const/4 v1, 0x4

    .line 96
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 100
    .line 101
    const/4 v1, 0x0

    .line 102
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 106
    .line 107
    new-instance v1, Ll/g4y;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/g4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P0:Landroid/animation/ObjectAnimator;

    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 126
    .line 127
    if-eqz v0, :cond_1

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 134
    .line 135
    const/4 v0, 0x1

    .line 136
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;->C:Z

    .line 137
    .line 138
    :cond_1
    return-void
.end method

.method public z1(Lcom/p1/mobile/putong/data/Video;)V
    .locals 1

    .line 1
    new-instance v0, Ll/q4y;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/q4y;-><init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Video;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
