.class public Ll/cbb0;
.super Ll/q0m;
.source "SourceFile"


# instance fields
.field public final c:Ll/msf0;

.field public d:Ll/x3m;


# direct methods
.method public constructor <init>(Ll/msf0;Lrx/c;Ll/g8t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/msf0;",
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
    new-instance p2, Ll/cbb0$a;

    .line 5
    .line 6
    invoke-direct {p2, p0}, Ll/cbb0$a;-><init>(Ll/cbb0;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/cbb0;->d:Ll/x3m;

    .line 10
    .line 11
    iput-object p1, p0, Ll/cbb0;->c:Ll/msf0;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic g(Ll/cbb0;)Ll/msf0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cbb0;->c:Ll/msf0;

    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cbb0;->d:Ll/x3m;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wrv;->C0(Ll/x3m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cbb0;->d:Ll/x3m;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/wrv;->g0(Ll/x3m;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/wrv;->Q()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/cbb0;->c:Ll/msf0;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Ll/msf0;->c(Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
