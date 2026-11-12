.class public final synthetic Lhc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:Lpc9;

.field public final synthetic b:J

.field public final synthetic c:Lfvd;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lpc9;JLfvd;Ljava/lang/String;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhc9;->a:Lpc9;

    iput-wide p2, p0, Lhc9;->b:J

    iput-object p4, p0, Lhc9;->c:Lfvd;

    iput-object p5, p0, Lhc9;->d:Ljava/lang/String;

    iput-boolean p6, p0, Lhc9;->e:Z

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lhc9;->a:Lpc9;

    iget-object v2, v1, Lpc9;->a:Landroid/content/Context;

    iget-object v3, v1, Lpc9;->c:Lbf9;

    const-wide/high16 v4, -0x8000000000000000L

    iget-wide v6, v0, Lhc9;->b:J

    cmp-long v4, v6, v4

    const/4 v5, 0x0

    const/4 v9, 0x1

    if-nez v4, :cond_2d

    invoke-virtual {v1}, Lpc9;->c()Ljvd;

    move-result-object v6

    iget-object v6, v6, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v7, Luvc;

    const/16 v10, 0x8

    invoke-direct {v7, v10}, Luvc;-><init>(B)V

    invoke-static {v6, v9, v5, v7}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-lez v6, :cond_42

    goto/16 :goto_211

    :cond_2d
    invoke-virtual {v1}, Lpc9;->c()Ljvd;

    move-result-object v10

    iget-object v10, v10, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v11, Lx41;

    const/16 v12, 0xd

    invoke-direct {v11, v6, v7, v12}, Lx41;-><init>(JB)V

    invoke-static {v10, v9, v5, v11}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfvd;

    if-nez v6, :cond_211

    :cond_42
    invoke-virtual {v1}, Lpc9;->c()Ljvd;

    move-result-object v6

    iget-object v7, v6, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance v10, Ljkc;

    const/16 v11, 0x9

    iget-object v12, v0, Lhc9;->c:Lfvd;

    invoke-direct {v10, v6, v12, v11}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v7, v5, v9, v10}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    iget-object v6, v3, Lbf9;->a:Loji;

    invoke-virtual {v6}, Loji;->u()Ljava/lang/String;

    move-result-object v6

    if-eqz v4, :cond_64

    iget-object v7, v0, Lhc9;->d:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_e7

    :cond_64
    iget-object v7, v1, Lpc9;->i:Lcom/opera/android/settings/SettingsManager;

    const-string v10, "my_flow_visible"

    invoke-virtual {v7, v10}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_e7

    iget-object v7, v1, Lpc9;->h:Lxc9;

    iget-object v7, v7, Lxc9;->c:Lb59;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    const-string v10, "unread_message"

    invoke-static {v7, v10, v9}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-boolean v0, v0, Lhc9;->e:Z

    if-eqz v0, :cond_e7

    if-eqz v4, :cond_e7

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    sget v0, Lcom/opera/android/BrowserActivityStateContentProvider;->a:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".BrowserActivityStateContentProvider"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "content://"

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v4, "flow_foreground"

    invoke-virtual {v0, v4}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v14

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    :try_start_bd
    invoke-virtual/range {v13 .. v18}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_c1
    .catchall {:try_start_bd .. :try_end_c1} :catchall_e1

    if-eqz v4, :cond_d9

    :try_start_c3
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_d9

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v0
    :try_end_cd
    .catchall {:try_start_c3 .. :try_end_cd} :catchall_d6

    if-eqz v0, :cond_d1

    move v0, v9

    goto :goto_d2

    :cond_d1
    move v0, v5

    :goto_d2
    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_dd

    :catchall_d6
    move-exception v0

    move-object v8, v4

    goto :goto_e3

    :cond_d9
    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    move v0, v5

    :goto_dd
    if-nez v0, :cond_e7

    move v0, v9

    goto :goto_e8

    :catchall_e1
    move-exception v0

    const/4 v8, 0x0

    :goto_e3
    invoke-static {v8}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :cond_e7
    move v0, v5

    :goto_e8
    iget-object v4, v1, Lpc9;->j:Ljc9;

    if-nez v4, :cond_ee

    if-eqz v0, :cond_211

    :cond_ee
    invoke-virtual {v3}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v3

    if-eqz v3, :cond_f9

    invoke-static {v12, v3, v6}, Lpc9;->a(Lfvd;Ljavax/crypto/spec/SecretKeySpec;Ljava/lang/String;)Lhb9;

    move-result-object v3

    goto :goto_fa

    :cond_f9
    const/4 v3, 0x0

    :goto_fa
    if-eqz v3, :cond_211

    iget-wide v6, v3, Lhb9;->b:J

    if-eqz v0, :cond_1f9

    new-instance v0, Lcm;

    const/4 v4, 0x5

    const-string v10, "flow"

    invoke-direct {v0, v10, v5, v4}, Lcm;-><init>(Ljava/lang/String;IB)V

    invoke-static {v10, v0}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v0

    iget-object v4, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v4, Ll1f;

    const v11, 0x7f0803bc

    invoke-virtual {v0, v11}, Lua7;->S(I)V

    iput-boolean v9, v4, Ll1f;->k:Z

    instance-of v11, v3, Lkb9;

    const-string v12, ""

    const/high16 v13, 0x40000000    # 2.0f

    const-string v14, "msg"

    const-string v15, "com.opera.android.flow.ACTION_NOTIFICATION"

    if-eqz v11, :cond_131

    move-object v11, v3

    check-cast v11, Lkb9;

    iget-object v11, v11, Lkb9;->e:Ljava/lang/String;

    move-wide/from16 v19, v6

    move-object v5, v11

    move-object v11, v12

    const/16 v16, 0x0

    goto/16 :goto_1ab

    :cond_131
    instance-of v11, v3, Ljb9;

    if-eqz v11, :cond_170

    move-object v11, v3

    check-cast v11, Ljb9;

    const/16 v16, 0x0

    iget-object v8, v11, Ljb9;->g:Ljava/lang/String;

    iget-object v9, v11, Ljb9;->f:Ljava/lang/String;

    iget-object v11, v11, Ljb9;->e:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_147

    move-object v9, v8

    :cond_147
    invoke-static {v2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5, v15}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    move-wide/from16 v19, v6

    iget-wide v6, v3, Lhb9;->b:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-static {v14, v6, v8}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v5

    const v6, 0x7f140790

    invoke-virtual {v2, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v2, v7, v5, v13, v7}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object v5

    invoke-virtual {v0, v7, v6, v5}, Lua7;->i(ILjava/lang/String;Lyhe;)V

    move-object v5, v9

    goto :goto_1ab

    :cond_170
    move-wide/from16 v19, v6

    const/16 v16, 0x0

    instance-of v5, v3, Lib9;

    if-eqz v5, :cond_1fd

    const v5, 0x7f14078f

    invoke-virtual {v2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    move-object v5, v3

    check-cast v5, Lib9;

    iget-object v5, v5, Lib9;->e:Ljava/lang/String;

    invoke-static {v2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6, v15}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v6

    iget-wide v7, v3, Lhb9;->b:J

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    const-string v8, "_download_"

    invoke-static {v14, v7, v8}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v6

    const v7, 0x7f14059f

    invoke-virtual {v2, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v2, v8, v6, v13, v8}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object v6

    invoke-virtual {v0, v8, v7, v6}, Lua7;->i(ILjava/lang/String;Lyhe;)V

    :goto_1ab
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1b4

    invoke-virtual {v0, v11}, Lua7;->P(Ljava/lang/CharSequence;)V

    :cond_1b4
    invoke-virtual {v0, v5}, Lua7;->O(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5, v15}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-static {v14, v6, v12}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v5

    const/4 v7, 0x0

    invoke-static {v2, v7, v5, v13, v7}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object v5

    invoke-virtual {v0, v5}, Lua7;->N(Lyhe;)V

    const-string v0, "notification"

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz v0, :cond_1fd

    const-string v2, "Notifications.Android.Build"

    :try_start_1df
    invoke-virtual {v4}, Ll1f;->b()Landroid/app/Notification;

    move-result-object v4
    :try_end_1e3
    .catch Ljava/lang/NullPointerException; {:try_start_1df .. :try_end_1e3} :catch_1ef
    .catchall {:try_start_1df .. :try_end_1e3} :catchall_1e9

    const/4 v5, 0x1

    invoke-static {v2, v5}, Lioh;->t(Ljava/lang/String;Z)V

    const/4 v7, 0x0

    goto :goto_1f5

    :catchall_1e9
    move-exception v0

    const/4 v7, 0x0

    invoke-static {v2, v7}, Lioh;->t(Ljava/lang/String;Z)V

    throw v0

    :catch_1ef
    const/4 v7, 0x0

    invoke-static {v2, v7}, Lioh;->t(Ljava/lang/String;Z)V

    move-object/from16 v4, v16

    :goto_1f5
    invoke-virtual {v0, v10, v7, v4}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    goto :goto_1fd

    :cond_1f9
    move-wide/from16 v19, v6

    const/16 v16, 0x0

    :cond_1fd
    :goto_1fd
    iget-object v0, v1, Lpc9;->j:Ljc9;

    if-eqz v0, :cond_213

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Ljc9;->a(J)I

    move-result v0

    new-instance v1, Landroid/util/Pair;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {v1, v0, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :cond_211
    :goto_211
    const/16 v16, 0x0

    :cond_213
    return-object v16
.end method
