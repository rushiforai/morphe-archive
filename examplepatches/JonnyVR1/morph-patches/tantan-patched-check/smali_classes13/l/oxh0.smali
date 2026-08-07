.class public Ll/oxh0;
.super Ll/nrd0;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/f2e0;

.field public static volatile c:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ll/f2e0;",
            "Ll/f2e0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nrd0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/e7m;Ll/f2e0;)Ll/f2e0;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/oxh0;->m(Ll/e7m;)Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static m(Ll/e7m;)Ll/f2e0;
    .locals 1

    .line 1
    sget-object v0, Ll/oxh0;->b:Ll/f2e0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/e7m;->a()Ljava/util/concurrent/ThreadPoolExecutor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Ll/f2e0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sput-object p0, Ll/oxh0;->b:Ll/f2e0;

    .line 14
    .line 15
    :cond_0
    sget-object p0, Ll/oxh0;->b:Ll/f2e0;

    .line 16
    .line 17
    return-object p0
.end method

.method public static n(Ll/e7m;)Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/e7m;",
            ")",
            "Ll/qcj<",
            "Ll/f2e0;",
            "Ll/f2e0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/oxh0;->c:Ll/qcj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nxh0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/nxh0;-><init>(Ll/e7m;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/oxh0;->c:Ll/qcj;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Ll/oxh0;->c:Ll/qcj;

    .line 13
    .line 14
    return-object p0
.end method
