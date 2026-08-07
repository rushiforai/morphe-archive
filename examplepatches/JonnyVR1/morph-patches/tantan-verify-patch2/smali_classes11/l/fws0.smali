.class public final Ll/fws0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/bvs0;

.field public b:Ll/hpr;


# direct methods
.method public constructor <init>(Ll/bvs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fws0;->a:Ll/bvs0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ll/hvs0;Ll/gvs0;)Ll/iws0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fws0;->d()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/iws0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fws0;->b:Ll/hpr;

    .line 7
    .line 8
    const-string v0, "google.afma.activeView.handleUpdate"

    .line 9
    .line 10
    invoke-direct {p1, p0, v0, p2, p3}, Ll/iws0;-><init>(Ll/hpr;Ljava/lang/String;Ll/hvs0;Ll/gvs0;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public final b(Ljava/lang/String;Ll/bqs0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/fws0;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/fws0;->b:Ll/hpr;

    .line 5
    .line 6
    new-instance v1, Ll/ews0;

    .line 7
    .line 8
    invoke-direct {v1, p1, p2}, Ll/ews0;-><init>(Ljava/lang/String;Ll/bqs0;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Ll/oct0;->f:Ll/xvw0;

    .line 12
    .line 13
    invoke-static {v0, v1, p1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/fws0;->b:Ll/hpr;

    .line 18
    .line 19
    return-void
.end method

.method public final c(Ljava/lang/String;Ll/bqs0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fws0;->b:Ll/hpr;

    .line 2
    .line 3
    new-instance v1, Ll/bws0;

    .line 4
    .line 5
    invoke-direct {v1, p1, p2}, Ll/bws0;-><init>(Ljava/lang/String;Ll/bqs0;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/oct0;->f:Ll/xvw0;

    .line 9
    .line 10
    invoke-static {v0, v1, p1}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/fws0;->b:Ll/hpr;

    .line 15
    .line 16
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fws0;->b:Ll/hpr;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/tct0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/tct0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fws0;->b:Ll/hpr;

    .line 11
    .line 12
    iget-object p0, p0, Ll/fws0;->a:Ll/bvs0;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v1}, Ll/bvs0;->b(Ll/v2s0;)Ll/vus0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v1, Ll/cws0;

    .line 20
    .line 21
    invoke-direct {v1, v0}, Ll/cws0;-><init>(Ll/tct0;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/dws0;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ll/dws0;-><init>(Ll/tct0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1, v2}, Ll/kdt0;->e(Ll/xct0;Ll/vct0;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
