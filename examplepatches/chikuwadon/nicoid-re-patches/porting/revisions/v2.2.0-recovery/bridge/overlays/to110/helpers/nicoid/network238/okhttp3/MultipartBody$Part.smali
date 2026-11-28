.class public final Lnicoid/network238/okhttp3/MultipartBody$Part;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/MultipartBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Part"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 \u000c2\u00020\u0001:\u0001\u000cB\u001b\u0008\u0002\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\u0002\u001a\u0004\u0018\u00010\u0003H\u0007\u00a2\u0006\u0002\u0008\nJ\r\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0008\u000bR\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0008R\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\t\u00a8\u0006\r"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MultipartBody$Part;",
        "",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "body",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)V",
        "()Lnicoid/network238/okhttp3/Headers;",
        "()Lnicoid/network238/okhttp3/RequestBody;",
        "-deprecated_headers",
        "-deprecated_body",
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
.field public static final Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;


# instance fields
.field private final body:Lnicoid/network238/okhttp3/RequestBody;

.field private final headers:Lnicoid/network238/okhttp3/Headers;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    return-void
.end method

.method private constructor <init>(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)V
    .registers 3

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartBody$Part;->headers:Lnicoid/network238/okhttp3/Headers;

    .line 187
    iput-object p2, p0, Lnicoid/network238/okhttp3/MultipartBody$Part;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/MultipartBody$Part;-><init>(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)V

    return-void
.end method

.method public static final create(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->create(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->create(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p0

    return-object p0
.end method

.method public static final createFormData(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->createFormData(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p0

    return-object p0
.end method

.method public static final createFormData(Ljava/lang/String;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 4

    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody$Part;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lnicoid/network238/okhttp3/MultipartBody$Part$Companion;->createFormData(Ljava/lang/String;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/MultipartBody$Part;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_body()Lnicoid/network238/okhttp3/RequestBody;
    .registers 2

    .line 203
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody$Part;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-object v0
.end method

.method public final -deprecated_headers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 195
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody$Part;->headers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public final body()Lnicoid/network238/okhttp3/RequestBody;
    .registers 2

    .line 187
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody$Part;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-object v0
.end method

.method public final headers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 186
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody$Part;->headers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method
