.class public Ll/jtx;
.super Ll/q0m;
.source "SourceFile"


# instance fields
.field public final c:Ll/v120;

.field public d:Ll/yqx$a;


# direct methods
.method public constructor <init>(Ll/v120;Lrx/c;Ll/g8t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v120;",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;",
            "Ll/g8t;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2, p3}, Ll/q0m;-><init>(Lrx/c;Ll/g8t;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ll/itx;

    .line 5
    .line 6
    invoke-direct {p2, p0}, Ll/itx;-><init>(Ll/jtx;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/jtx;->d:Ll/yqx$a;

    .line 10
    .line 11
    iput-object p1, p0, Ll/jtx;->c:Ll/v120;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic g(Ll/jtx;IILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/jtx;->h(IILandroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/jtx;->d:Ll/yqx$a;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/yqx;->g(Ll/yqx$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/jtx;->d:Ll/yqx$a;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/yqx;->f(Ll/yqx$a;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/yqx;->c()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/jtx;->c:Ll/v120;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Ll/v120;->a(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic h(IILandroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    if-eq p2, p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x4

    .line 7
    if-eq p2, p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x5

    .line 10
    if-eq p2, p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x6

    .line 13
    if-eq p2, p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Ll/jtx;->i(Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p0, p1}, Ll/jtx;->i(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public i(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/q0m;->d()Z

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
    iget-object p0, p0, Ll/jtx;->c:Ll/v120;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Ll/v120;->a(Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    invoke-virtual {p0}, Ll/v120;->b()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Ll/v120;->a(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
