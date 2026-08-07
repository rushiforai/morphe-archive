.class public Ll/dhw;
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

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static b()[Ljava/lang/StackTraceElement;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Exception;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->A(Ljava/lang/Exception;)[Ljava/lang/StackTraceElement;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static c()Ll/t9t;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/t9t<",
            "TN;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/dhw;->b()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/t9t;->b([Ljava/lang/StackTraceElement;)Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static d(Ll/y20;)Ll/t9t;
    .locals 1
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TN;>;)",
            "Ll/t9t<",
            "TN;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/dhw;->b()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0}, Ll/t9t;->c([Ljava/lang/StackTraceElement;Ll/y20;)Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static e(Ll/y20;Ll/y20;)Ll/t9t;
    .locals 1
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TN;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Ll/t9t<",
            "TN;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/dhw;->b()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0, p1}, Ll/t9t;->d([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;
    .locals 1
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TN;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/x20;",
            ")",
            "Ll/t9t<",
            "TN;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/dhw;->b()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0, p1, p2}, Ll/t9t;->e([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static g(Ll/bb50;)Ll/t9t;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/bb50<",
            "TT;>;)",
            "Ll/t9t<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/dhw;->b()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0}, Ll/t9t;->f([Ljava/lang/StackTraceElement;Ll/bb50;)Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static h(Ll/y20;)Ll/t9t;
    .locals 2
    .param p0    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TN;>;)",
            "Ll/t9t<",
            "TN;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/dhw;->b()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/chw;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/chw;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p0, v1}, Ll/t9t;->d([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)Ll/t9t;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
