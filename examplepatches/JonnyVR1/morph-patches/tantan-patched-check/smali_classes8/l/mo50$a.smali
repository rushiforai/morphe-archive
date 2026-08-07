.class public Ll/mo50$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mo50;->d(Ll/gcg0;Ljava/util/concurrent/atomic/AtomicBoolean;)Ll/y20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/kcg0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic c:Ll/mo50;


# direct methods
.method public constructor <init>(Ll/mo50;Ll/gcg0;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mo50$a;->c:Ll/mo50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mo50$a;->a:Ll/gcg0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/mo50$a;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/kcg0;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/mo50$a;->c:Ll/mo50;

    .line 3
    .line 4
    iget-object v1, v1, Ll/mo50;->b:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/mo50$a;->c:Ll/mo50;

    .line 10
    .line 11
    iget-object v1, p0, Ll/mo50$a;->a:Ll/gcg0;

    .line 12
    .line 13
    iget-object v2, p1, Ll/mo50;->b:Ll/ft5;

    .line 14
    .line 15
    invoke-virtual {p1, v1, v2}, Ll/mo50;->c(Ll/gcg0;Ll/ft5;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/mo50$a;->c:Ll/mo50;

    .line 19
    .line 20
    iget-object p1, p1, Ll/mo50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/mo50$a;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    iget-object v1, p0, Ll/mo50$a;->c:Ll/mo50;

    .line 33
    .line 34
    iget-object v1, v1, Ll/mo50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/mo50$a;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 42
    .line 43
    .line 44
    throw p1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mo50$a;->a(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
