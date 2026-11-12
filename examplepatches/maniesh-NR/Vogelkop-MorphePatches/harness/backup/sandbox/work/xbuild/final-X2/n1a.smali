.class public final Ln1a;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final a:Landroid/accounts/Account;

.field public final synthetic b:Lp1a;


# direct methods
.method public constructor <init>(Lp1a;Landroid/accounts/Account;)V
    .registers 3

    iput-object p1, p0, Ln1a;->b:Lp1a;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Ln1a;->a:Landroid/accounts/Account;

    return-void
.end method


# virtual methods
.method public final a()Lo1a;
    .registers 3

    iget-object v0, p0, Ln1a;->b:Lp1a;

    iget-object v0, v0, Lp1a;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Ln1a;->a:Landroid/accounts/Account;

    const-string v1, "oauth2:profile email"

    invoke-static {v0, p0, v1}, Lcom/google/android/gms/auth/GoogleAuthUtil;->getToken(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lo1a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lo1a;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    return-object v0
.end method

.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, [Ljava/lang/Void;

    :try_start_2
    invoke-virtual {p0}, Ln1a;->a()Lo1a;

    move-result-object p0
    :try_end_6
    .catch Lcom/google/android/gms/auth/GoogleAuthException; {:try_start_2 .. :try_end_6} :catch_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_6} :catch_7

    return-object p0

    :catch_7
    move-exception p0

    new-instance p1, Lo1a;

    const/4 v0, 0x0

    invoke-direct {p1, v0, p0}, Lo1a;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    return-object p1
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 7

    check-cast p1, Lo1a;

    iget-object v0, p1, Lo1a;->b:Ljava/lang/Exception;

    instance-of v1, v0, Lcom/google/android/gms/auth/UserRecoverableAuthException;

    const/4 v2, 0x0

    iget-object p0, p0, Ln1a;->b:Lp1a;

    if-eqz v1, :cond_34

    check-cast v0, Lcom/google/android/gms/auth/UserRecoverableAuthException;

    invoke-virtual {v0}, Lcom/google/android/gms/auth/UserRecoverableAuthException;->getIntent()Landroid/content/Intent;

    move-result-object p1

    iget-object v0, p0, Lp1a;->b:Landroid/app/Activity;

    instance-of v1, v0, Lhjf;

    const/16 v3, 0x3e9

    if-eqz v1, :cond_2e

    move-object v1, v0

    check-cast v1, Lhjf;

    new-instance v2, Lm1a;

    invoke-direct {v2, p0, v3}, Lm1a;-><init>(Lp1a;I)V

    iget-object p0, v1, Lhjf;->c:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, p1, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :cond_2e
    const/high16 p1, -0x80000000

    invoke-virtual {p0, v3, p1, v2}, Lp1a;->a(IILandroid/content/Intent;)V

    return-void

    :cond_34
    iget-object p1, p1, Lo1a;->a:Ljava/lang/String;

    if-eqz p1, :cond_9f

    iget-object p0, p0, Lp1a;->a:Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lq0a;

    new-instance v0, Lvzk;

    new-instance v1, Li4d;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v2}, Li4d;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lvzk;-><init>(Ltif;)V

    new-instance p0, Ltvh;

    invoke-direct {p0}, Ltvh;-><init>()V

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v2}, Lvep;->h(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "get_opera_access_token"

    const-string v3, "1"

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "create_user_if_not_exists"

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "provider"

    const-string v3, "google"

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltvh;->a:Ljava/lang/String;

    new-instance v1, Llyf;

    const-string v2, "X-Mobile-Client-AuthAPI"

    const-string v4, "2"

    invoke-direct {v1, v2, v4}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, p0, Ltvh;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Llyf;

    const-string v2, "token"

    invoke-direct {v1, v2, p1}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Ltvh;->c:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, p0, v3}, Lvzk;->a0(Ltvh;Ljava/lang/String;)V

    return-void

    :cond_9f
    iget-object p0, p0, Lp1a;->a:Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lq0a;

    iget-object p0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    invoke-virtual {p0, v2}, Lwjh;->t(Ljava/lang/CharSequence;)V

    return-void
.end method
