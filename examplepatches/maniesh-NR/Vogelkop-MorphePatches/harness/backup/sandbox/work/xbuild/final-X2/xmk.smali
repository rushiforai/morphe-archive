.class public final synthetic Lxmk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcnk;


# direct methods
.method public synthetic constructor <init>(Lcnk;B)V
    .registers 3

    iput-byte p2, p0, Lxmk;->a:B

    iput-object p1, p0, Lxmk;->b:Lcnk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 15

    iget-byte v0, p0, Lxmk;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lxmk;->b:Lcnk;

    packed-switch v0, :pswitch_data_142

    iget-object v0, p0, Lcnk;->e:Ljava/lang/Object;

    monitor-enter v0

    :try_start_c
    iput-boolean v2, p0, Lcnk;->h:Z

    iget-object v2, p0, Lcnk;->g:Loml;

    if-eqz v2, :cond_17

    invoke-virtual {v2, v1, v1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    iput-object v1, p0, Lcnk;->g:Loml;

    :cond_17
    monitor-exit v0

    return-void

    :goto_19
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_c .. :try_end_1a} :catchall_1b

    throw p0

    :catchall_1b
    move-exception p0

    goto :goto_19

    :pswitch_1d
    const-wide/16 v3, -0x1

    const/4 v0, -0x1

    :try_start_20
    new-instance v5, Ljava/io/BufferedInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lcnk;->a:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v8

    const-string v9, "vpn_locs"

    invoke-direct {v7, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v6, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_37
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_37} :catch_8e
    .catch Ljava/io/FileNotFoundException; {:try_start_20 .. :try_end_37} :catch_89
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_37} :catch_84
    .catchall {:try_start_20 .. :try_end_37} :catchall_81

    :try_start_37
    invoke-static {v5}, Lxvg;->z(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v6, "language"

    invoke-virtual {v7, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_70

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6
    :try_end_50
    .catch Lorg/json/JSONException; {:try_start_37 .. :try_end_50} :catch_7f
    .catch Ljava/io/FileNotFoundException; {:try_start_37 .. :try_end_50} :catch_7d
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_50} :catch_7b
    .catchall {:try_start_37 .. :try_end_50} :catchall_13b

    :try_start_50
    const-string v8, "date"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v8, "version_code"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v8, "countries"

    new-instance v9, Lvpb;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-direct {v9, v7}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    invoke-static {v9}, Lcnk;->c(Lvpb;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v7
    :try_end_6f
    .catch Lorg/json/JSONException; {:try_start_50 .. :try_end_6f} :catch_90
    .catch Ljava/io/FileNotFoundException; {:try_start_50 .. :try_end_6f} :catch_8b
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_6f} :catch_86
    .catchall {:try_start_50 .. :try_end_6f} :catchall_13b

    goto :goto_92

    :cond_70
    :try_start_70
    new-instance v6, Lorg/json/JSONException;

    const-string v7, "language is null"

    invoke-direct {v6, v7}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_78
    .catch Lorg/json/JSONException; {:try_start_70 .. :try_end_78} :catch_7f
    .catch Ljava/io/FileNotFoundException; {:try_start_70 .. :try_end_78} :catch_7d
    .catch Ljava/io/IOException; {:try_start_70 .. :try_end_78} :catch_7b
    .catchall {:try_start_70 .. :try_end_78} :catchall_13b

    :goto_78
    move-object v1, v5

    goto/16 :goto_13e

    :catch_7b
    move-object v6, v1

    goto :goto_86

    :catch_7d
    move-object v6, v1

    goto :goto_8b

    :catch_7f
    move-object v6, v1

    goto :goto_90

    :catchall_81
    move-exception p0

    goto/16 :goto_13e

    :catch_84
    move-object v5, v1

    move-object v6, v5

    :catch_86
    :goto_86
    :try_start_86
    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_92

    :catch_89
    move-object v5, v1

    move-object v6, v5

    :catch_8b
    :goto_8b
    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_92

    :catch_8e
    move-object v5, v1

    move-object v6, v5

    :catch_90
    :goto_90
    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    :try_end_92
    .catchall {:try_start_86 .. :try_end_92} :catchall_13b

    :goto_92
    invoke-static {v5}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-static {v5}, Lscd;->w(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const v8, 0x71de74d2

    const/4 v9, 0x0

    if-eq v0, v8, :cond_a9

    move v8, v2

    goto :goto_aa

    :cond_a9
    move v8, v9

    :goto_aa
    if-eqz v5, :cond_b4

    if-eqz v8, :cond_b4

    const v10, 0x71a60e20

    if-ge v0, v10, :cond_b4

    move v5, v9

    :cond_b4
    if-eqz v5, :cond_c6

    const-string v10, "en"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_c6

    if-eqz v8, :cond_c6

    const v6, 0x71a79c90

    if-ge v0, v6, :cond_c6

    move v5, v9

    :cond_c6
    if-eqz v5, :cond_d0

    if-eqz v8, :cond_d0

    const v6, 0x71c912f8

    if-ge v0, v6, :cond_d0

    move v5, v9

    :cond_d0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iget-object v0, p0, Lcnk;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "vpn.subscription_locations_outdated"

    invoke-interface {v0, v6, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_e8

    const-wide/32 v12, 0x5265c00

    goto :goto_ed

    :cond_e8
    const-wide v12, 0x9a7ec800L

    :goto_ed
    cmp-long v0, v10, v3

    if-ltz v0, :cond_f8

    sub-long/2addr v10, v3

    cmp-long v0, v10, v12

    if-gez v0, :cond_f8

    move v0, v9

    goto :goto_f9

    :cond_f8
    move v0, v2

    :goto_f9
    if-nez v5, :cond_fd

    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_fd
    iget-object v3, p0, Lcnk;->e:Ljava/lang/Object;

    monitor-enter v3

    :try_start_100
    iput-object v7, p0, Lcnk;->f:Ljava/util/List;

    monitor-exit v3
    :try_end_103
    .catchall {:try_start_100 .. :try_end_103} :catchall_139

    iget-object v3, p0, Lcnk;->d:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    if-nez v0, :cond_10c

    if-nez v5, :cond_132

    :cond_10c
    iget-object v0, p0, Lcnk;->e:Ljava/lang/Object;

    monitor-enter v0

    :try_start_10f
    iget-object v3, p0, Lcnk;->b:Lumi;

    new-instance v4, Lymk;

    invoke-direct {v4, p0, v9}, Lymk;-><init>(Lcnk;B)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lscl;

    invoke-direct {v5, v4, v2}, Lscl;-><init>(Lesk;B)V

    invoke-virtual {v3, v5}, Lumi;->g(Ln5o;)Lnml;

    move-result-object v2

    new-instance v3, Loml;

    invoke-direct {v3, v2}, Loml;-><init>(Lnml;)V

    iget-boolean v2, p0, Lcnk;->h:Z

    if-eqz v2, :cond_12f

    invoke-virtual {v3, v1, v1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    goto :goto_131

    :cond_12f
    iput-object v3, p0, Lcnk;->g:Loml;

    :goto_131
    monitor-exit v0

    :cond_132
    return-void

    :goto_133
    monitor-exit v0
    :try_end_134
    .catchall {:try_start_10f .. :try_end_134} :catchall_135

    throw p0

    :catchall_135
    move-exception p0

    goto :goto_133

    :goto_137
    :try_start_137
    monitor-exit v3
    :try_end_138
    .catchall {:try_start_137 .. :try_end_138} :catchall_139

    throw p0

    :catchall_139
    move-exception p0

    goto :goto_137

    :catchall_13b
    move-exception p0

    goto/16 :goto_78

    :goto_13e
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :pswitch_data_142
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
