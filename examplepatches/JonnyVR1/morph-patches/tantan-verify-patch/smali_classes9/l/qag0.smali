.class public Ll/qag0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Landroid/view/Window;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 3
    .line 4
    .line 5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v2, 0x1d

    .line 8
    .line 9
    if-lt v1, v2, :cond_0

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/oag0;->a(Landroid/view/Window;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static b()Ll/rq2;
    .locals 1

    .line 1
    invoke-static {}, Ll/le3$a;->b()Ll/le3$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/le3$a;->a()Ll/rq2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static c(F)Ll/rq2;
    .locals 1

    .line 1
    invoke-static {}, Ll/le3$a;->b()Ll/le3$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/le3$a;->c(F)Ll/le3$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/le3$a;->a()Ll/rq2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static d(FZ)Ll/rq2;
    .locals 1

    .line 1
    invoke-static {}, Ll/le3$a;->b()Ll/le3$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/le3$a;->d(Z)Ll/le3$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Ll/le3$a;->c(F)Ll/le3$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/le3$a;->a()Ll/rq2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static e(Z)Ll/rq2;
    .locals 1

    .line 1
    invoke-static {}, Ll/le3$a;->b()Ll/le3$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/le3$a;->d(Z)Ll/le3$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/le3$a;->a()Ll/rq2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static f()Ll/rq2;
    .locals 1

    .line 1
    invoke-static {}, Ll/vo4$a;->b()Ll/vo4$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vo4$a;->a()Ll/rq2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static g()Ll/rq2;
    .locals 2

    .line 1
    invoke-static {}, Ll/vo4$a;->b()Ll/vo4$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x3e99999a    # 0.3f

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/vo4$a;->c(F)Ll/vo4$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vo4$a;->a()Ll/rq2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method public static h()Ll/rq2;
    .locals 2

    .line 1
    invoke-static {}, Ll/k5j0$a;->b()Ll/k5j0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/pag0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/pag0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/k5j0$a;->c(Ll/y20;)Ll/k5j0$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/k5j0$a;->a()Ll/rq2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    return-object v0
.end method
