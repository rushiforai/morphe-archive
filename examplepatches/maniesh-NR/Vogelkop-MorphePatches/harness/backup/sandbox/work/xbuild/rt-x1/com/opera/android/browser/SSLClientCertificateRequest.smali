.class public final Lcom/opera/android/browser/SSLClientCertificateRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static selectClientCertificate(JLcom/opera/android/browser/chromium/ChromiumContent;[Ljava/lang/String;[[BLjava/lang/String;I)Z
    .registers 17
    .param p2    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # [[B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_2b

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-static {v1, v3}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    const/16 v4, 0x11

    const-wide/16 v5, 0x1

    invoke-virtual {v1, v4, v2, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_2b
    iget-object p2, p2, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    invoke-virtual {p2}, Lqi;->m()Lb2b;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/app/Activity;

    const/4 p2, 0x0

    if-eqz v3, :cond_54

    array-length v0, p4

    const/4 v1, 0x0

    if-lez v0, :cond_55

    array-length v0, p4

    new-array v0, v0, [Ljavax/security/auth/x500/X500Principal;

    move v4, p2

    :goto_43
    :try_start_43
    array-length v5, p4

    if-ge v4, v5, :cond_52

    new-instance v5, Ljavax/security/auth/x500/X500Principal;

    aget-object v6, p4, v4

    invoke-direct {v5, v6}, Ljavax/security/auth/x500/X500Principal;-><init>([B)V

    aput-object v5, v0, v4
    :try_end_4f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_43 .. :try_end_4f} :catch_54

    add-int/lit8 v4, v4, 0x1

    goto :goto_43

    :cond_52
    move-object v6, v0

    goto :goto_56

    :catch_54
    :cond_54
    return p2

    :cond_55
    move-object v6, v1

    :goto_56
    new-instance v4, Lbei;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {v4, p2, p0, p1}, Lbei;-><init>(Landroid/content/Context;J)V

    const/4 v9, 0x0

    move-object v5, p3

    move-object v7, p5

    move/from16 v8, p6

    :try_start_64
    invoke-static/range {v3 .. v9}, Landroid/security/KeyChain;->choosePrivateKeyAlias(Landroid/app/Activity;Landroid/security/KeyChainAliasCallback;[Ljava/lang/String;[Ljava/security/Principal;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_67
    .catch Landroid/content/ActivityNotFoundException; {:try_start_64 .. :try_end_67} :catch_68

    return v2

    :catch_68
    invoke-virtual {v4, v1}, Lbei;->alias(Ljava/lang/String;)V

    return v2
.end method
