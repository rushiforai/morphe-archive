.class public Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/block/BlockBaseStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public volatile a:J

.field public b:J

.field public c:Ljava/lang/String;

.field public d:[Ljava/lang/StackTraceElement;

.field public e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

.field public f:Ljava/lang/String;

.field public final synthetic g:Lcom/tantanapp/beatles/block/BlockBaseStrategy;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->g:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->ORIGIN:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->ORIGIN:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 11
    .line 12
    const-string v1, "UNKNOWN"

    .line 13
    .line 14
    iput-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->f:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d:[Ljava/lang/StackTraceElement;

    .line 17
    .line 18
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public c([Ljava/lang/StackTraceElement;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d:[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->g:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 2
    .line 3
    iget-wide v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 4
    .line 5
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 6
    .line 7
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 4
    .line 5
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startTime:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " endTime:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " scene:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "stacktrace:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d:[Ljava/lang/StackTraceElement;

    .line 39
    .line 40
    invoke-static {v1}, Ll/e1g0;->a([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, "level:"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method
