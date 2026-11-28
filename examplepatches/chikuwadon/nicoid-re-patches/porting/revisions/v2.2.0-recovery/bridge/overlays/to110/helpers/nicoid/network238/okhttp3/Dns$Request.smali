.class public final Lnicoid/network238/okhttp3/Dns$Request;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Dns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Request"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u001b\u0008\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0013\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\r\u001a\u00020\u0005H\u0016J\u0008\u0010\u000e\u001a\u00020\u0003H\u0016R\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0008R\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\t\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Dns$Request;",
        "",
        "hostname",
        "",
        "port",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "()Ljava/lang/String;",
        "()I",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
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
.field private final hostname:Ljava/lang/String;

.field private final port:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, p1, v2, v0, v1}, Lnicoid/network238/okhttp3/Dns$Request;-><init>(Ljava/lang/String;IILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    iput-object v0, p0, Lnicoid/network238/okhttp3/Dns$Request;->hostname:Ljava/lang/String;

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    const/16 p2, 0x1bb

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    if-gt p1, p2, :cond_1

    const/high16 p1, 0x10000

    if-ge p2, p1, :cond_1

    .line 126
    :goto_0
    iput p2, p0, Lnicoid/network238/okhttp3/Dns$Request;->port:I

    return-void

    .line 129
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unexpected port: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 115
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unexpected hostname: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, -0x1

    .line 96
    :cond_0
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/Dns$Request;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 132
    instance-of v0, p1, Lnicoid/network238/okhttp3/Dns$Request;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/Dns$Request;

    iget-object v0, p1, Lnicoid/network238/okhttp3/Dns$Request;->hostname:Ljava/lang/String;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Request;->hostname:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget p1, p1, Lnicoid/network238/okhttp3/Dns$Request;->port:I

    iget v0, p0, Lnicoid/network238/okhttp3/Dns$Request;->port:I

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .registers 3

    .line 134
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Request;->hostname:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/okhttp3/Dns$Request;->port:I

    add-int/2addr v0, v1

    return v0
.end method

.method public final hostname()Ljava/lang/String;
    .registers 2

    .line 113
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Request;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public final port()I
    .registers 2

    .line 125
    iget v0, p0, Lnicoid/network238/okhttp3/Dns$Request;->port:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 137
    iget v0, p0, Lnicoid/network238/okhttp3/Dns$Request;->port:I

    .line 139
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Request;->hostname:Ljava/lang/String;

    const/16 v2, 0x1bb

    if-ne v0, v2, :cond_0

    return-object v1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/Dns$Request;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
