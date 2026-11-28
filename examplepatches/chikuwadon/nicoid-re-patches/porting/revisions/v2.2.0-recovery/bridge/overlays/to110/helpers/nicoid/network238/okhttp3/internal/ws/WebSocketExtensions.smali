.class public final Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0016\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u0000 \u001d2\u00020\u0001:\u0001\u001dBG\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000e\u0010\r\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u0003J\t\u0010\u000f\u001a\u00020\u0003H\u00c6\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003\u00a2\u0006\u0002\u0010\u0011J\t\u0010\u0012\u001a\u00020\u0003H\u00c6\u0003J\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003\u00a2\u0006\u0002\u0010\u0011J\t\u0010\u0014\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0015\u001a\u00020\u0003H\u00c6\u0003JN\u0010\u0016\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00032\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00032\u0008\u0008\u0002\u0010\t\u001a\u00020\u0003H\u00c6\u0001\u00a2\u0006\u0002\u0010\u0017J\u0013\u0010\u0018\u001a\u00020\u00032\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u001a\u001a\u00020\u0005H\u00d6\u0001J\t\u0010\u001b\u001a\u00020\u001cH\u00d6\u0001R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000cR\u0010\u0010\u0006\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000cR\u0010\u0010\u0008\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;",
        "",
        "perMessageDeflate",
        "",
        "clientMaxWindowBits",
        "",
        "clientNoContextTakeover",
        "serverMaxWindowBits",
        "serverNoContextTakeover",
        "unknownValues",
        "<init>",
        "(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZ)V",
        "Ljava/lang/Integer;",
        "noContextTakeover",
        "clientOriginated",
        "component1",
        "component2",
        "()Ljava/lang/Integer;",
        "component3",
        "component4",
        "component5",
        "component6",
        "copy",
        "(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZ)Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;",
        "equals",
        "other",
        "hashCode",
        "toString",
        "",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;

.field private static final HEADER_WEB_SOCKET_EXTENSION:Ljava/lang/String; = "Sec-WebSocket-Extensions"


# instance fields
.field public final clientMaxWindowBits:Ljava/lang/Integer;

.field public final clientNoContextTakeover:Z

.field public final perMessageDeflate:Z

.field public final serverMaxWindowBits:Ljava/lang/Integer;

.field public final serverNoContextTakeover:Z

.field public final unknownValues:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->Companion:Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;

    return-void
.end method

.method public constructor <init>()V
    .registers 10

    const/16 v7, 0x3f

    const/4 v8, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;-><init>(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZ)V
    .registers 7

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    .line 65
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientMaxWindowBits:Ljava/lang/Integer;

    .line 67
    iput-boolean p3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientNoContextTakeover:Z

    .line 69
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverMaxWindowBits:Ljava/lang/Integer;

    .line 71
    iput-boolean p5, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverNoContextTakeover:Z

    .line 76
    iput-boolean p6, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->unknownValues:Z

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 11

    and-int/lit8 p8, p7, 0x1

    const/4 v0, 0x0

    if-eqz p8, :cond_0

    move p1, v0

    :cond_0
    and-int/lit8 p8, p7, 0x2

    const/4 v1, 0x0

    if-eqz p8, :cond_1

    move-object p2, v1

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    move p3, v0

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    move-object p4, v1

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    move p5, v0

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    move p7, v0

    goto :goto_0

    :cond_5
    move p7, p6

    .line 61
    :goto_0
    move p6, p5

    move-object p5, p4

    move p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    invoke-direct/range {p1 .. p7}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;-><init>(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZ)V

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;ZLjava/lang/Integer;ZLjava/lang/Integer;ZZILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;
    .registers 9

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientMaxWindowBits:Ljava/lang/Integer;

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    iget-boolean p3, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientNoContextTakeover:Z

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    iget-object p4, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverMaxWindowBits:Ljava/lang/Integer;

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    iget-boolean p5, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverNoContextTakeover:Z

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    iget-boolean p6, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->unknownValues:Z

    :cond_5
    move p7, p5

    move p8, p6

    move p5, p3

    move-object p6, p4

    move p3, p1

    move-object p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p8}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->copy(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZ)Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .registers 2

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    return v0
.end method

.method public final component2()Ljava/lang/Integer;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientMaxWindowBits:Ljava/lang/Integer;

    return-object v0
.end method

.method public final component3()Z
    .registers 2

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientNoContextTakeover:Z

    return v0
.end method

.method public final component4()Ljava/lang/Integer;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverMaxWindowBits:Ljava/lang/Integer;

    return-object v0
.end method

.method public final component5()Z
    .registers 2

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverNoContextTakeover:Z

    return v0
.end method

.method public final component6()Z
    .registers 2

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->unknownValues:Z

    return v0
.end method

.method public final copy(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZ)Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;
    .registers 14

    new-instance v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    move v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;-><init>(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZ)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    iget-boolean v1, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientMaxWindowBits:Ljava/lang/Integer;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientMaxWindowBits:Ljava/lang/Integer;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientNoContextTakeover:Z

    iget-boolean v1, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientNoContextTakeover:Z

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverMaxWindowBits:Ljava/lang/Integer;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverMaxWindowBits:Ljava/lang/Integer;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverNoContextTakeover:Z

    iget-boolean v1, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverNoContextTakeover:Z

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->unknownValues:Z

    iget-boolean p1, p1, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->unknownValues:Z

    if-eq v0, p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public hashCode()I
    .registers 4

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientMaxWindowBits:Ljava/lang/Integer;

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

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientNoContextTakeover:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverMaxWindowBits:Ljava/lang/Integer;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverNoContextTakeover:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->unknownValues:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final noContextTakeover(Z)Z
    .registers 2

    if-eqz p1, :cond_0

    .line 80
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientNoContextTakeover:Z

    return p1

    .line 82
    :cond_0
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverNoContextTakeover:Z

    return p1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WebSocketExtensions(perMessageDeflate="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->perMessageDeflate:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", clientMaxWindowBits="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientMaxWindowBits:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", clientNoContextTakeover="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->clientNoContextTakeover:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", serverMaxWindowBits="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverMaxWindowBits:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", serverNoContextTakeover="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->serverNoContextTakeover:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", unknownValues="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->unknownValues:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
