.class public Ll/jo50$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jo50;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicLong;

.field public final synthetic b:Ll/xk90;

.field public final synthetic c:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic d:Ll/f2e0$a;

.field public final synthetic e:Ll/x20;

.field public final synthetic f:Ll/jo50;


# direct methods
.method public constructor <init>(Ll/jo50;Ljava/util/concurrent/atomic/AtomicLong;Ll/xk90;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/f2e0$a;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jo50$e;->f:Ll/jo50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jo50$e;->a:Ljava/util/concurrent/atomic/AtomicLong;

    .line 4
    .line 5
    iput-object p3, p0, Ll/jo50$e;->b:Ll/xk90;

    .line 6
    .line 7
    iput-object p4, p0, Ll/jo50$e;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    iput-object p5, p0, Ll/jo50$e;->d:Ll/f2e0$a;

    .line 10
    .line 11
    iput-object p6, p0, Ll/jo50$e;->e:Ll/x20;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/jo50$e;->a:Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    invoke-static {v0, p1, p2}, Ll/rc2;->b(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/jo50$e;->b:Ll/xk90;

    .line 13
    .line 14
    invoke-virtual {v0, p1, p2}, Ll/xk90;->request(J)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/jo50$e;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, p2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/jo50$e;->d:Ll/f2e0$a;

    .line 28
    .line 29
    iget-object p0, p0, Ll/jo50$e;->e:Ll/x20;

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
