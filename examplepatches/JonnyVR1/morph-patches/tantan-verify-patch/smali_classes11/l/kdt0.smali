.class public Ll/kdt0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/tct0;

.field public final b:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tct0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/tct0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/kdt0;->a:Ll/tct0;

    .line 10
    .line 11
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/kdt0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    new-instance v1, Ll/yct0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/yct0;-><init>(Ll/kdt0;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Ll/oct0;->f:Ll/xvw0;

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static bridge synthetic b(Ll/kdt0;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kdt0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kdt0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final c()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/Exception;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/kdt0;->a:Ll/tct0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d(Ljava/lang/Object;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kdt0;->a:Ll/tct0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(Ll/xct0;Ll/vct0;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/jdt0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/jdt0;-><init>(Ll/kdt0;Ll/xct0;Ll/vct0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/kdt0;->a:Ll/tct0;

    .line 7
    .line 8
    sget-object p1, Ll/oct0;->f:Ll/xvw0;

    .line 9
    .line 10
    invoke-static {p0, v0, p1}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
