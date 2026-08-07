.class public final Ll/egw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ufw0;


# static fields
.field public static f:Ll/egw0;


# instance fields
.field public a:F

.field public final b:Ll/qfw0;

.field public final c:Ll/ofw0;

.field public d:Ll/pfw0;

.field public e:Ll/tfw0;


# direct methods
.method public constructor <init>(Ll/qfw0;Ll/ofw0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/egw0;->a:F

    .line 6
    .line 7
    iput-object p1, p0, Ll/egw0;->b:Ll/qfw0;

    .line 8
    .line 9
    iput-object p2, p0, Ll/egw0;->c:Ll/ofw0;

    .line 10
    .line 11
    return-void
.end method

.method public static c()Ll/egw0;
    .locals 3

    .line 1
    sget-object v0, Ll/egw0;->f:Ll/egw0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ofw0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ofw0;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/qfw0;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/qfw0;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/egw0;

    .line 16
    .line 17
    invoke-direct {v2, v1, v0}, Ll/egw0;-><init>(Ll/qfw0;Ll/ofw0;)V

    .line 18
    .line 19
    .line 20
    sput-object v2, Ll/egw0;->f:Ll/egw0;

    .line 21
    .line 22
    :cond_0
    sget-object v0, Ll/egw0;->f:Ll/egw0;

    .line 23
    .line 24
    return-object v0
.end method


# virtual methods
.method public final a(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/ghw0;->d()Ll/ghw0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/ghw0;->i()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Ll/ghw0;->d()Ll/ghw0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/ghw0;->h()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final b()F
    .locals 0

    .line 1
    iget p0, p0, Ll/egw0;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public final d(Landroid/content/Context;)V
    .locals 3

    .line 1
    new-instance v0, Ll/nfw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/nfw0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Handler;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/pfw0;

    .line 12
    .line 13
    invoke-direct {v2, v1, p1, v0, p0}, Ll/pfw0;-><init>(Landroid/os/Handler;Landroid/content/Context;Ll/nfw0;Ll/egw0;)V

    .line 14
    .line 15
    .line 16
    iput-object v2, p0, Ll/egw0;->d:Ll/pfw0;

    .line 17
    .line 18
    return-void
.end method

.method public final e(F)V
    .locals 1

    .line 1
    iput p1, p0, Ll/egw0;->a:F

    .line 2
    .line 3
    iget-object v0, p0, Ll/egw0;->e:Ll/tfw0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/tfw0;->a()Ll/tfw0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/egw0;->e:Ll/tfw0;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/egw0;->e:Ll/tfw0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tfw0;->b()Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/kfw0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/kfw0;->g()Ll/kgw0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p1}, Ll/kgw0;->i(F)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    invoke-static {}, Ll/sfw0;->i()Ll/sfw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/vfw0;->e(Ll/ufw0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/sfw0;->i()Ll/sfw0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vfw0;->f()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/ghw0;->d()Ll/ghw0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/ghw0;->i()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/egw0;->d:Ll/pfw0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/pfw0;->a()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    invoke-static {}, Ll/ghw0;->d()Ll/ghw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ghw0;->j()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/sfw0;->i()Ll/sfw0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vfw0;->g()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/egw0;->d:Ll/pfw0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pfw0;->b()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
