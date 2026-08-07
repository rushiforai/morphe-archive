.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/msr;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

.field public c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntrySignIn;

.field public d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Z

.field public h:Ll/kcg0;

.field public i:I

.field public j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

.field public k:Ll/msr;

.field public l:Ljava/lang/String;

.field public m:Ll/x20;

.field public n:Landroid/animation/AnimatorSet;

.field public o:Ll/psr;

.field public p:Ll/vsr;

.field public q:Ll/vrr;

.field public r:Ll/prr;

.field public s:Ll/fur;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->i:I

    .line 6
    .line 7
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x2

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->i:I

    .line 17
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x2

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->i:I

    .line 20
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n:Landroid/animation/AnimatorSet;

    return-void
.end method

.method private C()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->m:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->m:Ll/x20;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->s()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->C()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Ll/grr;Ll/grr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->u(Ll/grr;Ll/grr;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->v(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZLjava/lang/Long;)V

    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->k:Lv/VFrame;

    .line 4
    .line 5
    new-instance v1, Ll/wsr;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/wsr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/xsr;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/xsr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->getEntryInfo()Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->getEntryInfo()Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Ll/msr;->k3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/msr;->j3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic s()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->s:Ll/fur;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->g:Z

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Ll/fur;->d(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final A(ILcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 13
    .line 14
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;->Q(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->scheme:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->scheme:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->l:Ljava/lang/String;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntrySignIn;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 33
    .line 34
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntrySignIn;->s(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->scheme:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->scheme:Ljava/lang/String;

    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->l:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->m(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 6
    .line 7
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->w(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->i:I

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->g:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-wide/16 v3, 0x4

    .line 22
    .line 23
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    .line 25
    invoke-static {v3, v4, v0}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-virtual {v0, v3}, Lrx/c;->take(I)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v0, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v3, Ll/ysr;

    .line 43
    .line 44
    invoke-direct {v3, p0, p1, v2, v1}, Ll/ysr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZ)V

    .line 45
    .line 46
    .line 47
    invoke-static {v3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->h:Ll/kcg0;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {p0, p1, v2, v1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->y(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZ)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->i:I

    .line 68
    .line 69
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->s:Ll/fur;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/fur;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->s:Ll/fur;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/fur;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/msr;->h3()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0, v0}, Ll/sft;->f(Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getEntryInfo()Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getState()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ctr;->a(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/msr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->l(Ll/msr;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final j(IZ)V
    .locals 5

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->s:Ll/fur;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/fur;->a()V

    .line 4
    .line 5
    .line 6
    sget p2, Ll/bnl0;->f:I

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->a:Lv/VFrame;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    new-array v2, v1, [Landroid/view/View;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    aput-object v0, v2, v3

    .line 15
    .line 16
    invoke-static {p2, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntrySignIn;

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    if-ne p1, v0, :cond_0

    .line 23
    .line 24
    move v2, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v2, v3

    .line 27
    :goto_0
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveEntranceStartLiveView;

    .line 31
    .line 32
    const/4 v2, 0x4

    .line 33
    if-ne p1, v2, :cond_1

    .line 34
    .line 35
    move v4, v1

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move v4, v3

    .line 38
    :goto_1
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 42
    .line 43
    if-eq p1, v0, :cond_2

    .line 44
    .line 45
    if-eq p1, v2, :cond_2

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v3

    .line 49
    :goto_2
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public l(Ll/msr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 2
    .line 3
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->g:Z

    .line 6
    .line 7
    const/4 v1, 0x5

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-ne p0, v1, :cond_1

    .line 15
    .line 16
    :cond_0
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/j6t;->g()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getLiveActivitySummary()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->forceState(I)Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public final n(I)Ll/grr;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x5

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->r:Ll/prr;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->q:Ll/vrr;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->o:Ll/psr;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->p:Ll/vsr;

    .line 24
    .line 25
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/psr;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/psr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->o:Ll/psr;

    .line 15
    .line 16
    new-instance v0, Ll/vsr;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ll/vsr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->p:Ll/vsr;

    .line 24
    .line 25
    new-instance v0, Ll/vrr;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ll/vrr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->q:Ll/vrr;

    .line 33
    .line 34
    new-instance v0, Ll/prr;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ll/prr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->r:Ll/prr;

    .line 42
    .line 43
    new-instance v0, Ll/fur;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->e:Lv/VText;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->f:Lv/VImage;

    .line 48
    .line 49
    invoke-direct {v0, v1, v2}, Ll/fur;-><init>(Lv/VText;Lv/VImage;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->s:Ll/fur;

    .line 53
    .line 54
    invoke-static {}, Ll/mbs;->h()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    sget v0, Ll/qa00;->i:I

    .line 61
    .line 62
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic u(Ll/grr;Ll/grr;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->b(Ll/grr;Ll/grr;)Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p2, v0, p1}, Ll/grr;->j(Landroid/animation/ValueAnimator;Ll/grr;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1, v0, p2}, Ll/grr;->h(Landroid/animation/ValueAnimator;Ll/grr;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    const/4 p2, 0x1

    .line 18
    new-array p2, p2, [Landroid/animation/Animator;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    aput-object v0, p2, v1

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n:Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    new-instance p2, Ll/btr;

    .line 29
    .line 30
    invoke-direct {p2, p0}, Ll/btr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n:Landroid/animation/AnimatorSet;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->y(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x3

    .line 9
    if-eq v1, v2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v1, 0x4

    .line 16
    if-eq p1, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eq p1, v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-ne p1, v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->i:I

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eq p0, p1, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    :goto_0
    return v0
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->g:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->E()V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->h:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;IZ)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0, p3}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j(IZ)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    if-eq v0, v1, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x4

    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getLiveActivitySummary()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, v0, p2, p1, p3}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->z(IILcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getLiveEntranceSummary()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->A(ILcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final z(IILcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Z)V
    .locals 5

    .line 1
    new-instance v0, Ll/zsr;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zsr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->m:Ll/x20;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getState()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n(I)Ll/grr;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 19
    .line 20
    invoke-virtual {v1, p2, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->b(II)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->i:Lv/VMarqueeText;

    .line 26
    .line 27
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->title:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->j:Lv/VText;

    .line 37
    .line 38
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->desc:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 48
    .line 49
    invoke-interface {v0, v1, p3}, Ll/grr;->b(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V

    .line 50
    .line 51
    .line 52
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->k:Ll/msr;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 55
    .line 56
    invoke-virtual {p3, v0}, Ll/msr;->G3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n:Landroid/animation/AnimatorSet;

    .line 60
    .line 61
    if-eqz p3, :cond_1

    .line 62
    .line 63
    invoke-virtual {p3}, Landroid/animation/AnimatorSet;->cancel()V

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n(I)Ll/grr;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n(I)Ll/grr;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance p3, Landroid/animation/AnimatorSet;

    .line 75
    .line 76
    invoke-direct {p3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->n:Landroid/animation/AnimatorSet;

    .line 80
    .line 81
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 82
    .line 83
    const v1, 0x3c23d70a    # 0.01f

    .line 84
    .line 85
    .line 86
    const/high16 v2, 0x3f800000    # 1.0f

    .line 87
    .line 88
    const v3, 0x3ed70a3d    # 0.42f

    .line 89
    .line 90
    .line 91
    const/4 v4, 0x0

    .line 92
    invoke-direct {v0, v3, v4, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p3, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 96
    .line 97
    .line 98
    if-eqz p4, :cond_3

    .line 99
    .line 100
    if-eqz p2, :cond_3

    .line 101
    .line 102
    if-nez p1, :cond_2

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    new-instance p3, Ll/atr;

    .line 106
    .line 107
    invoke-direct {p3, p0, p2, p1}, Ll/atr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Ll/grr;Ll/grr;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_3
    :goto_0
    if-eqz p1, :cond_4

    .line 115
    .line 116
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 117
    .line 118
    iget-object p2, p2, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;

    .line 119
    .line 120
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->e(Ll/grr;)V

    .line 121
    .line 122
    .line 123
    invoke-interface {p1}, Ll/grr;->c()V

    .line 124
    .line 125
    .line 126
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;->C()V

    .line 127
    .line 128
    .line 129
    return-void
.end method
