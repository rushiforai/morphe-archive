.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;,
        Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/ImageView;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/TextView;

.field public k:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;

.field public l:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

.field public m:Landroid/animation/ObjectAnimator;

.field public n:Ll/jic0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;"
        }
    .end annotation
.end field

.field public o:Lcom/p1/mobile/putong/data/Music;

.field public p:I

.field public q:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->z(Lcom/p1/mobile/putong/data/Music;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->B(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private getDurationString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/AudioMedia;->duration:D

    .line 6
    .line 7
    double-to-int p0, v0

    .line 8
    div-int/lit8 v0, p0, 0x3c

    .line 9
    .line 10
    rem-int/lit8 p0, p0, 0x3c

    .line 11
    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "%02d:%02d"

    .line 25
    .line 26
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->A(Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->v(Ll/y20;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->w(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->x(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->y(Lcom/p1/mobile/putong/data/Music;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->C(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->k:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic B(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->k:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->p:I

    .line 4
    .line 5
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;->a(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic C(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    new-instance v0, Ljava/io/File;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-string p0, ""

    .line 22
    .line 23
    iput-object p0, v1, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->M(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final D(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/hy10;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/hy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final E(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->v0:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->n0:I

    .line 7
    .line 8
    :goto_0
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final F(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/api/a;->Z1(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/qy10;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/qy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/ry10;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/ry10;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/api/a;->R1(Lcom/p1/mobile/putong/data/Music;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/ey10;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/ey10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ll/fy10;

    .line 45
    .line 46
    invoke-direct {p0}, Ll/fy10;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final G(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->u()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->p:I

    .line 10
    .line 11
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->H(Lcom/p1/mobile/putong/data/Music;I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->p:I

    .line 16
    .line 17
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->I(Lcom/p1/mobile/putong/data/Music;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/data/Music;I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->Q(Lcom/p1/mobile/putong/data/Music;I)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ll/gy10;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, p2}, Ll/gy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->D(Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final I(Lcom/p1/mobile/putong/data/Music;I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->Q(Lcom/p1/mobile/putong/data/Music;I)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->q()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/api/a;->b2(Lcom/p1/mobile/putong/data/Music;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/my10;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Ll/my10;-><init>(Lcom/p1/mobile/putong/data/Music;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/ny10;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1, p2}, Ll/ny10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;I)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->l:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v1, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    if-eq v1, v2, :cond_1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    invoke-interface {v0, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;->b(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-nez p2, :cond_2

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_2
    const/4 p2, 0x3

    .line 20
    iput p2, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->R()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final K(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->l:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->l:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;->a(Lcom/p1/mobile/putong/data/Music;I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->q()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 26
    .line 27
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->l2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Music;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/data/Music;I)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->p:I

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->d:Landroid/widget/TextView;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "default"

    .line 17
    .line 18
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->e:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->d:Landroid/widget/TextView;

    .line 28
    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    const/high16 p2, 0x42700000    # 60.0f

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/high16 p2, 0x43480000    # 200.0f

    .line 35
    .line 36
    :goto_0
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->f:Landroid/widget/TextView;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->g:Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->getDurationString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->O()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->S()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->P()V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->h:Landroid/widget/ImageView;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->u()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    xor-int/lit8 p2, p2, 0x1

    .line 75
    .line 76
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->i:Landroid/widget/ImageView;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->u()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    xor-int/lit8 p0, p0, 0x1

    .line 86
    .line 87
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->b:Lv/VDraweeView;

    .line 4
    .line 5
    new-instance v1, Ljava/io/File;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final N(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->H0:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->u()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->k:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AudioMedia;->url:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Ll/oc4;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 36
    .line 37
    invoke-static {p1, v0}, Ll/cy10;->a(Ljava/lang/String;Lcom/p1/mobile/putong/data/Music;)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x3

    .line 42
    iput v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->k:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;

    .line 45
    .line 46
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->p:I

    .line 47
    .line 48
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;->a(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->q()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 59
    .line 60
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/api/a;->b2(Lcom/p1/mobile/putong/data/Music;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/oy10;

    .line 69
    .line 70
    invoke-direct {v1, p0, p1}, Ll/oy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Ll/py10;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Ll/py10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final O()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->b:Lv/VDraweeView;

    .line 14
    .line 15
    sget v1, Ll/lbc0;->b:I

    .line 16
    .line 17
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->u()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "/"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->M(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->b:Lv/VDraweeView;

    .line 60
    .line 61
    sget v2, Ll/lbc0;->b:I

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->n:Ll/jic0;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->q()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v2}, Ll/lwv;->d(Ljava/lang/String;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v0, v1, v2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/iy10;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/iy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->b:Lv/VDraweeView;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0, v1, p0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final P()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget p0, Ll/lbc0;->x6:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p0, Ll/lbc0;->y6:I

    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/data/Music;I)V
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
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->l:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->l:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 21
    .line 22
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;->a(Lcom/p1/mobile/putong/data/Music;I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->n:Ll/jic0;

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final R()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->q:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->q:Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    instance-of v3, v3, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    .line 21
    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->S()V

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-void
.end method

.method public final S()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    sget v0, Ll/lbc0;->B6:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->m:Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->c:Landroid/widget/ImageView;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->setRotation(F)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 24
    .line 25
    iget v1, v1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    if-eq v1, v2, :cond_1

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    if-eq v1, v2, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sget v0, Ll/lbc0;->A6:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget v0, Ll/lbc0;->z6:I

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->m:Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->c:Landroid/widget/ImageView;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public isSelected()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sy10;->a(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q()Lcom/p1/mobile/android/app/Act;
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

.method public r()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->t()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->s()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    new-instance v0, Ll/dy10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->i:Landroid/widget/ImageView;

    .line 10
    .line 11
    new-instance v1, Ll/jy10;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/jy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->j:Landroid/widget/TextView;

    .line 20
    .line 21
    new-instance v1, Ll/ky10;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/ky10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->h:Landroid/widget/ImageView;

    .line 30
    .line 31
    new-instance v1, Ll/ly10;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/ly10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final t()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->c:Landroid/widget/ImageView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->m:Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    const-wide/16 v1, 0x4b0

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->m:Landroid/animation/ObjectAnimator;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->m:Landroid/animation/ObjectAnimator;

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

.method public final u()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Music;->type:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "local"

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic v(Ll/y20;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->o:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AudioMedia;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/cy10;->a(Ljava/lang/String;Lcom/p1/mobile/putong/data/Music;)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic w(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->E(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic x(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->E(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/data/Music;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->J(Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/data/Music;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->J(Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
