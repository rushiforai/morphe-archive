.class public final Laei;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public a:[[B

.field public b:Ljava/security/PrivateKey;

.field public final c:J

.field public final d:Landroid/content/Context;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;J)V
    .registers 5

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-wide p3, p0, Laei;->c:J

    iput-object p1, p0, Laei;->d:Landroid/content/Context;

    iput-object p2, p0, Laei;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    check-cast p1, [Ljava/lang/Void;

    iget-object p1, p0, Laei;->d:Landroid/content/Context;

    const/4 v0, 0x0

    iget-object v1, p0, Laei;->e:Ljava/lang/String;

    if-eqz v1, :cond_32

    :try_start_9
    invoke-static {p1, v1}, Landroid/security/KeyChain;->getPrivateKey(Landroid/content/Context;Ljava/lang/String;)Ljava/security/PrivateKey;

    move-result-object v2
    :try_end_d
    .catch Landroid/security/KeyChainException; {:try_start_9 .. :try_end_d} :catch_e
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_d} :catch_e

    goto :goto_f

    :catch_e
    move-object v2, v0

    :goto_f
    :try_start_f
    invoke-static {p1, v1}, Landroid/security/KeyChain;->getCertificateChain(Landroid/content/Context;Ljava/lang/String;)[Ljava/security/cert/X509Certificate;

    move-result-object p1
    :try_end_13
    .catch Landroid/security/KeyChainException; {:try_start_f .. :try_end_13} :catch_14
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_13} :catch_14

    goto :goto_15

    :catch_14
    move-object p1, v0

    :goto_15
    if-eqz v2, :cond_32

    if-eqz p1, :cond_32

    array-length v1, p1

    if-eqz v1, :cond_32

    array-length v1, p1

    new-array v1, v1, [[B

    const/4 v3, 0x0

    :goto_20
    :try_start_20
    array-length v4, p1

    if-ge v3, v4, :cond_2e

    aget-object v4, p1, v3

    invoke-virtual {v4}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v4

    aput-object v4, v1, v3
    :try_end_2b
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_20 .. :try_end_2b} :catch_32

    add-int/lit8 v3, v3, 0x1

    goto :goto_20

    :cond_2e
    iput-object v1, p0, Laei;->a:[[B

    iput-object v2, p0, Laei;->b:Ljava/security/PrivateKey;

    :catch_32
    :cond_32
    return-object v0
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Laei;->a:[[B

    iget-object v0, p0, Laei;->b:Ljava/security/PrivateKey;

    iget-wide v1, p0, Laei;->c:J

    invoke-static {v1, v2, p1, v0}, LJ/N;->MtT_tevO(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
