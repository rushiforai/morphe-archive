.class public final Ltz8;
.super Llim;
.source "SourceFile"


# instance fields
.field public a:Landroid/app/Activity;

.field public b:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

.field public c:Landroid/credentials/CredentialManager;


# virtual methods
.method public final R()Landroid/credentials/CredentialManager;
    .registers 3

    iget-object v0, p0, Ltz8;->a:Landroid/app/Activity;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    iget-object v1, p0, Ltz8;->c:Landroid/credentials/CredentialManager;

    if-nez v1, :cond_15

    const-string v1, "credential"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/credentials/CredentialManager;

    iput-object v0, p0, Ltz8;->c:Landroid/credentials/CredentialManager;

    return-object v0

    :cond_15
    return-object v1
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p1, 0x0

    iput-object p1, p0, Ltz8;->b:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    iput-object p1, p0, Ltz8;->c:Landroid/credentials/CredentialManager;

    iput-object p1, p0, Ltz8;->a:Landroid/app/Activity;

    return-void
.end method
