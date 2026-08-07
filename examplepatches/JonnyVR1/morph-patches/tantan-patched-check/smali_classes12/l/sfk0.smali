.class public final Ll/sfk0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sfk0$b;,
        Ll/sfk0$a;
    }
.end annotation


# direct methods
.method public static a(Landroid/content/Context;)Lcom/google/android/ump/ConsentInformation;
    .locals 0
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/m9r0;->a(Landroid/content/Context;)Ll/m9r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/m9r0;->b()Ll/uyx0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static b(Landroid/app/Activity;Ll/vx5$a;)V
    .locals 2
    .param p0    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .param p1    # Ll/vx5$a;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Ll/m9r0;->a(Landroid/content/Context;)Ll/m9r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/m9r0;->b()Ll/uyx0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/uyx0;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-interface {p1, p0}, Ll/vx5$a;->a(Ll/m1j;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {p0}, Ll/m9r0;->a(Landroid/content/Context;)Ll/m9r0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/m9r0;->c()Ll/ols0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {}, Ll/pot0;->a()V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/ajs0;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1}, Ll/ajs0;-><init>(Landroid/app/Activity;Ll/vx5$a;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/iks0;

    .line 40
    .line 41
    invoke-direct {p0, p1}, Ll/iks0;-><init>(Ll/vx5$a;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1, p0}, Ll/ols0;->b(Ll/sfk0$b;Ll/sfk0$a;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
