.class public final Lmz;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lab;

.field public final c:Ljava/util/concurrent/CountDownLatch;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lab;)V
    .registers 5

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lmz;->c:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lmz;->a:Landroid/content/Context;

    iput-object p2, p0, Lmz;->b:Lab;

    return-void
.end method


# virtual methods
.method public final varargs a()Lnz;
    .registers 26

    move-object/from16 v0, p0

    iget-object v1, v0, Lmz;->a:Landroid/content/Context;

    invoke-static {v1}, Li0l;->a(Landroid/content/Context;)J

    move-result-wide v2

    const-wide/16 v4, 0x400

    div-long/2addr v2, v4

    div-long v7, v2, v4

    invoke-static {v1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1f

    const-string v2, "com.android.vending"

    invoke-static {v1, v2}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1f

    move v9, v4

    goto :goto_20

    :cond_1f
    move v9, v3

    :goto_20
    const-string v2, "com.facebook.katana"

    invoke-static {v1, v2}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3a

    const-string v2, "com.facebook.lite"

    invoke-static {v1, v2}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3a

    const-string v2, "com.instagram.android"

    invoke-static {v1, v2}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3a

    move v10, v3

    goto :goto_3b

    :cond_3a
    move v10, v4

    :goto_3b
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v2}, Lsfe;->b0(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-wide/16 v3, 0x0

    invoke-static {v1, v2, v3, v4}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v13, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v1}, Lu59;->C(Landroid/content/Context;)Lu59;

    move-result-object v2

    invoke-virtual {v2}, Lu59;->H()Lt59;

    move-result-object v2

    iget-wide v3, v2, Lt59;->b:J

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    long-to-int v3, v3

    iget-object v2, v2, Lt59;->c:Ljava/lang/Object;

    move-object/from16 v17, v2

    check-cast v17, Ljava/lang/String;

    const-string v2, ""

    :try_start_79
    const-string v4, "phone"

    invoke-virtual {v1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    if-eqz v4, :cond_8c

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v4
    :try_end_87
    .catchall {:try_start_79 .. :try_end_87} :catchall_8c

    if-eqz v4, :cond_8c

    move-object/from16 v18, v4

    goto :goto_8e

    :catchall_8c
    :cond_8c
    move-object/from16 v18, v2

    :goto_8e
    invoke-static {v1}, Li0l;->h(Landroid/content/Context;)Lcom/opera/android/Lazy;

    move-result-object v2

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Ljava/lang/String;

    sget-object v2, Lhs3;->a:Ln9a;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "beta"

    invoke-static {v2}, Ln9a;->n(Ljava/lang/String;)Lhs3;

    move-result-object v2

    invoke-virtual {v2, v1}, Lhs3;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v21

    sget-object v2, Lrv8;->b:Ls16;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/high16 v4, 0x44740000    # 976.0f

    invoke-static {v1, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v1

    if-le v2, v1, :cond_c9

    sget-object v1, Lrv8;->d:Lrv8;

    goto :goto_cb

    :cond_c9
    sget-object v1, Lrv8;->c:Lrv8;

    :goto_cb
    iget-byte v1, v1, Lrv8;->a:B

    :try_start_cd
    iget-object v2, v0, Lmz;->c:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_d2
    .catch Ljava/lang/InterruptedException; {:try_start_cd .. :try_end_d2} :catch_e9

    new-instance v6, Lnz;

    iget-object v2, v0, Lmz;->d:Ljava/lang/String;

    iget-object v0, v0, Lmz;->e:Ljava/lang/String;

    const v14, 0x71de74d2

    const-string v20, "44056845"

    move-object/from16 v23, v0

    move/from16 v24, v1

    move-object/from16 v22, v2

    move/from16 v16, v3

    invoke-direct/range {v6 .. v24}, Lnz;-><init>(JZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v6

    :catch_e9
    const/4 v0, 0x0

    return-object v0
.end method

.method public final b(Lnz;)V
    .registers 21

    if-nez p1, :cond_27

    new-instance v0, Lnz;

    const-string v17, ""

    const/16 v18, 0x1

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, ""

    const-string v6, ""

    const-string v7, ""

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v11, ""

    const-string v12, ""

    const-string v13, ""

    const-string v14, ""

    const-string v15, ""

    const-string v16, ""

    invoke-direct/range {v0 .. v18}, Lnz;-><init>(JZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    :goto_24
    move-object/from16 v1, p0

    goto :goto_2a

    :cond_27
    move-object/from16 v0, p1

    goto :goto_24

    :goto_2a
    iget-object v1, v1, Lmz;->b:Lab;

    invoke-virtual {v1, v0}, Lab;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0}, Lmz;->a()Lnz;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lnz;

    invoke-virtual {p0, p1}, Lmz;->b(Lnz;)V

    return-void
.end method
