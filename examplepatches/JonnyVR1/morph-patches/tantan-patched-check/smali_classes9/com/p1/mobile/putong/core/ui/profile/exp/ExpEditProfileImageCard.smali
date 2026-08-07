.class public Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;
.super Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;
.source "SourceFile"


# static fields
.field public static G0:Ljava/lang/String; = "RepeatPicture"

.field public static H0:Ljava/lang/String; = "NetPicture"


# instance fields
.field public A:Lv/VProgressBar;

.field public B:Lv/VProgressBar;

.field public C:Landroid/widget/ImageView;

.field public D:Ll/okf;

.field public E:Landroid/widget/ImageView;

.field public E0:I

.field public F:Z

.field public F0:Landroid/animation/ObjectAnimator;

.field public G:I

.field public H:Ljava/lang/String;

.field public I:Lcom/p1/mobile/putong/data/Media;

.field public J:Ll/kcg0;

.field public K:Ll/a30;
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

.field public L:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public M:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public N:Z

.field public O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

.field public P:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

.field public Q:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

.field public R:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

.field public S:Ll/l4g0;

.field public T:Ll/l4g0;

.field public U:Z

.field public V:J

.field public W:Ljava/lang/Runnable;

.field public k0:Lcom/p1/mobile/putong/data/Media;

.field public p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

.field public r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

.field public s:Lv/VDraweeView;

.field public t:Landroid/view/View;

.field public u:Lv/VText;

.field public v:Landroid/widget/TextView;

.field public w:Landroid/widget/LinearLayout;

.field public x:Landroid/widget/TextView;

.field public y:Lv/VFrame_Anim;

.field public z:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F:Z

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G:I

    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L:Ljava/util/List;

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M:Ljava/util/List;

    .line 23
    .line 24
    const/4 p1, -0x1

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F:Z

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G:I

    .line 31
    new-instance p1, Ljava/util/ArrayList;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L:Ljava/util/List;

    .line 32
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M:Ljava/util/List;

    const/4 p1, -0x1

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F:Z

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G:I

    .line 37
    new-instance p1, Ljava/util/ArrayList;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L:Ljava/util/List;

    .line 38
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M:Ljava/util/List;

    const/4 p1, -0x1

    .line 39
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->S0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->X0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s0()V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s0()V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J0(Lcom/p1/mobile/putong/data/Picture;[I)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->T0(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L(Ljava/lang/String;)V
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

.method public static synthetic M(Landroid/view/View;)Landroid/view/ViewPropertyAnimator;
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

.method public static synthetic N(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->W0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic O(Ll/bkj0;)Ll/uxj0;
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

.method public static synthetic P(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/User;
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

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->z0()V

    return-void
.end method

.method public static synthetic R()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->H0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T(Ljava/util/List;)Lcom/p1/mobile/putong/data/Picture;
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

.method public static synthetic U(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->R0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->V0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W(Landroid/view/View;)Landroid/view/ViewPropertyAnimator;
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

.method public static synthetic X(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->Q0(Ljava/lang/String;)V

    return-void
.end method

.method private Y0()Z
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

.method public static synthetic Z(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->K0([I)V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->B0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Picture;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->N0()V

    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private c1()V
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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

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
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

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
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

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
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

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
    iget-object v3, v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {v1, v2, v3, p0, v0}, Landroid/view/View;->layout(IIII)V

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->A0(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->U0(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F0(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M0()V

    return-void
.end method

.method private g1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F:Z

    .line 21
    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    sget v0, Ll/dbc0;->d1:I

    .line 39
    .line 40
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 44
    .line 45
    const-string v1, "\u9996\u56fe"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 51
    .line 52
    const-string v1, "#ffffff"

    .line 53
    .line 54
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    sget v0, Ll/dbc0;->e1:I

    .line 63
    .line 64
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 68
    .line 69
    new-instance v3, Ll/rbf;

    .line 70
    .line 71
    invoke-direct {v3, p0}, Ll/rbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 80
    .line 81
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_1

    .line 86
    .line 87
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 96
    .line 97
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Ljava/lang/String;

    .line 104
    .line 105
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gh(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    goto :goto_0

    .line 110
    :cond_1
    const/4 v0, 0x0

    .line 111
    :goto_0
    if-eqz v0, :cond_2

    .line 112
    .line 113
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_2

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 122
    .line 123
    const-string v3, "#000000"

    .line 124
    .line 125
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    sget v3, Ll/c9c0;->A:I

    .line 147
    .line 148
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 156
    .line 157
    const-string v1, "\u6dfb\u52a0\u6807\u7b7e"

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 163
    .line 164
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 169
    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 173
    .line 174
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->D0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method private i1()V
    .locals 4

    .line 1
    new-instance v0, Ll/jgw;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/nbf;

    .line 8
    .line 9
    invoke-direct {v2}, Ll/nbf;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v3, Ll/obf;

    .line 13
    .line 14
    invoke-direct {v3, p0}, Ll/obf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

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

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->P0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method private j1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->S:Ll/l4g0;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->S:Ll/l4g0;

    .line 37
    .line 38
    :cond_0
    new-instance v0, Ll/jl80$a;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    new-instance v1, Ll/bcf;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/bcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

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
    new-instance v1, Ll/ccf;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/ccf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

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
    new-instance v1, Ll/dcf;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/dcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/ecf;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/ecf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

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

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I0(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method private k1(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->T:Ll/l4g0;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->T:Ll/l4g0;

    .line 19
    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G0:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->P:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->P:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->H0:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->Q:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->Q:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->T:Ll/l4g0;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

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
    new-instance v1, Ll/hcf;

    .line 104
    .line 105
    invoke-direct {v1, p0, p1}, Ll/hcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Ljava/lang/String;)V

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
    new-instance v1, Ll/icf;

    .line 115
    .line 116
    invoke-direct {v1, p1}, Ll/icf;-><init>(Ljava/lang/String;)V

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
    new-instance v0, Ll/jcf;

    .line 126
    .line 127
    invoke-direct {v0, p0}, Ll/jcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    new-instance v0, Ll/kcf;

    .line 135
    .line 136
    invoke-direct {v0, p0}, Ll/kcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

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

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method

.method private m1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private o0()V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 45
    .line 46
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    new-instance v2, Ll/fcf;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/fcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

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

.method private p1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J:Ll/kcg0;

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
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v1}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t:Landroid/view/View;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J:Ll/kcg0;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private q0(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
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
    new-instance v1, Ll/wbf;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/wbf;-><init>()V

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
    new-instance v1, Ll/xbf;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Ll/xbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;)V

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

.method private r0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;
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
    new-instance p1, Ll/ubf;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/ubf;-><init>()V

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

.method private s0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    new-instance v2, Ll/ybf;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/ybf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    :goto_0
    invoke-virtual {v0, v1, v2, p0}, Ll/aw90;->n0(Lcom/p1/mobile/android/app/Act;Ll/z20;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private v0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_d

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

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
    if-nez v0, :cond_d

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

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
    goto/16 :goto_2

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->N:Z

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
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->e1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 262
    .line 263
    .line 264
    if-eqz v4, :cond_4

    .line 265
    .line 266
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G0:Ljava/lang/String;

    .line 267
    .line 268
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k1(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    goto :goto_1

    .line 272
    :cond_4
    if-eqz v5, :cond_5

    .line 273
    .line 274
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->j1()V

    .line 275
    .line 276
    .line 277
    goto :goto_1

    .line 278
    :cond_5
    if-eqz v6, :cond_b

    .line 279
    .line 280
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->H0:Ljava/lang/String;

    .line 281
    .line 282
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k1(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    goto :goto_1

    .line 286
    :cond_6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fl()Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz v0, :cond_8

    .line 299
    .line 300
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->e1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 301
    .line 302
    .line 303
    if-eqz v4, :cond_7

    .line 304
    .line 305
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G0:Ljava/lang/String;

    .line 306
    .line 307
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k1(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    goto :goto_1

    .line 311
    :cond_7
    if-eqz v5, :cond_b

    .line 312
    .line 313
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->j1()V

    .line 314
    .line 315
    .line 316
    goto :goto_1

    .line 317
    :cond_8
    invoke-static {}, Ll/xra;->w()Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-eqz v0, :cond_9

    .line 322
    .line 323
    if-eqz v5, :cond_9

    .line 324
    .line 325
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k0:Lcom/p1/mobile/putong/data/Media;

    .line 326
    .line 327
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-eqz v0, :cond_9

    .line 332
    .line 333
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 334
    .line 335
    .line 336
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k0:Lcom/p1/mobile/putong/data/Media;

    .line 337
    .line 338
    invoke-virtual {p0, v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->e1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 339
    .line 340
    .line 341
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->j1()V

    .line 342
    .line 343
    .line 344
    goto :goto_1

    .line 345
    :cond_9
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->e1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 346
    .line 347
    .line 348
    if-eqz v5, :cond_b

    .line 349
    .line 350
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->j1()V

    .line 351
    .line 352
    .line 353
    goto :goto_1

    .line 354
    :cond_a
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->e1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 355
    .line 356
    .line 357
    :cond_b
    move v3, v2

    .line 358
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 359
    .line 360
    const-string v4, "normal"

    .line 361
    .line 362
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    if-eqz v0, :cond_d

    .line 367
    .line 368
    if-eqz v3, :cond_d

    .line 369
    .line 370
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M:Ljava/util/List;

    .line 371
    .line 372
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 373
    .line 374
    .line 375
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J:Ll/kcg0;

    .line 376
    .line 377
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 378
    .line 379
    sget v1, Ll/dbc0;->c7:I

    .line 380
    .line 381
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 382
    .line 383
    .line 384
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 385
    .line 386
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 387
    .line 388
    .line 389
    new-instance v0, Ll/zbf;

    .line 390
    .line 391
    invoke-direct {v0, p0, p1}, Ll/zbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Media;)V

    .line 392
    .line 393
    .line 394
    const-wide/16 v3, 0x3e8

    .line 395
    .line 396
    invoke-virtual {p0, v0, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 397
    .line 398
    .line 399
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 400
    .line 401
    iget-object p1, p1, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 402
    .line 403
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 404
    .line 405
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 406
    .line 407
    .line 408
    move-result p1

    .line 409
    if-eqz p1, :cond_c

    .line 410
    .line 411
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 412
    .line 413
    iget-object p1, p1, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 414
    .line 415
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 416
    .line 417
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 418
    .line 419
    .line 420
    move-result p0

    .line 421
    invoke-interface {p1, p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;->a(IZ)V

    .line 422
    .line 423
    .line 424
    :cond_c
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 425
    .line 426
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 427
    .line 428
    iget-object p0, p0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 429
    .line 430
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 431
    .line 432
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 433
    .line 434
    .line 435
    :cond_d
    :goto_2
    return-void
.end method

.method private w0(Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J:Ll/kcg0;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->z:Landroid/widget/ImageView;

    .line 9
    .line 10
    invoke-static {v2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 14
    .line 15
    sget v3, Ll/dbc0;->b7:I

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n1(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 30
    .line 31
    iget-object v3, v3, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 34
    .line 35
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 42
    .line 43
    iget-object v3, v3, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-interface {v3, v4, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;->a(IZ)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_1

    .line 59
    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 61
    .line 62
    instance-of v3, v3, Lcom/p1/mobile/putong/data/Picture;

    .line 63
    .line 64
    if-eqz v3, :cond_1

    .line 65
    .line 66
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k0:Lcom/p1/mobile/putong/data/Media;

    .line 67
    .line 68
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k0:Lcom/p1/mobile/putong/data/Media;

    .line 78
    .line 79
    invoke-virtual {p0, v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->e1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 80
    .line 81
    .line 82
    :cond_1
    instance-of p0, p1, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 83
    .line 84
    if-eqz p0, :cond_2

    .line 85
    .line 86
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    return-void
.end method


# virtual methods
.method public final synthetic A0(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

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

.method public final synthetic B0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Picture;
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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 28
    .line 29
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->P:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 32
    .line 33
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->Q:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 38
    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->R:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->P:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->P:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->Q:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->Q:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->P:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->P:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->N:Z

    .line 177
    .line 178
    if-eqz p2, :cond_5

    .line 179
    .line 180
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 181
    .line 182
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    if-eqz p2, :cond_5

    .line 187
    .line 188
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 189
    .line 190
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 191
    .line 192
    const-string p2, "low"

    .line 193
    .line 194
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    if-eqz p0, :cond_5

    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->setLow()V

    .line 201
    .line 202
    .line 203
    goto :goto_3

    .line 204
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->removeLowLabel()V

    .line 205
    .line 206
    .line 207
    :goto_3
    const-string p0, "NOT_VERIFICATION"

    .line 208
    .line 209
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Picture;->removeLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 214
    .line 215
    .line 216
    :cond_6
    return-object p1
.end method

.method public final synthetic C0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/User;)Lrx/c;
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
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

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
    new-instance v0, Ll/acf;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/acf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;)V

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

.method public final synthetic D0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->D:Ll/okf;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-interface {v0, p0, p1, p2}, Ll/okf;->a(ILjava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic E0(Landroid/view/View;)V
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

.method public final synthetic F0(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 4

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
    const-string p3, "\u66f4\u6362\u5934\u50cf"

    .line 9
    .line 10
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s0()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Sj:I

    .line 27
    .line 28
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    const-string p3, "p_edit_profile_view"

    .line 37
    .line 38
    const-string v0, "p_upload_photos"

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    if-nez p1, :cond_8

    .line 42
    .line 43
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 44
    .line 45
    const-string v2, "\u91cd\u65b0\u88c1\u526a\u7167\u7247"

    .line 46
    .line 47
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :cond_1
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    sget v3, Lcom/p1/mobile/putong/core/R$string;->t:I

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->q1()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    sget v3, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_5

    .line 94
    .line 95
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 96
    .line 97
    const-string v2, "\u5220\u9664\u8be5\u7167\u7247"

    .line 98
    .line 99
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-nez p1, :cond_5

    .line 104
    .line 105
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 106
    .line 107
    const-string v2, "\u5220\u9664\u8be5\u89c6\u9891"

    .line 108
    .line 109
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_3
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 117
    .line 118
    const-string p2, "\u7f16\u8f91\u6807\u7b7e"

    .line 119
    .line 120
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_4

    .line 125
    .line 126
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->o0()V

    .line 127
    .line 128
    .line 129
    :cond_4
    return-void

    .line 130
    :cond_5
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->getCurPageId()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    const/4 p2, 0x1

    .line 139
    if-nez p1, :cond_6

    .line 140
    .line 141
    const-string p1, "add_delete_picture"

    .line 142
    .line 143
    const-string v0, "delete_picture"

    .line 144
    .line 145
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr v0, p2

    .line 154
    const-string v2, "picture_number"

    .line 155
    .line 156
    invoke-static {v2, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    filled-new-array {p1, v0}, [Ll/sfj0$a;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    const-string v0, "e_profile_add_delete_photos"

    .line 165
    .line 166
    invoke-static {v0, p3, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 167
    .line 168
    .line 169
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M:Ljava/util/List;

    .line 170
    .line 171
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 172
    .line 173
    invoke-interface {p1, p3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    const/4 p1, 0x0

    .line 177
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 178
    .line 179
    const-string p3, "delete"

    .line 180
    .line 181
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->m1(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p1()V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->l()V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setIllegalPicture(Z)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->e1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->h1()V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 200
    .line 201
    iget-object p0, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 202
    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 204
    .line 205
    if-eqz p0, :cond_7

    .line 206
    .line 207
    invoke-interface {p0}, Ll/t4m;->b()V

    .line 208
    .line 209
    .line 210
    :cond_7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 211
    .line 212
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 213
    .line 214
    iget-object p0, p0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 215
    .line 216
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 217
    .line 218
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_8
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->getCurPageId()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    if-nez p1, :cond_9

    .line 231
    .line 232
    const-string p1, "e_picture_re_edit_button"

    .line 233
    .line 234
    new-array p2, v1, [Ll/sfj0$a;

    .line 235
    .line 236
    invoke-static {p1, p3, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 237
    .line 238
    .line 239
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 240
    .line 241
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-nez p1, :cond_c

    .line 246
    .line 247
    new-instance p1, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    const-string p2, "MediaReorderCard error: "

    .line 250
    .line 251
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L:Ljava/util/List;

    .line 255
    .line 256
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 257
    .line 258
    .line 259
    move-result p2

    .line 260
    if-ge v1, p2, :cond_b

    .line 261
    .line 262
    if-lez v1, :cond_a

    .line 263
    .line 264
    const-string p2, ", "

    .line 265
    .line 266
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    :cond_a
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L:Ljava/util/List;

    .line 270
    .line 271
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object p2

    .line 275
    check-cast p2, Ljava/lang/String;

    .line 276
    .line 277
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    add-int/lit8 v1, v1, 0x1

    .line 281
    .line 282
    goto :goto_2

    .line 283
    :cond_b
    new-instance p0, Ljava/lang/NullPointerException;

    .line 284
    .line 285
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M:Ljava/util/List;

    .line 297
    .line 298
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 299
    .line 300
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 304
    .line 305
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u0(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 311
    .line 312
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 313
    .line 314
    iget-object p0, p0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 315
    .line 316
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 317
    .line 318
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->getMediaOperation()Ll/xyl;

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

.method public final synthetic H0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/core/R$string;->u4:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic I0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t:Landroid/view/View;

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

.method public final synthetic J0(Lcom/p1/mobile/putong/data/Picture;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->b1(Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic K0([I)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    if-eqz p1, :cond_0

    .line 34
    .line 35
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s:Lv/VDraweeView;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-virtual {p1, v0, p0, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final synthetic L0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->o0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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

.method public final synthetic N0()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->O:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

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

.method public final synthetic O0(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->S:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->S:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic P0(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->S:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->S:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Q0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s0()V

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

.method public final synthetic R0(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->T:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->T:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic S0(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->T:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->T:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic T0(Ll/uxj0;)Lrx/c;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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

.method public final synthetic U0(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->N:Z

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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->q0(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;

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

.method public final synthetic V0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->v0(Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->W:Ljava/lang/Runnable;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->W:Ljava/lang/Runnable;

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

.method public final synthetic W0(Ll/uxj0;)V
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

.method public final synthetic X0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->w0(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z0()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 27
    .line 28
    if-lez v1, :cond_0

    .line 29
    .line 30
    const-string v1, "\u7f16\u8f91\u6807\u7b7e"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 46
    .line 47
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 54
    .line 55
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 56
    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    const-string v1, "\u91cd\u65b0\u88c1\u526a\u7167\u7247"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 65
    .line 66
    if-nez v1, :cond_2

    .line 67
    .line 68
    const-string v1, "\u66f4\u6362\u5934\u50cf"

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 74
    .line 75
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    if-eqz v1, :cond_3

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->L:Ljava/util/List;

    .line 85
    .line 86
    const-string v3, "show action dialog"

    .line 87
    .line 88
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 92
    .line 93
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_4

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 102
    .line 103
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_4

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J:Ll/kcg0;

    .line 110
    .line 111
    if-nez v1, :cond_4

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    sget v3, Lcom/p1/mobile/putong/core/R$string;->t:I

    .line 118
    .line 119
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->i()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    const/4 v3, 0x1

    .line 131
    if-le v1, v3, :cond_6

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 134
    .line 135
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_6

    .line 140
    .line 141
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 142
    .line 143
    if-lez v1, :cond_6

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 146
    .line 147
    instance-of v3, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 148
    .line 149
    if-eqz v3, :cond_5

    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    const-string v3, "\u5220\u9664\u8be5\u7167\u7247"

    .line 156
    .line 157
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    goto :goto_0

    .line 161
    :cond_5
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 162
    .line 163
    if-eqz v1, :cond_6

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    const-string v3, "\u5220\u9664\u8be5\u89c6\u9891"

    .line 170
    .line 171
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_6
    const/4 v1, -0x1

    .line 176
    :goto_0
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->N:Z

    .line 177
    .line 178
    if-eqz v3, :cond_8

    .line 179
    .line 180
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 181
    .line 182
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    if-eqz v3, :cond_8

    .line 187
    .line 188
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 189
    .line 190
    instance-of v4, v3, Lcom/p1/mobile/putong/data/Picture;

    .line 191
    .line 192
    if-eqz v4, :cond_8

    .line 193
    .line 194
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 195
    .line 196
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->isLow()Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    if-eqz v3, :cond_8

    .line 201
    .line 202
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    if-nez v3, :cond_7

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    sget v3, Lcom/p1/mobile/putong/core/R$string;->t:I

    .line 217
    .line 218
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    sget v4, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 234
    .line 235
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    :cond_8
    :goto_1
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->o:Z

    .line 243
    .line 244
    if-nez v3, :cond_9

    .line 245
    .line 246
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 247
    .line 248
    .line 249
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 250
    .line 251
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 252
    .line 253
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-nez v2, :cond_9

    .line 258
    .line 259
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    sget v3, Lcom/p1/mobile/putong/core/R$string;->t:I

    .line 264
    .line 265
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    :cond_9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    if-nez v2, :cond_a

    .line 277
    .line 278
    return-void

    .line 279
    :cond_a
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t0(Ljava/util/ArrayList;I)V

    .line 280
    .line 281
    .line 282
    return-void
.end method

.method public a1(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 1

    .line 1
    new-instance v0, Ll/gcf;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/gcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b1(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 12
    .line 13
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k0:Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 32
    .line 33
    const-string p1, "onPickMedia"

    .line 34
    .line 35
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->m1(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->q1()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->f1()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->f()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->h1()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public d1(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->e1(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e1(Lcom/p1/mobile/putong/data/Media;ZZ)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 18
    .line 19
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    const-string v0, "render"

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->m1(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->f1()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->K:Ll/a30;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->K:Ll/a30;

    .line 40
    .line 41
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-interface {p0, p1, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public f1()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->k(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E:Landroid/widget/ImageView;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    instance-of v3, v3, Lcom/p1/mobile/putong/data/Video;

    .line 18
    .line 19
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    .line 35
    move-result-object v0

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s:Lv/VDraweeView;

    .line 57
    .line 58
    new-instance v3, Ll/kbf;

    .line 59
    .line 60
    invoke-direct {v3, p0}, Ll/kbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v3}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 68
    .line 69
    instance-of v3, v0, Lcom/p1/mobile/putong/data/Video;

    .line 70
    .line 71
    if-eqz v3, :cond_2

    .line 72
    .line 73
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s:Lv/VDraweeView;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v3, v4, v0}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 84
    .line 85
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s:Lv/VDraweeView;

    .line 86
    .line 87
    invoke-virtual {v0, v3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 88
    .line 89
    .line 90
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J:Ll/kcg0;

    .line 99
    .line 100
    if-nez v0, :cond_3

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 105
    .line 106
    const-string v3, "normal"

    .line 107
    .line 108
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_3

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 115
    .line 116
    sget v1, Ll/dbc0;->b7:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 124
    .line 125
    .line 126
    move v1, v2

    .line 127
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 128
    .line 129
    const/4 v3, 0x0

    .line 130
    if-nez v0, :cond_4

    .line 131
    .line 132
    const/4 v0, 0x0

    .line 133
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t:Landroid/view/View;

    .line 137
    .line 138
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 139
    .line 140
    .line 141
    :cond_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ak()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    const/high16 v4, 0x3f800000    # 1.0f

    .line 154
    .line 155
    if-nez v0, :cond_5

    .line 156
    .line 157
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fl()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_7

    .line 170
    .line 171
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 172
    .line 173
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_7

    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 180
    .line 181
    instance-of v5, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 182
    .line 183
    if-eqz v5, :cond_7

    .line 184
    .line 185
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 186
    .line 187
    const-string v5, "WITH_REPEAT_MAIN_PICTURE"

    .line 188
    .line 189
    invoke-static {v5}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-nez v0, :cond_6

    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 200
    .line 201
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 202
    .line 203
    const-string v5, "WITH_NET_MAIN_PICTURE"

    .line 204
    .line 205
    invoke-static {v5}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-eqz v0, :cond_7

    .line 214
    .line 215
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 216
    .line 217
    sget v1, Ll/dbc0;->b7:I

    .line 218
    .line 219
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 223
    .line 224
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t:Landroid/view/View;

    .line 228
    .line 229
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 238
    .line 239
    .line 240
    goto :goto_2

    .line 241
    :cond_7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->N:Z

    .line 242
    .line 243
    if-eqz v0, :cond_8

    .line 244
    .line 245
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 246
    .line 247
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_8

    .line 252
    .line 253
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 254
    .line 255
    instance-of v5, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 256
    .line 257
    if-eqz v5, :cond_8

    .line 258
    .line 259
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 260
    .line 261
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->isLow()Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-eqz v0, :cond_8

    .line 266
    .line 267
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 268
    .line 269
    sget v1, Ll/dbc0;->b7:I

    .line 270
    .line 271
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 275
    .line 276
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t:Landroid/view/View;

    .line 280
    .line 281
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 290
    .line 291
    .line 292
    goto :goto_2

    .line 293
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t:Landroid/view/View;

    .line 294
    .line 295
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 304
    .line 305
    .line 306
    move v2, v1

    .line 307
    :goto_2
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n1(Z)V

    .line 308
    .line 309
    .line 310
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->g1()V

    .line 311
    .line 312
    .line 313
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M:Ljava/util/List;

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

.method public h1()V
    .locals 6

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
    if-eqz v0, :cond_a

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    if-eq v0, v1, :cond_a

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 21
    .line 22
    sget v1, Ll/dbc0;->U6:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 43
    .line 44
    sget v2, Ll/bnl0;->e:I

    .line 45
    .line 46
    invoke-virtual {v1, v0, v2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 50
    .line 51
    const/16 v1, 0x11

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 54
    .line 55
    .line 56
    :cond_0
    invoke-static {}, Ll/xra;->k()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v1, 0x3

    .line 61
    if-eqz v0, :cond_5

    .line 62
    .line 63
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 64
    .line 65
    if-lez v0, :cond_2

    .line 66
    .line 67
    if-ge v0, v1, :cond_2

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F0:Landroid/animation/ObjectAnimator;

    .line 70
    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_2

    .line 78
    .line 79
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    sget v3, Ll/c9c0;->A:I

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    sget v3, Ll/c9c0;->A:I

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    sget v3, Ll/c9c0;->A:I

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 126
    .line 127
    invoke-direct {v0, v2, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 128
    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 131
    .line 132
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 137
    .line 138
    .line 139
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 142
    .line 143
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    if-eqz v2, :cond_5

    .line 148
    .line 149
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 150
    .line 151
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 152
    .line 153
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v0, v2}, Landroid/graphics/PorterDuffColorFilter;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    if-nez v2, :cond_5

    .line 166
    .line 167
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 168
    .line 169
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 170
    .line 171
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 183
    .line 184
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 185
    .line 186
    invoke-virtual {v0, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 187
    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 191
    .line 192
    if-lez v0, :cond_3

    .line 193
    .line 194
    if-ge v0, v1, :cond_3

    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 198
    .line 199
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b:Lv/VText;

    .line 200
    .line 201
    const-string v2, "#cccccc"

    .line 202
    .line 203
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 211
    .line 212
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

    .line 213
    .line 214
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 222
    .line 223
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 224
    .line 225
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    if-eqz v0, :cond_4

    .line 230
    .line 231
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 232
    .line 233
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 234
    .line 235
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 240
    .line 241
    .line 242
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 243
    .line 244
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 249
    .line 250
    .line 251
    :cond_5
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G:I

    .line 252
    .line 253
    const/4 v2, 0x2

    .line 254
    const/4 v3, 0x0

    .line 255
    const/4 v4, 0x1

    .line 256
    if-eq v0, v2, :cond_6

    .line 257
    .line 258
    if-eq v0, v1, :cond_6

    .line 259
    .line 260
    move v2, v4

    .line 261
    goto :goto_1

    .line 262
    :cond_6
    move v2, v3

    .line 263
    :goto_1
    if-ne v0, v1, :cond_8

    .line 264
    .line 265
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 266
    .line 267
    if-ge v0, v1, :cond_7

    .line 268
    .line 269
    goto :goto_2

    .line 270
    :cond_7
    move v0, v3

    .line 271
    goto :goto_3

    .line 272
    :cond_8
    :goto_2
    move v0, v4

    .line 273
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 274
    .line 275
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 276
    .line 277
    invoke-virtual {v1, v5, v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c(IZZ)V

    .line 278
    .line 279
    .line 280
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 281
    .line 282
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 283
    .line 284
    if-nez p0, :cond_9

    .line 285
    .line 286
    move v3, v4

    .line 287
    :cond_9
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 288
    .line 289
    .line 290
    :cond_a
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->k(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l1(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->y:Lv/VFrame_Anim;

    .line 2
    .line 3
    new-instance v0, Ll/pbf;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/pbf;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/qbf;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/qbf;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, v0, v1}, Lv/VFrame_Anim;->F(Landroid/view/View;Ll/qcj;Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m0(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->B4:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 10
    .line 11
    sget v0, Ll/adc0;->N5:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VDraweeView;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s:Lv/VDraweeView;

    .line 20
    .line 21
    sget v0, Ll/adc0;->X7:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t:Landroid/view/View;

    .line 28
    .line 29
    sget v0, Ll/adc0;->Se:I

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lv/VText;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

    .line 38
    .line 39
    sget v0, Ll/adc0;->L5:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/widget/TextView;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->v:Landroid/widget/TextView;

    .line 48
    .line 49
    sget v0, Ll/adc0;->Jd:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/widget/LinearLayout;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->w:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    sget v0, Ll/adc0;->Hd:I

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Landroid/widget/TextView;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x:Landroid/widget/TextView;

    .line 68
    .line 69
    sget v0, Ll/adc0;->Ac:I

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Landroid/widget/ImageView;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->z:Landroid/widget/ImageView;

    .line 78
    .line 79
    sget v0, Ll/adc0;->Bc:I

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lv/VFrame_Anim;

    .line 86
    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->y:Lv/VFrame_Anim;

    .line 88
    .line 89
    sget v0, Ll/adc0;->Te:I

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lv/VProgressBar;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->A:Lv/VProgressBar;

    .line 98
    .line 99
    sget v0, Ll/adc0;->Ue:I

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lv/VProgressBar;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->B:Lv/VProgressBar;

    .line 108
    .line 109
    sget v0, Ll/adc0;->fd:I

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Landroid/widget/ImageView;

    .line 116
    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->C:Landroid/widget/ImageView;

    .line 118
    .line 119
    sget v0, Ll/adc0;->R8:I

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    check-cast p1, Landroid/widget/ImageView;

    .line 126
    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E:Landroid/widget/ImageView;

    .line 128
    .line 129
    sget p0, Ll/dbc0;->Q6:I

    .line 130
    .line 131
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public n0()Lcom/p1/mobile/android/app/Act;
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

.method public final n1(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G:I

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 18
    .line 19
    const-string v0, "normal"

    .line 20
    .line 21
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->z:Landroid/widget/ImageView;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    sget p1, Ll/dbc0;->R6:I

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->z:Landroid/widget/ImageView;

    .line 42
    .line 43
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    sget p1, Ll/dbc0;->O6:I

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->z:Landroid/widget/ImageView;

    .line 53
    .line 54
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->z:Landroid/widget/ImageView;

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public o1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/core/R$string;->a4:I

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->u:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->c1()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->m0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 8
    .line 9
    sget v1, Ll/dbc0;->In:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 22
    .line 23
    sget v2, Ll/qa00;->h:I

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ll/wlj;

    .line 40
    .line 41
    int-to-float v3, v2

    .line 42
    int-to-float v4, v2

    .line 43
    int-to-float v5, v2

    .line 44
    int-to-float v2, v2

    .line 45
    invoke-static {v3, v4, v5, v2}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->A:Lv/VProgressBar;

    .line 53
    .line 54
    invoke-static {v1}, Ll/bnl0;->p0(Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->B:Lv/VProgressBar;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->A:Lv/VProgressBar;

    .line 60
    .line 61
    sget v1, Ll/adc0;->Rb:I

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public p0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCardScaleIndependentFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->p0:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b:Lv/VText;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F0:Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    new-instance v3, Ll/ncf;

    .line 80
    .line 81
    invoke-direct {v3, p0, v0, v1}, Ll/ncf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F0:Landroid/animation/ObjectAnimator;

    .line 88
    .line 89
    const/4 v1, 0x2

    .line 90
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F0:Landroid/animation/ObjectAnimator;

    .line 94
    .line 95
    const/4 v1, 0x4

    .line 96
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F0:Landroid/animation/ObjectAnimator;

    .line 100
    .line 101
    const/4 v1, 0x0

    .line 102
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F0:Landroid/animation/ObjectAnimator;

    .line 106
    .line 107
    new-instance v1, Ll/ocf;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/ocf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F0:Landroid/animation/ObjectAnimator;

    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_0
    const/4 v0, 0x1

    .line 122
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->U:Z

    .line 123
    .line 124
    return-void
.end method

.method public q1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->a0(Lcom/p1/mobile/putong/data/Media;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "http"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/pcf;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/pcf;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->r0(Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/qcf;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/qcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/rcf;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/rcf;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :goto_0
    new-instance v1, Ll/scf;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/scf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 70
    .line 71
    filled-new-array {v1}, [Lcom/p1/mobile/putong/data/Media;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const/4 v2, 0x0

    .line 80
    const-string v3, "profile"

    .line 81
    .line 82
    invoke-static {v3, v1, v2}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->f0(Ljava/lang/String;Ljava/util/List;Ll/qcj;)Lrx/c$d;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->A:Lv/VProgressBar;

    .line 91
    .line 92
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->l1(Landroid/view/View;)V

    .line 93
    .line 94
    .line 95
    const/4 v1, 0x0

    .line 96
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setIllegalPicture(Z)V

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->t:Landroid/view/View;

    .line 100
    .line 101
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const/high16 v2, 0x3f800000    # 1.0f

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v1, Ll/tcf;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/tcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    new-instance v1, Ll/lbf;

    .line 140
    .line 141
    invoke-direct {v1, p0}, Ll/lbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 142
    .line 143
    .line 144
    new-instance v2, Ll/mbf;

    .line 145
    .line 146
    invoke-direct {v2, p0}, Ll/mbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->J:Ll/kcg0;

    .line 158
    .line 159
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->W:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->b1(Lcom/p1/mobile/putong/data/Media;)V

    .line 4
    .line 5
    .line 6
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->K:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public setEnableLowPhoto(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->N:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->H:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIllegalPicture(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->F:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->v:Landroid/widget/TextView;

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

.method public setStyle(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->G:I

    .line 2
    .line 3
    return-void
.end method

.method public setUploadDataCallback(Ll/okf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->D:Ll/okf;

    .line 2
    .line 3
    return-void
.end method

.method public t0(Ljava/util/ArrayList;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/CharSequence;",
            ">;I)V"
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c:I

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
    new-instance v2, Ll/sbf;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/sbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

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
    filled-new-array {p2}, [I

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    sget v1, Ll/c9c0;->L:I

    .line 42
    .line 43
    filled-new-array {v1}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p1, p2, v1}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance p2, Ll/tbf;

    .line 52
    .line 53
    invoke-direct {p2, p0}, Ll/tbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ll/w30$b;->F()Ll/w30;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 66
    .line 67
    .line 68
    return-void
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
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->V:J

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
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->V:J

    .line 20
    .line 21
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    :goto_0
    return-void

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    if-nez v0, :cond_5

    .line 31
    .line 32
    invoke-static {}, Ll/xra;->w()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_5

    .line 37
    .line 38
    invoke-static {}, Ll/xra;->k()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 57
    .line 58
    new-instance v3, Ll/vbf;

    .line 59
    .line 60
    invoke-direct {v3, p0}, Ll/vbf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Kc(Lcom/p1/mobile/android/app/Act;ILl/x20;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->N:Z

    .line 68
    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->Y0()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->i1()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s0()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->s0()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->Z0()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public u0(Ljava/lang/String;)V
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->n0()Lcom/p1/mobile/android/app/Act;

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
    new-instance v1, Ll/lcf;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/lcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v1, Ll/mcf;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/mcf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;)V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->getMediaOperation()Ll/xyl;

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

.method public x0(I)V
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
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->E0:I

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->h1()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public y0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->M:Ljava/util/List;

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

.method public final synthetic z0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->d1(Lcom/p1/mobile/putong/data/Media;)V

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
