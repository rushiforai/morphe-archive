.class public final Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;
.super Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Log"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u000e\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008\u0086\u0008\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0002\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u0013\u001a\u00020\u0008H\u00c6\u0003J1\u0010\u0014\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008H\u00c6\u0001J\u0013\u0010\u0015\u001a\u00020\u00082\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u00d6\u0003J\t\u0010\u0018\u001a\u00020\u0006H\u00d6\u0001J\t\u0010\u0019\u001a\u00020\u0003H\u00d6\u0001R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\rR\u0011\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u000f\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;",
        "Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;",
        "host",
        "",
        "ip",
        "code",
        "",
        "isHttpDns",
        "",
        "(Ljava/lang/String;Ljava/lang/String;IZ)V",
        "getCode",
        "()I",
        "getHost",
        "()Ljava/lang/String;",
        "getIp",
        "()Z",
        "component1",
        "component2",
        "component3",
        "component4",
        "copy",
        "equals",
        "other",
        "",
        "hashCode",
        "toString",
        "mmdns_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field private final code:I

.field private final host:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final ip:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final isHttpDns:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, v0}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->host:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->ip:Ljava/lang/String;

    .line 14
    .line 15
    iput p3, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->code:I

    .line 16
    .line 17
    iput-boolean p4, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns:Z

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic copy$default(Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;Ljava/lang/String;Ljava/lang/String;IZILjava/lang/Object;)Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;
    .locals 0

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    iget-object p1, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->host:Ljava/lang/String;

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    iget-object p2, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->ip:Ljava/lang/String;

    :cond_1
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_2

    iget p3, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->code:I

    :cond_2
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_3

    iget-boolean p4, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns:Z

    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->copy(Ljava/lang/String;Ljava/lang/String;IZ)Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->host:Ljava/lang/String;

    return-object p0
.end method

.method public final component2()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->ip:Ljava/lang/String;

    return-object p0
.end method

.method public final component3()I
    .locals 0

    iget p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->code:I

    return p0
.end method

.method public final component4()Z
    .locals 0

    iget-boolean p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns:Z

    return p0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;IZ)Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;-><init>(Ljava/lang/String;Ljava/lang/String;IZ)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    iget-object v0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->host:Ljava/lang/String;

    iget-object v1, p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->host:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->ip:Ljava/lang/String;

    iget-object v1, p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->ip:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->code:I

    iget v1, p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->code:I

    if-ne v0, v1, :cond_0

    iget-boolean p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns:Z

    iget-boolean p1, p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns:Z

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public final getHost()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->host:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getIp()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->ip:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->host:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->ip:Ljava/lang/String;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->code:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns:Z

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    :cond_2
    add-int/2addr v0, p0

    return v0
.end method

.method public final isHttpDns()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Log(host="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", ip="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->ip:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", isHttpDns="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns:Z

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
