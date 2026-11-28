.class public final Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter;
.super Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u000f2\u00020\u0001:\u0001\u000fB3\u0012\u000e\u0010\u0002\u001a\n\u0012\u0006\u0008\u0000\u0012\u00020\u00040\u0003\u0012\u000e\u0010\u0005\u001a\n\u0012\u0006\u0008\u0000\u0012\u00020\u00060\u0003\u0012\n\u0010\u0007\u001a\u0006\u0012\u0002\u0008\u00030\u0003\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u0006H\u0016J\u0012\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u000c\u001a\u00020\u0006H\u0016R\u0016\u0010\u0005\u001a\n\u0012\u0006\u0008\u0000\u0012\u00020\u00060\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0007\u001a\u0006\u0012\u0002\u0008\u00030\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter;",
        "Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;",
        "sslSocketClass",
        "Ljava/lang/Class;",
        "Ljavax/net/ssl/SSLSocket;",
        "sslSocketFactoryClass",
        "Ljavax/net/ssl/SSLSocketFactory;",
        "paramClass",
        "<init>",
        "(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V",
        "matchesSocketFactory",
        "",
        "sslSocketFactory",
        "trustManager",
        "Ljavax/net/ssl/X509TrustManager;",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter$Companion;


# instance fields
.field private final paramClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private final sslSocketFactoryClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "-",
            "Ljavax/net/ssl/SSLSocketFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "-",
            "Ljavax/net/ssl/SSLSocket;",
            ">;",
            "Ljava/lang/Class<",
            "-",
            "Ljavax/net/ssl/SSLSocketFactory;",
            ">;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;-><init>(Ljava/lang/Class;)V

    .line 33
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter;->sslSocketFactoryClass:Ljava/lang/Class;

    .line 34
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter;->paramClass:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public matchesSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter;->sslSocketFactoryClass:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter;->paramClass:Ljava/lang/Class;

    .line 40
    const-string v1, "sslParameters"

    invoke-static {p1, v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    const-class v0, Ljavax/net/ssl/X509TrustManager;

    .line 46
    const-string v1, "x509TrustManager"

    invoke-static {p1, v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/net/ssl/X509TrustManager;

    if-nez v1, :cond_0

    .line 52
    const-string v1, "trustManager"

    invoke-static {p1, v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljavax/net/ssl/X509TrustManager;

    return-object p1

    :cond_0
    return-object v1
.end method
