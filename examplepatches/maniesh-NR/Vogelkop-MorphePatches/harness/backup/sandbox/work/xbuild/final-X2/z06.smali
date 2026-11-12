.class public final Lz06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/OutcomeReceiver;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lek2;

.field public final synthetic c:Z

.field public final synthetic d:La16;


# direct methods
.method public constructor <init>(La16;ZLek2;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lz06;->a:Z

    iput-object p3, p0, Lz06;->b:Lek2;

    iput-boolean p4, p0, Lz06;->c:Z

    iput-object p1, p0, Lz06;->d:La16;

    return-void
.end method


# virtual methods
.method public final onError(Ljava/lang/Throwable;)V
    .registers 4

    check-cast p1, Landroid/credentials/GetCredentialException;

    invoke-virtual {p1}, Landroid/credentials/GetCredentialException;->getType()Ljava/lang/String;

    move-result-object p1

    iget-boolean v0, p0, Lz06;->c:Z

    const-string v1, "android.credentials.GetCredentialException.TYPE_NO_CREDENTIAL"

    if-eqz v0, :cond_13

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    return-void

    :cond_13
    const-string v0, "android.credentials.GetCredentialException.TYPE_USER_CANCELED"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object p0, p0, Lz06;->b:Lek2;

    if-nez v0, :cond_29

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_29

    const/16 p1, 0x20

    invoke-virtual {p0, p1}, Lek2;->s(I)V

    return-void

    :cond_29
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lek2;->s(I)V

    return-void
.end method

.method public final onResult(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Landroid/credentials/GetCredentialResponse;

    iget-object v0, p0, Lz06;->d:La16;

    iget-boolean v1, p0, Lz06;->a:Z

    invoke-virtual {p1}, Landroid/credentials/GetCredentialResponse;->getCredential()Landroid/credentials/Credential;

    move-result-object v2

    invoke-virtual {v2}, Landroid/credentials/Credential;->getType()Ljava/lang/String;

    move-result-object v2

    const-string v3, "androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object p0, p0, Lz06;->b:Lek2;

    const/16 v3, 0x20

    if-nez v2, :cond_1e

    invoke-virtual {p0, v3}, Lek2;->s(I)V

    return-void

    :cond_1e
    invoke-virtual {p1}, Landroid/credentials/GetCredentialResponse;->getCredential()Landroid/credentials/Credential;

    move-result-object p1

    invoke-virtual {p1}, Landroid/credentials/Credential;->getData()Landroid/os/Bundle;

    move-result-object p1

    const-string v2, "androidx.credentials.BUNDLE_KEY_AUTHENTICATION_RESPONSE_JSON"

    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_32

    invoke-virtual {p0, v3}, Lek2;->s(I)V

    return-void

    :cond_32
    :try_start_32
    invoke-virtual {v0, p1, v1}, La16;->e(Ljava/lang/String;Z)Lrw9;

    move-result-object p1

    invoke-virtual {p0, p1}, Lek2;->t(Lrw9;)V
    :try_end_39
    .catch Lorg/json/JSONException; {:try_start_32 .. :try_end_39} :catch_3a

    return-void

    :catch_3a
    invoke-virtual {p0, v3}, Lek2;->s(I)V

    return-void
.end method
