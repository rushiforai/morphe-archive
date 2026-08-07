.class public Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# static fields
.field public static final w:Ljava/lang/String; = "FeedAudioPlayerView"


# instance fields
.field public d:Lv/VFrame;

.field public e:Landroid/widget/ProgressBar;

.field public f:Lv/VImage;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VImage;

.field public i:F

.field public j:F

.field public k:Ljava/lang/String;

.field public l:Ll/npg;

.field public m:Lcom/p1/mobile/putong/feed/data/Moment;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:Lcom/p1/mobile/android/rx/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/android/rx/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ll/kcg0;

.field public s:Z

.field public t:Z

.field public u:Z

.field public final v:Ll/ga1;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->t:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->u:Z

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->v:Ll/ga1;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->I0(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    const-string p2, ""

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    const/4 p2, 0x1

    .line 27
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->t:Z

    const/4 p2, 0x0

    .line 28
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->u:Z

    .line 29
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->v:Ll/ga1;

    .line 30
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->I0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    const-string p2, ""

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    const/4 p2, 0x1

    .line 33
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->t:Z

    const/4 p2, 0x0

    .line 34
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->u:Z

    .line 35
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->v:Ll/ga1;

    .line 36
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->I0(Landroid/content/Context;)V

    return-void
.end method

.method private I0(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->J0()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->L0()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->U0()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->V0()V

    .line 22
    .line 23
    .line 24
    const p1, 0x43938000    # 295.0f

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMaxWidth(I)V

    .line 32
    .line 33
    .line 34
    const/high16 p1, 0x435b0000    # 219.0f

    .line 35
    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMinWidth(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->a1()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private J0()V
    .locals 1

    .line 1
    new-instance v0, Ll/qpg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qpg;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private N0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->B0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->g:Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->k0:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->i:F

    .line 19
    .line 20
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v1, "%ss"

    .line 41
    .line 42
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic O0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->y0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_2

    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->t:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/lpg;->e0(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/lpg;->j0()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->w:Ljava/lang/String;

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->v:Ll/ga1;

    .line 41
    .line 42
    invoke-virtual {p1, v0, v1, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
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

.method private f1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->d1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getPlayListenerToAudioPlayer()Ll/npg;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->l:Ll/npg;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->l:Ll/npg;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->l:Ll/npg;

    .line 13
    .line 14
    return-object p0
.end method

.method private getPlayingSubscriber()Lcom/p1/mobile/android/rx/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/p1/mobile/android/rx/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->q:Lcom/p1/mobile/android/rx/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/rpg;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/rpg;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->q:Lcom/p1/mobile/android/rx/a;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->q:Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->O0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->Q0(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->D0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->P0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->i:F

    return p0
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->u:Z

    return p0
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic o0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->j:F

    return-void
.end method

.method public static bridge synthetic p0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic q0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->R0()V

    return-void
.end method

.method public static bridge synthetic r0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->S0()V

    return-void
.end method

.method public static bridge synthetic s0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->f1()V

    return-void
.end method

.method public static bridge synthetic t0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->g1()V

    return-void
.end method

.method public static bridge synthetic u0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->h1(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final B0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->h1(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->T0()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->g1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final D0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->z0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->T0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final E0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->r:Ll/kcg0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->r:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final G0(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    const-string v0, ""

    .line 12
    .line 13
    const-string v1, "resource"

    .line 14
    .line 15
    const-string v2, "moment_id"

    .line 16
    .line 17
    const-string v3, "owner_id"

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->s:Z

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->n:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->o:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v3, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    filled-new-array {v3, p0, v0}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v4, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v0, "e_moment_voice"

    .line 57
    .line 58
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->s:Z

    .line 63
    .line 64
    if-eqz p1, :cond_2

    .line 65
    .line 66
    new-instance p1, Ljava/text/DecimalFormat;

    .line 67
    .line 68
    const-string v4, "0.0"

    .line 69
    .line 70
    invoke-direct {p1, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->n:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->o:Ljava/lang/String;

    .line 76
    .line 77
    new-instance v6, Ll/pf60;

    .line 78
    .line 79
    iget v7, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->i:F

    .line 80
    .line 81
    float-to-double v7, v7

    .line 82
    invoke-virtual {p1, v7, v8}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    const-string v8, "voice_duration"

    .line 87
    .line 88
    invoke-direct {v6, v8, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    new-instance v7, Ll/pf60;

    .line 92
    .line 93
    iget v8, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->j:F

    .line 94
    .line 95
    float-to-double v8, v8

    .line 96
    invoke-virtual {p1, v8, v9}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    const-string v8, "voice_play_duration"

    .line 101
    .line 102
    invoke-direct {v7, v8, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 114
    .line 115
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    filled-new-array {v6, v7, p1, v2, v0}, [Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {v5, p1}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    const-string v0, "e_moment_voice_over"

    .line 134
    .line 135
    invoke-static {v0, v4, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 136
    .line 137
    .line 138
    const/4 p1, 0x0

    .line 139
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->s:Z

    .line 140
    .line 141
    :cond_2
    :goto_0
    return-void
.end method

.method public final H0(Lcom/p1/mobile/putong/feed/data/Moment;)V
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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Audio;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/data/Audio;

    .line 29
    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 31
    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->i:F

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final K0(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->n:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p1, "p_user_moment_interactions_details_view"

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->n:Ljava/lang/String;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final L0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/lpg;->x()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->getPlayingSubscriber()Lcom/p1/mobile/android/rx/a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->r:Ll/kcg0;

    .line 18
    .line 19
    return-void
.end method

.method public final synthetic P0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->E0()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->w:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic Q0(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final R0()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->u:Z

    .line 3
    .line 4
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->w:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->h1(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->g1()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->G0(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final S0()V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/lpg;->e0(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/lpg;->j0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->u:Z

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->G0(Z)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ll/lpg;->d0(Landroid/app/Activity;)Ll/lpg;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/lpg;->c0(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/lpg;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->getPlayListenerToAudioPlayer()Ll/npg;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v0, v1, v2}, Ll/lpg;->Z(Ljava/lang/String;Ll/npg;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->o:Ljava/lang/String;

    .line 56
    .line 57
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->C:Ljava/lang/String;

    .line 58
    .line 59
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->p:Z

    .line 60
    .line 61
    sput-boolean v0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->D:Z

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->n:Ljava/lang/String;

    .line 64
    .line 65
    sput-object p0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->B:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    return-void

    .line 68
    :catch_0
    move-exception p0

    .line 69
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final T0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->f1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->w0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final U0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/spg;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/spg;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final V0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    iget-object v1, v1, Ll/jka;->l0:Lrx/subjects/b;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ppg;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ppg;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public X0(FLjava/lang/String;)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->i:F

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->N0()V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public Y0(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->Z0(Lcom/p1/mobile/putong/feed/data/Moment;Z)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public Z0(Lcom/p1/mobile/putong/feed/data/Moment;Z)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->H0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->t:Z

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->N0()V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public a1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->f:Lv/VImage;

    .line 2
    .line 3
    sget v0, Ll/lbc0;->C:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->f:Lv/VImage;

    .line 2
    .line 3
    sget v0, Ll/lbc0;->b1:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e1(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->o:Ljava/lang/String;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->p:Z

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->K0(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final g1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->a1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/lpg;->g0(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/upg;->b(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final w0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->getPlayListenerToAudioPlayer()Ll/npg;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/lpg;->m(Ll/npg;)Ll/lpg;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final y0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "http"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final z0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->k:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
