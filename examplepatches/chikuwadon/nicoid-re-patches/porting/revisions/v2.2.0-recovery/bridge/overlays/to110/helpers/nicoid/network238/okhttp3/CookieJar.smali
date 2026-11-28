.class public interface abstract Lnicoid/network238/okhttp3/CookieJar;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/CookieJar$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008f\u0018\u0000 \n2\u00020\u0001:\u0001\nJ\u001e\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H&J\u0016\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00072\u0006\u0010\u0004\u001a\u00020\u0005H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u000b\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CookieJar;",
        "",
        "saveFromResponse",
        "",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "cookies",
        "",
        "Lnicoid/network238/okhttp3/Cookie;",
        "loadForRequest",
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
.field public static final Companion:Lnicoid/network238/okhttp3/CookieJar$Companion;

.field public static final NO_COOKIES:Lnicoid/network238/okhttp3/CookieJar;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/CookieJar$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/CookieJar$Companion;

    sput-object v0, Lnicoid/network238/okhttp3/CookieJar;->Companion:Lnicoid/network238/okhttp3/CookieJar$Companion;

    .line 57
    new-instance v0, Lnicoid/network238/okhttp3/CookieJar$Companion$NoCookies;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/CookieJar$Companion$NoCookies;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/CookieJar;->NO_COOKIES:Lnicoid/network238/okhttp3/CookieJar;

    return-void
.end method


# virtual methods
.method public abstract loadForRequest(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Cookie;",
            ">;"
        }
    .end annotation
.end method

.method public abstract saveFromResponse(Lnicoid/network238/okhttp3/HttpUrl;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Cookie;",
            ">;)V"
        }
    .end annotation
.end method
