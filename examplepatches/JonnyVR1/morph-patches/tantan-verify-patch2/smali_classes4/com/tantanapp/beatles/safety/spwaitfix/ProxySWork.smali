.class public Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;
.super Ljava/util/LinkedList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/LinkedList<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final aboveAndroid12Processor:Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;

.field private final proxy:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final sHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Ljava/util/LinkedList;Landroid/os/Looper;Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList<",
            "TT;>;",
            "Landroid/os/Looper;",
            "Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->proxy:Ljava/util/LinkedList;

    .line 5
    .line 6
    new-instance p1, Landroid/os/Handler;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->sHandler:Landroid/os/Handler;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->aboveAndroid12Processor:Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;

    .line 14
    .line 15
    return-void
.end method

.method private delegateWork()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->proxy:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->proxy:Ljava/util/LinkedList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/LinkedList;->clone()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/util/LinkedList;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->proxy:Ljava/util/LinkedList;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->sHandler:Landroid/os/Handler;

    .line 24
    .line 25
    new-instance v2, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$a;

    .line 26
    .line 27
    invoke-direct {v2, p0, v0}, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$a;-><init>(Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;Ljava/util/LinkedList;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->proxy:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->proxy:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->delegateWork()V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ljava/util/LinkedList;

    .line 11
    .line 12
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->proxy:Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/LinkedList;->clone()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public isEmpty()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public size()I
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->delegateWork()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->aboveAndroid12Processor:Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;->a()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;->proxy:Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/util/LinkedList;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method
