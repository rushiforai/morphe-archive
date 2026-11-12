.class public final Lkq4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/security/cert/X509Certificate;

.field public final b:Landroid/net/http/SslCertificate;

.field public final c:[B

.field public final d:[B


# direct methods
.method public constructor <init>(Ljava/security/cert/X509Certificate;[B[B)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkq4;->a:Ljava/security/cert/X509Certificate;

    new-instance v0, Landroid/net/http/SslCertificate;

    invoke-direct {v0, p1}, Landroid/net/http/SslCertificate;-><init>(Ljava/security/cert/X509Certificate;)V

    iput-object v0, p0, Lkq4;->b:Landroid/net/http/SslCertificate;

    iput-object p2, p0, Lkq4;->c:[B

    iput-object p3, p0, Lkq4;->d:[B

    return-void
.end method
