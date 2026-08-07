.class public Ll/t9t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bb50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/bb50<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:[Ljava/lang/StackTraceElement;

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "TT;>;"
        }
    .end annotation
.end field

.field public d:Ll/x20;

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/bb50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bb50<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Ljava/lang/StackTraceElement;)V
    .locals 1
    .param p1    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 23
    new-instance v0, Ll/s9t;

    invoke-direct {v0}, Ll/s9t;-><init>()V

    invoke-direct {p0, p1, v0}, Ll/t9t;-><init>([Ljava/lang/StackTraceElement;Ll/y20;)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;Ll/bb50;)V
    .locals 1
    .param p1    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/StackTraceElement;",
            "Ll/bb50<",
            "TT;>;)V"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ll/t9t;->a:Ljava/lang/String;

    .line 28
    iput-object p1, p0, Ll/t9t;->b:[Ljava/lang/StackTraceElement;

    .line 29
    iput-object p2, p0, Ll/t9t;->f:Ll/bb50;

    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;Ll/y20;)V
    .locals 1
    .param p1    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/StackTraceElement;",
            "Ll/y20<",
            "TT;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p1, p2, v0}, Ll/t9t;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)V
    .locals 1
    .param p1    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/StackTraceElement;",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, p2, p3, v0}, Ll/t9t;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;)V
    .locals 1
    .param p1    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/StackTraceElement;",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/t9t;->a:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, p0, Ll/t9t;->b:[Ljava/lang/StackTraceElement;

    .line 15
    .line 16
    iput-object p2, p0, Ll/t9t;->c:Ll/y20;

    .line 17
    .line 18
    iput-object p4, p0, Ll/t9t;->d:Ll/x20;

    .line 19
    .line 20
    iput-object p3, p0, Ll/t9t;->e:Ll/y20;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static b([Ljava/lang/StackTraceElement;)Ll/t9t;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
            ")",
            "Ll/t9t<",
            "TN;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/t9t;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/t9t;-><init>([Ljava/lang/StackTraceElement;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c([Ljava/lang/StackTraceElement;Ll/y20;)Ll/t9t;
    .locals 1
    .param p0    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
            "Ll/y20<",
            "TN;>;)",
            "Ll/t9t<",
            "TN;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/t9t;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/t9t;-><init>([Ljava/lang/StackTraceElement;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static d([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)Ll/t9t;
    .locals 1
    .param p0    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
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
    new-instance v0, Ll/t9t;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/t9t;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static e([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;
    .locals 1
    .param p0    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
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
    new-instance v0, Ll/t9t;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/t9t;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static f([Ljava/lang/StackTraceElement;Ll/bb50;)Ll/t9t;
    .locals 1
    .param p0    # [Ljava/lang/StackTraceElement;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/bb50;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
            "Ll/bb50<",
            "TT;>;)",
            "Ll/t9t<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/t9t;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/t9t;-><init>([Ljava/lang/StackTraceElement;Ll/bb50;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private g(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lrx/exceptions/MissingBackpressureException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p1, Lrx/exceptions/MissingBackpressureException;

    .line 6
    .line 7
    const-string v0, "find a missing back pressure exception from observer id"

    .line 8
    .line 9
    invoke-direct {p1, v0}, Lrx/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/t9t;->b:[Ljava/lang/StackTraceElement;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Ll/t9t;->e:Ll/y20;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t9t;->f:Ll/bb50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/t9t;->d:Ll/x20;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/t9t;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/t9t;->f:Ll/bb50;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Ll/t9t;->e:Ll/y20;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/t9t;->f:Ll/bb50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/t9t;->c:Ll/y20;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method
