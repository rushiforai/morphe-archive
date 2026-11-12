.class public final Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;
    }
.end annotation


# static fields
.field public static final a:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge;->a:Ljava/util/ArrayList;

    return-void
.end method

.method public static getCredentialDetailsCredentialId(Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;)[B
    .registers 1
    .param p0    # Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;->a:[B

    return-object p0
.end method

.method public static getCredentialDetailsDisplayName(Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;)Ljava/lang/String;
    .registers 1
    .param p0    # Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static getCredentialDetailsUserId(Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;)[B
    .registers 1
    .param p0    # Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;->b:[B

    return-object p0
.end method

.method public static getCredentialDetailsUsername(Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;)Ljava/lang/String;
    .registers 1
    .param p0    # Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge$CredentialDetails;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static onWebAuthnAccountSelected(Lorg/chromium/content_public/browser/WebContents;[B)V
    .registers 7
    .param p0    # Lorg/chromium/content_public/browser/WebContents;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_7
    if-ge v2, v1, :cond_1a

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lrpf;

    iget-object v4, v3, Lrpf;->a:Lorg/chromium/content_public/browser/WebContents;

    if-ne v4, p0, :cond_7

    iget-object p0, v3, Lrpf;->c:Ltu;

    invoke-virtual {p0, p1}, Ltu;->run(Ljava/lang/Object;)V

    :cond_1a
    return-void
.end method
