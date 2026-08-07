.class public final Ll/wjl0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wjl0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/wjl0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Handler;Ll/wjl0;)V
    .locals 0
    .param p1    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/wjl0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/os/Handler;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    iput-object p1, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 15
    .line 16
    iput-object p2, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/wjl0$a;IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wjl0;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3}, Ll/wjl0;->i(IJ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b(Ll/wjl0$a;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wjl0;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/wjl0;->r(Ljava/lang/Exception;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c(Ll/wjl0$a;Ll/jid;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/jid;->c()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/wjl0;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/wjl0;->o(Ll/jid;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic d(Ll/wjl0$a;Ljava/lang/Object;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wjl0;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3}, Ll/wjl0;->w(Ljava/lang/Object;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e(Ll/wjl0$a;JI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wjl0;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3}, Ll/wjl0;->k(JI)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic f(Ll/wjl0$a;Ll/zjl0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wjl0;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/wjl0;->x(Ll/zjl0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic g(Ll/wjl0$a;Ll/jid;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wjl0;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/wjl0;->m(Ll/jid;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic h(Ll/wjl0$a;Ljava/lang/String;JJ)V
    .locals 6

    .line 1
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    move-object v0, p0

    .line 8
    check-cast v0, Ll/wjl0;

    .line 9
    .line 10
    move-object v1, p1

    .line 11
    move-wide v2, p2

    .line 12
    move-wide v4, p4

    .line 13
    invoke-interface/range {v0 .. v5}, Ll/wjl0;->l(Ljava/lang/String;JJ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic i(Ll/wjl0$a;Lcom/google/android/exoplayer2/k;Ll/nid;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wjl0;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/wjl0;->D(Lcom/google/android/exoplayer2/k;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 13
    .line 14
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/wjl0;

    .line 19
    .line 20
    invoke-interface {p0, p1, p2}, Ll/wjl0;->h(Lcom/google/android/exoplayer2/k;Ll/nid;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic j(Ll/wjl0$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wjl0$a;->b:Ll/wjl0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wjl0;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/wjl0;->c(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public k(Ljava/lang/String;JJ)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/sjl0;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move-object v3, p1

    .line 9
    move-wide v4, p2

    .line 10
    move-wide v6, p4

    .line 11
    invoke-direct/range {v1 .. v7}, Ll/sjl0;-><init>(Ll/wjl0$a;Ljava/lang/String;JJ)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public l(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/pjl0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/pjl0;-><init>(Ll/wjl0$a;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public m(Ll/jid;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jid;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/qjl0;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/qjl0;-><init>(Ll/wjl0$a;Ll/jid;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public n(IJ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/njl0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/njl0;-><init>(Ll/wjl0$a;IJ)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public o(Ll/jid;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/tjl0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/tjl0;-><init>(Ll/wjl0$a;Ll/jid;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public p(Lcom/google/android/exoplayer2/k;Ll/nid;)V
    .locals 2
    .param p2    # Ll/nid;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/ujl0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2}, Ll/ujl0;-><init>(Ll/wjl0$a;Lcom/google/android/exoplayer2/k;Ll/nid;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public q(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v3, Ll/ojl0;

    .line 12
    .line 13
    invoke-direct {v3, p0, p1, v0, v1}, Ll/ojl0;-><init>(Ll/wjl0$a;Ljava/lang/Object;J)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public r(JI)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/vjl0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/vjl0;-><init>(Ll/wjl0$a;JI)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public s(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/rjl0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/rjl0;-><init>(Ll/wjl0$a;Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public t(Ll/zjl0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wjl0$a;->a:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/mjl0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/mjl0;-><init>(Ll/wjl0$a;Ll/zjl0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
