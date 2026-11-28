.class public final Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;
.super Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u0000 \n2\u00020\u0001:\u0001\nB\u0011\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0008\u001a\u00020\tH\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u000b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;",
        "Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;",
        "path",
        "",
        "<init>",
        "(Ljava/lang/String;)V",
        "getPath",
        "()Ljava/lang/String;",
        "listSource",
        "Lnicoid/network238/okio/Source;",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList$Companion;

.field private static final PUBLIC_SUFFIX_RESOURCE:Ljava/lang/String;


# instance fields
.field private final path:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList$Companion;

    .line 51
    const-string v0, "PublicSuffixDatabase.list"

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;->PUBLIC_SUFFIX_RESOURCE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;-><init>(Ljava/lang/String;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/BasePublicSuffixList;-><init>()V

    .line 25
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;->path:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 25
    sget-object p1, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;->PUBLIC_SUFFIX_RESOURCE:Ljava/lang/String;

    .line 24
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$getPUBLIC_SUFFIX_RESOURCE$cp()Ljava/lang/String;
    .registers 1

    .line 24
    sget-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;->PUBLIC_SUFFIX_RESOURCE:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic getPath()Ljava/lang/Object;
    .registers 2

    .line 24
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 2

    .line 25
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;->path:Ljava/lang/String;

    return-object v0
.end method

.method public listSource()Lnicoid/network238/okio/Source;
    .registers 2

    invoke-static {}, Lnicoid/network238/EmbeddedSuffix;->open()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->source(Ljava/io/InputStream;)Lnicoid/network238/okio/Source;

    move-result-object v0

    return-object v0
.end method
