.class public final Ly06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/OutcomeReceiver;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lek2;

.field public final synthetic c:La16;


# direct methods
.method public constructor <init>(La16;ZLek2;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Ly06;->a:Z

    iput-object p3, p0, Ly06;->b:Lek2;

    iput-object p1, p0, Ly06;->c:La16;

    return-void
.end method


# virtual methods
.method public final onError(Ljava/lang/Throwable;)V
    .registers 3

    check-cast p1, Landroid/credentials/CreateCredentialException;

    invoke-virtual {p1}, Landroid/credentials/CreateCredentialException;->getType()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.credentials.CreateCredentialException.TYPE_USER_CANCELED"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object p0, p0, Ly06;->b:Lek2;

    if-eqz v0, :cond_15

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lek2;->s(I)V

    return-void

    :cond_15
    const-string v0, "INVALID_STATE_ERROR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_22

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lek2;->s(I)V

    return-void

    :cond_22
    const/16 p1, 0x20

    invoke-virtual {p0, p1}, Lek2;->s(I)V

    return-void
.end method

.method public final onResult(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Landroid/credentials/CreateCredentialResponse;

    iget-object v0, p0, Ly06;->c:La16;

    iget-boolean v1, p0, Ly06;->a:Z

    invoke-virtual {p1}, Landroid/credentials/CreateCredentialResponse;->getData()Landroid/os/Bundle;

    move-result-object p1

    const-string v2, "androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON"

    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Ly06;->b:Lek2;

    const/16 v2, 0x20

    if-nez p1, :cond_1a

    invoke-virtual {p0, v2}, Lek2;->s(I)V

    return-void

    :cond_1a
    :try_start_1a
    invoke-virtual {v0, p1, v1}, La16;->d(Ljava/lang/String;Z)Lz7d;

    move-result-object p1

    iget-boolean v0, p0, Lek2;->f:Z

    if-nez v0, :cond_23

    return-void

    :cond_23
    iget-object v0, p0, Lek2;->h:Ln61;

    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v3, p1, v1}, Ln61;->b(ILz7d;Lzsn;)V

    iput-boolean v3, p0, Lek2;->f:Z

    iput-object v1, p0, Lek2;->h:Ln61;

    iput-object v1, p0, Lek2;->i:Ln61;

    iput-object v1, p0, Lek2;->e:Lsz8;
    :try_end_32
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_32} :catch_33

    return-void

    :catch_33
    invoke-virtual {p0, v2}, Lek2;->s(I)V

    return-void
.end method
