.class public final Ll/kj40;
.super Ll/f2e0;
.source "SourceFile"


# instance fields
.field public final b:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kj40;->b:Ljava/util/concurrent/ThreadFactory;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public createWorker()Ll/f2e0$a;
    .locals 1

    .line 1
    new-instance v0, Ll/lj40;

    .line 2
    .line 3
    iget-object p0, p0, Ll/kj40;->b:Ljava/util/concurrent/ThreadFactory;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/lj40;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
