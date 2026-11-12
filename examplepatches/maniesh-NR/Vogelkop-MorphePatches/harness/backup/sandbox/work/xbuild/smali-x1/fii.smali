.class public final synthetic Lfii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgii;


# direct methods
.method public synthetic constructor <init>(Lgii;B)V
    .registers 3

    iput-byte p2, p0, Lfii;->a:B

    iput-object p1, p0, Lfii;->b:Lgii;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lfii;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lfii;->b:Lgii;

    packed-switch v0, :pswitch_data_c2

    check-cast p1, Landroid/util/Pair;

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v8, p1

    check-cast v8, [B

    iget-object p1, p0, Lgii;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->n()Lag7;

    move-result-object v3

    iget-object v4, p0, Lgii;->h:Landroid/net/Uri;

    iget-object v5, p0, Lgii;->i:Landroid/net/Uri;

    iget-object v7, p0, Lgii;->j:Ljava/lang/String;

    new-instance v11, Lzzh;

    const/4 p1, 0x4

    invoke-direct {v11, p0, p1}, Lzzh;-><init>(Ljava/lang/Object;B)V

    const-string v6, "application/pdf"

    invoke-virtual/range {v3 .. v11}, Lag7;->b(Landroid/net/Uri;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;[BJLcom/opera/api/Callback;)V

    iget-object p1, p0, Lgii;->m:Lzzh;

    if-eqz p1, :cond_42

    iput-object v2, p0, Lgii;->m:Lzzh;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Lzzh;->run(Ljava/lang/Object;)V

    :cond_42
    return-object v2

    :pswitch_43
    check-cast p1, Ldd7;

    const-wide/16 v3, 0x0

    :try_start_47
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    iget-object v5, p0, Lgii;->a:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    iget-object p0, p0, Lgii;->i:Landroid/net/Uri;

    invoke-virtual {v5, p0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_59} :catch_76
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_47 .. :try_end_59} :catch_76
    .catchall {:try_start_47 .. :try_end_59} :catchall_73

    const v5, 0x8000

    :try_start_5c
    new-array v6, v5, [B

    move-wide v7, v3

    :goto_5f
    invoke-virtual {p0, v6, v1, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v9

    if-ltz v9, :cond_6b

    invoke-virtual {v0, v6, v1, v9}, Ljava/security/MessageDigest;->update([BII)V

    int-to-long v9, v9

    add-long/2addr v7, v9

    goto :goto_5f

    :cond_6b
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_6f} :catch_77
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5c .. :try_end_6f} :catch_77
    .catchall {:try_start_5c .. :try_end_6f} :catchall_7e

    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_89

    :catchall_73
    move-exception v0

    move-object p1, v0

    goto :goto_81

    :catch_76
    move-object p0, v2

    :catch_77
    if-eqz p1, :cond_85

    :try_start_79
    invoke-virtual {p1}, Ldd7;->j()J

    move-result-wide v3
    :try_end_7d
    .catchall {:try_start_79 .. :try_end_7d} :catchall_7e

    goto :goto_85

    :catchall_7e
    move-exception v0

    move-object p1, v0

    move-object v2, p0

    :goto_81
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p1

    :cond_85
    :goto_85
    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    move-wide v7, v3

    :goto_89
    new-instance p0, Landroid/util/Pair;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-direct {p0, p1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :pswitch_93
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_a3

    iget-object p1, p0, Lgii;->d:Lqji;

    iget-byte p1, p1, Lqji;->l:B

    invoke-virtual {p0, p1}, Lgii;->c(I)V

    goto :goto_a6

    :cond_a3
    invoke-virtual {p0}, Lgii;->e()V

    :goto_a6
    return-object v2

    :pswitch_a7
    check-cast p1, Ljava/lang/Void;

    :try_start_a9
    iget-object p1, p0, Lgii;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v0, p0, Lgii;->i:Landroid/net/Uri;

    const-string v2, "w"

    invoke-virtual {p1, v0, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    iput-object p1, p0, Lgii;->l:Landroid/os/ParcelFileDescriptor;
    :try_end_b9
    .catch Ljava/lang/IllegalStateException; {:try_start_a9 .. :try_end_b9} :catch_bc
    .catch Ljava/io/FileNotFoundException; {:try_start_a9 .. :try_end_b9} :catch_bc

    if-eqz p1, :cond_bc

    const/4 v1, 0x1

    :catch_bc
    :cond_bc
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_a7
        :pswitch_93
        :pswitch_43
    .end packed-switch
.end method
