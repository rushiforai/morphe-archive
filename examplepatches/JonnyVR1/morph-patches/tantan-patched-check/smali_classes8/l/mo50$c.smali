.class public Ll/mo50$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mo50;->b(Ll/ft5;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ft5;

.field public final synthetic b:Ll/mo50;


# direct methods
.method public constructor <init>(Ll/mo50;Ll/ft5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mo50$c;->b:Ll/mo50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mo50$c;->a:Ll/ft5;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mo50$c;->b:Ll/mo50;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mo50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Ll/mo50$c;->b:Ll/mo50;

    .line 9
    .line 10
    iget-object v0, v0, Ll/mo50;->b:Ll/ft5;

    .line 11
    .line 12
    iget-object v1, p0, Ll/mo50$c;->a:Ll/ft5;

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/mo50$c;->b:Ll/mo50;

    .line 17
    .line 18
    iget-object v0, v0, Ll/mo50;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/mo50$c;->b:Ll/mo50;

    .line 27
    .line 28
    iget-object v0, v0, Ll/mo50;->b:Ll/ft5;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/ft5;->unsubscribe()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/mo50$c;->b:Ll/mo50;

    .line 34
    .line 35
    new-instance v1, Ll/ft5;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/ft5;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v1, v0, Ll/mo50;->b:Ll/ft5;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/mo50$c;->b:Ll/mo50;

    .line 46
    .line 47
    iget-object p0, p0, Ll/mo50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :goto_1
    iget-object p0, p0, Ll/mo50$c;->b:Ll/mo50;

    .line 54
    .line 55
    iget-object p0, p0, Ll/mo50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 58
    .line 59
    .line 60
    throw v0
.end method
