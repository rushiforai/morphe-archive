.class public Ll/jo50$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jo50;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Lrx/subjects/a;

.field public final synthetic c:Ll/xk90;

.field public final synthetic d:Ljava/util/concurrent/atomic/AtomicLong;

.field public final synthetic e:Ll/wqe0;

.field public final synthetic f:Ll/jo50;


# direct methods
.method public constructor <init>(Ll/jo50;Ll/gcg0;Lrx/subjects/a;Ll/xk90;Ljava/util/concurrent/atomic/AtomicLong;Ll/wqe0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jo50$b;->f:Ll/jo50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jo50$b;->a:Ll/gcg0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/jo50$b;->b:Lrx/subjects/a;

    .line 6
    .line 7
    iput-object p4, p0, Ll/jo50$b;->c:Ll/xk90;

    .line 8
    .line 9
    iput-object p5, p0, Ll/jo50$b;->d:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    iput-object p6, p0, Ll/jo50$b;->e:Ll/wqe0;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jo50$b;->a:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ll/jo50$b$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/jo50$b$a;-><init>(Ll/jo50$b;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/jo50$b;->e:Ll/wqe0;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/jo50$b;->f:Ll/jo50;

    .line 21
    .line 22
    iget-object p0, p0, Ll/jo50;->a:Lrx/c;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method
