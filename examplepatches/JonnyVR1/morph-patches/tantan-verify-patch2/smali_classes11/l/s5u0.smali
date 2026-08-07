.class public final Ll/s5u0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/o7w0;

.field public final c:Landroid/os/Bundle;

.field public final d:Ll/c7w0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Ll/z3u0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:Ll/tcv0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public synthetic constructor <init>(Ll/q5u0;Ll/r5u0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/q5u0;->a(Ll/q5u0;)Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Ll/s5u0;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {p1}, Ll/q5u0;->m(Ll/q5u0;)Ll/o7w0;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/s5u0;->b:Ll/o7w0;

    .line 15
    .line 16
    invoke-static {p1}, Ll/q5u0;->b(Ll/q5u0;)Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iput-object p2, p0, Ll/s5u0;->c:Landroid/os/Bundle;

    .line 21
    .line 22
    invoke-static {p1}, Ll/q5u0;->l(Ll/q5u0;)Ll/c7w0;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Ll/s5u0;->d:Ll/c7w0;

    .line 27
    .line 28
    invoke-static {p1}, Ll/q5u0;->c(Ll/q5u0;)Ll/z3u0;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iput-object p2, p0, Ll/s5u0;->e:Ll/z3u0;

    .line 33
    .line 34
    invoke-static {p1}, Ll/q5u0;->k(Ll/q5u0;)Ll/tcv0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/s5u0;->f:Ll/tcv0;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5u0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Landroid/os/Bundle;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s5u0;->c:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/z3u0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s5u0;->e:Ll/z3u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/q5u0;
    .locals 2

    .line 1
    new-instance v0, Ll/q5u0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q5u0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/s5u0;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/q5u0;->e(Landroid/content/Context;)Ll/q5u0;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/s5u0;->b:Ll/o7w0;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/q5u0;->i(Ll/o7w0;)Ll/q5u0;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/s5u0;->c:Landroid/os/Bundle;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/q5u0;->f(Landroid/os/Bundle;)Ll/q5u0;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/s5u0;->e:Ll/z3u0;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/q5u0;->g(Ll/z3u0;)Ll/q5u0;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/s5u0;->f:Ll/tcv0;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ll/q5u0;->d(Ll/tcv0;)Ll/q5u0;

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public final e(Ljava/lang/String;)Ll/tcv0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5u0;->f:Ll/tcv0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ll/tcv0;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/tcv0;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final f()Ll/c7w0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s5u0;->d:Ll/c7w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Ll/o7w0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5u0;->b:Ll/o7w0;

    .line 2
    .line 3
    return-object p0
.end method
