.class public final synthetic Lrqd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvqd;
.implements Lk2m;
.implements Ln5o;
.implements Lxjj;
.implements Llr8;
.implements Llua;
.implements Lfn8;
.implements Lhvb;
.implements Lv2p;
.implements Lwgb;
.implements Ltff;
.implements Llo7;
.implements Lwqe;
.implements Lurg;
.implements Ljtl;
.implements Lp9n;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 7
    iput-byte p1, p0, Lrqd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lxjh;)V
    .registers 2

    const/4 p1, 0x0

    iput-byte p1, p0, Lrqd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic c(ILjava/lang/Object;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Source subfield "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is present but null: "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static d(Lm37;)V
    .registers 3

    new-instance v0, Lvib;

    const-string v1, "encountered deserialization error"

    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static synthetic e(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic o(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic p(Ljava/lang/Throwable;)V
    .registers 2

    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final accept(Ljava/lang/Object;)V
    .registers 21

    move-object/from16 v0, p1

    check-cast v0, Lvho;

    invoke-virtual {v0}, Lvho;->c()Z

    move-result v1

    const/16 v2, 0xc

    if-eqz v1, :cond_71

    invoke-virtual {v0}, Lvho;->a()Llho;

    move-result-object v1

    iget-object v3, v1, Llho;->d:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v6, 0x0

    move v7, v6

    :cond_21
    :goto_21
    if-ge v7, v4, :cond_35

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    move-object v9, v8

    check-cast v9, Lpho;

    iget v9, v9, Lpho;->a:I

    const/4 v10, 0x7

    if-ne v9, v10, :cond_21

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_21

    :cond_35
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3d

    const/4 v3, 0x0

    goto :goto_45

    :cond_3d
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpho;

    iget-object v3, v3, Lpho;->b:Ljava/util/ArrayList;

    :goto_45
    iget-object v1, v1, Llho;->a:Lxho;

    iget-object v4, v1, Lxho;->m:Ljava/lang/String;

    if-eqz v4, :cond_71

    invoke-static {v4}, Lsjo;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_53

    iget-object v5, v1, Lxho;->d:Ljava/lang/String;

    :cond_53
    new-instance v6, Lwci;

    invoke-direct {v6, v1, v3, v2}, Lwci;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v4}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_71

    new-instance v1, Lroj;

    const/16 v3, 0x16

    invoke-direct {v1, v4, v6, v3}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v3, Lgxo;->c:Lgxo;

    new-instance v4, Lfmn;

    const/16 v6, 0xd

    invoke-direct {v4, v5, v1, v6}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lgxo;->b(Ljava/lang/Runnable;)V

    :cond_71
    invoke-virtual {v0}, Lvho;->a()Llho;

    move-result-object v1

    iget-object v1, v1, Llho;->a:Lxho;

    iget-object v4, v1, Lxho;->k:Ljava/lang/String;

    iget-object v6, v1, Lxho;->j:Ljava/lang/String;

    iget-object v8, v1, Lxho;->c:Ljava/lang/String;

    sget-object v3, Ltgo;->a:[I

    iget-object v5, v1, Lxho;->a:Lw06;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aget v3, v3, v5

    const/4 v11, 0x2

    const/4 v5, 0x1

    sget-object v12, Lg94;->Io:Lt14;

    if-eq v3, v5, :cond_100

    if-eq v3, v11, :cond_e1

    const/4 v5, 0x5

    if-eq v3, v5, :cond_e1

    const/4 v5, 0x6

    if-eq v3, v5, :cond_99

    if-eq v3, v2, :cond_e1

    goto/16 :goto_121

    :cond_99
    iget-object v14, v1, Lxho;->i:Ljava/lang/String;

    if-eqz v14, :cond_121

    if-eqz v6, :cond_121

    if-eqz v4, :cond_121

    sget-object v1, Lfip;->a:Ljava/util/HashMap;

    new-instance v1, Lsmo;

    invoke-direct {v1, v12, v11}, Lsmo;-><init>(Ljava/lang/Object;B)V

    sget-object v2, Lphf;->a:Lx79;

    iget-object v3, v2, Lx79;->a:Ljava/lang/Object;

    move-object v13, v3

    check-cast v13, Landroid/content/Context;

    const/16 v15, 0x20

    const/16 v16, 0x20

    sget-object v17, Lvhp;->b:Lvhp;

    move-object/from16 v18, v1

    invoke-static/range {v13 .. v18}, Lfip;->a(Landroid/content/Context;Ljava/lang/String;IILvhp;Lzhp;)V

    new-instance v10, Lsmo;

    invoke-direct {v10, v12, v11}, Lsmo;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v2, Lx79;->a:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Landroid/content/Context;

    const/16 v7, 0x20

    const/16 v8, 0x20

    move-object/from16 v9, v17

    invoke-static/range {v5 .. v10}, Lfip;->a(Landroid/content/Context;Ljava/lang/String;IILvhp;Lzhp;)V

    new-instance v8, Lsmo;

    invoke-direct {v8, v12, v11}, Lsmo;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v2, Lx79;->a:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Landroid/content/Context;

    const/16 v5, 0x20

    const/16 v6, 0x20

    move-object/from16 v7, v17

    invoke-static/range {v3 .. v8}, Lfip;->a(Landroid/content/Context;Ljava/lang/String;IILvhp;Lzhp;)V

    goto :goto_121

    :cond_e1
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_121

    sget-object v1, Lfip;->a:Ljava/util/HashMap;

    new-instance v1, Lsmo;

    invoke-direct {v1, v12, v11}, Lsmo;-><init>(Ljava/lang/Object;B)V

    sget-object v2, Lphf;->a:Lx79;

    iget-object v2, v2, Lx79;->a:Ljava/lang/Object;

    move-object v7, v2

    check-cast v7, Landroid/content/Context;

    const/16 v9, 0x20

    const/16 v10, 0x20

    sget-object v11, Lvhp;->b:Lvhp;

    move-object v12, v1

    invoke-static/range {v7 .. v12}, Lfip;->a(Landroid/content/Context;Ljava/lang/String;IILvhp;Lzhp;)V

    goto :goto_121

    :cond_100
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_108

    iget-object v8, v1, Lxho;->b:Ljava/lang/String;

    :cond_108
    move-object v2, v8

    if-eqz v2, :cond_121

    sget-object v1, Lfip;->a:Ljava/util/HashMap;

    new-instance v6, Lsmo;

    invoke-direct {v6, v12, v11}, Lsmo;-><init>(Ljava/lang/Object;B)V

    sget-object v1, Lphf;->a:Lx79;

    iget-object v1, v1, Lx79;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const/16 v3, 0x20

    const/16 v4, 0x20

    sget-object v5, Lvhp;->b:Lvhp;

    invoke-static/range {v1 .. v6}, Lfip;->a(Landroid/content/Context;Ljava/lang/String;IILvhp;Lzhp;)V

    :cond_121
    :goto_121
    iget-object v1, v0, Lvho;->a:Lw06;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v1, v1, Ln06;

    if-eqz v1, :cond_12d

    invoke-static {v0}, Lvtp;->s(Lvho;)V

    :cond_12d
    return-void
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lbxd;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lo6h;->a:Ld7h;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_f
    invoke-virtual {p0, p1, v0}, Ld7h;->a(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_12} :catch_12

    :catch_12
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method public final b(Lz7;Lt9f;)Lsff;
    .registers 3

    new-instance p0, Lsff;

    invoke-direct {p0, p1, p2}, Lsff;-><init>(Lz7;Lt9f;)V

    return-object p0
.end method

.method public final createExtractors()[Lcn8;
    .registers 5

    iget-byte p0, p0, Lrqd;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_20

    new-instance p0, Ll9f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v1, v1, [Lcn8;

    aput-object p0, v1, v0

    return-object v1

    :pswitch_11
    new-instance p0, Lbbe;

    sget-object v2, Ltnk;->Ap:Ldvj;

    const/16 v3, 0x10

    invoke-direct {p0, v2, v3}, Lbbe;-><init>(Ltnk;I)V

    new-array v1, v1, [Lcn8;

    aput-object p0, v1, v0

    return-object v1

    nop

    :pswitch_data_20
    .packed-switch 0x8
        :pswitch_11
    .end packed-switch
.end method

.method public final evaluate(IIIII)Z
    .registers 8

    const/16 p0, 0x43

    const/4 v0, 0x2

    const/16 v1, 0x4d

    if-ne p2, p0, :cond_11

    const/16 p0, 0x4f

    if-ne p3, p0, :cond_11

    if-ne p4, v1, :cond_11

    if-eq p5, v1, :cond_1f

    if-eq p1, v0, :cond_1f

    :cond_11
    if-ne p2, v1, :cond_21

    const/16 p0, 0x4c

    if-ne p3, p0, :cond_21

    if-ne p4, p0, :cond_21

    const/16 p0, 0x54

    if-eq p5, p0, :cond_1f

    if-ne p1, v0, :cond_21

    :cond_1f
    const/4 p0, 0x1

    return p0

    :cond_21
    const/4 p0, 0x0

    return p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte p0, p0, Lrqd;->a:B

    packed-switch p0, :pswitch_data_c8

    check-cast p1, Ljava/lang/Void;

    const-wide/16 p0, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    sget-object p1, Lxne;->b:Lii;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lt9f;

    iget-object p1, p1, Lt9f;->k:La74;

    if-eqz p1, :cond_23

    :try_start_19
    iget-object p1, p1, La74;->a:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {p1}, Lokhttp3/internal/cache/DiskLruCache;->size()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_23} :catch_23

    :catch_23
    :cond_23
    return-object p0

    :pswitch_24
    check-cast p1, Lgxd;

    const-string p0, "actual_timestamp"

    const-string v0, "install_referrer"

    iget-object v1, p1, Lgxd;->a:Landroid/content/Context;

    const/4 v2, 0x0

    :try_start_2d
    const-string v3, "com.facebook.katana.provider.InstallReferrerProvider"

    invoke-static {v1, v3}, Lgxd;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/ProviderInfo;

    move-result-object v3

    if-eqz v3, :cond_3c

    const-string v3, "content://com.facebook.katana.provider.InstallReferrerProvider/120257965334518"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    goto :goto_59

    :cond_3c
    const-string v3, "com.instagram.contentprovider.InstallReferrerProvider"

    invoke-static {v1, v3}, Lgxd;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/ProviderInfo;

    move-result-object v3

    if-eqz v3, :cond_4b

    const-string v3, "content://com.instagram.contentprovider.InstallReferrerProvider/120257965334518"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    goto :goto_59

    :cond_4b
    const-string v3, "com.facebook.lite.provider.InstallReferrerProvider"

    invoke-static {v1, v3}, Lgxd;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/ProviderInfo;

    move-result-object v3

    if-eqz v3, :cond_b8

    const-string v3, "content://com.facebook.lite.provider.InstallReferrerProvider/120257965334518"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    :goto_59
    move-object v5, v3

    filled-new-array {v0, p0}, [Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    if-eqz v2, :cond_b5

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_b5

    invoke-interface {v2, p0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p0

    invoke-interface {v2, p0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p0

    invoke-interface {v2, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8a

    sget-object p0, Lfxd;->g:Lfxd;

    goto :goto_bd

    :cond_8a
    const/4 v0, 0x2

    invoke-static {v0, p0}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_98

    sget-object p0, Lfxd;->h:Lfxd;

    goto :goto_bd

    :cond_98
    invoke-static {v1}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld3j;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ld3j;->b(I)Lqsh;

    move-result-object v0

    if-nez v0, :cond_ac

    sget-object p0, Lfxd;->h:Lfxd;

    goto :goto_bd

    :cond_ac
    iget-object v0, v0, Lqsh;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v3, v4, p0, v0}, Lgxd;->a(JLjava/lang/String;Ljava/lang/String;)Lfxd;

    move-result-object p0

    goto :goto_bd

    :cond_b5
    sget-object p0, Lfxd;->g:Lfxd;

    goto :goto_bd

    :cond_b8
    sget-object p0, Lfxd;->f:Lfxd;
    :try_end_ba
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_ba} :catch_bb
    .catchall {:try_start_2d .. :try_end_ba} :catchall_c1

    goto :goto_c0

    :catch_bb
    :try_start_bb
    sget-object p0, Lfxd;->g:Lfxd;
    :try_end_bd
    .catchall {:try_start_bb .. :try_end_bd} :catchall_c1

    :goto_bd
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_c0
    return-object p0

    :catchall_c1
    move-exception v0

    move-object p0, v0

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    nop

    :pswitch_data_c8
    .packed-switch 0x3
        :pswitch_24
    .end packed-switch
.end method

.method public final get()Lpne;
    .registers 1

    iget-byte p0, p0, Lrqd;->a:B

    packed-switch p0, :pswitch_data_14

    sget-object p0, Lcqp;->m:Landroid/content/Context;

    invoke-static {p0}, Lcqp;->h0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_c
    sget-object p0, Lcqp;->m:Landroid/content/Context;

    invoke-static {p0}, Lcqp;->g0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0xd
        :pswitch_c
    .end packed-switch
.end method

.method public final h(Landroid/view/View;)V
    .registers 2

    check-cast p1, Lcom/opera/android/bar/OmniButtonView;

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-byte p0, p0, Lrqd;->a:B

    packed-switch p0, :pswitch_data_1c

    check-cast p1, Lyzd;

    check-cast p2, Ld0e;

    iput-object p1, p2, Ld0e;->l:Lyzd;

    invoke-virtual {p2}, Ld0e;->X()V

    invoke-virtual {p2}, Ld0e;->Y()V

    return-void

    :pswitch_12
    check-cast p1, Lzzd;

    check-cast p2, Le0e;

    iput-object p1, p2, Le0e;->l:Lzzd;

    invoke-virtual {p2}, Le0e;->Z()V

    return-void

    :pswitch_data_1c
    .packed-switch 0x4
        :pswitch_12
    .end packed-switch
.end method

.method public final j(Loup;)Lr6h;
    .registers 2

    check-cast p1, Lcbc;

    iget-object p0, p1, Lcbc;->f:Lr6h;

    iget-object p1, p0, Lr6h;->d:Lmub;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    return-object p0
.end method

.method public final k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Object;
    .registers 14

    const p0, 0x7f0d01e3

    const/4 v0, 0x0

    invoke-virtual {p1, p0, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p1, 0x7f0a077d

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Lcom/opera/android/widget/FaqItemView;

    if-eqz v2, :cond_8b

    const p1, 0x7f0a09bf

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v3, :cond_8b

    const p1, 0x7f0a09c2

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v4, p2

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v4, :cond_8b

    const p1, 0x7f0a09c3

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v5, :cond_8b

    const p1, 0x7f0a09e2

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v6, p2

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_8b

    const p1, 0x7f0a09ea

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v7, p2

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_8b

    const p1, 0x7f0a09ec

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v8, p2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_8b

    const p1, 0x7f0a09f3

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz p2, :cond_8b

    const p1, 0x7f0a0a1c

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v9, p2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_8b

    const p1, 0x7f0a0b2a

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v10, p2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_8b

    new-instance v0, Lfm9;

    move-object v1, p0

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-direct/range {v0 .. v10}, Lfm9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/widget/FaqItemView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-object v0

    :cond_8b
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final l(Lnpd;Lnod;I)Ljava/lang/Object;
    .registers 4

    iget-object p0, p1, Lnpd;->e:Lkod;

    invoke-virtual {p1, p2}, Lnpd;->r(Lnod;)Lnod;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Le4j;

    const/4 p1, -0x6

    invoke-direct {p0, p1}, Le4j;-><init>(I)V

    invoke-static {p0}, Lyr9;->c(Ljava/lang/Object;)Lr0b;

    move-result-object p0

    return-object p0
.end method

.method public final n(Ljava/lang/String;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 2

    iget-byte p0, p0, Lrqd;->a:B

    check-cast p1, Lbwf;

    packed-switch p0, :pswitch_data_1e

    invoke-virtual {p1}, Lbwf;->a()Ljava/lang/String;

    move-result-object p0

    const-string p1, "top_news"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_12
    invoke-virtual {p1}, Lbwf;->a()Ljava/lang/String;

    move-result-object p0

    const-string p1, "cur_city_id"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    nop

    :pswitch_data_1e
    .packed-switch 0x14
        :pswitch_12
    .end packed-switch
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 4

    iget-byte p0, p0, Lrqd;->a:B

    const/16 v0, 0x11

    packed-switch p0, :pswitch_data_20

    :pswitch_7
    new-instance p0, Lz7f;

    const-string v1, "ofa_appearances"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0

    :pswitch_f
    new-instance p0, Lhte;

    const-string v1, "news_settings"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0

    :pswitch_17
    new-instance p0, Lbqe;

    const-string v1, "news_country_settings"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x11
        :pswitch_17
        :pswitch_7
        :pswitch_f
    .end packed-switch
.end method
