.class public final Ll/r4u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xqy0;


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ll/s26;

.field public final c:Ll/m1z0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ll/s26;Ll/m1z0;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/s26;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/m1z0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r4u0;->a:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-object p2, p0, Ll/r4u0;->b:Ll/s26;

    .line 7
    .line 8
    iput-object p3, p0, Ll/r4u0;->c:Ll/m1z0;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic b(Ll/r4u0;)Ll/s26;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r4u0;->b:Ll/s26;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic c(Ll/r4u0;)Ll/m1z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r4u0;->c:Ll/m1z0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/tasks/Task;)V
    .locals 1
    .param p1    # Lcom/google/android/gms/tasks/Task;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/f6t0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/f6t0;-><init>(Ll/r4u0;Lcom/google/android/gms/tasks/Task;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/r4u0;->a:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
