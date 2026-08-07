.class public final Ll/asx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Landroid/net/Uri;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:Ll/adj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/adj<",
            "Landroid/content/Context;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 10

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v1, 0x0

    .line 23
    const-string v3, ""

    const-string v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v9}, Ll/asx0;-><init>(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ZZZZLl/adj;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ZZZZLl/adj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZZZ",
            "Ll/adj<",
            "Landroid/content/Context;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/asx0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/asx0;->b:Landroid/net/Uri;

    .line 7
    .line 8
    iput-object p3, p0, Ll/asx0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/asx0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/asx0;->e:Z

    .line 13
    .line 14
    iput-boolean p6, p0, Ll/asx0;->f:Z

    .line 15
    .line 16
    iput-boolean p7, p0, Ll/asx0;->g:Z

    .line 17
    .line 18
    iput-boolean p8, p0, Ll/asx0;->h:Z

    .line 19
    .line 20
    iput-object p9, p0, Ll/asx0;->i:Ll/adj;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;D)Ll/sqx0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D)",
            "Ll/sqx0<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 1
    const-wide/high16 p2, -0x3ff8000000000000L    # -3.0

    .line 2
    .line 3
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/4 p3, 0x1

    .line 8
    invoke-static {p0, p1, p2, p3}, Ll/sqx0;->g(Ll/asx0;Ljava/lang/String;Ljava/lang/Double;Z)Ll/sqx0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final b(Ljava/lang/String;J)Ll/sqx0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J)",
            "Ll/sqx0<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 p3, 0x1

    .line 6
    invoke-static {p0, p1, p2, p3}, Ll/sqx0;->h(Ll/asx0;Ljava/lang/String;Ljava/lang/Long;Z)Ll/sqx0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)Ll/sqx0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ll/sqx0<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/sqx0;->i(Ll/asx0;Ljava/lang/String;Ljava/lang/String;Z)Ll/sqx0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final d(Ljava/lang/String;Z)Ll/sqx0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ll/sqx0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, p1, p2, v0}, Ll/sqx0;->f(Ll/asx0;Ljava/lang/String;Ljava/lang/Boolean;Z)Ll/sqx0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final e()Ll/asx0;
    .locals 10

    .line 1
    new-instance v0, Ll/asx0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/asx0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/asx0;->b:Landroid/net/Uri;

    .line 6
    .line 7
    iget-object v3, p0, Ll/asx0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Ll/asx0;->d:Ljava/lang/String;

    .line 10
    .line 11
    iget-boolean v5, p0, Ll/asx0;->e:Z

    .line 12
    .line 13
    iget-boolean v6, p0, Ll/asx0;->f:Z

    .line 14
    .line 15
    iget-boolean v8, p0, Ll/asx0;->h:Z

    .line 16
    .line 17
    iget-object v9, p0, Ll/asx0;->i:Ll/adj;

    .line 18
    .line 19
    const/4 v7, 0x1

    .line 20
    invoke-direct/range {v0 .. v9}, Ll/asx0;-><init>(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ZZZZLl/adj;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public final f()Ll/asx0;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/asx0;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v10, p0, Ll/asx0;->i:Ll/adj;

    .line 10
    .line 11
    if-nez v10, :cond_0

    .line 12
    .line 13
    new-instance v1, Ll/asx0;

    .line 14
    .line 15
    iget-object v2, p0, Ll/asx0;->a:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v3, p0, Ll/asx0;->b:Landroid/net/Uri;

    .line 18
    .line 19
    iget-object v4, p0, Ll/asx0;->c:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v5, p0, Ll/asx0;->d:Ljava/lang/String;

    .line 22
    .line 23
    iget-boolean v7, p0, Ll/asx0;->f:Z

    .line 24
    .line 25
    iget-boolean v8, p0, Ll/asx0;->g:Z

    .line 26
    .line 27
    iget-boolean v9, p0, Ll/asx0;->h:Z

    .line 28
    .line 29
    const/4 v6, 0x1

    .line 30
    invoke-direct/range {v1 .. v10}, Ll/asx0;-><init>(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ZZZZLl/adj;)V

    .line 31
    .line 32
    .line 33
    return-object v1

    .line 34
    :cond_0
    const-string p0, "Cannot skip gservices both always and conditionally"

    .line 35
    .line 36
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    const/4 p0, 0x0

    .line 40
    return-object p0

    .line 41
    :cond_1
    const-string p0, "Cannot set GServices prefix and skip GServices"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0
.end method
