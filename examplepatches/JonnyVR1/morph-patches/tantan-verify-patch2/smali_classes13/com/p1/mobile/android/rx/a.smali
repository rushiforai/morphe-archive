.class public Lcom/p1/mobile/android/rx/a;
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

.field public f:Z

.field public g:Ll/bb50;
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

    .line 33
    new-instance v0, Ll/i1d0;

    invoke-direct {v0}, Ll/i1d0;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/y20;)V

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

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/android/rx/a;->a:Ljava/lang/String;

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/android/rx/a;->b:[Ljava/lang/StackTraceElement;

    .line 28
    iput-object p2, p0, Lcom/p1/mobile/android/rx/a;->g:Ll/bb50;

    const/4 p1, 0x1

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/android/rx/a;->f:Z

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

    .line 30
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)V
    .locals 6
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

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 31
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;Z)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;Z)V
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
            "Z)V"
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
    iput-object v0, p0, Lcom/p1/mobile/android/rx/a;->a:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/android/rx/a;->b:[Ljava/lang/StackTraceElement;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/android/rx/a;->c:Ll/y20;

    .line 17
    .line 18
    iput-object p4, p0, Lcom/p1/mobile/android/rx/a;->d:Ll/x20;

    .line 19
    .line 20
    iput-object p3, p0, Lcom/p1/mobile/android/rx/a;->e:Ll/y20;

    .line 21
    .line 22
    iput-boolean p5, p0, Lcom/p1/mobile/android/rx/a;->f:Z

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Z)V
    .locals 6
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
            ">;Z)V"
        }
    .end annotation

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    .line 32
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;Z)V

    return-void
.end method

.method public static synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c([Ljava/lang/StackTraceElement;)Lcom/p1/mobile/android/rx/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
            ")",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/android/rx/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static d([Ljava/lang/StackTraceElement;Ll/y20;)Lcom/p1/mobile/android/rx/a;
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
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
            "Ll/y20<",
            "TT;>;)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/android/rx/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static e([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;
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
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/android/rx/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static f([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;Z)Lcom/p1/mobile/android/rx/a;
    .locals 6
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
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/x20;",
            "Z)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/android/rx/a;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Ll/x20;Z)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static g([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;
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
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/StackTraceElement;",
            "Ll/y20<",
            "TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;Z)",
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/android/rx/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/y20;Ll/y20;Z)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static h([Ljava/lang/StackTraceElement;Ll/bb50;)Lcom/p1/mobile/android/rx/a;
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
            "Lcom/p1/mobile/android/rx/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/android/rx/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/android/rx/a;-><init>([Ljava/lang/StackTraceElement;Ll/bb50;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/android/rx/RxException;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/rx/RxException;-><init>(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/rx/a;->g:Ll/bb50;

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
    iget-object p0, p0, Lcom/p1/mobile/android/rx/a;->d:Ll/x20;

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
    .locals 3

    .line 1
    instance-of v0, p1, Lrx/exceptions/MissingBackpressureException;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/rx/a;->b:[Ljava/lang/StackTraceElement;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget-object v0, v0, v1

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v0, Lcom/p1/mobile/android/rx/MissingBackpressureThrowable;

    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/rx/MissingBackpressureThrowable;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/android/rx/a;->b:[Ljava/lang/StackTraceElement;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Lcom/p1/mobile/android/rx/MissingBackpressureThrowable;

    .line 28
    .line 29
    invoke-direct {v2, v1}, Lcom/p1/mobile/android/rx/MissingBackpressureThrowable;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    new-instance v2, Ljava/lang/Throwable;

    .line 44
    .line 45
    invoke-direct {v2, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/android/rx/a;->b:[Ljava/lang/StackTraceElement;

    .line 49
    .line 50
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/rx/a;->g:Ll/bb50;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    iget-boolean p1, p0, Lcom/p1/mobile/android/rx/a;->f:Z

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/rx/a;->i(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/android/rx/a;->e:Ll/y20;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    iget-boolean p1, p0, Lcom/p1/mobile/android/rx/a;->f:Z

    .line 76
    .line 77
    if-eqz p1, :cond_3

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/rx/a;->i(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    return-void

    .line 83
    :cond_4
    new-instance p0, Ll/h1d0;

    .line 84
    .line 85
    invoke-direct {p0, v2}, Ll/h1d0;-><init>(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 89
    .line 90
    .line 91
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
    iget-object v0, p0, Lcom/p1/mobile/android/rx/a;->g:Ll/bb50;

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
    iget-object p0, p0, Lcom/p1/mobile/android/rx/a;->c:Ll/y20;

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
