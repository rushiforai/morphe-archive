.class public final Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList_androidKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Default",
        "Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;",
        "Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;",
        "getDefault",
        "(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;)Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final getDefault(Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;)Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    new-instance p0, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lnicoid/network238/okhttp3/internal/publicsuffix/AssetPublicSuffixList;-><init>(Ljava/lang/String;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object p0
.end method
