.class public final Lnicoid/network238/okhttp3/MultipartBody$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/MultipartBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0013\u0008\u0007\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000e\u0010\u000c\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0008J\u000e\u0010\r\u001a\u00020\u00002\u0006\u0010\u000e\u001a\u00020\u000fJ\u0018\u0010\r\u001a\u00020\u00002\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u000e\u001a\u00020\u000fJ\u0016\u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u0003J \u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u00032\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u000e\u001a\u00020\u000fJ\u000e\u0010\r\u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\u000bJ\u0006\u0010\u0017\u001a\u00020\u0018R\u000e\u0010\u0002\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MultipartBody$Builder;",
        "",
        "boundary",
        "",
        "<init>",
        "(Ljava/lang/String;)V",
        "Lnicoid/network238/okio/ByteString;",
        "type",
        "Lnicoid/network238/okhttp3/MediaType;",
        "parts",
        "",
        "Lnicoid/network238/okhttp3/MultipartBody$Part;",
        "setType",
        "addPart",
        "body",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "addFormDataPart",
        "name",
        "value",
        "filename",
        "part",
        "build",
        "Lnicoid/network238/okhttp3/MultipartBody;",
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
.field private final boundary:Lnicoid/network238/okio/ByteString;

.field private final parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/MultipartBody$Part;",
            ">;"
        }
    .end annotation
.end field

.field private type:Lnicoid/network238/okhttp3/MediaType;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lnicoid/network238/okhttp3/MultipartBody$Builder;-><init>(Ljava/lang/String;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 258
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->boundary:Lnicoid/network238/okio/ByteString;

    .line 259
    sget-object p1, Lnicoid/network238/okhttp3/MultipartBody;->MIXED:Lnicoid/network238/okhttp3/MediaType;

    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->type:Lnicoid/network238/okhttp3/MediaType;

    .line 260
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->parts:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 256
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 255
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Builder;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final addFormDataPart(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/MultipartBody$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 291
    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->createFormData(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Builder;->addPart(Lnicoid/network238/okhttp3/MultipartBody$Part;)Lnicoid/network238/okhttp3/MultipartBody$Builder;

    return-object p0
.end method

.method public final addFormDataPart(Ljava/lang/String;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Builder;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 300
    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->createFormData(Ljava/lang/String;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Builder;->addPart(Lnicoid/network238/okhttp3/MultipartBody$Part;)Lnicoid/network238/okhttp3/MultipartBody$Builder;

    return-object p0
.end method

.method public final addPart(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Builder;
    .registers 4

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 283
    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->create(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Builder;->addPart(Lnicoid/network238/okhttp3/MultipartBody$Part;)Lnicoid/network238/okhttp3/MultipartBody$Builder;

    return-object p0
.end method

.method public final addPart(Lnicoid/network238/okhttp3/MultipartBody$Part;)Lnicoid/network238/okhttp3/MultipartBody$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 306
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->parts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public final addPart(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 275
    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->create(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Builder;->addPart(Lnicoid/network238/okhttp3/MultipartBody$Part;)Lnicoid/network238/okhttp3/MultipartBody$Builder;

    return-object p0
.end method

.method public final build()Lnicoid/network238/okhttp3/MultipartBody;
    .registers 5

    .line 311
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->parts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 312
    new-instance v0, Lnicoid/network238/okhttp3/MultipartBody;

    iget-object v1, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->boundary:Lnicoid/network238/okio/ByteString;

    iget-object v2, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->type:Lnicoid/network238/okhttp3/MediaType;

    iget-object v3, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->parts:Ljava/util/List;

    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/MultipartBody;-><init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;Ljava/util/List;)V

    return-object v0

    .line 311
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Multipart body must have at least one part."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setType(Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/MultipartBody$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 268
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/MediaType;->type()Ljava/lang/String;

    move-result-object v0

    const-string v1, "multipart"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartBody$Builder;->type:Lnicoid/network238/okhttp3/MediaType;

    return-object p0

    .line 268
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "multipart != "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
