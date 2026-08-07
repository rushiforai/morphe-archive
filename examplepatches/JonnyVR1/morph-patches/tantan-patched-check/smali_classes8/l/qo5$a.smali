.class public Ll/qo5$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/b$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qo5;->a(Lrx/b$j;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ft5;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic c:Lrx/b$j;

.field public final synthetic d:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic e:Ll/qo5;


# direct methods
.method public constructor <init>(Ll/qo5;Ll/ft5;Ljava/util/concurrent/atomic/AtomicBoolean;Lrx/b$j;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qo5$a;->e:Ll/qo5;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qo5$a;->a:Ll/ft5;

    .line 4
    .line 5
    iput-object p3, p0, Ll/qo5$a;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 6
    .line 7
    iput-object p4, p0, Ll/qo5$a;->c:Lrx/b$j;

    .line 8
    .line 9
    iput-object p5, p0, Ll/qo5$a;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qo5$a;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/qo5$a;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/qo5$a;->c:Lrx/b$j;

    .line 20
    .line 21
    invoke-interface {p0}, Lrx/b$j;->onCompleted()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qo5$a;->a:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qo5$a;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/qo5$a;->c:Lrx/b$j;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Lrx/b$j;->onError(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onSubscribe(Ll/kcg0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qo5$a;->a:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
