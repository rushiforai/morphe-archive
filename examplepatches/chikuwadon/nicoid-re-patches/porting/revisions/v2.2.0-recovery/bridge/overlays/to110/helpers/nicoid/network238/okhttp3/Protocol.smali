.class public final enum Lnicoid/network238/okhttp3/Protocol;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Protocol$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnicoid/network238/okhttp3/Protocol;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u000c\u0008\u0086\u0081\u0002\u0018\u0000 \u000e2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000eB\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\r\u001a\u00020\u0003H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000c\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Protocol;",
        "",
        "protocol",
        "",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "HTTP_1_0",
        "HTTP_1_1",
        "SPDY_3",
        "HTTP_2",
        "H2_PRIOR_KNOWLEDGE",
        "QUIC",
        "HTTP_3",
        "toString",
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

.field private static final synthetic $VALUES:[Lnicoid/network238/okhttp3/Protocol;

.field public static final Companion:Lnicoid/network238/okhttp3/Protocol$Companion;

.field public static final enum H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

.field public static final enum HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

.field public static final enum HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

.field public static final enum HTTP_2:Lnicoid/network238/okhttp3/Protocol;

.field public static final enum HTTP_3:Lnicoid/network238/okhttp3/Protocol;

.field public static final enum QUIC:Lnicoid/network238/okhttp3/Protocol;

.field public static final enum SPDY_3:Lnicoid/network238/okhttp3/Protocol;


# instance fields
.field private final protocol:Ljava/lang/String;


# direct methods
.method private static final synthetic $values()[Lnicoid/network238/okhttp3/Protocol;
    .registers 7

    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    sget-object v2, Lnicoid/network238/okhttp3/Protocol;->SPDY_3:Lnicoid/network238/okhttp3/Protocol;

    sget-object v3, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    sget-object v4, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    sget-object v5, Lnicoid/network238/okhttp3/Protocol;->QUIC:Lnicoid/network238/okhttp3/Protocol;

    sget-object v6, Lnicoid/network238/okhttp3/Protocol;->HTTP_3:Lnicoid/network238/okhttp3/Protocol;

    filled-new-array/range {v0 .. v6}, [Lnicoid/network238/okhttp3/Protocol;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 4

    .line 37
    new-instance v0, Lnicoid/network238/okhttp3/Protocol;

    const/4 v1, 0x0

    const-string v2, "http/1.0"

    const-string v3, "HTTP_1_0"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    .line 46
    new-instance v0, Lnicoid/network238/okhttp3/Protocol;

    const/4 v1, 0x1

    const-string v2, "http/1.1"

    const-string v3, "HTTP_1_1"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    .line 55
    new-instance v0, Lnicoid/network238/okhttp3/Protocol;

    const/4 v1, 0x2

    const-string v2, "spdy/3.1"

    const-string v3, "SPDY_3"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->SPDY_3:Lnicoid/network238/okhttp3/Protocol;

    .line 66
    new-instance v0, Lnicoid/network238/okhttp3/Protocol;

    const/4 v1, 0x3

    const-string v2, "h2"

    const-string v3, "HTTP_2"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    .line 76
    new-instance v0, Lnicoid/network238/okhttp3/Protocol;

    const/4 v1, 0x4

    const-string v2, "h2_prior_knowledge"

    const-string v3, "H2_PRIOR_KNOWLEDGE"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    .line 86
    new-instance v0, Lnicoid/network238/okhttp3/Protocol;

    const/4 v1, 0x5

    const-string v2, "quic"

    const-string v3, "QUIC"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->QUIC:Lnicoid/network238/okhttp3/Protocol;

    .line 95
    new-instance v0, Lnicoid/network238/okhttp3/Protocol;

    const/4 v1, 0x6

    const-string v2, "h3"

    const-string v3, "HTTP_3"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_3:Lnicoid/network238/okhttp3/Protocol;

    invoke-static {}, Lnicoid/network238/okhttp3/Protocol;->$values()[Lnicoid/network238/okhttp3/Protocol;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->$VALUES:[Lnicoid/network238/okhttp3/Protocol;

    invoke-static {v0}, Lnicoid/network238/kotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    new-instance v0, Lnicoid/network238/okhttp3/Protocol$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/Protocol$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/Protocol;->Companion:Lnicoid/network238/okhttp3/Protocol$Companion;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 32
    iput-object p3, p0, Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$getProtocol$p(Lnicoid/network238/okhttp3/Protocol;)Ljava/lang/String;
    .registers 1

    .line 31
    iget-object p0, p0, Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;

    return-object p0
.end method

.method public static final get(Ljava/lang/String;)Lnicoid/network238/okhttp3/Protocol;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->Companion:Lnicoid/network238/okhttp3/Protocol$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/Protocol$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/Protocol;

    move-result-object p0

    return-object p0
.end method

.method public static getEntries()Lnicoid/network238/kotlin/enums/EnumEntries;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnicoid/network238/kotlin/enums/EnumEntries;"
        }
    .end annotation

    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lnicoid/network238/okhttp3/Protocol;
    .registers 2

    const-class v0, Lnicoid/network238/okhttp3/Protocol;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnicoid/network238/okhttp3/Protocol;

    return-object p0
.end method

.method public static values()[Lnicoid/network238/okhttp3/Protocol;
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->$VALUES:[Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnicoid/network238/okhttp3/Protocol;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .line 106
    iget-object v0, p0, Lnicoid/network238/okhttp3/Protocol;->protocol:Ljava/lang/String;

    return-object v0
.end method
