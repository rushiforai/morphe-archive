.class public Ll/htb;
.super Ll/ioi0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ioi0<",
        "Ll/mtb;",
        ">;"
    }
.end annotation


# instance fields
.field public h:Ll/ctb;

.field public i:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ioi0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/htb$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/htb$a;-><init>(Ll/htb;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/htb;->i:Ljava/lang/Runnable;

    .line 10
    .line 11
    new-instance v0, Ll/ctb;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ctb;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/htb;->h:Ll/ctb;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Ll/ctb;)V
    .locals 1
    .param p1    # Ll/ctb;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0}, Ll/ioi0;-><init>()V

    .line 20
    new-instance v0, Ll/htb$a;

    invoke-direct {v0, p0}, Ll/htb$a;-><init>(Ll/htb;)V

    iput-object v0, p0, Ll/htb;->i:Ljava/lang/Runnable;

    .line 21
    iput-object p1, p0, Ll/htb;->h:Ll/ctb;

    return-void
.end method

.method public static synthetic t(Ll/htb;F)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/htb;->w(F)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic u(Ll/htb;)Ll/ctb;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/htb;->h:Ll/ctb;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/htb;->h:Ll/ctb;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ctb;->j()J

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
    iget-object p0, p0, Ll/htb;->h:Ll/ctb;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ctb;->k()I

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
    iget-object p0, p0, Ll/htb;->h:Ll/ctb;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ctb;->l()J

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
    invoke-virtual {p0}, Ll/htb;->v()Ll/mtb;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "cpu"

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/f6m;
    .locals 1

    .line 1
    new-instance v0, Ll/ltb;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/htb;->j()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/ltb;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public l()Ll/uni0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/htb;->h:Ll/ctb;

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
    iget-object v0, p0, Ll/htb;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    iget-object p0, p0, Ll/htb;->h:Ll/ctb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ctb;->i()J

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

.method public v()Ll/mtb;
    .locals 1

    .line 1
    invoke-static {}, Ll/etb;->b()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    new-instance v0, Ll/mtb;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/mtb;-><init>(F)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final w(F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/htb;->h:Ll/ctb;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ctb;->h()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    cmpl-float p0, p1, p0

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    const/high16 p0, 0x42c80000    # 100.0f

    .line 13
    .line 14
    cmpg-float p0, p1, p0

    .line 15
    .line 16
    if-gtz p0, :cond_0

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
