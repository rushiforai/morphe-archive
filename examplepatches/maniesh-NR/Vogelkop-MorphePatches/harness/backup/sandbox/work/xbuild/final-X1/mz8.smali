.class public final synthetic Lmz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lni;


# instance fields
.field public final synthetic a:Lsz8;

.field public final synthetic b:Lorg/chromium/content_public/browser/RenderFrameHost;

.field public final synthetic c:Lek2;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lsz8;Lorg/chromium/content_public/browser/RenderFrameHost;Lek2;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmz8;->a:Lsz8;

    iput-object p2, p0, Lmz8;->b:Lorg/chromium/content_public/browser/RenderFrameHost;

    iput-object p3, p0, Lmz8;->c:Lek2;

    iput-boolean p4, p0, Lmz8;->d:Z

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 11

    iget-object v0, p0, Lmz8;->a:Lsz8;

    iget v1, v0, Lsz8;->b:I

    iget-object v2, p0, Lmz8;->b:Lorg/chromium/content_public/browser/RenderFrameHost;

    const/4 v3, 0x1

    if-eq v1, v3, :cond_2a

    if-nez p2, :cond_25

    const/4 p0, 0x5

    if-ne v1, p0, :cond_21

    iput v3, v0, Lsz8;->b:I

    invoke-virtual {v0, v2}, Lsz8;->b(Lorg/chromium/content_public/browser/RenderFrameHost;)V

    iget-object p0, v0, Lsz8;->c:Lek2;

    if-nez p0, :cond_18

    return-void

    :cond_18
    const/16 p1, 0xd

    invoke-virtual {p0, p1}, Lek2;->s(I)V

    const/4 p0, 0x0

    iput-object p0, v0, Lsz8;->c:Lek2;

    return-void

    :cond_21
    const/4 p0, 0x3

    iput p0, v0, Lsz8;->b:I

    return-void

    :cond_25
    iput v3, v0, Lsz8;->b:I

    invoke-virtual {v0, v2}, Lsz8;->b(Lorg/chromium/content_public/browser/RenderFrameHost;)V

    :cond_2a
    iget-object v1, p0, Lmz8;->c:Lek2;

    const/4 v4, 0x2

    if-nez p1, :cond_33

    invoke-virtual {v1, v4}, Lek2;->s(I)V

    return-void

    :cond_33
    const/4 v5, -0x1

    if-ne p1, v5, :cond_113

    if-eqz p2, :cond_113

    const-string p1, "FIDO2_CREDENTIAL_EXTRA"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p1

    iget-boolean p0, p0, Lmz8;->d:Z

    if-eqz p1, :cond_e4

    invoke-static {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->deserializeFromBytes([B)Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getResponse()Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorResponse;

    move-result-object v5

    instance-of v6, v5, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;

    if-eqz v6, :cond_54

    check-cast v5, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;

    invoke-static {v5, v1}, Lsz8;->k(Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;Lek2;)V

    return-void

    :cond_54
    instance-of v5, v5, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAssertionResponse;

    if-eqz v5, :cond_e4

    iget-object p2, v0, Lsz8;->e:[B

    if-eqz p2, :cond_5f

    invoke-interface {v2}, Lorg/chromium/content_public/browser/RenderFrameHost;->g()V

    :cond_5f
    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getRawId()[B

    move-result-object p2

    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getResponse()Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorResponse;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAssertionResponse;

    invoke-virtual {v0, p2, v2, p0}, Lsz8;->i([BLcom/google/android/gms/fido/fido2/api/common/AuthenticatorAssertionResponse;Z)Lrw9;

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getClientExtensionResults()Lcom/google/android/gms/fido/fido2/api/common/AuthenticationExtensionsClientOutputs;

    move-result-object p2

    if-eqz p2, :cond_c4

    iget-object v0, p0, Lrw9;->f:Lxj2;

    iput-boolean v3, v0, Lxj2;->c:Z

    invoke-virtual {p2}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticationExtensionsClientOutputs;->getUvmEntries()Lcom/google/android/gms/fido/fido2/api/common/UvmEntries;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/gms/fido/fido2/api/common/UvmEntries;->getUvmEntryList()Ljava/util/List;

    move-result-object p2

    const/4 v2, 0x0

    if-nez p2, :cond_85

    new-array p2, v2, [Lszm;

    goto :goto_c2

    :cond_85
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lszm;

    :goto_8b
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_c1

    new-instance v6, Lszm;

    const/16 v7, 0x10

    invoke-direct {v6, v7}, Luik;-><init>(I)V

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/fido/fido2/api/common/UvmEntry;

    invoke-virtual {v7}, Lcom/google/android/gms/fido/fido2/api/common/UvmEntry;->getUserVerificationMethod()I

    move-result v7

    iput v7, v6, Lszm;->b:I

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/fido/fido2/api/common/UvmEntry;

    invoke-virtual {v7}, Lcom/google/android/gms/fido/fido2/api/common/UvmEntry;->getKeyProtectionType()S

    move-result v7

    iput-short v7, v6, Lszm;->c:S

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/fido/fido2/api/common/UvmEntry;

    invoke-virtual {v7}, Lcom/google/android/gms/fido/fido2/api/common/UvmEntry;->getMatcherProtectionType()S

    move-result v7

    iput-short v7, v6, Lszm;->d:S

    aput-object v6, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_8b

    :cond_c1
    move-object p2, v5

    :goto_c2
    iput-object p2, v0, Lxj2;->d:[Lszm;

    :cond_c4
    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/PublicKeyCredential;->getAuthenticatorAttachment()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p2, "cross-platform"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_de

    const-string p2, "platform"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e0

    iput v3, p0, Lrw9;->c:I

    goto :goto_e0

    :cond_de
    iput v4, p0, Lrw9;->c:I

    :cond_e0
    :goto_e0
    invoke-virtual {v1, p0}, Lek2;->t(Lrw9;)V

    return-void

    :cond_e4
    const-string p1, "FIDO2_RESPONSE_EXTRA"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p1

    if-eqz p1, :cond_103

    invoke-static {p1}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAssertionResponse;->deserializeFromBytes([B)Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAssertionResponse;

    move-result-object p1

    iget-object p2, v0, Lsz8;->e:[B

    if-eqz p2, :cond_f7

    invoke-interface {v2}, Lorg/chromium/content_public/browser/RenderFrameHost;->g()V

    :cond_f7
    invoke-virtual {p1}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorAssertionResponse;->getKeyHandle()[B

    move-result-object p2

    invoke-virtual {v0, p2, p1, p0}, Lsz8;->i([BLcom/google/android/gms/fido/fido2/api/common/AuthenticatorAssertionResponse;Z)Lrw9;

    move-result-object p0

    invoke-virtual {v1, p0}, Lek2;->t(Lrw9;)V

    return-void

    :cond_103
    const-string p0, "FIDO2_ERROR_EXTRA"

    invoke-virtual {p2, p0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p0

    if-eqz p0, :cond_113

    invoke-static {p0}, Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;->deserializeFromBytes([B)Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;

    move-result-object p0

    invoke-static {p0, v1}, Lsz8;->k(Lcom/google/android/gms/fido/fido2/api/common/AuthenticatorErrorResponse;Lek2;)V

    return-void

    :cond_113
    const/16 p0, 0x20

    invoke-virtual {v1, p0}, Lek2;->s(I)V

    return-void
.end method
