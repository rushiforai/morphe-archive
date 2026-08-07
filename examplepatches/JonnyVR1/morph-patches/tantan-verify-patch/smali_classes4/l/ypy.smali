.class public Ll/ypy;
.super Ll/ioi0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ioi0<",
        "Ll/eqy;",
        ">;"
    }
.end annotation


# instance fields
.field public h:Ll/rpy;

.field public i:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ioi0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ypy$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ypy$a;-><init>(Ll/ypy;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ypy;->i:Ljava/lang/Runnable;

    .line 10
    .line 11
    new-instance v0, Ll/rpy;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/rpy;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ypy;->h:Ll/rpy;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Ll/rpy;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ll/ioi0;-><init>()V

    .line 20
    new-instance v0, Ll/ypy$a;

    invoke-direct {v0, p0}, Ll/ypy$a;-><init>(Ll/ypy;)V

    iput-object v0, p0, Ll/ypy;->i:Ljava/lang/Runnable;

    .line 21
    iput-object p1, p0, Ll/ypy;->h:Ll/rpy;

    return-void
.end method

.method public static synthetic t(Ll/ypy;)Ll/wpy;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ypy;->v()Ll/wpy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic u(Ll/ypy;)Ll/rpy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypy;->h:Ll/rpy;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ypy;->h:Ll/rpy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rpy;->i()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypy;->h:Ll/rpy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rpy;->j()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ypy;->h:Ll/rpy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rpy;->k()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public bridge synthetic f()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ypy;->w()Ll/eqy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "memory"

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/f6m;
    .locals 1

    .line 1
    new-instance v0, Ll/dqy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ypy;->j()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/dqy;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public l()Ll/uni0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypy;->h:Ll/rpy;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()I
    .locals 0

    .line 1
    const/16 p0, 0x1e

    .line 2
    .line 3
    return p0
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ypy;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ypy;->h:Ll/rpy;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rpy;->h()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v0, v1, v2}, Ll/u21;->c(Ljava/lang/Runnable;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final v()Ll/wpy;
    .locals 7

    .line 1
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/vpy;->a(Landroid/content/Context;)Ll/eqy;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ypy;->x(Ll/eqy;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    new-instance v1, Ll/wpy;

    .line 16
    .line 17
    invoke-static {}, Ll/du2;->f()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget v3, v0, Ll/eqy;->b:I

    .line 22
    .line 23
    iget v4, v0, Ll/eqy;->a:I

    .line 24
    .line 25
    iget v5, v0, Ll/eqy;->d:I

    .line 26
    .line 27
    iget v6, v0, Ll/eqy;->c:I

    .line 28
    .line 29
    invoke-direct/range {v1 .. v6}, Ll/wpy;-><init>(Ljava/lang/String;IIII)V

    .line 30
    .line 31
    .line 32
    return-object v1

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public w()Ll/eqy;
    .locals 0

    .line 1
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/vpy;->a(Landroid/content/Context;)Ll/eqy;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final x(Ll/eqy;)Z
    .locals 4

    .line 1
    iget-object p0, p0, Ll/ioi0;->f:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/beatles/utils/DeviceUtil;->l(Landroid/content/Context;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    iget p0, p1, Ll/eqy;->c:I

    .line 14
    .line 15
    int-to-long p0, p0

    .line 16
    const-wide/16 v2, 0x2800

    .line 17
    .line 18
    div-long/2addr v0, v2

    .line 19
    cmp-long p0, p0, v0

    .line 20
    .line 21
    if-lez p0, :cond_0

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
