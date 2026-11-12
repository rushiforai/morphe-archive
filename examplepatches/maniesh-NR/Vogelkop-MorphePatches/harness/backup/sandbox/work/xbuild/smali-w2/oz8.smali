.class public final synthetic Loz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:Lsz8;

.field public final synthetic b:Lek2;

.field public final synthetic c:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

.field public final synthetic d:Lcx9;

.field public final synthetic e:Ldx3;

.field public final synthetic f:Lorg/chromium/content_public/browser/RenderFrameHost;

.field public final synthetic g:Lorg/chromium/url/Origin;


# direct methods
.method public synthetic constructor <init>(Lsz8;Lek2;Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lcx9;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loz8;->a:Lsz8;

    iput-object p2, p0, Loz8;->b:Lek2;

    iput-object p3, p0, Loz8;->c:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    iput-object p4, p0, Loz8;->d:Lcx9;

    iput-object p5, p0, Loz8;->e:Ldx3;

    iput-object p6, p0, Loz8;->f:Lorg/chromium/content_public/browser/RenderFrameHost;

    iput-object p7, p0, Loz8;->g:Lorg/chromium/url/Origin;

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 14

    check-cast p1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;

    iget v0, p1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;->b:I

    iget-object v8, p0, Loz8;->b:Lek2;

    if-eqz v0, :cond_c

    invoke-virtual {v8, v0}, Lek2;->s(I)V

    return-void

    :cond_c
    iget-boolean v7, p1, Lorg/chromium/content_public/browser/RenderFrameHost$WebAuthSecurityChecksResults;->a:Z

    iget-object v3, p0, Loz8;->d:Lcx9;

    iget-object v4, v3, Lcx9;->c:Lb9h;

    iget-object p1, v4, Lb9h;->e:[Ly8h;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_1e

    array-length p1, p1

    if-eqz p1, :cond_1e

    move-object v5, v3

    move v3, v1

    goto :goto_20

    :cond_1e
    move-object v5, v3

    move v3, v0

    :goto_20
    if-nez v3, :cond_26

    iget-object p1, v4, Lb9h;->h:Lwj2;

    iput-boolean v0, p1, Lwj2;->c:Z

    :cond_26
    iget p1, v5, Lcx9;->b:I

    iget-object v2, p0, Loz8;->a:Lsz8;

    iget-object v6, p0, Loz8;->c:Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;

    move-object v0, v4

    iget-object v4, p0, Loz8;->e:Ldx3;

    move v9, v3

    move-object v3, v5

    iget-object v5, p0, Loz8;->f:Lorg/chromium/content_public/browser/RenderFrameHost;

    iget-object p0, p0, Loz8;->g:Lorg/chromium/url/Origin;

    if-eq p1, v1, :cond_41

    if-eqz v9, :cond_41

    const/4 v9, 0x0

    move-object v1, v2

    move-object v2, v6

    move-object v6, p0

    invoke-virtual/range {v1 .. v9}, Lsz8;->g(Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Lcx9;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;ZLek2;[B)V

    return-void

    :cond_41
    move-object v1, v2

    move-object v2, v6

    move-object v6, p0

    const/4 p0, 0x2

    iput p0, v1, Lsz8;->b:I

    iput-object v8, v1, Lsz8;->c:Lek2;

    :try_start_49
    iget-object p0, v0, Lb9h;->d:Ljava/lang/String;

    invoke-virtual {v2, p0}, Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;->getCredentialList(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0
    :try_end_4f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_49 .. :try_end_4f} :catch_6c

    move-object v11, v8

    move-object v8, v5

    move-object v5, v3

    move v3, v9

    move-object v9, v6

    move-object v6, v2

    move-object v2, v1

    new-instance v1, Lpz8;

    move v10, v7

    move-object v7, v4

    move-object v4, v0

    invoke-direct/range {v1 .. v11}, Lpz8;-><init>(Lsz8;ZLb9h;Lcx9;Lcom/google/android/gms/fido/fido2/Fido2PrivilegedApiClient;Ldx3;Lorg/chromium/content_public/browser/RenderFrameHost;Lorg/chromium/url/Origin;ZLek2;)V

    move-object v8, v11

    invoke-virtual {p0, v1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    new-instance p1, Lbk2;

    const/4 v0, 0x4

    invoke-direct {p1, v8, v0}, Lbk2;-><init>(Lek2;B)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    :catch_6c
    const/16 p0, 0x20

    invoke-virtual {v8, p0}, Lek2;->s(I)V

    return-void
.end method
