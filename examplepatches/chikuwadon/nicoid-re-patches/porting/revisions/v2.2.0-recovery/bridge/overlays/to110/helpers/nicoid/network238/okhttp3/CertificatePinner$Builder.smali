.class public final Lnicoid/network238/okhttp3/CertificatePinner$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/CertificatePinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0010\u0011\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\'\u0010\t\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u000b2\u0012\u0010\u0004\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000b0\u000c\"\u00020\u000b\u00a2\u0006\u0002\u0010\rJ\u0006\u0010\u000e\u001a\u00020\u000fR\u0017\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CertificatePinner$Builder;",
        "",
        "<init>",
        "()V",
        "pins",
        "",
        "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
        "getPins",
        "()Ljava/util/List;",
        "add",
        "pattern",
        "",
        "",
        "(Ljava/lang/String;[Ljava/lang/String;)Lnicoid/network238/okhttp3/CertificatePinner$Builder;",
        "build",
        "Lnicoid/network238/okhttp3/CertificatePinner;",
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


# instance fields
.field private final pins:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 345
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 346
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Builder;->pins:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final varargs add(Ljava/lang/String;[Ljava/lang/String;)Lnicoid/network238/okhttp3/CertificatePinner$Builder;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 359
    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p2, v1

    .line 360
    iget-object v3, p0, Lnicoid/network238/okhttp3/CertificatePinner$Builder;->pins:Ljava/util/List;

    new-instance v4, Lnicoid/network238/okhttp3/CertificatePinner$Pin;

    invoke-direct {v4, p1, v2}, Lnicoid/network238/okhttp3/CertificatePinner$Pin;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public final build()Lnicoid/network238/okhttp3/CertificatePinner;
    .registers 5

    .line 364
    new-instance v0, Lnicoid/network238/okhttp3/CertificatePinner;

    iget-object v1, p0, Lnicoid/network238/okhttp3/CertificatePinner$Builder;->pins:Ljava/util/List;

    invoke-static {v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3, v2}, Lnicoid/network238/okhttp3/CertificatePinner;-><init>(Ljava/util/Set;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final getPins()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/CertificatePinner$Pin;",
            ">;"
        }
    .end annotation

    .line 346
    iget-object v0, p0, Lnicoid/network238/okhttp3/CertificatePinner$Builder;->pins:Ljava/util/List;

    return-object v0
.end method
