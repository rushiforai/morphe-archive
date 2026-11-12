.class public final synthetic Lpz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# instance fields
.field public final synthetic a:Lsz8;

.field public final synthetic b:Z

.field public final synthetic c:Lb9h;

.field public final synthetic d:Lcx9;

.field public final synthetic e:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

.field public final synthetic f:Ldx3;

.field public final synthetic g:Lorg/chromium/content_public/browser/RenderFrameHost;

.field public final synthetic h:Lorg/chromium/url/Origin;

.field public final synthetic i:Z

.field public final synthetic j:Lek2;


# direct methods
.method public synthetic constructor <init>(Lsz8;ZLb9h;Lcx9;Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;ZLek2;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpz8;->a:Lsz8;

    iput-boolean p2, p0, Lpz8;->b:Z

    iput-object p3, p0, Lpz8;->c:Lb9h;

    iput-object p4, p0, Lpz8;->d:Lcx9;

    iput-object p5, p0, Lpz8;->e:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    iput-object p6, p0, Lpz8;->f:Ldx3;

    iput-object p7, p0, Lpz8;->g:Lorg/chromium/content_public/browser/RenderFrameHost;

    iput-object p8, p0, Lpz8;->h:Lorg/chromium/url/Origin;

    iput-boolean p9, p0, Lpz8;->i:Z

    iput-object p10, p0, Lpz8;->j:Lek2;

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/Object;)V
    .registers 13

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lpz8;->a:Lsz8;

    iget v1, v0, Lsz8;->b:I

    const/4 v2, 0x5

    const/4 v3, 0x1

    if-ne v1, v2, :cond_d

    iput v3, v0, Lsz8;->b:I

    return-void

    :cond_d
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_16
    :goto_16
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v10, 0x0

    if-eqz v1, :cond_4d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;

    invoke-virtual {v1}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getIsDiscoverable()Z

    move-result v2

    if-eqz v2, :cond_16

    iget-boolean v2, p0, Lpz8;->b:Z

    if-nez v2, :cond_31

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_16

    :cond_31
    iget-object v2, p0, Lpz8;->c:Lb9h;

    iget-object v2, v2, Lb9h;->e:[Ly8h;

    array-length v4, v2

    :goto_36
    if-ge v10, v4, :cond_16

    aget-object v5, v2, v10

    invoke-virtual {v1}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getCredentialId()[B

    move-result-object v6

    iget-object v5, v5, Ly8h;->c:[B

    invoke-static {v6, v5}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v5

    if-eqz v5, :cond_4a

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_16

    :cond_4a
    add-int/lit8 v10, v10, 0x1

    goto :goto_36

    :cond_4d
    iget-object v2, p0, Lpz8;->d:Lcx9;

    iget p1, v2, Lcx9;->b:I

    iget-object v1, p0, Lpz8;->e:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    iget-object v4, p0, Lpz8;->f:Ldx3;

    iget-object v5, p0, Lpz8;->g:Lorg/chromium/content_public/browser/RenderFrameHost;

    iget-object v6, p0, Lpz8;->h:Lorg/chromium/url/Origin;

    iget-boolean v7, p0, Lpz8;->i:Z

    iget-object v8, p0, Lpz8;->j:Lek2;

    if-eq p1, v3, :cond_71

    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_71

    iput v3, v0, Lsz8;->b:I

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move v6, v7

    move-object v7, v8

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Lsz8;->g(Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lcx9;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;ZLek2;[B)V

    return-void

    :cond_71
    const/4 p0, 0x3

    iput p0, v0, Lsz8;->b:I

    iput-object v8, v0, Lsz8;->c:Lek2;

    iget-object p0, v0, Lsz8;->d:Ltyn;

    if-nez p0, :cond_94

    iget-object p0, v0, Lsz8;->a:Lbk2;

    iget-object p0, p0, Lbk2;->b:Lek2;

    iget-object p0, p0, Lek2;->b:Lorg/chromium/content_public/browser/WebContents;

    sget-object p1, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {p0}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-nez p0, :cond_8c

    const/4 p0, 0x0

    goto :goto_92

    :cond_8c
    new-instance p1, Ltyn;

    invoke-direct {p1, p0}, Ltyn;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    move-object p0, p1

    :goto_92
    iput-object p0, v0, Lsz8;->d:Ltyn;

    :cond_94
    iget p1, v2, Lcx9;->b:I

    if-nez p0, :cond_a5

    if-eq p1, v3, :cond_133

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move v6, v7

    move-object v7, v8

    new-array v8, v10, [B

    invoke-virtual/range {v0 .. v8}, Lsz8;->g(Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lcx9;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;ZLek2;[B)V

    return-void

    :cond_a5
    if-ne p1, v3, :cond_ac

    move p1, v3

    :goto_a8
    move-object v3, v2

    move-object v2, v1

    move-object v1, v0

    goto :goto_ae

    :cond_ac
    move p1, v10

    goto :goto_a8

    :goto_ae
    new-instance v0, Llz8;

    invoke-direct/range {v0 .. v8}, Llz8;-><init>(Lsz8;Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lcx9;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;ZLek2;)V

    move-object v4, v5

    iget-object v1, p0, Ltyn;->a:Ljava/util/LinkedHashMap;

    iget-object v2, p0, Ltyn;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-nez v2, :cond_c0

    new-array p0, v10, [B

    invoke-virtual {v0, p0}, Llz8;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_c0
    if-eqz p1, :cond_10d

    iget-object p1, p0, Ltyn;->c:Lrpf;

    if-eqz p1, :cond_c9

    invoke-virtual {p1}, Lrpf;->a()V

    :cond_c9
    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    new-instance v1, Ltu;

    const/16 v2, 0xf

    invoke-direct {v1, v0, v2}, Ltu;-><init>(Ljava/lang/Object;B)V

    sget-object v0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge;->a:Ljava/util/ArrayList;

    new-instance v0, Lrpf;

    invoke-direct {v0, p1, v4, v1}, Lrpf;-><init>(Lorg/chromium/content_public/browser/WebContents;Lorg/chromium/content_public/browser/RenderFrameHost;Ltu;)V

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;

    :goto_e1
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v10, v2, :cond_107

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;

    new-instance v3, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;

    invoke-virtual {v2}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getCredentialId()[B

    move-result-object v5

    invoke-virtual {v2}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getUserId()[B

    move-result-object v6

    invoke-virtual {v2}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getUserName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getUserDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v5, v7, v2, v6}, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;-><init>([BLjava/lang/String;Ljava/lang/String;[B)V

    aput-object v3, v1, v10

    add-int/lit8 v10, v10, 0x1

    goto :goto_e1

    :cond_107
    invoke-static {p1, v4, v1}, LJ/N;->MCF7cEPC(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Ltyn;->c:Lrpf;

    return-void

    :cond_10d
    invoke-interface {v4}, Lorg/chromium/content_public/browser/RenderFrameHost;->c()Liz9;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcej;

    if-eqz p0, :cond_11e

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Lcej;->finish(Lhjm;)V

    :cond_11e
    new-instance p0, Lxq3;

    const/16 p1, 0xb

    invoke-direct {p0, v9, v0, p1}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v4}, Lorg/chromium/content_public/browser/RenderFrameHost;->c()Liz9;

    move-result-object p1

    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-eqz p1, :cond_133

    invoke-interface {p1, p0}, Lcom/opera/android/browser/dialog/DialogDelegate;->d(Lcej;)V

    :cond_133
    return-void
.end method
