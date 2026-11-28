.class public final enum Lnicoid/network238/okhttp3/TlsVersion;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/TlsVersion$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnicoid/network238/okhttp3/TlsVersion;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u000b\u0008\u0086\u0081\u0002\u0018\u0000 \r2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\rB\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\r\u0010\u0002\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u000cR\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000b\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/TlsVersion;",
        "",
        "javaName",
        "",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "()Ljava/lang/String;",
        "TLS_1_3",
        "TLS_1_2",
        "TLS_1_1",
        "TLS_1_0",
        "SSL_3_0",
        "-deprecated_javaName",
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

.field private static final synthetic $VALUES:[Lnicoid/network238/okhttp3/TlsVersion;

.field public static final Companion:Lnicoid/network238/okhttp3/TlsVersion$Companion;

.field public static final enum SSL_3_0:Lnicoid/network238/okhttp3/TlsVersion;

.field public static final enum TLS_1_0:Lnicoid/network238/okhttp3/TlsVersion;

.field public static final enum TLS_1_1:Lnicoid/network238/okhttp3/TlsVersion;

.field public static final enum TLS_1_2:Lnicoid/network238/okhttp3/TlsVersion;

.field public static final enum TLS_1_3:Lnicoid/network238/okhttp3/TlsVersion;


# instance fields
.field private final javaName:Ljava/lang/String;


# direct methods
.method private static final synthetic $values()[Lnicoid/network238/okhttp3/TlsVersion;
    .registers 5

    sget-object v0, Lnicoid/network238/okhttp3/TlsVersion;->TLS_1_3:Lnicoid/network238/okhttp3/TlsVersion;

    sget-object v1, Lnicoid/network238/okhttp3/TlsVersion;->TLS_1_2:Lnicoid/network238/okhttp3/TlsVersion;

    sget-object v2, Lnicoid/network238/okhttp3/TlsVersion;->TLS_1_1:Lnicoid/network238/okhttp3/TlsVersion;

    sget-object v3, Lnicoid/network238/okhttp3/TlsVersion;->TLS_1_0:Lnicoid/network238/okhttp3/TlsVersion;

    sget-object v4, Lnicoid/network238/okhttp3/TlsVersion;->SSL_3_0:Lnicoid/network238/okhttp3/TlsVersion;

    filled-new-array {v0, v1, v2, v3, v4}, [Lnicoid/network238/okhttp3/TlsVersion;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 4

    .line 25
    new-instance v0, Lnicoid/network238/okhttp3/TlsVersion;

    const/4 v1, 0x0

    const-string v2, "TLSv1.3"

    const-string v3, "TLS_1_3"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/TlsVersion;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/TlsVersion;->TLS_1_3:Lnicoid/network238/okhttp3/TlsVersion;

    .line 26
    new-instance v0, Lnicoid/network238/okhttp3/TlsVersion;

    const/4 v1, 0x1

    const-string v2, "TLSv1.2"

    const-string v3, "TLS_1_2"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/TlsVersion;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/TlsVersion;->TLS_1_2:Lnicoid/network238/okhttp3/TlsVersion;

    .line 27
    new-instance v0, Lnicoid/network238/okhttp3/TlsVersion;

    const/4 v1, 0x2

    const-string v2, "TLSv1.1"

    const-string v3, "TLS_1_1"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/TlsVersion;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/TlsVersion;->TLS_1_1:Lnicoid/network238/okhttp3/TlsVersion;

    .line 28
    new-instance v0, Lnicoid/network238/okhttp3/TlsVersion;

    const/4 v1, 0x3

    const-string v2, "TLSv1"

    const-string v3, "TLS_1_0"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/TlsVersion;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/TlsVersion;->TLS_1_0:Lnicoid/network238/okhttp3/TlsVersion;

    .line 29
    new-instance v0, Lnicoid/network238/okhttp3/TlsVersion;

    const/4 v1, 0x4

    const-string v2, "SSLv3"

    const-string v3, "SSL_3_0"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okhttp3/TlsVersion;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/TlsVersion;->SSL_3_0:Lnicoid/network238/okhttp3/TlsVersion;

    invoke-static {}, Lnicoid/network238/okhttp3/TlsVersion;->$values()[Lnicoid/network238/okhttp3/TlsVersion;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/TlsVersion;->$VALUES:[Lnicoid/network238/okhttp3/TlsVersion;

    invoke-static {v0}, Lnicoid/network238/kotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/TlsVersion;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    new-instance v0, Lnicoid/network238/okhttp3/TlsVersion$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/TlsVersion$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/TlsVersion;->Companion:Lnicoid/network238/okhttp3/TlsVersion$Companion;

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

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 23
    iput-object p3, p0, Lnicoid/network238/okhttp3/TlsVersion;->javaName:Ljava/lang/String;

    return-void
.end method

.method public static final forJavaName(Ljava/lang/String;)Lnicoid/network238/okhttp3/TlsVersion;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/TlsVersion;->Companion:Lnicoid/network238/okhttp3/TlsVersion$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/TlsVersion$Companion;->forJavaName(Ljava/lang/String;)Lnicoid/network238/okhttp3/TlsVersion;

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

    sget-object v0, Lnicoid/network238/okhttp3/TlsVersion;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lnicoid/network238/okhttp3/TlsVersion;
    .registers 2

    const-class v0, Lnicoid/network238/okhttp3/TlsVersion;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnicoid/network238/okhttp3/TlsVersion;

    return-object p0
.end method

.method public static values()[Lnicoid/network238/okhttp3/TlsVersion;
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/TlsVersion;->$VALUES:[Lnicoid/network238/okhttp3/TlsVersion;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnicoid/network238/okhttp3/TlsVersion;

    return-object v0
.end method


# virtual methods
.method public final -deprecated_javaName()Ljava/lang/String;
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/TlsVersion;->javaName:Ljava/lang/String;

    return-object v0
.end method

.method public final javaName()Ljava/lang/String;
    .registers 2

    .line 23
    iget-object v0, p0, Lnicoid/network238/okhttp3/TlsVersion;->javaName:Ljava/lang/String;

    return-object v0
.end method
