.class public Ll/av80;
.super Ljava/util/concurrent/FutureTask;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask<",
        "Ljava/lang/Runnable;",
        ">;",
        "Ljava/lang/Comparable<",
        "Ll/av80;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/Runnable;

.field private final b:J


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;J)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Ll/av80;->a:Ljava/lang/Runnable;

    .line 6
    .line 7
    iput-wide p2, p0, Ll/av80;->b:J

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ll/av80;)I
    .locals 5

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p0, Ll/av80;->a:Ljava/lang/Runnable;

    .line 6
    .line 7
    instance-of v1, v0, Ll/hv80;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    check-cast v0, Ll/hv80;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/hv80;->a()Lcom/immomo/medialog/thread/Priority;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    sget-object v0, Lcom/immomo/medialog/thread/Priority;->LOW:Lcom/immomo/medialog/thread/Priority;

    .line 19
    .line 20
    :goto_0
    iget-object v1, p1, Ll/av80;->a:Ljava/lang/Runnable;

    .line 21
    .line 22
    instance-of v2, v1, Ll/hv80;

    .line 23
    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    check-cast v1, Ll/hv80;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/hv80;->a()Lcom/immomo/medialog/thread/Priority;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    goto :goto_1

    .line 33
    :cond_2
    sget-object v1, Lcom/immomo/medialog/thread/Priority;->LOW:Lcom/immomo/medialog/thread/Priority;

    .line 34
    .line 35
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x1

    .line 44
    if-ge v2, v3, :cond_3

    .line 45
    .line 46
    return v4

    .line 47
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v2, -0x1

    .line 56
    if-le v0, v1, :cond_4

    .line 57
    .line 58
    return v2

    .line 59
    :cond_4
    iget-wide v0, p0, Ll/av80;->b:J

    .line 60
    .line 61
    iget-wide p0, p1, Ll/av80;->b:J

    .line 62
    .line 63
    cmp-long p0, v0, p0

    .line 64
    .line 65
    if-gez p0, :cond_5

    .line 66
    .line 67
    return v2

    .line 68
    :cond_5
    return v4
.end method

.method public b()Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/av80;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/av80;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/av80;->a(Ll/av80;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
