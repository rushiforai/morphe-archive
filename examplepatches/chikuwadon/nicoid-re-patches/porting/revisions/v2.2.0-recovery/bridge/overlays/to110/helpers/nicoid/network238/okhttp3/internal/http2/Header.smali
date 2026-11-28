.class public final Lnicoid/network238/okhttp3/internal/http2/Header;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Header$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0086\u0008\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006B\u0019\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0008B\u0019\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\tJ\u0008\u0010\u000c\u001a\u00020\u0007H\u0016J\t\u0010\r\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u000e\u001a\u00020\u0003H\u00c6\u0003J\u001d\u0010\u000f\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0013\u001a\u00020\u000bH\u00d6\u0001R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u00020\u000b8\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "",
        "name",
        "Lnicoid/network238/okio/ByteString;",
        "value",
        "<init>",
        "(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V",
        "",
        "(Ljava/lang/String;Ljava/lang/String;)V",
        "(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V",
        "hpackSize",
        "",
        "toString",
        "component1",
        "component2",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/Header$Companion;

.field public static final PSEUDO_PREFIX:Lnicoid/network238/okio/ByteString;

.field public static final RESPONSE_STATUS:Lnicoid/network238/okio/ByteString;

.field public static final RESPONSE_STATUS_UTF8:Ljava/lang/String; = ":status"

.field public static final TARGET_AUTHORITY:Lnicoid/network238/okio/ByteString;

.field public static final TARGET_AUTHORITY_UTF8:Ljava/lang/String; = ":authority"

.field public static final TARGET_METHOD:Lnicoid/network238/okio/ByteString;

.field public static final TARGET_METHOD_UTF8:Ljava/lang/String; = ":method"

.field public static final TARGET_PATH:Lnicoid/network238/okio/ByteString;

.field public static final TARGET_PATH_UTF8:Ljava/lang/String; = ":path"

.field public static final TARGET_SCHEME:Lnicoid/network238/okio/ByteString;

.field public static final TARGET_SCHEME_UTF8:Ljava/lang/String; = ":scheme"


# instance fields
.field public final hpackSize:I

.field public final name:Lnicoid/network238/okio/ByteString;

.field public final value:Lnicoid/network238/okio/ByteString;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Header$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Header;->Companion:Lnicoid/network238/okhttp3/internal/http2/Header$Companion;

    .line 39
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/internal/http2/Header;->PSEUDO_PREFIX:Lnicoid/network238/okio/ByteString;

    .line 47
    const-string v1, ":status"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/internal/http2/Header;->RESPONSE_STATUS:Lnicoid/network238/okio/ByteString;

    .line 49
    const-string v1, ":method"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_METHOD:Lnicoid/network238/okio/ByteString;

    .line 51
    const-string v1, ":path"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_PATH:Lnicoid/network238/okio/ByteString;

    .line 53
    const-string v1, ":scheme"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_SCHEME:Lnicoid/network238/okio/ByteString;

    .line 55
    const-string v1, ":authority"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_AUTHORITY:Lnicoid/network238/okio/ByteString;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-virtual {v0, p2}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p2}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    .line 26
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    .line 28
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p1

    add-int/lit8 p1, p1, 0x20

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->hpackSize:I

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/http2/Header;Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http2/Header;
    .registers 5

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    :cond_1
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Header;->copy(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lnicoid/network238/okio/ByteString;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public final component2()Lnicoid/network238/okio/ByteString;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public final copy(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/internal/http2/Header;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-direct {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/http2/Header;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/http2/Header;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

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

.method public hashCode()I
    .registers 3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
