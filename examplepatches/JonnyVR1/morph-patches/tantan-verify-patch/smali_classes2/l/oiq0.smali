.class public Ll/oiq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k1j;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field public static final d:Ljava/lang/String;


# instance fields
.field public final a:Ll/zni0;

.field public final b:Ll/j1j;

.field public final c:Ll/njq0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "WMFgUpdater"

    .line 2
    .line 3
    invoke-static {v0}, Ll/qzv;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/oiq0;->d:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroidx/work/impl/WorkDatabase;Ll/j1j;Ll/zni0;)V
    .locals 0
    .param p1    # Landroidx/work/impl/WorkDatabase;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/j1j;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/zni0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LambdaLast"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/oiq0;->b:Ll/j1j;

    .line 5
    .line 6
    iput-object p3, p0, Ll/oiq0;->a:Ll/zni0;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Ll/njq0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/oiq0;->c:Ll/njq0;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic b(Ll/oiq0;Ljava/util/UUID;Ll/i1j;Landroid/content/Context;)Ljava/lang/Void;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Ll/oiq0;->c:Ll/njq0;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ll/njq0;->v(Ljava/lang/String;)Ll/mjq0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v2, v0, Ll/mjq0;->b:Landroidx/work/WorkInfo$State;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroidx/work/WorkInfo$State;->isFinished()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/oiq0;->b:Ll/j1j;

    .line 26
    .line 27
    invoke-interface {p0, p1, p2}, Ll/j1j;->a(Ljava/lang/String;Ll/i1j;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/tjq0;->a(Ll/mjq0;)Ll/piq0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p3, p0, p2}, Landroidx/work/impl/foreground/a;->d(Landroid/content/Context;Ll/piq0;Ll/i1j;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p3, p0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_0
    const-string p0, "Calls to setForegroundAsync() must complete before a ListenableWorker signals completion of work by returning an instance of Result."

    .line 43
    .line 44
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-object v1
.end method


# virtual methods
.method public a(Landroid/content/Context;Ljava/util/UUID;Ll/i1j;)Ll/hpr;
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/i1j;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/UUID;",
            "Ll/i1j;",
            ")",
            "Ll/hpr<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/oiq0;->a:Ll/zni0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/zni0;->d()Ll/tqe0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/niq0;

    .line 8
    .line 9
    invoke-direct {v1, p0, p2, p3, p1}, Ll/niq0;-><init>(Ll/oiq0;Ljava/util/UUID;Ll/i1j;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    const-string p0, "setForegroundAsync"

    .line 13
    .line 14
    invoke-static {v0, p0, v1}, Landroidx/work/ListenableFutureKt;->f(Ljava/util/concurrent/Executor;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Ll/hpr;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
