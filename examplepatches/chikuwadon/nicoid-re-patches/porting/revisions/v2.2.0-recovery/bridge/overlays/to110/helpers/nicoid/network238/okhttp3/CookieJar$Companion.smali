.class public final Lnicoid/network238/okhttp3/CookieJar$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/CookieJar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/CookieJar$Companion$NoCookies;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001:\u0001\u0006B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0013\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0001\u00a8\u0006\u0007"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CookieJar$Companion;",
        "",
        "<init>",
        "()V",
        "NO_COOKIES",
        "Lnicoid/network238/okhttp3/CookieJar;",
        "NoCookies",
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
.field static final synthetic $$INSTANCE:Lnicoid/network238/okhttp3/CookieJar$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/CookieJar$Companion;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/CookieJar$Companion;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/CookieJar$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/CookieJar$Companion;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
