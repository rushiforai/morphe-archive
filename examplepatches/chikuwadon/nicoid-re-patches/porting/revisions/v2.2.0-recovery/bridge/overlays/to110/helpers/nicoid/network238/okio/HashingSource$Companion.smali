.class public final Lnicoid/network238/okio/HashingSource$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/HashingSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0010\u0010\u0008\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0010\u0010\t\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0010\u0010\n\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0018\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\rH\u0007J\u0018\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\rH\u0007J\u0018\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\rH\u0007\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okio/HashingSource$Companion;",
        "",
        "<init>",
        "()V",
        "md5",
        "Lnicoid/network238/okio/HashingSource;",
        "source",
        "Lnicoid/network238/okio/Source;",
        "sha1",
        "sha256",
        "sha512",
        "hmacSha1",
        "key",
        "Lnicoid/network238/okio/ByteString;",
        "hmacSha256",
        "hmacSha512",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/HashingSource$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final hmacSha1(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 149
    new-instance v0, Lnicoid/network238/okio/HashingSource;

    const-string v1, "HmacSHA1"

    invoke-direct {v0, p1, p2, v1}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    return-object v0
.end method

.method public final hmacSha256(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    new-instance v0, Lnicoid/network238/okio/HashingSource;

    const-string v1, "HmacSHA256"

    invoke-direct {v0, p1, p2, v1}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    return-object v0
.end method

.method public final hmacSha512(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/HashingSource;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 157
    new-instance v0, Lnicoid/network238/okio/HashingSource;

    const-string v1, "HmacSHA512"

    invoke-direct {v0, p1, p2, v1}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    return-object v0
.end method

.method public final md5(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    new-instance v0, Lnicoid/network238/okio/HashingSource;

    const-string v1, "MD5"

    invoke-direct {v0, p1, v1}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Ljava/lang/String;)V

    return-object v0
.end method

.method public final sha1(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    new-instance v0, Lnicoid/network238/okio/HashingSource;

    const-string v1, "SHA-1"

    invoke-direct {v0, p1, v1}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Ljava/lang/String;)V

    return-object v0
.end method

.method public final sha256(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 141
    new-instance v0, Lnicoid/network238/okio/HashingSource;

    const-string v1, "SHA-256"

    invoke-direct {v0, p1, v1}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Ljava/lang/String;)V

    return-object v0
.end method

.method public final sha512(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/HashingSource;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 145
    new-instance v0, Lnicoid/network238/okio/HashingSource;

    const-string v1, "SHA-512"

    invoke-direct {v0, p1, v1}, Lnicoid/network238/okio/HashingSource;-><init>(Lnicoid/network238/okio/Source;Ljava/lang/String;)V

    return-object v0
.end method
