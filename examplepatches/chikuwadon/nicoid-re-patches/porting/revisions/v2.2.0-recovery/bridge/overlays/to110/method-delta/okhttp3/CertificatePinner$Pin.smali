.class public final Lokhttp3/CertificatePinner$Pin;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/CertificatePinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Pin"
.end annotation


# instance fields
.field public final canonicalHostname:Ljava/lang/String;

.field public final hash:Li/g;

.field public final hashAlgorithm:Ljava/lang/String;

.field public final pattern:Ljava/lang/String;


# virtual methods
.method public final matches(Ljava/lang/String;)Z
    .registers 7

    if-eqz p1, :cond_2

    invoke-static {p1}, Le/e/a/NetworkSecurity220;->normalizePinHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lokhttp3/CertificatePinner$Pin;->pattern:Ljava/lang/String;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const-string v3, "*."

    invoke-static {v0, v3, v2, v1}, Lg/o/f;->b(Ljava/lang/String;Ljava/lang/String;ZI)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x2e

    const/4 v1, 0x6

    invoke-static {p1, v0, v2, v2, v1}, Lg/o/f;->a(Ljava/lang/CharSequence;CIZI)I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v0

    const/4 v3, 0x1

    sub-int/2addr v1, v3

    iget-object v4, p0, Lokhttp3/CertificatePinner$Pin;->canonicalHostname:Ljava/lang/String;

    invoke-static {v4}, Le/e/a/NetworkSecurity220;->normalizePinHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v1, v4, :cond_0

    iget-object v1, p0, Lokhttp3/CertificatePinner$Pin;->canonicalHostname:Ljava/lang/String;

    invoke-static {v1}, Le/e/a/NetworkSecurity220;->normalizePinHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    add-int/2addr v0, v3

    const/4 v4, 0x4

    invoke-static {p1, v1, v0, v2, v4}, Lg/o/f;->a(Ljava/lang/String;Ljava/lang/String;IZI)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2

    :cond_1
    iget-object v0, p0, Lokhttp3/CertificatePinner$Pin;->canonicalHostname:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/NetworkSecurity220;->normalizePinHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lg/k/c/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    const-string p1, "hostname"

    .line 1
    invoke-static {p1}, Lg/k/c/h;->a(Ljava/lang/String;)V

    const/4 p1, 0x0

    throw p1
.end method
