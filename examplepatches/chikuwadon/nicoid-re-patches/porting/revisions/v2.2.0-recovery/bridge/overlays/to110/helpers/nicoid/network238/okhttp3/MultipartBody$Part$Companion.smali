.class public final Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/MultipartBody$Part;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u001a\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0006\u001a\u00020\u0007H\u0007J\u0018\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000cH\u0007J\"\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000c2\u0006\u0010\u0006\u001a\u00020\u0007H\u0007\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;",
        "",
        "<init>",
        "()V",
        "create",
        "Lnicoid/network238/okhttp3/MultipartBody$Part;",
        "body",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "createFormData",
        "name",
        "",
        "value",
        "filename",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final create(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 214
    const-string v1, "Content-Type"

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_3

    if-eqz p1, :cond_1

    .line 215
    const-string v1, "Content-Length"

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    move-object v1, v0

    :goto_1
    if-nez v1, :cond_2

    .line 216
    new-instance v1, Lnicoid/network238/okhttp3/MultipartBody$Part;

    invoke-direct {v1, p1, p2, v0}, Lnicoid/network238/okhttp3/MultipartBody$Part;-><init>(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v1

    .line 215
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Unexpected header: Content-Length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 214
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Unexpected header: Content-Type"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final create(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 207
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->create(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p1

    return-object p1
.end method

.method public final createFormData(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 223
    sget-object v0, Lnicoid/network238/okhttp3/RequestBody;->Companion:Lnicoid/network238/okhttp3/RequestBody$Companion;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p2, v2, v1, v2}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p2

    invoke-virtual {p0, p1, v2, p2}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->createFormData(Ljava/lang/String;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p1

    return-object p1
.end method

.method public final createFormData(Ljava/lang/String;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 232
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    const-string v1, "form-data; name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    sget-object v1, Lnicoid/network238/okhttp3/MultipartBody;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Companion;

    invoke-virtual {v1, v0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Companion;->appendQuotedString$okhttp(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 237
    const-string p1, "; filename="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    invoke-virtual {v1, v0, p2}, Lnicoid/network238/okhttp3/MultipartBody$Companion;->appendQuotedString$okhttp(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 232
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 244
    new-instance p2, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {p2}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 245
    const-string v0, "Content-Disposition"

    invoke-virtual {p2, v0, p1}, Lnicoid/network238/okhttp3/Headers$Builder;->addUnsafeNonAscii(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    .line 246
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    .line 248
    invoke-virtual {p0, p1, p3}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->create(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p1

    return-object p1
.end method
