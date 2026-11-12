.class public final Lwf2;
.super Landroid/database/ContentObserver;
.source "SourceFile"

# interfaces
.implements Ly9j;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/content/ContentResolver;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lwf2;->a:B

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, v1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Lwf2;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, p0, Lwf2;->b:Landroid/content/ContentResolver;

    iput-object p1, p0, Lwf2;->d:Ljava/lang/Object;

    sget-object v1, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v1, p1, v0, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method

.method public constructor <init>(Lxf2;Landroid/os/Handler;Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lwf2;->a:B

    .line 44
    iput-object p1, p0, Lwf2;->d:Ljava/lang/Object;

    .line 45
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 46
    iput-object p3, p0, Lwf2;->b:Landroid/content/ContentResolver;

    .line 47
    iput-object p4, p0, Lwf2;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lezg;)V
    .registers 2

    iget-object p0, p0, Lwf2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Landroid/net/Uri;Landroid/content/ContentValues;)V
    .registers 4

    :try_start_0
    iget-object p0, p0, Lwf2;->b:Landroid/content/ContentResolver;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v0}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_6} :catch_6

    :catch_6
    return-void
.end method

.method public final contains(Ljava/lang/String;)Z
    .registers 8

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/opera/android/settings/UserSettingsContentProvider;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "contains"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "anytype"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    const/4 p1, 0x0

    :try_start_21
    iget-object v0, p0, Lwf2;->b:Landroid/content/ContentResolver;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const/4 p0, 0x0

    if-eqz p1, :cond_3c

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3c

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0
    :try_end_38
    .catchall {:try_start_21 .. :try_end_38} :catchall_40

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3c

    move p0, v1

    :cond_3c
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return p0

    :catchall_40
    move-exception v0

    move-object p0, v0

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final d(Ljava/lang/String;)Z
    .registers 8

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/opera/android/settings/UserSettingsContentProvider;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "containsDefault"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "anytype"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    const/4 p1, 0x0

    :try_start_21
    iget-object v0, p0, Lwf2;->b:Landroid/content/ContentResolver;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const/4 p0, 0x0

    if-eqz p1, :cond_3c

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3c

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0
    :try_end_38
    .catchall {:try_start_21 .. :try_end_38} :catchall_40

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3c

    move p0, v1

    :cond_3c
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return p0

    :catchall_40
    move-exception v0

    move-object p0, v0

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "String"

    const-string v2, "wallpaper_current"

    invoke-static {v0, v2, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    const/4 v3, 0x2

    invoke-direct {v1, v3}, Landroid/content/ContentValues;-><init>(I)V

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "__uscp_predefined_default"

    invoke-virtual {v1, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lwf2;->b(Landroid/net/Uri;Landroid/content/ContentValues;)V

    return-void
.end method

.method public final getInt(Ljava/lang/String;I)I
    .registers 11

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "int"

    invoke-static {v0, p1, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 p1, 0x0

    :try_start_b
    iget-object v2, p0, Lwf2;->b:Landroid/content/ContentResolver;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_26

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p0

    if-eqz p0, :cond_26

    const/4 p0, 0x0

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0
    :try_end_22
    .catchall {:try_start_b .. :try_end_22} :catchall_2a

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return p0

    :cond_26
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return p2

    :catchall_2a
    move-exception v0

    move-object p0, v0

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final getLong(Ljava/lang/String;J)J
    .registers 12

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "long"

    invoke-static {v0, p1, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 p1, 0x0

    :try_start_b
    iget-object v2, p0, Lwf2;->b:Landroid/content/ContentResolver;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_22

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p0

    if-eqz p0, :cond_22

    const/4 p0, 0x0

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p2
    :try_end_22
    .catchall {:try_start_b .. :try_end_22} :catchall_26

    :cond_22
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-wide p2

    :catchall_26
    move-exception v0

    move-object p0, v0

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "String"

    invoke-static {v0, p1, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 p1, 0x0

    :try_start_b
    iget-object v2, p0, Lwf2;->b:Landroid/content/ContentResolver;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_26

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p0

    if-eqz p0, :cond_26

    const/4 p0, 0x0

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0
    :try_end_22
    .catchall {:try_start_b .. :try_end_22} :catchall_2a

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object p0

    :cond_26
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object p2

    :catchall_2a
    move-exception v0

    move-object p0, v0

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final i(JJLjava/lang/String;)V
    .registers 9

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "long"

    invoke-static {v0, p5, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v1, p5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p1, "__uscp_predefined_default"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v1, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-virtual {p0, v0, v1}, Lwf2;->b(Landroid/net/Uri;Landroid/content/ContentValues;)V

    return-void
.end method

.method public final m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "String"

    invoke-static {v0, p1, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    invoke-virtual {v1, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "__uscp_predefined_default"

    invoke-virtual {v1, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lwf2;->b(Landroid/net/Uri;Landroid/content/ContentValues;)V

    return-void
.end method

.method public final n(ILjava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "int"

    invoke-static {v0, p2, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "__uscp_predefined_default"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p0, p2, v0}, Lwf2;->b(Landroid/net/Uri;Landroid/content/ContentValues;)V

    return-void
.end method

.method public final o(IILjava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "int"

    invoke-static {v0, p3, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "__uscp_predefined_default"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p0, v0, v1}, Lwf2;->b(Landroid/net/Uri;Landroid/content/ContentValues;)V

    return-void
.end method

.method public final onChange(Z)V
    .registers 4

    iget-byte v0, p0, Lwf2;->a:B

    packed-switch v0, :pswitch_data_22

    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    return-void

    .line 54
    :pswitch_9
    iget-object p0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast p0, Lxf2;

    .line 55
    iget-object p1, p0, Lxf2;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    .line 56
    iget-object v0, p0, Lxf2;->j:Ljava/lang/Object;

    check-cast v0, Lpf2;

    .line 57
    iget-object v1, p0, Lxf2;->i:Ljava/lang/Object;

    check-cast v1, Landroid/media/AudioDeviceInfo;

    .line 58
    invoke-static {p1, v0, v1}, Luf2;->b(Landroid/content/Context;Lpf2;Landroid/media/AudioDeviceInfo;)Luf2;

    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Lxf2;->a(Luf2;)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onChange(ZLandroid/net/Uri;)V
    .registers 4

    iget-byte v0, p0, Lwf2;->a:B

    packed-switch v0, :pswitch_data_36

    invoke-super {p0, p1, p2}, Landroid/database/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1, p2}, Landroid/database/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    :try_start_c
    sget-object p1, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    invoke-virtual {p2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x2

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_19} :catch_1a

    goto :goto_1b

    :catch_1a
    const/4 p1, 0x0

    :goto_1b
    if-eqz p1, :cond_35

    iget-object p0, p0, Lwf2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_25
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_35

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lp5j;

    invoke-interface {p2, p1}, Lp5j;->M(Ljava/lang/String;)V

    goto :goto_25

    :cond_35
    return-void

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final q(IILjava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "int"

    invoke-static {v0, p3, v1}, Lcom/opera/android/settings/UserSettingsContentProvider;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "__uscp_predefined_default"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p0, v0, v1}, Lwf2;->b(Landroid/net/Uri;Landroid/content/ContentValues;)V

    return-void
.end method

.method public final remove(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lwf2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/opera/android/settings/UserSettingsContentProvider;->a(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "type"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    :try_start_20
    iget-object p0, p0, Lwf2;->b:Landroid/content/ContentResolver;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_26
    .catch Ljava/lang/IllegalArgumentException; {:try_start_20 .. :try_end_26} :catch_26

    :catch_26
    return-void
.end method
