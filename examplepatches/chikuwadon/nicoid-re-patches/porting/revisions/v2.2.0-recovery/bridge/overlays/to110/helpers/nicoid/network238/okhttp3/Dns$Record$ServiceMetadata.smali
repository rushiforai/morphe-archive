.class public final Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;
.super Lnicoid/network238/okhttp3/Dns$Record;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Dns$Record;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ServiceMetadata"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001BG\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0010\u0008\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008\u0012\u000e\u0008\u0002\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0005\u0012\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0013\u0010\u0013\u001a\u00020\u00142\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u0096\u0002J\u0008\u0010\u0017\u001a\u00020\u0008H\u0016J\u0008\u0010\u0018\u001a\u00020\u0003H\u0016R\u0015\u0010\u000b\u001a\u0004\u0018\u00010\u000c8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000fR\u0016\u0010\u0002\u001a\u00020\u00038\u0017X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0010R\u0013\u0010\u0007\u001a\u00020\u00088\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0011R\u001b\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u0012R\u0019\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0012\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;",
        "Lnicoid/network238/okhttp3/Dns$Record;",
        "hostname",
        "",
        "alpnIds",
        "",
        "Lnicoid/network238/okhttp3/Protocol;",
        "port",
        "",
        "ipAddressHints",
        "Ljava/net/InetAddress;",
        "echConfigList",
        "Lnicoid/network238/okio/ByteString;",
        "<init>",
        "(Ljava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V",
        "()Lnicoid/network238/okio/ByteString;",
        "()Ljava/lang/String;",
        "()I",
        "()Ljava/util/List;",
        "equals",
        "",
        "other",
        "",
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
.field private final alpnIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field private final echConfigList:Lnicoid/network238/okio/ByteString;

.field private final hostname:Ljava/lang/String;

.field private final ipAddressHints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation
.end field

.field private final port:I


# direct methods
.method public static synthetic $r8$lambda$CGsFA4ItjDlrJByu-dW17M4q0sI(Ljava/net/InetAddress;)Ljava/lang/CharSequence;
    .registers 1

    invoke-static {p0}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->toString$lambda$0$0(Ljava/net/InetAddress;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;I",
            "Ljava/util/List<",
            "+",
            "Ljava/net/InetAddress;",
            ">;",
            "Lnicoid/network238/okio/ByteString;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/Dns$Record;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 218
    iput-object p5, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->echConfigList:Lnicoid/network238/okio/ByteString;

    .line 223
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    if-eqz p5, :cond_3

    iput-object p5, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->hostname:Ljava/lang/String;

    const/4 p1, -0x1

    if-ne p3, p1, :cond_0

    const/16 p3, 0x1bb

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    if-gt p1, p3, :cond_2

    const/high16 p1, 0x10000

    if-ge p3, p1, :cond_2

    .line 228
    :goto_0
    iput p3, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->port:I

    if-eqz p2, :cond_1

    .line 235
    invoke-static {p2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    goto :goto_1

    :cond_1
    nop

    :goto_1
    iput-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->alpnIds:Ljava/util/List;

    .line 238
    invoke-static {p4}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->ipAddressHints:Ljava/util/List;

    return-void

    .line 231
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p4, "unexpected port: "

    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 224
    :cond_3
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "unexpected hostname: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 9

    and-int/lit8 p7, p6, 0x2

    const/4 v0, 0x0

    if-eqz p7, :cond_0

    move-object p2, v0

    :cond_0
    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_1

    const/4 p3, -0x1

    :cond_1
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_2

    .line 214
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p4

    :cond_2
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_3

    move-object p6, v0

    goto :goto_0

    :cond_3
    move-object p6, p5

    .line 192
    :goto_0
    move-object p5, p4

    move p4, p3

    move-object p3, p2

    move-object p2, p1

    move-object p1, p0

    invoke-direct/range {p1 .. p6}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;-><init>(Ljava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V

    return-void
.end method

.method private static final toString$lambda$0$0(Ljava/net/InetAddress;)Ljava/lang/CharSequence;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 272
    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method


# virtual methods
.method public final alpnIds()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation

    .line 235
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->alpnIds:Ljava/util/List;

    return-object v0
.end method

.method public final echConfigList()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 219
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->echConfigList:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 241
    instance-of v0, p1, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;

    if-eqz v0, :cond_0

    .line 242
    check-cast p1, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->hostname()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->hostname()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p1, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->alpnIds:Ljava/util/List;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->alpnIds:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 244
    iget v0, p1, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->port:I

    iget v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->port:I

    if-ne v0, v1, :cond_0

    .line 245
    iget-object v0, p1, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->ipAddressHints:Ljava/util/List;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->ipAddressHints:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 246
    iget-object p1, p1, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->echConfigList:Lnicoid/network238/okio/ByteString;

    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->echConfigList:Lnicoid/network238/okio/ByteString;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic getHostname()Ljava/lang/String;
    .registers 2

    .line 192
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->hostname()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .line 250
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->hostname()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    .line 251
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->alpnIds:Ljava/util/List;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 252
    iget v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->port:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 253
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->ipAddressHints:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 254
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->echConfigList:Lnicoid/network238/okio/ByteString;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_1
    add-int/2addr v0, v2

    return v0
.end method

.method public hostname()Ljava/lang/String;
    .registers 2

    .line 222
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public final ipAddressHints()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    .line 238
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->ipAddressHints:Ljava/util/List;

    return-object v0
.end method

.method public final port()I
    .registers 2

    .line 227
    iget v0, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->port:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 12

    .line 259
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 260
    const-string v1, "ServiceMetadata{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->hostname()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->alpnIds:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 263
    const-string v1, ", alpnIds="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->alpnIds:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 266
    :cond_0
    iget v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->port:I

    const/16 v2, 0x1bb

    if-eq v1, v2, :cond_1

    .line 267
    const-string v1, ", port="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    iget v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    :cond_1
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->ipAddressHints:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 271
    const-string v1, ", ipAddressHints=["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    iget-object v2, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->ipAddressHints:Ljava/util/List;

    new-instance v8, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata$0;

    invoke-direct {v8}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata$0;-><init>()V

    const/16 v9, 0x1f

    const/4 v10, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v2 .. v10}, Lnicoid/network238/kotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    :cond_2
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->echConfigList:Lnicoid/network238/okio/ByteString;

    if-eqz v1, :cond_3

    .line 276
    const-string v1, ", echConfigList="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->echConfigList:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    :cond_3
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
