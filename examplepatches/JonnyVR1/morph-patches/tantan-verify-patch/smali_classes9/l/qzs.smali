.class public Ll/qzs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kwl;


# instance fields
.field public a:Ll/pzs;

.field public b:Ll/tzs;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/hti;)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->v0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-virtual {p1, p0}, Ll/hti;->h(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Ll/pzs;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/pzs;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/qzs;->a:Ll/pzs;

    .line 20
    .line 21
    new-instance v0, Ll/tzs;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/tzs;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/qzs;->b:Ll/tzs;

    .line 27
    .line 28
    iget-object v1, p0, Ll/qzs;->a:Ll/pzs;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ll/pzs;->n(Ll/tzs;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/qzs;->b:Ll/tzs;

    .line 34
    .line 35
    iget-object v1, p0, Ll/qzs;->a:Ll/pzs;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/tzs;->b(Ll/pzs;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/qzs;->a:Ll/pzs;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ll/pzs;->x(Ll/hti;)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p1, v0}, Ll/hti;->h(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/qzs;->a:Ll/pzs;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/pzs;->G1()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzs;->a:Ll/pzs;

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
    iget-object v0, p0, Ll/qzs;->a:Ll/pzs;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1, v1}, Ll/pzs;->K0(ZZ)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/qzs;->a:Ll/pzs;

    .line 17
    .line 18
    iput-object v0, p0, Ll/qzs;->b:Ll/tzs;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public p(Ll/hti;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/qzs;->a(Ll/hti;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qzs;->a:Ll/pzs;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pzs;->q()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/qzs;->a:Ll/pzs;

    .line 10
    .line 11
    iput-object v0, p0, Ll/qzs;->b:Ll/tzs;

    .line 12
    .line 13
    :cond_0
    return-void
.end method
