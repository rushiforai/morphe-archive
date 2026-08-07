.class public Ll/o460$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o460$a;->f(Ll/vk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicLong;

.field public final synthetic b:Ll/vk90;

.field public final synthetic c:Ll/o460$a;


# direct methods
.method public constructor <init>(Ll/o460$a;Ll/vk90;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/o460$a$a;->c:Ll/o460$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o460$a$a;->b:Ll/vk90;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    invoke-direct {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/o460$a$a;->a:Ljava/util/concurrent/atomic/AtomicLong;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 9

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-lez v2, :cond_2

    .line 6
    .line 7
    iget-object v2, p0, Ll/o460$a$a;->c:Ll/o460$a;

    .line 8
    .line 9
    iget-boolean v2, v2, Ll/o460$a;->f:Z

    .line 10
    .line 11
    if-nez v2, :cond_2

    .line 12
    .line 13
    :cond_0
    iget-object v2, p0, Ll/o460$a$a;->a:Ljava/util/concurrent/atomic/AtomicLong;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    iget-object v4, p0, Ll/o460$a$a;->c:Ll/o460$a;

    .line 20
    .line 21
    iget-object v4, v4, Ll/o460$a;->h:Ll/o460;

    .line 22
    .line 23
    iget v4, v4, Ll/o460;->a:I

    .line 24
    .line 25
    int-to-long v4, v4

    .line 26
    sub-long/2addr v4, v2

    .line 27
    invoke-static {p1, p2, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    cmp-long v6, v4, v0

    .line 32
    .line 33
    if-nez v6, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v6, p0, Ll/o460$a$a;->a:Ljava/util/concurrent/atomic/AtomicLong;

    .line 37
    .line 38
    add-long v7, v2, v4

    .line 39
    .line 40
    invoke-virtual {v6, v2, v3, v7, v8}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Ll/o460$a$a;->b:Ll/vk90;

    .line 47
    .line 48
    invoke-interface {p0, v4, v5}, Ll/vk90;->request(J)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method
