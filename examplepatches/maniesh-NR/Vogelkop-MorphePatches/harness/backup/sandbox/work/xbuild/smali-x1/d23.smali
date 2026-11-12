.class public final Ld23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/oauth2/OAuth2Account;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Ld23;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ld23;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 12
    iput-byte p2, p0, Ld23;->a:B

    iput-object p1, p0, Ld23;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Ld23;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_be

    iget-object v0, p0, Ld23;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/base/Callback;

    invoke-interface {v0, p1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    iput-object v2, p0, Ld23;->b:Ljava/lang/Object;

    return-void

    :pswitch_11
    check-cast p1, Lcom/opera/android/oauth2/LoginResult;

    iget-object p0, p0, Ld23;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/oauth2/OAuth2Account;

    iget v0, p1, Lcom/opera/android/oauth2/LoginResult;->a:I

    sget-object v3, Lqs7;->i:Lqs7;

    if-eqz v0, :cond_2b

    if-eq v0, v1, :cond_2c

    const/4 v4, 0x2

    if-eq v0, v4, :cond_28

    const/4 v4, 0x3

    if-ne v0, v4, :cond_2c

    sget-object v3, Lqs7;->j:Lqs7;

    goto :goto_2c

    :cond_28
    sget-object v3, Lqs7;->h:Lqs7;

    goto :goto_2c

    :cond_2b
    move-object v3, v2

    :cond_2c
    :goto_2c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/opera/android/oauth2/OAuth2Account;->b:Lyqa;

    if-eqz v3, :cond_37

    invoke-virtual {v0}, Lyqa;->m()V

    goto :goto_aa

    :cond_37
    iget-object p1, p1, Lcom/opera/android/oauth2/LoginResult;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/opera/android/oauth2/OAuth2Account;->d(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/opera/android/oauth2/OAuth2Account;->e(Z)V

    iget-object p0, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Ldb;

    iget-object p1, p0, Ldb;->d:Ljh0;

    if-eqz p1, :cond_77

    iget-object p1, v0, Lyqa;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    iget-object v0, p0, Ldb;->d:Ljh0;

    invoke-virtual {p1, v0}, Lx5f;->b0(Ljh0;)V

    iget-object p1, p0, Ldb;->d:Ljh0;

    iget-object v0, p0, Ldb;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "account_type"

    iget-byte p1, p1, Ljh0;->a:B

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_77
    iget-object p1, p0, Ldb;->e:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_7d
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8d

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcb;

    invoke-virtual {v0}, Lcb;->c()V

    goto :goto_7d

    :cond_8d
    iput-object v2, p0, Ldb;->d:Ljh0;

    iget-object p1, p0, Ldb;->f:Ln1;

    if-eqz p1, :cond_a8

    iget-object p1, p1, Ln1;->b:Ljava/lang/Object;

    check-cast p1, Lwjh;

    iget-object v0, p1, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Ldb;

    iput-object v2, v0, Ldb;->f:Ln1;

    iget-object p1, p1, Lwjh;->c:Ljava/lang/Object;

    check-cast p1, Lab;

    if-eqz p1, :cond_a8

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v0}, Lab;->run(Ljava/lang/Object;)V

    :cond_a8
    iput-object v2, p0, Ldb;->g:Ljava/lang/String;

    :goto_aa
    return-void

    :pswitch_ab
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-lez p1, :cond_bc

    iget-object p0, p0, Ld23;->b:Ljava/lang/Object;

    check-cast p0, Le23;

    iput-boolean v1, p0, Le23;->b:Z

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_bc
    return-void

    nop

    :pswitch_data_be
    .packed-switch 0x0
        :pswitch_ab
        :pswitch_11
    .end packed-switch
.end method
