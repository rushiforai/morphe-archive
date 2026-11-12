.class public final Lnc9;
.super Lrvh;
.source "SourceFile"


# instance fields
.field public final a:Lkc9;

.field public final b:Ldc9;

.field public final c:Lpe9;

.field public final d:Ljava/lang/Object;

.field public e:Lmc9;


# direct methods
.method public constructor <init>(Lkc9;Ldc9;Lpe9;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lnc9;->d:Ljava/lang/Object;

    iput-object p1, p0, Lnc9;->a:Lkc9;

    iput-object p2, p0, Lnc9;->b:Ldc9;

    iput-object p3, p0, Lnc9;->c:Lpe9;

    return-void
.end method


# virtual methods
.method public final contentLength()J
    .registers 5

    iget-object p0, p0, Lnc9;->a:Lkc9;

    invoke-interface {p0}, Lkc9;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x10

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public final writeTo(Lu04;)V
    .registers 18

    move-object/from16 v0, p0

    sget-object v1, Lp36;->a:Lii;

    const/16 v1, 0xc

    new-array v1, v1, [B

    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    iget-object v2, v0, Lnc9;->b:Ldc9;

    invoke-virtual {v2, v1}, Ldc9;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/crypto/Cipher;

    new-instance v3, Lic9;

    invoke-interface/range {p1 .. p1}, Lu04;->A1()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    iget-object v4, v0, Lnc9;->a:Lkc9;

    invoke-interface {v4}, Lkc9;->E()Ljava/io/InputStream;

    move-result-object v4

    iget-object v5, v0, Lnc9;->a:Lkc9;

    invoke-interface {v5}, Lkc9;->length()J

    move-result-wide v5

    const/high16 v7, 0x10000

    new-array v8, v7, [B

    new-array v7, v7, [B

    const-wide/16 v9, 0x0

    const/high16 v11, -0x40800000    # -1.0f

    :cond_37
    :goto_37
    :try_start_37
    invoke-virtual {v4, v8}, Ljava/io/InputStream;->read([B)I

    move-result v12
    :try_end_3b
    .catch Ljavax/crypto/BadPaddingException; {:try_start_37 .. :try_end_3b} :catch_8f
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_37 .. :try_end_3b} :catch_8f

    :goto_3b
    const/4 v13, -0x1

    const/4 v14, 0x0

    if-ne v12, v13, :cond_4d

    :try_start_3f
    invoke-virtual {v2, v14}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v15
    :try_end_43
    .catch Ljavax/crypto/ShortBufferException; {:try_start_3f .. :try_end_43} :catch_85
    .catch Ljavax/crypto/BadPaddingException; {:try_start_3f .. :try_end_43} :catch_8f
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_3f .. :try_end_43} :catch_8f

    :try_start_43
    array-length v13, v7

    if-le v15, v13, :cond_48

    new-array v7, v15, [B

    :cond_48
    invoke-virtual {v2, v7, v14}, Ljavax/crypto/Cipher;->doFinal([BI)I

    move-result v13

    goto :goto_51

    :cond_4d
    invoke-virtual {v2, v8, v14, v12, v7}, Ljavax/crypto/Cipher;->update([BII[B)I

    move-result v13
    :try_end_51
    .catch Ljavax/crypto/ShortBufferException; {:try_start_43 .. :try_end_51} :catch_84
    .catch Ljavax/crypto/BadPaddingException; {:try_start_43 .. :try_end_51} :catch_8f
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_43 .. :try_end_51} :catch_8f

    :goto_51
    :try_start_51
    invoke-virtual {v3, v7, v14, v13}, Lic9;->write([BII)V
    :try_end_54
    .catch Ljavax/crypto/BadPaddingException; {:try_start_51 .. :try_end_54} :catch_8f
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_51 .. :try_end_54} :catch_8f

    const/4 v13, -0x1

    if-ne v12, v13, :cond_6c

    iget-object v13, v0, Lnc9;->d:Ljava/lang/Object;

    monitor-enter v13

    :try_start_5a
    new-instance v2, Lmc9;

    iget-wide v4, v3, Lic9;->a:J

    invoke-direct {v2, v1, v4, v5}, Lmc9;-><init>([BJ)V

    iput-object v2, v0, Lnc9;->e:Lmc9;

    monitor-exit v13
    :try_end_64
    .catchall {:try_start_5a .. :try_end_64} :catchall_6a

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    return-void

    :goto_68
    :try_start_68
    monitor-exit v13
    :try_end_69
    .catchall {:try_start_68 .. :try_end_69} :catchall_6a

    throw v0

    :catchall_6a
    move-exception v0

    goto :goto_68

    :cond_6c
    int-to-long v12, v12

    add-long/2addr v9, v12

    long-to-float v12, v9

    long-to-float v13, v5

    div-float/2addr v12, v13

    sub-float v13, v12, v11

    const v14, 0x3c23d70a    # 0.01f

    cmpl-float v13, v13, v14

    if-ltz v13, :cond_37

    :try_start_7a
    new-instance v11, Llc9;

    invoke-direct {v11, v0, v12}, Llc9;-><init>(Lnc9;F)V

    invoke-static {v11}, Lvml;->c(Ljava/lang/Runnable;)V

    move v11, v12

    goto :goto_37

    :catch_84
    const/4 v13, -0x1

    :catch_85
    if-eq v12, v13, :cond_88

    move v14, v12

    :cond_88
    invoke-virtual {v2, v14}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v7

    new-array v7, v7, [B
    :try_end_8e
    .catch Ljavax/crypto/BadPaddingException; {:try_start_7a .. :try_end_8e} :catch_8f
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_7a .. :try_end_8e} :catch_8f

    goto :goto_3b

    :catch_8f
    move-exception v0

    invoke-static {v0}, Lt3p;->r(Ljava/lang/Throwable;)V

    return-void
.end method
