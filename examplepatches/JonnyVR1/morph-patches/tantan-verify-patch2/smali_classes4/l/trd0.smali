.class public Ll/trd0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


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

.method public static synthetic a(Ljava/lang/Exception;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/trd0;->d(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method public static synthetic b(Ll/f2e0;Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ll/f2e0;Ljava/lang/Exception;Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p2, p0}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p2, Ll/srd0;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ll/srd0;-><init>(Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static d(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    sget-object v0, Ll/trd0;->a:Ll/y20;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static e(Ll/f2e0;)Lrx/c$d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/f2e0;",
            ")",
            "Lrx/c$d<",
            "TT;TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    .line 13
    .line 14
    const-string v1, "run in UI thread after subscribeOn(notUIThread)\uff0cCheck it before ANR"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/rrd0;

    .line 20
    .line 21
    invoke-direct {v1, p0, v0}, Ll/rrd0;-><init>(Ll/f2e0;Ljava/lang/Exception;)V

    .line 22
    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_1
    :goto_0
    new-instance v0, Ll/qrd0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/qrd0;-><init>(Ll/f2e0;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method
