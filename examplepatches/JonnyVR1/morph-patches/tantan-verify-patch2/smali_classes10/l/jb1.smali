.class public Ll/jb1;
.super Ll/q0m;
.source "SourceFile"


# instance fields
.field public final c:Ll/v120;

.field public d:Lcom/p1/mobile/android/media/a$a;


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
    new-instance p2, Ll/jb1$a;

    .line 5
    .line 6
    invoke-direct {p2, p0}, Ll/jb1$a;-><init>(Ll/jb1;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/jb1;->d:Lcom/p1/mobile/android/media/a$a;

    .line 10
    .line 11
    iput-object p1, p0, Ll/jb1;->c:Ll/v120;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic g(Ll/jb1;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jb1;->h(Z)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/jb1;->d:Lcom/p1/mobile/android/media/a$a;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/media/a;->g(Lcom/p1/mobile/android/media/a$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/jb1;->d:Lcom/p1/mobile/android/media/a$a;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/media/a;->f(Lcom/p1/mobile/android/media/a$a;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/media/a;->b()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/android/media/a;->c()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void

    .line 32
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/jb1;->c:Ll/v120;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0, v0}, Ll/v120;->a(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final h(Z)V
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
    iget-object p0, p0, Ll/jb1;->c:Ll/v120;

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
