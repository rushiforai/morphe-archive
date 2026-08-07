.class public Ll/y360$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y360$a;->g(Lrx/c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/c;

.field public final synthetic b:Ll/y360$a;


# direct methods
.method public constructor <init>(Ll/y360$a;Lrx/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y360$a$a;->a:Lrx/c;

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
    iget-object v0, p0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/y360$a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/y360$a$a$a;

    .line 9
    .line 10
    invoke-direct {v0, p0, p0}, Ll/y360$a$a$a;-><init>(Ll/y360$a$a;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/y360$a$a;->b:Ll/y360$a;

    .line 14
    .line 15
    iget-object v1, v1, Ll/y360$a;->h:Ll/wqe0;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/y360$a$a;->a:Lrx/c;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method
