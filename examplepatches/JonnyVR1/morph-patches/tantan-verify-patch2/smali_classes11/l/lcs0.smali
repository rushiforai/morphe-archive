.class public final Ll/lcs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/u6s0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public b:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final c:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ll/kbt0;->b:Ljava/util/concurrent/ExecutorService;

    iput-object v0, p0, Ll/lcs0;->c:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/kbt0;->b:Ljava/util/concurrent/ExecutorService;

    .line 5
    .line 6
    iput-object v0, p0, Ll/lcs0;->c:Ljava/util/concurrent/ExecutorService;

    .line 7
    .line 8
    new-instance v1, Ll/gcs0;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/gcs0;-><init>(Ll/lcs0;Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Ll/lcs0;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lcs0;->c:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method
