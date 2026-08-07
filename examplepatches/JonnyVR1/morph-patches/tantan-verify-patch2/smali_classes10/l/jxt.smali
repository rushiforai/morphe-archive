.class public Ll/jxt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dtl;


# instance fields
.field public final a:Ll/ogd0;


# direct methods
.method public constructor <init>(Ll/ogd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jxt;->a:Ll/ogd0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/d3q;Ll/j80;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/d3q<",
            "*>;",
            "Ll/j80;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/jxt;->b()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of v1, p1, Ll/zxt;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Ll/zxt;

    .line 14
    .line 15
    invoke-virtual {p0, v1, v0}, Ll/jxt;->c(Ll/zxt;Ll/oo2;)Ll/kfd0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1}, Ll/d3q;->p()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p2}, Ll/j80;->a()Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p0, p1, p2}, Ll/afu;->k(Ll/kfd0;Ljava/lang/String;Ljava/util/Map;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public final b()Ll/oo2;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jxt;->a:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ogd0;->y0()Ll/x5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/jxt;->a:Ll/ogd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final c(Ll/zxt;Ll/oo2;)Ll/kfd0$a;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/z0u;->I()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "p_live_right_recommend"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Ll/zxt;->T()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Ll/kfd0$a;->z(Ljava/lang/String;)Ll/kfd0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p2}, Ll/oo2;->I0()Ll/ajt$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/ajt$a;->e()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-virtual {p1, v0, v1}, Ll/kfd0$a;->B(J)Ll/kfd0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "0"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/kfd0$a;->p(Ljava/lang/String;)Ll/kfd0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Ll/jxt;->a:Ll/ogd0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ogd0;->D0()Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->j()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    xor-int/lit8 p0, p0, 0x1

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Ll/kfd0$a;->n(Z)Ll/kfd0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0, p2}, Ll/lsv;->a(Ll/kfd0$a;Ll/oo2;)Ll/kfd0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public d(Ll/d3q;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/d3q<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/jxt;->b()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    :goto_0
    instance-of v2, p1, Ll/zxt;

    .line 24
    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    move-object v2, p1

    .line 28
    check-cast v2, Ll/zxt;

    .line 29
    .line 30
    invoke-virtual {p0, v2, v0}, Ll/jxt;->c(Ll/zxt;Ll/oo2;)Ll/kfd0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v1}, Ll/kfd0$a;->k(Ljava/lang/String;)Ll/kfd0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1}, Ll/d3q;->p()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p0, p1}, Ll/afu;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_1
    return-void
.end method
