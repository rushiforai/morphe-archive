.class public final Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ConnectResult"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\t\u0010\u0011\u001a\u00020\u0003H\u00c6\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0006H\u00c6\u0003J+\u0010\u0014\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u00c6\u0001J\u0013\u0010\u0015\u001a\u00020\u000f2\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0017\u001a\u00020\u0018H\u00d6\u0001J\t\u0010\u0019\u001a\u00020\u001aH\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u000f8F\u00a2\u0006\u0006\u001a\u0004\u0008\u000e\u0010\u0010\u00a8\u0006\u001b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;",
        "",
        "plan",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "nextPlan",
        "throwable",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;)V",
        "getPlan",
        "()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "getNextPlan",
        "getThrowable",
        "()Ljava/lang/Throwable;",
        "isSuccess",
        "",
        "()Z",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

.field private final plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

.field private final throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    .line 112
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    .line 113
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 7

    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move-object p2, v0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move-object p3, v0

    .line 110
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->copy(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;)Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    return-object v0
.end method

.method public final component2()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    return-object v0
.end method

.method public final component3()Ljava/lang/Throwable;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public final copy(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;)Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    invoke-direct {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public final getNextPlan()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .registers 2

    .line 112
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    return-object v0
.end method

.method public final getPlan()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .registers 2

    .line 111
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    return-object v0
.end method

.method public final getThrowable()Ljava/lang/Throwable;
    .registers 2

    .line 113
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_1
    add-int/2addr v0, v2

    return v0
.end method

.method public final isSuccess()Z
    .registers 2

    .line 116
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    if-nez v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ConnectResult(plan="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->plan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", nextPlan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->nextPlan:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", throwable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->throwable:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
