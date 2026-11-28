.class public final enum Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0014\u0008\u0086\u0081\u0002\u0018\u0000 \u00162\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0016B\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013j\u0002\u0008\u0014j\u0002\u0008\u0015\u00a8\u0006\u0017"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        "",
        "httpCode",
        "",
        "<init>",
        "(Ljava/lang/String;II)V",
        "getHttpCode",
        "()I",
        "NO_ERROR",
        "PROTOCOL_ERROR",
        "INTERNAL_ERROR",
        "FLOW_CONTROL_ERROR",
        "SETTINGS_TIMEOUT",
        "STREAM_CLOSED",
        "FRAME_SIZE_ERROR",
        "REFUSED_STREAM",
        "CANCEL",
        "COMPRESSION_ERROR",
        "CONNECT_ERROR",
        "ENHANCE_YOUR_CALM",
        "INADEQUATE_SECURITY",
        "HTTP_1_1_REQUIRED",
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
.field private static final synthetic $ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum COMPRESSION_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum CONNECT_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;

.field public static final enum ENHANCE_YOUR_CALM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum FLOW_CONTROL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum FRAME_SIZE_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum HTTP_1_1_REQUIRED:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum INADEQUATE_SECURITY:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum INTERNAL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum NO_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum PROTOCOL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum REFUSED_STREAM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum SETTINGS_TIMEOUT:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

.field public static final enum STREAM_CLOSED:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;


# instance fields
.field private final httpCode:I


# direct methods
.method private static final synthetic $values()[Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
    .registers 14

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->NO_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->INTERNAL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v3, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->FLOW_CONTROL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v4, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->SETTINGS_TIMEOUT:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v5, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->STREAM_CLOSED:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v6, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->FRAME_SIZE_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v7, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v8, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v9, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->COMPRESSION_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v10, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CONNECT_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v11, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->ENHANCE_YOUR_CALM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v12, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->INADEQUATE_SECURITY:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v13, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->HTTP_1_1_REQUIRED:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    filled-new-array/range {v0 .. v13}, [Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 23
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "NO_ERROR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->NO_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 25
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "PROTOCOL_ERROR"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 27
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "INTERNAL_ERROR"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->INTERNAL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 29
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "FLOW_CONTROL_ERROR"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->FLOW_CONTROL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 31
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "SETTINGS_TIMEOUT"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->SETTINGS_TIMEOUT:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 33
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "STREAM_CLOSED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->STREAM_CLOSED:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 35
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "FRAME_SIZE_ERROR"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->FRAME_SIZE_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 37
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "REFUSED_STREAM"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 39
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "CANCEL"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 41
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "COMPRESSION_ERROR"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->COMPRESSION_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 43
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "CONNECT_ERROR"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CONNECT_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 45
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "ENHANCE_YOUR_CALM"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->ENHANCE_YOUR_CALM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 47
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "INADEQUATE_SECURITY"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->INADEQUATE_SECURITY:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 49
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const-string v1, "HTTP_1_1_REQUIRED"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2, v2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->HTTP_1_1_REQUIRED:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-static {}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->$values()[Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->$VALUES:[Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-static {v0}, Lnicoid/network238/kotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->Companion:Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 20
    iput p3, p0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->httpCode:I

    return-void
.end method

.method public static getEntries()Lnicoid/network238/kotlin/enums/EnumEntries;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnicoid/network238/kotlin/enums/EnumEntries;"
        }
    .end annotation

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
    .registers 2

    const-class v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    return-object p0
.end method

.method public static values()[Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->$VALUES:[Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    return-object v0
.end method


# virtual methods
.method public final getHttpCode()I
    .registers 2

    .line 20
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->httpCode:I

    return v0
.end method
