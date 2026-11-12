.class public final Ldb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbb;

.field public final b:Lb59;

.field public c:Lcom/opera/android/oauth2/OAuth2Account;

.field public d:Ljh0;

.field public final e:Lh7f;

.field public f:Ln1;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lzwk;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ldb;->e:Lh7f;

    new-instance v0, Lbb;

    invoke-direct {v0, p0, p1, p2, p3}, Lbb;-><init>(Ldb;Landroid/content/Context;Lumi;Lzwk;)V

    iput-object v0, p0, Ldb;->a:Lbb;

    new-instance p3, Lya;

    const/4 v1, 0x0

    invoke-direct {p3, v0, v1}, Lya;-><init>(Lbb;B)V

    new-instance v2, Lb94;

    invoke-direct {v2, p2, p3, v1}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p3, 0x1

    new-array v3, p3, [Lbg1;

    aput-object v2, v3, v1

    const-string v1, "account_manager"

    invoke-static {p1, p2, v1, v3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Ldb;->b:Lb59;

    sget-object p0, Lcak;->d:Lavj;

    invoke-static {p3, v0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(Lcb;)V
    .registers 2

    iget-object p0, p0, Ldb;->e:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()Ljh0;
    .registers 3

    iget-object p0, p0, Ldb;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "account_type"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    packed-switch p0, :pswitch_data_2c

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_17
    sget-object p0, Ljh0;->h:Ljh0;

    return-object p0

    :pswitch_1a
    sget-object p0, Ljh0;->g:Ljh0;

    return-object p0

    :pswitch_1d
    sget-object p0, Ljh0;->f:Ljh0;

    return-object p0

    :pswitch_20
    sget-object p0, Ljh0;->e:Ljh0;

    return-object p0

    :pswitch_23
    sget-object p0, Ljh0;->d:Ljh0;

    return-object p0

    :pswitch_26
    sget-object p0, Ljh0;->c:Ljh0;

    return-object p0

    :pswitch_29
    sget-object p0, Ljh0;->b:Ljh0;

    return-object p0

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
    .end packed-switch
.end method

.method public final c()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    const/4 v0, 0x0

    if-nez p0, :cond_6

    return-object v0

    :cond_6
    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "pun_1"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()Z
    .registers 4

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    const/4 v0, 0x0

    if-nez p0, :cond_6

    return v0

    :cond_6
    invoke-virtual {p0}, Lcom/opera/android/oauth2/OAuth2Account;->b()Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "pun_1"

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_21

    const/4 p0, 0x1

    return p0

    :cond_21
    return v0
.end method

.method public final e()Z
    .registers 3

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    const/4 v0, 0x0

    if-nez p0, :cond_6

    return v0

    :cond_6
    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "pending"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public final f()Z
    .registers 1

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-virtual {p0}, Lcom/opera/android/oauth2/OAuth2Account;->b()Z

    move-result p0

    return p0
.end method

.method public final g(ZLjava/lang/Runnable;Lcom/opera/api/Callback;)Landroid/os/CancellationSignal;
    .registers 12

    new-instance v2, Landroid/os/CancellationSignal;

    invoke-direct {v2}, Landroid/os/CancellationSignal;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    if-nez p1, :cond_25

    iget-object p1, p0, Ldb;->b:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v0, "last_account_update_timestamp"

    const-wide/16 v6, 0x0

    invoke-interface {p1, v0, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    sub-long v0, v4, v0

    const-wide/32 v6, 0x1499700

    cmp-long p1, v0, v6

    if-gtz p1, :cond_25

    return-object v2

    :cond_25
    iget-object p1, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p1, :cond_2f

    const-string p0, "No account"

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v2

    :cond_2f
    new-instance v0, Lza;

    const/4 v7, 0x0

    move-object v1, p0

    move-object v6, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v7}, Lza;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;B)V

    new-instance p0, Li4d;

    invoke-direct {p0, p1, v0}, Li4d;-><init>(Lcom/opera/android/oauth2/OAuth2Account;Lza;)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p0}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    return-object v2
.end method

.method public final h(Lcb;)V
    .registers 2

    iget-object p0, p0, Ldb;->e:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final i(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 15

    iget-object v0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez v0, :cond_5

    return-void

    :cond_5
    sget-object v0, Ljh0;->c:Ljh0;

    const/4 v1, 0x0

    if-nez p5, :cond_1d

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_19

    if-nez p2, :cond_19

    iget-object p5, p0, Ldb;->g:Ljava/lang/String;

    iput-object v1, p0, Ldb;->g:Ljava/lang/String;

    iput-object v0, p0, Ldb;->d:Ljh0;

    goto :goto_1d

    :cond_19
    sget-object v2, Ljh0;->d:Ljh0;

    iput-object v2, p0, Ldb;->d:Ljh0;

    :cond_1d
    :goto_1d
    if-eqz p5, :cond_68

    invoke-virtual {p5}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, -0x1

    sparse-switch v2, :sswitch_data_90

    goto :goto_4f

    :sswitch_28
    const-string v2, "facebook"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_4f

    const/4 v3, 0x3

    goto :goto_4f

    :sswitch_32
    const-string v2, "vk"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_4f

    const/4 v3, 0x2

    goto :goto_4f

    :sswitch_3c
    const-string v2, "twitter"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_4f

    const/4 v3, 0x1

    goto :goto_4f

    :sswitch_46
    const-string v2, "google"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_4f

    const/4 v3, 0x0

    :cond_4f
    :goto_4f
    packed-switch v3, :pswitch_data_a2

    iput-object v0, p0, Ldb;->d:Ljh0;

    goto :goto_68

    :pswitch_55
    sget-object p5, Ljh0;->e:Ljh0;

    iput-object p5, p0, Ldb;->d:Ljh0;

    goto :goto_68

    :pswitch_5a
    sget-object p5, Ljh0;->h:Ljh0;

    iput-object p5, p0, Ldb;->d:Ljh0;

    goto :goto_68

    :pswitch_5f
    sget-object p5, Ljh0;->g:Ljh0;

    iput-object p5, p0, Ldb;->d:Ljh0;

    goto :goto_68

    :pswitch_64
    sget-object p5, Ljh0;->f:Ljh0;

    iput-object p5, p0, Ldb;->d:Ljh0;

    :cond_68
    :goto_68
    if-eqz p4, :cond_72

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p5

    if-eqz p5, :cond_72

    move-object v5, v1

    goto :goto_73

    :cond_72
    move-object v5, p4

    :goto_73
    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-wide v2, p0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    const-wide/16 p4, 0x0

    cmp-long p4, v2, p4

    if-eqz p4, :cond_89

    new-instance v8, Ld23;

    invoke-direct {v8, p0}, Ld23;-><init>(Lcom/opera/android/oauth2/OAuth2Account;)V

    move-object v7, p1

    move-object v6, p2

    move-object v4, p3

    invoke-static/range {v2 .. v8}, LJ/N;->METaRzWC(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_89
    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->b:Lyqa;

    invoke-virtual {p0}, Lyqa;->m()V

    return-void

    nop

    :sswitch_data_90
    .sparse-switch
        -0x49eca1c7 -> :sswitch_46
        -0x369e558d -> :sswitch_3c
        0xeb5 -> :sswitch_32
        0x1da19ac6 -> :sswitch_28
    .end sparse-switch

    :pswitch_data_a2
    .packed-switch 0x0
        :pswitch_64
        :pswitch_5f
        :pswitch_5a
        :pswitch_55
    .end packed-switch
.end method

.method public final j(Z)V
    .registers 3

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/oauth2/OAuth2Account;->f(ZZ)V

    return-void
.end method

.method public final k(Landroid/app/Activity;Ljava/lang/String;Lcom/opera/api/Callback;Lab;)Z
    .registers 12

    const/4 v0, 0x0

    iput-object v0, p0, Ldb;->g:Ljava/lang/String;

    new-instance v1, Lwjh;

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move-object v6, p3

    move-object v4, p4

    invoke-direct/range {v1 .. v6}, Lwjh;-><init>(Ldb;Landroid/app/Activity;Lab;Ljava/lang/String;Lcom/opera/api/Callback;)V

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result p0

    const/4 p1, 0x1

    const/4 p2, 0x0

    const/4 p3, -0x1

    sparse-switch p0, :sswitch_data_6e

    goto :goto_3f

    :sswitch_18
    const-string p0, "facebook"

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3f

    const/4 p3, 0x3

    goto :goto_3f

    :sswitch_22
    const-string p0, "vk"

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3f

    const/4 p3, 0x2

    goto :goto_3f

    :sswitch_2c
    const-string p0, "twitter"

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3f

    move p3, p1

    goto :goto_3f

    :sswitch_36
    const-string p0, "google"

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3f

    move p3, p2

    :cond_3f
    :goto_3f
    const/16 p0, 0x11

    packed-switch p3, :pswitch_data_80

    new-instance p3, Lcvj;

    invoke-direct {p3, v1, p0}, Ln1;-><init>(Ljava/lang/Object;B)V

    goto :goto_61

    :pswitch_4a
    new-instance p3, Lcvj;

    invoke-direct {p3, v1, p0}, Ln1;-><init>(Ljava/lang/Object;B)V

    goto :goto_61

    :pswitch_50
    new-instance p3, Lcvj;

    invoke-direct {p3, v1, p0}, Ln1;-><init>(Ljava/lang/Object;B)V

    goto :goto_61

    :pswitch_56
    new-instance p3, Lcvj;

    invoke-direct {p3, v1, p0}, Ln1;-><init>(Ljava/lang/Object;B)V

    goto :goto_61

    :pswitch_5c
    new-instance p3, Lq0a;

    invoke-direct {p3, v1}, Lq0a;-><init>(Lwjh;)V

    :goto_61
    iput-object p3, v2, Ldb;->f:Ln1;

    invoke-virtual {p3}, Ln1;->t0()Z

    move-result p0

    if-eqz p0, :cond_6d

    invoke-virtual {p3}, Ln1;->D0()V

    return p1

    :cond_6d
    return p2

    :sswitch_data_6e
    .sparse-switch
        -0x49eca1c7 -> :sswitch_36
        -0x369e558d -> :sswitch_2c
        0xeb5 -> :sswitch_22
        0x1da19ac6 -> :sswitch_18
    .end sparse-switch

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_56
        :pswitch_50
        :pswitch_4a
    .end packed-switch
.end method
