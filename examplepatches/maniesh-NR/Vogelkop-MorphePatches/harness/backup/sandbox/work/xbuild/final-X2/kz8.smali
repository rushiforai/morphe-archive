.class public final synthetic Lkz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lni;


# instance fields
.field public final synthetic a:Lsz8;

.field public final synthetic b:Lek2;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lsz8;Lek2;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkz8;->a:Lsz8;

    iput-object p2, p0, Lkz8;->b:Lek2;

    iput-boolean p3, p0, Lkz8;->c:Z

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 11

    iget-object v0, p0, Lkz8;->b:Lek2;

    const/4 v1, 0x2

    if-nez p1, :cond_9

    invoke-virtual {v0, v1}, Lek2;->s(I)V

    return-void

    :cond_9
    const/4 v2, -0x1

    if-ne p1, v2, :cond_c3

    if-eqz p2, :cond_c3

    const-string p1, "FIDO2_CREDENTIAL_EXTRA"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lkz8;->a:Lsz8;

    iget-boolean p0, p0, Lkz8;->c:Z

    const/16 v5, 0x9

    if-eqz p1, :cond_89

    invoke-static {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->deserializeFromBytes([B)Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getResponse()Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorResponse;

    move-result-object v6

    instance-of v7, v6, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;

    if-eqz v7, :cond_30

    check-cast v6, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;

    invoke-static {v6, v0}, Lsz8;->k(Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;Lek2;)V

    return-void

    :cond_30
    instance-of v6, v6, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAttestationResponse;

    if-eqz v6, :cond_89

    :try_start_34
    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getRawId()[B

    move-result-object p2

    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getResponse()Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorResponse;

    move-result-object v6

    check-cast v6, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAttestationResponse;

    invoke-virtual {v4, p2, v6, p0}, Lsz8;->j([BLcom/google/android/gms/fido/fido2/api/common/AuthenticatorAttestationResponse;Z)Lz7d;

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getAuthenticatorAttachment()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_49
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_34 .. :try_end_49} :catch_85

    const-string v4, "cross-platform"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v6, 0x1

    if-nez v4, :cond_5d

    const-string v1, "platform"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5f

    :try_start_5a
    iput v6, p0, Lz7d;->c:I

    goto :goto_5f

    :cond_5d
    iput v1, p0, Lz7d;->c:I

    :cond_5f
    :goto_5f
    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getClientExtensionResults()Lcom/google/android/gms/fido/fido2/api/common/AuthenticationExtensionsClientOutputs;

    move-result-object p1

    if-eqz p1, :cond_73

    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticationExtensionsClientOutputs;->getCredProps()Lcom/google/android/gms/fido/fido2/api/common/AuthenticationExtensionsCredPropsOutputs;

    move-result-object p1

    if-eqz p1, :cond_73

    iput-boolean v6, p0, Lz7d;->i:Z

    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticationExtensionsCredPropsOutputs;->getIsDiscoverableCredential()Z

    move-result p1

    iput-boolean p1, p0, Lz7d;->j:Z

    :cond_73
    iget-boolean p1, v0, Lek2;->f:Z

    if-eqz p1, :cond_b2

    iget-object p1, v0, Lek2;->h:Ln61;

    invoke-virtual {p1, v2, p0, v3}, Ln61;->b(ILz7d;Lzsn;)V

    iput-boolean v2, v0, Lek2;->f:Z

    iput-object v3, v0, Lek2;->h:Ln61;

    iput-object v3, v0, Lek2;->i:Ln61;

    iput-object v3, v0, Lek2;->e:Lsz8;
    :try_end_84
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5a .. :try_end_84} :catch_85

    return-void

    :catch_85
    invoke-virtual {v0, v5}, Lek2;->s(I)V

    goto :goto_b2

    :cond_89
    const-string p1, "FIDO2_RESPONSE_EXTRA"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p1

    if-eqz p1, :cond_b3

    invoke-static {p1}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAttestationResponse;->deserializeFromBytes([B)Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAttestationResponse;

    move-result-object p1

    :try_start_95
    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAttestationResponse;->getKeyHandle()[B

    move-result-object p2

    invoke-virtual {v4, p2, p1, p0}, Lsz8;->j([BLcom/google/android/gms/fido/fido2/api/common/AuthenticatorAttestationResponse;Z)Lz7d;

    move-result-object p0

    iget-boolean p1, v0, Lek2;->f:Z

    if-eqz p1, :cond_b2

    iget-object p1, v0, Lek2;->h:Ln61;

    invoke-virtual {p1, v2, p0, v3}, Ln61;->b(ILz7d;Lzsn;)V

    iput-boolean v2, v0, Lek2;->f:Z

    iput-object v3, v0, Lek2;->h:Ln61;

    iput-object v3, v0, Lek2;->i:Ln61;

    iput-object v3, v0, Lek2;->e:Lsz8;
    :try_end_ae
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_95 .. :try_end_ae} :catch_af

    goto :goto_b2

    :catch_af
    invoke-virtual {v0, v5}, Lek2;->s(I)V

    :cond_b2
    :goto_b2
    return-void

    :cond_b3
    const-string p0, "FIDO2_ERROR_EXTRA"

    invoke-virtual {p2, p0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p0

    if-eqz p0, :cond_c3

    invoke-static {p0}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;->deserializeFromBytes([B)Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;

    move-result-object p0

    invoke-static {p0, v0}, Lsz8;->k(Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;Lek2;)V

    return-void

    :cond_c3
    const/16 p0, 0x20

    invoke-virtual {v0, p0}, Lek2;->s(I)V

    return-void
.end method
