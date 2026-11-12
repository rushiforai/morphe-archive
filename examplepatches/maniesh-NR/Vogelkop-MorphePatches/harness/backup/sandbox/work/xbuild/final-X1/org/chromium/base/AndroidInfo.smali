.class public final Lorg/chromium/base/AndroidInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a()Lorg/chromium/base/IAndroidInfo;
    .registers 4

    new-instance v0, Lorg/chromium/base/IAndroidInfo;

    invoke-direct {v0}, Lorg/chromium/base/IAndroidInfo;-><init>()V

    const-string v1, ", "

    sget-object v2, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->a:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x80

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->b:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->ID:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->c:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->BOARD:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->d:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->e:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->f:Ljava/lang/String;

    sget-object v1, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->g:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->h:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->i:Ljava/lang/String;

    invoke-static {}, Lorg/chromium/base/AndroidInfo;->b()Z

    move-result v1

    iput-boolean v1, v0, Lorg/chromium/base/IAndroidInfo;->j:Z

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->k:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->l:Ljava/lang/String;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    iput v1, v0, Lorg/chromium/base/IAndroidInfo;->m:I

    const/16 v2, 0x24

    if-lt v1, v2, :cond_5b

    invoke-static {}, Lx04;->a()I

    move-result v2

    iput v2, v0, Lorg/chromium/base/IAndroidInfo;->n:I

    goto :goto_61

    :cond_5b
    const v2, 0x186a0

    mul-int/2addr v2, v1

    iput v2, v0, Lorg/chromium/base/IAndroidInfo;->n:I

    :goto_61
    sget-object v2, Landroid/os/Build$VERSION;->SECURITY_PATCH:Ljava/lang/String;

    iput-object v2, v0, Lorg/chromium/base/IAndroidInfo;->o:Ljava/lang/String;

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_6c

    sget-object v1, Landroid/os/Build;->SOC_MANUFACTURER:Ljava/lang/String;

    goto :goto_6e

    :cond_6c
    const-string v1, ""

    :goto_6e
    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->p:Ljava/lang/String;

    sget-object v1, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    iput-object v1, v0, Lorg/chromium/base/IAndroidInfo;->q:Ljava/lang/String;

    return-object v0
.end method

.method public static b()Z
    .registers 2

    sget-object v0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string v1, "eng"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, "userdebug"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x0

    return v0

    :cond_14
    const/4 v0, 0x1

    return v0
.end method

.method public static c(Lorg/chromium/base/IAndroidInfo;)V
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/chromium/base/IAndroidInfo;->e:Ljava/lang/String;

    move-object v2, v1

    iget-object v1, v0, Lorg/chromium/base/IAndroidInfo;->h:Ljava/lang/String;

    move-object v3, v2

    iget-object v2, v0, Lorg/chromium/base/IAndroidInfo;->c:Ljava/lang/String;

    move-object v4, v3

    iget-object v3, v0, Lorg/chromium/base/IAndroidInfo;->k:Ljava/lang/String;

    move-object v5, v4

    iget-object v4, v0, Lorg/chromium/base/IAndroidInfo;->l:Ljava/lang/String;

    move-object v6, v5

    iget-object v5, v0, Lorg/chromium/base/IAndroidInfo;->f:Ljava/lang/String;

    move-object v7, v6

    iget-object v6, v0, Lorg/chromium/base/IAndroidInfo;->d:Ljava/lang/String;

    move-object v8, v7

    iget-object v7, v0, Lorg/chromium/base/IAndroidInfo;->b:Ljava/lang/String;

    move-object v9, v8

    iget-object v8, v0, Lorg/chromium/base/IAndroidInfo;->q:Ljava/lang/String;

    move-object v10, v9

    iget-object v9, v0, Lorg/chromium/base/IAndroidInfo;->i:Ljava/lang/String;

    move-object v11, v10

    iget-object v10, v0, Lorg/chromium/base/IAndroidInfo;->g:Ljava/lang/String;

    move-object v12, v11

    iget-object v11, v0, Lorg/chromium/base/IAndroidInfo;->p:Ljava/lang/String;

    move-object v13, v12

    iget-object v12, v0, Lorg/chromium/base/IAndroidInfo;->a:Ljava/lang/String;

    move-object v14, v13

    iget v13, v0, Lorg/chromium/base/IAndroidInfo;->m:I

    move-object v15, v14

    iget v14, v0, Lorg/chromium/base/IAndroidInfo;->n:I

    move-object/from16 v16, v15

    iget-boolean v15, v0, Lorg/chromium/base/IAndroidInfo;->j:Z

    iget-object v0, v0, Lorg/chromium/base/IAndroidInfo;->o:Ljava/lang/String;

    move-object/from16 v17, v16

    move-object/from16 v16, v0

    move-object/from16 v0, v17

    invoke-static/range {v0 .. v16}, LJ/N;->MYc8mtnY(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IIZLjava/lang/Object;)V

    return-void
.end method

.method public static nativeReadyForFields()V
    .registers 1

    invoke-static {}, Lorg/chromium/base/AndroidInfo;->a()Lorg/chromium/base/IAndroidInfo;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/AndroidInfo;->c(Lorg/chromium/base/IAndroidInfo;)V

    return-void
.end method
