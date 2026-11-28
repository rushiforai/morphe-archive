.class public final Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u001f\u0010\u0004\u001a\u00020\u00052\u0012\u0010\u0008\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\n0\t\"\u00020\n\u00a2\u0006\u0002\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;",
        "",
        "<init>",
        "()V",
        "get",
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "trustManager",
        "Ljavax/net/ssl/X509TrustManager;",
        "caCerts",
        "",
        "Ljava/security/cert/X509Certificate;",
        "([Ljava/security/cert/X509Certificate;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
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

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final get(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->buildCertificateChainCleaner(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object p1

    return-object p1
.end method

.method public final varargs get([Ljava/security/cert/X509Certificate;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    new-instance v0, Lnicoid/network238/okhttp3/internal/tls/BasicCertificateChainCleaner;

    new-instance v1, Lnicoid/network238/okhttp3/internal/tls/BasicTrustRootIndex;

    array-length v2, p1

    invoke-static {p1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/security/cert/X509Certificate;

    invoke-direct {v1, p1}, Lnicoid/network238/okhttp3/internal/tls/BasicTrustRootIndex;-><init>([Ljava/security/cert/X509Certificate;)V

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/tls/BasicCertificateChainCleaner;-><init>(Lnicoid/network238/okhttp3/internal/tls/TrustRootIndex;)V

    return-object v0
.end method
