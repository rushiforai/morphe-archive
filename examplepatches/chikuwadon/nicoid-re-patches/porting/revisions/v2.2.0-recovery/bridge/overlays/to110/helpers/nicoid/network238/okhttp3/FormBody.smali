.class public final Lnicoid/network238/okhttp3/FormBody;
.super Lnicoid/network238/okhttp3/RequestBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/FormBody$Builder;,
        Lnicoid/network238/okhttp3/FormBody$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0018\u0000 \u001d2\u00020\u0001:\u0002\u001c\u001dB%\u0008\u0000\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\r\u0010\u0008\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0008\u000bJ\u000e\u0010\u000c\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\tJ\u000e\u0010\u000e\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\tJ\u000e\u0010\u000f\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\tJ\u000e\u0010\u0010\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\tJ\u0008\u0010\u0011\u001a\u00020\u0012H\u0016J\u0008\u0010\u0013\u001a\u00020\u0014H\u0016J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J\u001a\u0010\u0019\u001a\u00020\u00142\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u001a\u001a\u00020\u001bH\u0002R\u0014\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0008\u001a\u00020\t8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\n\u00a8\u0006\u001e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/FormBody;",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "encodedNames",
        "",
        "",
        "encodedValues",
        "<init>",
        "(Ljava/util/List;Ljava/util/List;)V",
        "size",
        "",
        "()I",
        "-deprecated_size",
        "encodedName",
        "index",
        "name",
        "encodedValue",
        "value",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "contentLength",
        "",
        "writeTo",
        "",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "writeOrCountBytes",
        "countBytes",
        "",
        "Builder",
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
.field private static final CONTENT_TYPE:Lnicoid/network238/okhttp3/MediaType;

.field public static final Companion:Lnicoid/network238/okhttp3/FormBody$Companion;


# instance fields
.field private final encodedNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final encodedValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/FormBody$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/FormBody$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/FormBody;->Companion:Lnicoid/network238/okhttp3/FormBody$Companion;

    .line 145
    sget-object v0, Lnicoid/network238/okhttp3/MediaType;->Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

    const-string v1, "application/x-www-form-urlencoded"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/FormBody;->CONTENT_TYPE:Lnicoid/network238/okhttp3/MediaType;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    invoke-direct {p0}, Lnicoid/network238/okhttp3/RequestBody;-><init>()V

    .line 32
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/FormBody;->encodedNames:Ljava/util/List;

    .line 33
    invoke-static {p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/FormBody;->encodedValues:Ljava/util/List;

    return-void
.end method

.method private final writeOrCountBytes(Lnicoid/network238/okio/BufferedSink;Z)J
    .registers 6

    if-eqz p2, :cond_0

    .line 76
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 78
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/FormBody;->encodedNames:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_2

    if-lez v1, :cond_1

    .line 79
    const/16 v2, 0x26

    invoke-virtual {p1, v2}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 80
    :cond_1
    iget-object v2, p0, Lnicoid/network238/okhttp3/FormBody;->encodedNames:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    .line 81
    const/16 v2, 0x3d

    invoke-virtual {p1, v2}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 82
    iget-object v2, p0, Lnicoid/network238/okhttp3/FormBody;->encodedValues:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    if-eqz p2, :cond_3

    .line 86
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 87
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->clear()V

    return-wide v0

    :cond_3
    const-wide/16 p1, 0x0

    return-wide p1
.end method


# virtual methods
.method public final -deprecated_size()I
    .registers 2

    .line 46
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/FormBody;->size()I

    move-result v0

    return v0
.end method

.method public contentLength()J
    .registers 3

    .line 58
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lnicoid/network238/okhttp3/FormBody;->writeOrCountBytes(Lnicoid/network238/okio/BufferedSink;Z)J

    move-result-wide v0

    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 56
    sget-object v0, Lnicoid/network238/okhttp3/FormBody;->CONTENT_TYPE:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public final encodedName(I)Ljava/lang/String;
    .registers 3

    .line 48
    iget-object v0, p0, Lnicoid/network238/okhttp3/FormBody;->encodedNames:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public final encodedValue(I)Ljava/lang/String;
    .registers 3

    .line 52
    iget-object v0, p0, Lnicoid/network238/okhttp3/FormBody;->encodedValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public final name(I)Ljava/lang/String;
    .registers 8

    .line 50
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/FormBody;->encodedName(I)Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final size()I
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/FormBody;->encodedNames:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public final value(I)Ljava/lang/String;
    .registers 8

    .line 54
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/FormBody;->encodedValue(I)Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lnicoid/network238/okio/BufferedSink;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/FormBody;->writeOrCountBytes(Lnicoid/network238/okio/BufferedSink;Z)J

    return-void
.end method
