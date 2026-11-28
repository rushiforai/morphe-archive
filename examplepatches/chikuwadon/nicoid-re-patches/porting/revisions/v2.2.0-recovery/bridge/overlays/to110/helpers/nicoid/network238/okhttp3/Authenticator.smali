.class public interface abstract Lnicoid/network238/okhttp3/Authenticator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Authenticator$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00e6\u0080\u0001\u0018\u0000 \u00082\u00020\u0001:\u0001\u0008J\u001c\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\t\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Authenticator;",
        "",
        "authenticate",
        "Lnicoid/network238/okhttp3/Request;",
        "route",
        "Lnicoid/network238/okhttp3/Route;",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
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
.field public static final Companion:Lnicoid/network238/okhttp3/Authenticator$Companion;

.field public static final JAVA_NET_AUTHENTICATOR:Lnicoid/network238/okhttp3/Authenticator;

.field public static final NONE:Lnicoid/network238/okhttp3/Authenticator;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/Authenticator$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/Authenticator$Companion;

    sput-object v0, Lnicoid/network238/okhttp3/Authenticator;->Companion:Lnicoid/network238/okhttp3/Authenticator$Companion;

    .line 133
    new-instance v0, Lnicoid/network238/okhttp3/Authenticator$Companion$AuthenticatorNone;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Authenticator$Companion$AuthenticatorNone;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/Authenticator;->NONE:Lnicoid/network238/okhttp3/Authenticator;

    .line 144
    new-instance v0, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;-><init>(Lnicoid/network238/okhttp3/Dns;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/Authenticator;->JAVA_NET_AUTHENTICATOR:Lnicoid/network238/okhttp3/Authenticator;

    return-void
.end method


# virtual methods
.method public abstract authenticate(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
