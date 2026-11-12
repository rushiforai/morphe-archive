.class public final synthetic Lbu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 13
    iput-byte p1, p0, Lbu3;->a:B

    iput-object p2, p0, Lbu3;->c:Ljava/lang/Object;

    iput-object p3, p0, Lbu3;->d:Ljava/lang/Object;

    iput-boolean p4, p0, Lbu3;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;ZLcom/google/android/gms/tasks/TaskCompletionSource;)V
    .registers 5

    .line 15
    const/4 v0, 0x2

    iput-byte v0, p0, Lbu3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbu3;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lbu3;->b:Z

    iput-object p3, p0, Lbu3;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lpjo;Ljava/io/File;Ljava/lang/String;Lwci;Ljava/lang/String;Z)V
    .registers 7

    .line 14
    const/4 p3, 0x6

    iput-byte p3, p0, Lbu3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbu3;->c:Ljava/lang/Object;

    iput-object p2, p0, Lbu3;->d:Ljava/lang/Object;

    iput-boolean p6, p0, Lbu3;->b:Z

    return-void
.end method

.method public synthetic constructor <init>(Lr4m;Lszb;I)V
    .registers 5

    const/4 v0, 0x5

    iput-byte v0, p0, Lbu3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbu3;->c:Ljava/lang/Object;

    iput-object p2, p0, Lbu3;->d:Ljava/lang/Object;

    iput-boolean p3, p0, Lbu3;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 12

    iget-byte v0, p0, Lbu3;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_1bc

    iget-object v0, p0, Lbu3;->c:Ljava/lang/Object;

    check-cast v0, Lpjo;

    iget-object v1, p0, Lbu3;->d:Ljava/lang/Object;

    check-cast v1, Ljava/io/File;

    iget-boolean p0, p0, Lbu3;->b:Z

    iget-object v0, v0, Lpjo;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    if-eqz p0, :cond_26

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_26

    invoke-static {v1}, Lsjo;->g(Ljava/io/File;)V

    :cond_26
    return-void

    :pswitch_27
    iget-object v0, p0, Lbu3;->c:Ljava/lang/Object;

    check-cast v0, Lr4m;

    iget-object v4, p0, Lbu3;->d:Ljava/lang/Object;

    move-object v8, v4

    check-cast v8, Lszb;

    iget-boolean v10, p0, Lbu3;->b:Z

    iget-object v6, v0, Lr4m;->b:Ly4m;

    iget-boolean p0, v6, Ly4m;->j:Z

    iget-object v0, v6, Ly4m;->d:Lv3m;

    invoke-virtual {v0}, Lv3m;->g()Z

    move-result v4

    if-eq v4, v3, :cond_4c

    iget-object v4, v0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v5, "translate_web_pages_enabled"

    invoke-virtual {v4, v3, v5}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {v0}, Lv3m;->d()Lszb;

    move-result-object v4

    invoke-virtual {v0, v4}, Lv3m;->i(Lszb;)V

    :cond_4c
    if-eqz p0, :cond_64

    invoke-virtual {v0, v8, v10}, Lv3m;->e(Lszb;I)Z

    move-result v4

    if-eqz v4, :cond_64

    iget-object p0, v0, Lv3m;->d:Lplk;

    iget-object v0, p0, Lplk;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    new-instance v1, Liyk;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v8, v2}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lxl;->j(Lcom/opera/api/Callback;)V

    goto :goto_be

    :cond_64
    xor-int/lit8 v9, v10, 0x1

    invoke-virtual {v0, v8, v9}, Lv3m;->e(Lszb;I)Z

    move-result v4

    if-eqz p0, :cond_70

    if-eqz v4, :cond_70

    move v7, v3

    goto :goto_71

    :cond_70
    move v7, v2

    :goto_71
    invoke-virtual {v0, v8, v10, v3}, Lv3m;->j(Lszb;IZ)V

    iget-object p0, v6, Ly4m;->f:Lr4m;

    if-nez v10, :cond_83

    iget-object v0, p0, Lr4m;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0, v3}, Lr4m;->Z(Lb2l;I)V

    const p0, 0x7f140927

    goto :goto_8e

    :cond_83
    new-instance v0, Lo4m;

    invoke-direct {v0, p0, v1}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {p0, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    const p0, 0x7f140928

    :goto_8e
    iget-object v0, v6, Ly4m;->e:Lghf;

    new-instance v5, Lx4m;

    invoke-direct/range {v5 .. v10}, Lx4m;-><init>(Ly4m;ZLszb;II)V

    iget-object v1, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/res/Resources;

    iget v2, v8, Lszb;->b:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object v1, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v1, Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    if-eqz v1, :cond_be

    new-instance v2, Lc4m;

    const v4, 0x7f1412ee

    invoke-direct {v2, v0, p0, v4, v5}, Lc4m;-><init>(Lghf;Ljava/lang/String;ILandroid/view/View$OnClickListener;)V

    iget-object p0, v0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Laal;

    invoke-virtual {p0, v2, v1, v3}, Laal;->S(Lo93;Lb2l;Z)V

    :cond_be
    :goto_be
    return-void

    :pswitch_bf
    iget-object v0, p0, Lbu3;->c:Ljava/lang/Object;

    check-cast v0, Lglh;

    iget-object v3, p0, Lbu3;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/Collection;

    iget-boolean p0, p0, Lbu3;->b:Z

    iget-object v4, v0, Lglh;->a:Ljlh;

    invoke-virtual {v4, v3, p0}, Ljlh;->h(Ljava/util/Collection;Z)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    :goto_d3
    if-ge v2, v5, :cond_e1

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v2, v2, 0x1

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v6}, Lglh;->b(Ljava/lang/String;)V

    goto :goto_d3

    :cond_e1
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const-string v0, "DELETE FROM reading WHERE id IN (%1$s)"

    const-string v2, ","

    new-instance v4, Lr40;

    invoke-direct {v4, v2, v1}, Lr40;-><init>(Ljava/lang/String;B)V

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {v4, v3}, Lr40;->b(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void

    :pswitch_100
    iget-object v0, p0, Lbu3;->c:Ljava/lang/Object;

    check-cast v0, Lbv5;

    iget-object v1, p0, Lbu3;->d:Ljava/lang/Object;

    check-cast v1, Ljch;

    iget-boolean p0, p0, Lbu3;->b:Z

    iget-object v2, v0, Lbv5;->c:Lech;

    iget-object v2, v2, Lech;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldch;

    if-eqz v2, :cond_12e

    iget-object v3, v2, Ldch;->e:Ljava/util/HashMap;

    monitor-enter v3

    :try_start_119
    iget-object v2, v2, Ldch;->e:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_123

    monitor-exit v3

    goto :goto_12e

    :cond_123
    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    throw p0

    :goto_129
    monitor-exit v3
    :try_end_12a
    .catchall {:try_start_119 .. :try_end_12a} :catchall_12b

    throw p0

    :catchall_12b
    move-exception v0

    move-object p0, v0

    goto :goto_129

    :cond_12e
    :goto_12e
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljch;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_136
    iget-object v0, p0, Lbu3;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-boolean v1, p0, Lbu3;->b:Z

    iget-object p0, p0, Lbu3;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    const-string v4, "com.google.android.gms"

    const/4 v5, 0x0

    :try_start_143
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v6

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    iget v7, v7, Landroid/content/pm/ApplicationInfo;->uid:I

    if-ne v6, v7, :cond_150

    move v2, v3

    :cond_150
    if-nez v2, :cond_156

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    goto :goto_181

    :cond_156
    invoke-static {v0}, Lz7h;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v6, "proxy_notification_initialized"

    invoke-interface {v2, v6, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-class v2, Landroid/app/NotificationManager;

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz v1, :cond_174

    invoke-virtual {v0, v4}, Landroid/app/NotificationManager;->setNotificationDelegate(Ljava/lang/String;)V

    goto :goto_181

    :cond_174
    invoke-virtual {v0}, Landroid/app/NotificationManager;->getNotificationDelegate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_181

    invoke-virtual {v0, v5}, Landroid/app/NotificationManager;->setNotificationDelegate(Ljava/lang/String;)V
    :try_end_181
    .catchall {:try_start_143 .. :try_end_181} :catchall_185

    :cond_181
    :goto_181
    invoke-virtual {p0, v5}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    return-void

    :catchall_185
    move-exception v0

    invoke-virtual {p0, v5}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    throw v0

    :pswitch_18a
    iget-object v0, p0, Lbu3;->c:Ljava/lang/Object;

    check-cast v0, Lre7;

    iget-object v1, p0, Lbu3;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;

    iget-boolean p0, p0, Lbu3;->b:Z

    iput-object v1, v0, Lre7;->y:Lcom/opera/api/Callback;

    iget-boolean v1, v0, Lre7;->s:Z

    if-nez v1, :cond_19c

    iput-boolean v3, v0, Lre7;->s:Z

    :cond_19c
    iget-boolean v1, v0, Lre7;->z:Z

    if-eqz v1, :cond_1a3

    invoke-virtual {v0}, Lre7;->v()V

    :cond_1a3
    iget-object v1, v0, Lre7;->x:Lcx3;

    if-eqz v1, :cond_1aa

    invoke-virtual {v1, v0, p0}, Lcx3;->c(Lre7;Z)V

    :cond_1aa
    return-void

    :pswitch_1ab
    iget-object v0, p0, Lbu3;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Lbu3;->d:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    iget-boolean p0, p0, Lbu3;->b:Z

    sget v2, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0, v1, p0}, Lcom/opera/android/BrowserActivity;->w1(Landroid/view/View;Z)V

    return-void

    nop

    :pswitch_data_1bc
    .packed-switch 0x0
        :pswitch_1ab
        :pswitch_18a
        :pswitch_136
        :pswitch_100
        :pswitch_bf
        :pswitch_27
    .end packed-switch
.end method
