.class public Ll/ye0;
.super Ll/ij2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ij2<",
        "Ll/ze0;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ll/g1e;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ff0;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ff0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/kcg0;

.field public k:Ll/kcg0;

.field public l:Ll/kcg0;

.field public m:Ll/kcg0;

.field public n:Ll/kcg0;

.field public o:Z

.field public p:Ll/l4g0;

.field public q:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/s1e;)V
    .locals 1

    .line 1
    invoke-direct {p0, p2}, Ll/ij2;-><init>(Ll/s1e;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ye0;->g:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/ye0;->i:Ljava/util/List;

    .line 24
    .line 25
    iput-object p1, p0, Ll/ye0;->c:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    check-cast p2, Ll/g1e;

    .line 28
    .line 29
    iput-object p2, p0, Ll/ye0;->d:Ll/g1e;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ll/ff0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->good:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p1, Ll/ff0;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p1, Ll/ff0;->a:I

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->bad:Ljava/util/List;

    .line 15
    .line 16
    iget-object v0, p1, Ll/ff0;->c:Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x2

    .line 25
    iput p0, p1, Ll/ff0;->a:I

    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public static synthetic B(Ll/ye0;Lcom/p1/mobile/putong/core/data/AiAlbumRenderEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye0;->T(Lcom/p1/mobile/putong/core/data/AiAlbumRenderEnvelope;)V

    return-void
.end method

.method public static synthetic D(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic E(Ljava/lang/String;)Ll/ff0;
    .locals 2

    .line 1
    new-instance v0, Ll/ff0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ll/ff0;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/ff0;->b(Ljava/lang/String;)Ll/ff0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic F(Ll/ye0;Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye0;->M(Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ll/ff0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->good:Ljava/util/List;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ff0;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

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

.method public static synthetic H(Ll/ff0;Ll/ff0;)I
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget p1, p1, Ll/ff0;->a:I

    .line 7
    .line 8
    iget p0, p0, Ll/ff0;->a:I

    .line 9
    .line 10
    sub-int/2addr p1, p0

    .line 11
    return p1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static synthetic I(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/Media;)Ll/ff0;
    .locals 2

    .line 1
    new-instance v0, Ll/ff0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/ff0;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/ff0;->a(Ljava/lang/String;)Ll/ff0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ljava/lang/String;)Ll/ff0;
    .locals 2

    .line 1
    new-instance v0, Ll/ff0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ll/ff0;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/ff0;->b(Ljava/lang/String;)Ll/ff0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ljava/lang/String;)Ll/ff0;
    .locals 1

    .line 1
    new-instance v0, Ll/ff0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->good:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-direct {v0, p0}, Ll/ff0;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/ff0;->b(Ljava/lang/String;)Ll/ff0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic g(Ll/ye0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye0;->S(Ljava/util/List;)V

    return-void
.end method

.method private g0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ye0;->d:Ll/g1e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ye0;->d:Ll/g1e;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/g1e;->show()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ye0;->j0()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Ljava/lang/String;)Ll/ff0;
    .locals 2

    .line 1
    new-instance v0, Ll/ff0;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Ll/ff0;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/ff0;->b(Ljava/lang/String;)Ll/ff0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic m(Ll/ff0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ll/ff0;->a:I

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ll/ye0;Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye0;->P(Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;)V

    return-void
.end method

.method public static synthetic o(Ll/ye0;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ye0;->V(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic r(Ll/ye0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye0;->R(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ll/ff0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->good:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p1, Ll/ff0;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

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
    iput p0, p1, Ll/ff0;->a:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    iput p0, p1, Ll/ff0;->a:I

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic u(Ll/ye0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye0;->O(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic v(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w(Ll/ye0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye0;->U(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic x(Ll/ye0;Lcom/p1/mobile/putong/core/data/AiAlbumCheckEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye0;->N(Lcom/p1/mobile/putong/core/data/AiAlbumCheckEnvelope;)V

    return-void
.end method

.method public static synthetic y(Ll/ye0;Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ye0;->Q(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/data/Media;)Ll/ff0;
    .locals 2

    .line 1
    new-instance v0, Ll/ff0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/ff0;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/ff0;->a(Ljava/lang/String;)Ll/ff0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public J()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ye0;->d:Ll/g1e;

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
    iget-object p0, p0, Ll/ye0;->d:Ll/g1e;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final K()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ye0;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Y1:Ll/qx6;

    .line 9
    .line 10
    sget v1, Ll/uqb0;->f0:I

    .line 11
    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v1, v2}, Ll/qx6;->m3(ILjava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/ve0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/ve0;-><init>(Ll/ye0;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/we0;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/we0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/ye0;->k:Ll/kcg0;

    .line 53
    .line 54
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;",
            ")",
            "Ljava/util/List<",
            "Ll/ff0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->action:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, -0x1

    .line 16
    sparse-switch v1, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :sswitch_0
    const-string v1, "wait"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v2, 0x2

    .line 30
    goto :goto_0

    .line 31
    :sswitch_1
    const-string v1, "add"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 v2, 0x1

    .line 41
    goto :goto_0

    .line 42
    :sswitch_2
    const-string v1, "upload"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const/4 v2, 0x0

    .line 52
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :pswitch_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->origin:Ljava/util/List;

    .line 57
    .line 58
    new-instance v1, Ll/ae0;

    .line 59
    .line 60
    invoke-direct {v1, p1}, Ll/ae0;-><init>(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance v0, Ll/be0;

    .line 68
    .line 69
    invoke-direct {v0}, Ll/be0;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :pswitch_1
    iget-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 82
    .line 83
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->good:Ljava/util/List;

    .line 84
    .line 85
    new-instance v2, Ll/de0;

    .line 86
    .line 87
    invoke-direct {v2}, Ll/de0;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->bad:Ljava/util/List;

    .line 100
    .line 101
    new-instance v1, Ll/ee0;

    .line 102
    .line 103
    invoke-direct {v1}, Ll/ee0;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :pswitch_2
    iget-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 115
    .line 116
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->good:Ljava/util/List;

    .line 117
    .line 118
    new-instance v1, Ll/ce0;

    .line 119
    .line 120
    invoke-direct {v1}, Ll/ce0;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 128
    .line 129
    .line 130
    :goto_1
    iget-object p0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 131
    .line 132
    return-object p0

    .line 133
    :sswitch_data_0
    .sparse-switch
        -0x31fbf1ff -> :sswitch_2
        0x178a1 -> :sswitch_1
        0x379175 -> :sswitch_0
    .end sparse-switch

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ye0;->g0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/ze0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/ze0;->f:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->X(Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ye0;->k0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/core/data/AiAlbumCheckEnvelope;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ye0;->n0(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/ze0;

    .line 9
    .line 10
    iget-object v0, v0, Ll/ze0;->g:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 13
    .line 14
    iget-object v1, p0, Ll/ye0;->h:Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->S(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Ll/ef0;->INSTANCE:Ll/ef0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/ef0;->f()Ll/jxd0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Ll/ye0;->o:Z

    .line 32
    .line 33
    return-void
.end method

.method public final synthetic O(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/ye0;->o:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->albumId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v1, p0, Ll/ye0;->f:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Ll/ye0;->e:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 22
    .line 23
    iget v1, v0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->availableTimes:I

    .line 24
    .line 25
    iput v1, p0, Ll/ye0;->q:I

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const-string v2, "checking"

    .line 37
    .line 38
    const-string v3, "init"

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    const/4 v5, -0x1

    .line 42
    sparse-switch v1, :sswitch_data_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :sswitch_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 v5, 0x4

    .line 54
    goto :goto_0

    .line 55
    :sswitch_1
    const-string v1, "processing"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const/4 v5, 0x3

    .line 65
    goto :goto_0

    .line 66
    :sswitch_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    const/4 v5, 0x2

    .line 74
    goto :goto_0

    .line 75
    :sswitch_3
    const-string v1, "finished"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_4

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    const/4 v5, 0x1

    .line 85
    goto :goto_0

    .line 86
    :sswitch_4
    const-string v1, "failed"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_5

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    move v5, v4

    .line 96
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :pswitch_0
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 101
    .line 102
    check-cast v0, Ll/ze0;

    .line 103
    .line 104
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 105
    .line 106
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-direct {p0}, Ll/ye0;->g0()V

    .line 112
    .line 113
    .line 114
    iget-boolean v0, p0, Ll/ye0;->o:Z

    .line 115
    .line 116
    if-nez v0, :cond_6

    .line 117
    .line 118
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 119
    .line 120
    check-cast v0, Ll/ze0;

    .line 121
    .line 122
    iget-object v0, v0, Ll/ze0;->g:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;

    .line 123
    .line 124
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 125
    .line 126
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 127
    .line 128
    invoke-virtual {p0, v1}, Ll/ye0;->L(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)Ljava/util/List;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->S(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ljava/util/List;)V

    .line 133
    .line 134
    .line 135
    :cond_6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 136
    .line 137
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->good:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0, p1}, Ll/ye0;->X(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :pswitch_1
    iput-boolean v4, p0, Ll/ye0;->o:Z

    .line 154
    .line 155
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 156
    .line 157
    check-cast v0, Ll/ze0;

    .line 158
    .line 159
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 160
    .line 161
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-direct {p0}, Ll/ye0;->g0()V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 170
    .line 171
    check-cast p0, Ll/ze0;

    .line 172
    .line 173
    iget-object p0, p0, Ll/ze0;->h:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumRenderView;

    .line 174
    .line 175
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 176
    .line 177
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 178
    .line 179
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumRenderView;->Q(Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :pswitch_2
    iget-boolean v0, p0, Ll/ye0;->o:Z

    .line 184
    .line 185
    iget-object v1, p0, Ll/ij2;->a:Ll/iam;

    .line 186
    .line 187
    if-eqz v0, :cond_7

    .line 188
    .line 189
    check-cast v1, Ll/ze0;

    .line 190
    .line 191
    invoke-virtual {v1, v2}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-direct {p0}, Ll/ye0;->g0()V

    .line 195
    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 198
    .line 199
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 200
    .line 201
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->good:Ljava/util/List;

    .line 202
    .line 203
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p0, p1}, Ll/ye0;->X(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_7
    check-cast v1, Ll/ze0;

    .line 216
    .line 217
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 218
    .line 219
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v1, p1}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Ll/ye0;->K()V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :pswitch_3
    iput-boolean v4, p0, Ll/ye0;->o:Z

    .line 229
    .line 230
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 231
    .line 232
    check-cast v0, Ll/ze0;

    .line 233
    .line 234
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 235
    .line 236
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-direct {p0}, Ll/ye0;->g0()V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 245
    .line 246
    check-cast v0, Ll/ze0;

    .line 247
    .line 248
    iget-object v0, v0, Ll/ze0;->i:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 249
    .line 250
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 251
    .line 252
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->finished:Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 253
    .line 254
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->b0(Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0}, Ll/ye0;->e0()V

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :pswitch_4
    iput-boolean v4, p0, Ll/ye0;->o:Z

    .line 262
    .line 263
    iget-object p1, p0, Ll/ij2;->a:Ll/iam;

    .line 264
    .line 265
    check-cast p1, Ll/ze0;

    .line 266
    .line 267
    invoke-virtual {p1, v3}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0}, Ll/ye0;->K()V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    nop

    .line 275
    :sswitch_data_0
    .sparse-switch
        -0x4c696bc3 -> :sswitch_4
        -0x28273f8e -> :sswitch_3
        0x316510 -> :sswitch_2
        0x192a2f13 -> :sswitch_1
        0x5b9b35da -> :sswitch_0
    .end sparse-switch

    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ye0;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ye0;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/ze0;

    .line 14
    .line 15
    const-string v1, "checking"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 21
    .line 22
    new-instance v1, Ll/xd0;

    .line 23
    .line 24
    invoke-direct {v1, p1}, Ll/xd0;-><init>(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/ye0;->h:Ljava/util/List;

    .line 32
    .line 33
    new-instance p1, Ll/yd0;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/yd0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p2, p1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Ll/ye0;->i:Ljava/util/List;

    .line 43
    .line 44
    iget-object p2, p0, Ll/ye0;->h:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/ij2;->a:Ll/iam;

    .line 50
    .line 51
    check-cast p1, Ll/ze0;

    .line 52
    .line 53
    iget-object p1, p1, Ll/ze0;->g:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;

    .line 54
    .line 55
    iget-object p2, p0, Ll/ye0;->h:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->T(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/ye0;->f:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ll/ye0;->o0(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic R(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    iput-object p1, p0, Ll/ye0;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/ye0;->e:Ljava/lang/String;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Ll/ye0;->o:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ye0;->Z()V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/ef0;->INSTANCE:Ll/ef0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ef0;->e()Ll/jxd0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic S(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ye0;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ye0;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/ij2;->a:Ll/iam;

    .line 12
    .line 13
    check-cast p1, Ll/ze0;

    .line 14
    .line 15
    const-string v0, "checking"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/ye0;->h:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/ye0;->g:Ljava/util/List;

    .line 26
    .line 27
    new-instance v0, Ll/zd0;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/zd0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/ye0;->i:Ljava/util/List;

    .line 37
    .line 38
    iget-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/ij2;->a:Ll/iam;

    .line 44
    .line 45
    check-cast p1, Ll/ze0;

    .line 46
    .line 47
    iget-object p1, p1, Ll/ze0;->g:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;

    .line 48
    .line 49
    iget-object v0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->T(Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    const-string p1, ""

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/ye0;->o0(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/core/data/AiAlbumRenderEnvelope;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ze0;

    .line 4
    .line 5
    const-string v1, "processing"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/ze0;->c(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/ze0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ze0;->h:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumRenderView;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumRenderEnvelope;->data:Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumRenderView;->Q(Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic U(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ye0;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V(Ljava/lang/String;Ljava/util/List;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ye0;->e:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ll/ke0;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/ke0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p2, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1, v0, p2}, Ll/ye0;->Y(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Ll/ye0;->o:Z

    .line 26
    .line 27
    return-void
.end method

.method public W()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ye0;->p:Ll/l4g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ye0;->n:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final X(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "p_intl_ai_photo_self_photo"

    .line 2
    .line 3
    const-string v1, "AiAlbumPickerDialog"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/ye0;->p:Ll/l4g0;

    .line 10
    .line 11
    const-string v1, "intl_ai_photo_qualification_num"

    .line 12
    .line 13
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    filled-new-array {p1}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/ye0;->p:Ll/l4g0;

    .line 25
    .line 26
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final Y(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ye0;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    iget-object v1, p0, Ll/ye0;->i:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ge v0, v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Ll/ye0;->i:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ll/ff0;

    .line 29
    .line 30
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ljava/lang/String;

    .line 35
    .line 36
    iput-object v2, v1, Ll/ff0;->c:Ljava/lang/String;

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Ll/ye0;->l:Ll/kcg0;

    .line 42
    .line 43
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 44
    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Y1:Ll/qx6;

    .line 49
    .line 50
    invoke-virtual {v0, p1, p2, p3}, Ll/qx6;->n3(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance p2, Ll/le0;

    .line 59
    .line 60
    invoke-direct {p2, p0}, Ll/le0;-><init>(Ll/ye0;)V

    .line 61
    .line 62
    .line 63
    new-instance p3, Ll/me0;

    .line 64
    .line 65
    invoke-direct {p3, p0}, Ll/me0;-><init>(Ll/ye0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Ll/ye0;->l:Ll/kcg0;

    .line 77
    .line 78
    return-void
.end method

.method public Z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ye0;->j:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Y1:Ll/qx6;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/qx6;->q3()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/wd0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/wd0;-><init>(Ll/ye0;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/he0;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/he0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/ye0;->j:Ll/kcg0;

    .line 37
    .line 38
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ye0;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ye0;->K()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b0(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ye0;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->bad:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-instance v2, Ll/qe0;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1}, Ll/qe0;-><init>(Ll/ye0;Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1, v2}, Ll/yf0;->w(Lcom/p1/mobile/android/app/Act;ILl/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c0(Ljava/lang/String;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 16
    .line 17
    const-string p1, "image/*"

    .line 18
    .line 19
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Ll/ye0;->c:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-static {p0, v0, p2}, Ll/yf0;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Picture;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public d0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Y1:Ll/qx6;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ye0;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/qx6;->p3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/te0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/te0;-><init>(Ll/ye0;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/ue0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/ue0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final e0()V
    .locals 2

    .line 1
    const-string v0, "p_intl_ai_photo_result"

    .line 2
    .line 3
    const-string v1, "AiAlbumResultDialog"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/ye0;->p:Ll/l4g0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 16
    .line 17
    const-string p1, "image/*"

    .line 18
    .line 19
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Ll/ye0;->c:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-static {p0, v0, p1}, Ll/yf0;->t(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Picture;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public h0(Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p1, p0, Ll/ye0;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p0, Ll/ye0;->c:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    new-instance v0, Ll/xe0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/xe0;-><init>(Ll/ye0;)V

    .line 10
    .line 11
    .line 12
    const/16 p0, 0xa

    .line 13
    .line 14
    invoke-static {p1, p0, v0}, Ll/yf0;->w(Lcom/p1/mobile/android/app/Act;ILl/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public i0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Y1:Ll/qx6;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ye0;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/qx6;->o3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/re0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/re0;-><init>(Ll/ye0;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/se0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/se0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public j0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ye0;->n:Ll/kcg0;

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
    iget-object v0, p0, Ll/ye0;->n:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object v0, Ll/ef0;->INSTANCE:Ll/ef0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ef0;->c()Lrx/subjects/b;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/fe0;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/fe0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/ge0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/ge0;-><init>(Ll/ye0;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ll/ie0;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/ie0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Ll/ye0;->n:Ll/kcg0;

    .line 52
    .line 53
    return-void
.end method

.method public final k0()V
    .locals 2

    .line 1
    const-string v0, "p_intl_ai_photo_homepopup"

    .line 2
    .line 3
    const-string v1, "AiAlbumTemplatesDialog"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/ye0;->p:Ll/l4g0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public l0()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/ye0;->q:I

    .line 2
    .line 3
    if-gtz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public m0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ye0;->j:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ye0;->k:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final n0(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->action:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch v1, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string v1, "wait"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x2

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v1, "add"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x1

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v1, "upload"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x0

    .line 47
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :pswitch_0
    iget-object p0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 52
    .line 53
    new-instance v0, Ll/ne0;

    .line 54
    .line 55
    invoke-direct {v0, p1}, Ll/ne0;-><init>(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :pswitch_1
    iget-object p0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 63
    .line 64
    new-instance v0, Ll/pe0;

    .line 65
    .line 66
    invoke-direct {v0, p1}, Ll/pe0;-><init>(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :pswitch_2
    iget-object p0, p0, Ll/ye0;->h:Ljava/util/List;

    .line 74
    .line 75
    new-instance p1, Ll/oe0;

    .line 76
    .line 77
    invoke-direct {p1}, Ll/oe0;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    nop

    .line 85
    :sswitch_data_0
    .sparse-switch
        -0x31fbf1ff -> :sswitch_2
        0x178a1 -> :sswitch_1
        0x379175 -> :sswitch_0
    .end sparse-switch

    .line 86
    .line 87
    .line 88
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final o0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ye0;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/ye0;->o:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/ye0;->m:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ye0;->g:Ljava/util/List;

    .line 19
    .line 20
    new-instance v1, Ll/je0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/je0;-><init>(Ll/ye0;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/yf0;->x(Ljava/util/List;Ll/y20;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/ye0;->m:Ll/kcg0;

    .line 30
    .line 31
    return-void
.end method
