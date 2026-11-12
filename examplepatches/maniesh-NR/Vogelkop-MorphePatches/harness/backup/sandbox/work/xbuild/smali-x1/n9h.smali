.class public final Ln9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrr9;
.implements Lch7;
.implements Lovm;
.implements Lnmn;
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 4

    iput-byte p1, p0, Ln9h;->a:B

    packed-switch p1, :pswitch_data_3a

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    return-void

    :pswitch_17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    return-void

    :pswitch_23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Loji;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/ArrayMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/util/ArrayMap;-><init>(I)V

    iput-object v0, p1, Loji;->a:Ljava/lang/Object;

    iput-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    return-void

    :pswitch_data_3a
    .packed-switch 0xd
        :pswitch_27
        :pswitch_23
        :pswitch_17
    .end packed-switch
.end method

.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 74
    iput-byte p1, p0, Ln9h;->a:B

    iput-object p2, p0, Ln9h;->b:Ljava/lang/Object;

    iput-object p3, p0, Ln9h;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ln9h;->a:B

    .line 65
    sget-object v0, Lbb7;->a:Lcv6;

    .line 66
    sget-object v0, Lmr6;->b:Lmr6;

    .line 67
    invoke-static {v0}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object v0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object v0, p0, Ln9h;->b:Ljava/lang/Object;

    .line 70
    new-instance v0, Lvg4;

    const/16 v1, 0xf

    invoke-direct {v0, p1, v1}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/google/ads/interactivemedia/v3/internal/zzeg;)V
    .registers 4

    const/16 v0, 0x10

    iput-byte v0, p0, Ln9h;->a:B

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Ln9h;->b:Ljava/lang/Object;

    iput-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 58
    iput-byte p3, p0, Ln9h;->a:B

    iput-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    iput-object p2, p0, Ln9h;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lwci;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Ln9h;->a:B

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    .line 60
    iget-object v1, p1, Lwci;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    .line 61
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Ln9h;->b:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    .line 62
    iget-object p1, p1, Lwci;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    .line 63
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwub;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Ln9h;->a:B

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    .line 73
    iput-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    return-void
.end method

.method public static n(Ljava/lang/String;)Z
    .registers 2

    const-string v0, "web:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, ";"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Lcph;

    monitor-enter p0

    :try_start_5
    iget-object v0, p0, Lcph;->a:[B

    array-length v0, v0

    iput v0, p0, Lcph;->c:I
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_e

    monitor-exit p0

    return-void

    :goto_c
    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_e

    throw v0

    :catchall_e
    move-exception v0

    goto :goto_c
.end method

.method public final b(Lzg3;Landroid/graphics/Bitmap;)V
    .registers 3

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Luf8;

    iget-object p0, p0, Luf8;->b:Ljava/io/IOException;

    if-eqz p0, :cond_e

    if-eqz p2, :cond_d

    invoke-interface {p1, p2}, Lzg3;->b(Landroid/graphics/Bitmap;)V

    :cond_d
    throw p0

    :cond_e
    return-void
.end method

.method public final c(I)V
    .registers 10

    iget-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v0, Ljn;

    if-eqz v0, :cond_36

    iget-object v0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_f
    :goto_f
    if-ge v2, v1, :cond_36

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lvsp;

    iget-object v4, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v4, Ljn;

    iget-boolean v5, v3, Lvsp;->c:Z

    if-eqz v5, :cond_f

    invoke-static {}, Lcom/google/ads/interactivemedia/v3/impl/data/zzcg;->a()Lcom/google/ads/interactivemedia/v3/impl/data/zzcf;

    move-result-object v5

    int-to-float v6, p1

    const/high16 v7, 0x42c80000    # 100.0f

    div-float/2addr v6, v7

    invoke-virtual {v5, v6}, Lcom/google/ads/interactivemedia/v3/impl/data/zzcf;->b(F)Lcom/google/ads/interactivemedia/v3/impl/data/zzcf;

    invoke-virtual {v5}, Lcom/google/ads/interactivemedia/v3/impl/data/zzcf;->a()Lcom/google/ads/interactivemedia/v3/impl/data/zzcg;

    move-result-object v5

    sget-object v6, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->volumeChange:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {v3, v6, v4, v5}, Lvsp;->a(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljn;Ljava/lang/Object;)V

    goto :goto_f

    :cond_36
    return-void
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final f(Ljava/lang/String;)I
    .registers 6

    iget-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    iget-object v1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v1, v1, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-static {v1, p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->j(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    if-nez p1, :cond_1c

    monitor-exit v0

    return v2

    :cond_1c
    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Landroid/database/MatrixCursor;

    invoke-virtual {p0}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p0

    const/4 v3, 0x0

    invoke-interface {v1, p1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    monitor-exit v0

    return v2

    :goto_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_7 .. :try_end_2f} :catchall_30

    throw p0

    :catchall_30
    move-exception p0

    goto :goto_2e
.end method

.method public final g(Lomn;)V
    .registers 4

    iget-object v0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v0, Lqsh;

    iget-object v0, v0, Lqsh;->c:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object p1, p1, Lomn;->a:Laln;

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    iget-object v0, v0, Lqln;->j:Lvzk;

    iget-object v1, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lvzk;->i0()V

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final h(Ljava/lang/String;)I
    .registers 7

    iget-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    iget-object v1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v1, v1, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-static {v1, p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->j(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    if-nez p1, :cond_1c

    monitor-exit v0

    return v2

    :cond_1c
    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Landroid/database/MatrixCursor;

    invoke-virtual {p0}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p0

    const-wide/16 v3, 0x0

    invoke-interface {v1, p1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    monitor-exit v0

    return v2

    :goto_33
    monitor-exit v0
    :try_end_34
    .catchall {:try_start_7 .. :try_end_34} :catchall_35

    throw p0

    :catchall_35
    move-exception p0

    goto :goto_33
.end method

.method public final i(Ljava/lang/String;)I
    .registers 6

    iget-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    iget-object v1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v1, v1, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "previous_version_code"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2a

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/UserSettingsContentProvider;

    invoke-virtual {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->h()V

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget p1, p1, Lcom/opera/android/settings/UserSettingsContentProvider;->d:I

    goto :goto_36

    :cond_2a
    invoke-static {v1, p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->j(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_32

    monitor-exit v0

    return v3

    :cond_32
    invoke-interface {v1, p1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    :goto_36
    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Landroid/database/MatrixCursor;

    invoke-virtual {p0}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    monitor-exit v0

    return v3

    :goto_47
    monitor-exit v0
    :try_end_48
    .catchall {:try_start_7 .. :try_end_48} :catchall_49

    throw p0

    :catchall_49
    move-exception p0

    goto :goto_47
.end method

.method public final j(JZLjava/lang/String;)Lsmj;
    .registers 11

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_77

    iget-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_9
    invoke-virtual {p0, p4}, Ln9h;->l(Ljava/lang/String;)Lsmj;

    move-result-object v1

    if-eqz v1, :cond_11

    monitor-exit v0

    return-object v1

    :cond_11
    const-string v1, "sites"

    sget-object v2, Lxjf;->a:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsr4;

    sget-object v2, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v3, v1, Lsr4;->b:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/app/NotificationChannelGroup;

    iget-object v1, v1, Lsr4;->a:Ljava/lang/String;

    invoke-direct {v3, v1, v2}, Landroid/app/NotificationChannelGroup;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;)V

    iget-object v1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v1, Lwub;

    invoke-virtual {v1, v3}, Lwub;->y(Landroid/app/NotificationChannelGroup;)V

    new-instance v1, Lsmj;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "web:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p4}, Leyi;->f(Ljava/lang/String;)Leyi;

    move-result-object v3

    iget-object v4, v3, Leyi;->d:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_53

    iget-boolean v5, v3, Leyi;->b:Z

    if-eqz v5, :cond_53

    const-string v3, "http://"

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_57

    :cond_53
    iget-object v3, v3, Leyi;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    :goto_57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ";"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, p4, p3}, Lsmj;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_69
    .catchall {:try_start_9 .. :try_end_69} :catchall_7b

    :try_start_69
    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {v1}, Lsmj;->a()Landroid/app/NotificationChannel;

    move-result-object p1

    invoke-virtual {p0, p1}, Lwub;->x(Landroid/app/NotificationChannel;)V
    :try_end_74
    .catch Ljava/lang/IllegalStateException; {:try_start_69 .. :try_end_74} :catch_76
    .catchall {:try_start_69 .. :try_end_74} :catchall_7b

    :try_start_74
    monitor-exit v0

    return-object v1

    :catch_76
    monitor-exit v0

    :cond_77
    const/4 p0, 0x0

    return-object p0

    :goto_79
    monitor-exit v0
    :try_end_7a
    .catchall {:try_start_74 .. :try_end_7a} :catchall_7b

    throw p0

    :catchall_7b
    move-exception p0

    goto :goto_79
.end method

.method public final k(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0, p1}, Ln9h;->l(Ljava/lang/String;)Lsmj;

    move-result-object p1

    if-eqz p1, :cond_12

    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Lwub;

    iget-object p1, p1, Lsmj;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lwub;->A(Ljava/lang/String;)V

    :cond_12
    monitor-exit v0

    return-void

    :goto_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_16

    throw p0

    :catchall_16
    move-exception p0

    goto :goto_14
.end method

.method public final l(Ljava/lang/String;)Lsmj;
    .registers 6

    invoke-static {p1}, Leyi;->f(Ljava/lang/String;)Leyi;

    move-result-object p1

    iget-object v0, p1, Leyi;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_15

    iget-boolean v1, p1, Leyi;->b:Z

    if-eqz v1, :cond_15

    const-string p1, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_19

    :cond_15
    iget-object p1, p1, Leyi;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    :goto_19
    invoke-virtual {p0}, Ln9h;->m()[Lsmj;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    :goto_1f
    if-ge v1, v0, :cond_2f

    aget-object v2, p0, v1

    iget-object v3, v2, Lsmj;->b:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    return-object v2

    :cond_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    :cond_2f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final m()[Lsmj;
    .registers 9

    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0}, Lwub;->F()Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_11
    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_53

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationChannel;

    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ln9h;->n(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getId()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ";"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lsmj;

    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getId()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v6, v2, v5

    const/4 v7, 0x1

    aget-object v2, v2, v7

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getImportance()I

    move-result v1

    if-eqz v1, :cond_4c

    move v5, v7

    :cond_4c
    invoke-direct {v3, v4, v6, v5}, Lsmj;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_53
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Lsmj;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lsmj;

    return-object p0
.end method

.method public final o(Ljava/lang/String;Lx4l;Z)V
    .registers 7

    if-eqz p3, :cond_31

    iget-object p3, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p3, Ljava/util/LinkedHashMap;

    sget-object v0, La5l;->l:Lgpk;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ly4l;

    invoke-direct {v1, v0}, Ly4l;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_31
    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 3

    iget-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p1, Ldpp;

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v0, p1, Ldpp;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_b
    iget-object p1, p1, Ldpp;->e:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_b .. :try_end_13} :catchall_14

    throw p0

    :catchall_14
    move-exception p0

    goto :goto_12
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 9

    iget-byte v0, p0, Ln9h;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_ae

    instance-of v0, p1, Lztk;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Camera surface session should only fail with request cancellation. Instead failed due to:\n"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0}, Ljpo;->n(Ljava/lang/String;Z)V

    iget-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p1, Lqp5;

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/Surface;

    new-instance v0, Lxo2;

    invoke-direct {v0, v1, p0}, Lxo2;-><init>(ILandroid/view/Surface;)V

    invoke-interface {p1, v0}, Lqp5;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_2a
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v0, Lkoh;

    iget v2, v0, Lkoh;->e:I

    iget-byte v3, v0, Lkoh;->c:B

    if-ge v2, v3, :cond_5e

    add-int/2addr v2, v1

    iput v2, v0, Lkoh;->e:I

    new-instance p1, Lpjg;

    const/16 v1, 0x12

    invoke-direct {p1, p0, v1}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Lkoh;->g:Lmoh;

    iget-object p0, p0, Lmoh;->d:Lb2j;

    sget-short v1, Lmoh;->L:S

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v4

    new-instance v5, Lq2g;

    const/16 v6, 0x18

    invoke-direct {v5, p0, p1, v6}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    check-cast v4, Lg7a;

    invoke-virtual {v4, v5, v1, v2, v3}, Lg7a;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    iput-object p0, v0, Lkoh;->f:Ljava/util/concurrent/ScheduledFuture;

    goto :goto_a8

    :cond_5e
    iget-object p0, v0, Lkoh;->g:Lmoh;

    const-string v0, "Encountered encoder setup error while in unexpected state "

    iget-object v1, p0, Lmoh;->f:Ljava/lang/Object;

    monitor-enter v1

    :try_start_65
    iget-object v2, p0, Lmoh;->h:Lloh;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    packed-switch v2, :pswitch_data_b4

    goto :goto_a7

    :pswitch_6f
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lmoh;->h:Lloh;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ": "

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    :pswitch_8b
    iget p1, p0, Lmoh;->j:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_a2

    iput v0, p0, Lmoh;->j:I

    iget-object p1, p0, Lmoh;->a:Lm59;

    iget-object v2, p0, Lmoh;->h:Lloh;

    invoke-static {v2}, Lmoh;->m(Lloh;)I

    move-result v2

    new-instance v3, Lso2;

    invoke-direct {v3, v0, v2}, Lso2;-><init>(II)V

    invoke-virtual {p1, v3}, Lm59;->o(Ljava/lang/Object;)V

    :cond_a2
    sget-object p1, Lloh;->h:Lloh;

    invoke-virtual {p0, p1}, Lmoh;->q(Lloh;)V

    :goto_a7
    monitor-exit v1

    :goto_a8
    return-void

    :goto_a9
    monitor-exit v1
    :try_end_aa
    .catchall {:try_start_65 .. :try_end_aa} :catchall_ab

    throw p0

    :catchall_ab
    move-exception p0

    goto :goto_a9

    nop

    :pswitch_data_ae
    .packed-switch 0x1
        :pswitch_2a
    .end packed-switch

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_8b
        :pswitch_8b
        :pswitch_8b
        :pswitch_6f
        :pswitch_6f
        :pswitch_6f
        :pswitch_6f
        :pswitch_6f
    .end packed-switch
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 9

    iget-byte v0, p0, Ln9h;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_1a4

    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p1, Lqp5;

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/Surface;

    new-instance v0, Lxo2;

    invoke-direct {v0, v1, p0}, Lxo2;-><init>(ILandroid/view/Surface;)V

    invoke-interface {p1, v0}, Lqp5;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_19
    check-cast p1, Lf28;

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    if-eqz p1, :cond_19e

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p1, Lkoh;

    iget-object p1, p1, Lkoh;->g:Lmoh;

    iget-object p1, p1, Lmoh;->w:Lcyd;

    iget-object v0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v0, Lcyd;

    const/4 v2, 0x1

    if-ne p1, v0, :cond_31

    move p1, v2

    goto :goto_32

    :cond_31
    move p1, v1

    :goto_32
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljpo;->n(Ljava/lang/String;Z)V

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p1, Lkoh;

    iget-object p1, p1, Lkoh;->g:Lmoh;

    iget-object p1, p1, Lmoh;->s:Lf28;

    if-nez p1, :cond_42

    move p1, v2

    goto :goto_43

    :cond_42
    move p1, v1

    :goto_43
    invoke-static {v0, p1}, Ljpo;->n(Ljava/lang/String;Z)V

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p1, Lkoh;

    iget-object p1, p1, Lkoh;->g:Lmoh;

    iget-object v3, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v3, Lcyd;

    iget-object v4, v3, Lcyd;->f:Ljava/lang/Object;

    check-cast v4, Lf28;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v4, p1, Lmoh;->s:Lf28;

    iget-object v5, p1, Lmoh;->g:Lm59;

    iget-object v4, v4, Lf28;->f:Ln1;

    check-cast v4, Lu3n;

    invoke-interface {v4}, Lu3n;->r()Landroid/util/Range;

    move-result-object v4

    invoke-virtual {v5, v4}, Lm59;->o(Ljava/lang/Object;)V

    iget-object v4, p1, Lmoh;->s:Lf28;

    iget-object v4, v4, Lf28;->c:Landroid/media/MediaFormat;

    const-string v5, "bitrate"

    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_75

    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    :cond_75
    iget v4, v3, Lcyd;->b:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_7e

    iget-object v0, v3, Lcyd;->g:Ljava/lang/Object;

    check-cast v0, Landroid/view/Surface;

    :cond_7e
    iput-object v0, p1, Lmoh;->q:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Lmoh;->p(Landroid/view/Surface;)V

    iget-object v0, v3, Lcyd;->k:Ljava/lang/Object;

    check-cast v0, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v0}, Lk1g;->O(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v4, Ld7h;

    invoke-direct {v4, v2, p1, v3, v1}, Ld7h;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p1, p1, Lmoh;->d:Lb2j;

    new-instance v3, Lwr9;

    invoke-direct {v3, v0, v4, v1}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v3, p1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lkoh;

    iget-object p0, p0, Lkoh;->g:Lmoh;

    const-string p1, "Incorrectly invoke onConfigured() in state "

    iget-object v0, p0, Lmoh;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_a5
    iget-object v3, p0, Lmoh;->h:Lloh;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    packed-switch v3, :pswitch_data_1aa

    goto/16 :goto_124

    :pswitch_b0
    new-instance p0, Ljava/lang/AssertionError;

    const-string p1, "Unexpectedly invoke onConfigured() in a STOPPING state when it\'s not waiting for a new surface."

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0

    :pswitch_b8
    move p1, v2

    goto :goto_bb

    :pswitch_ba
    move p1, v1

    :goto_bb
    const-string v3, "Unexpectedly invoke onConfigured() when there\'s a non-persistent in-progress recording"

    invoke-static {v3, v1}, Ljpo;->n(Ljava/lang/String;Z)V

    move v3, v2

    goto :goto_126

    :pswitch_c2
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lmoh;->h:Lloh;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    :pswitch_d6
    move p1, v2

    goto :goto_d9

    :pswitch_d8
    move p1, v1

    :goto_d9
    iget v3, p0, Lmoh;->B:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_105

    sget-object v3, Lmoh;->C:Ljava/util/Set;

    iget-object v4, p0, Lmoh;->h:Lloh;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ef

    iget-object v3, p0, Lmoh;->i:Lloh;

    invoke-virtual {p0, v3}, Lmoh;->q(Lloh;)V

    move v3, v1

    goto :goto_126

    :cond_ef
    new-instance p1, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cannot restore non-pending state when in state "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lmoh;->h:Lloh;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    :cond_105
    iget-object p0, p0, Lmoh;->h:Lloh;

    sget-object p1, Lloh;->c:Lloh;

    if-eq p0, p1, :cond_117

    sget-object p1, Lloh;->b:Lloh;

    if-eq p0, p1, :cond_117

    new-instance p0, Ljava/lang/AssertionError;

    const-string p1, "makePendingRecordingActiveLocked() can only be called from a pending state."

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0

    :cond_117
    new-instance p0, Ljava/lang/AssertionError;

    const-string p1, "Pending recording should exist when in a PENDING state."

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0

    :pswitch_11f
    sget-object p1, Lloh;->d:Lloh;

    invoke-virtual {p0, p1}, Lmoh;->q(Lloh;)V

    :goto_124
    move p1, v1

    move v3, p1

    :goto_126
    monitor-exit v0
    :try_end_127
    .catchall {:try_start_a5 .. :try_end_127} :catchall_1a1

    if-eqz v3, :cond_19e

    iget-object v0, p0, Lmoh;->m:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_14b

    new-instance v3, Lohc;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {}, Ln97;->a()Ln97;

    move-result-object v5

    invoke-direct {v3, v4, v2, v5}, Lohc;-><init>(Ljava/util/ArrayList;ZLn97;)V

    invoke-virtual {v3}, Lohc;->isDone()Z

    move-result v4

    if-nez v4, :cond_148

    invoke-virtual {v3, v2}, Lohc;->cancel(Z)Z

    :cond_148
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_14b
    new-instance v3, Lr9g;

    const/16 v4, 0x15

    invoke-direct {v3, p0, v4}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3}, Lk1g;->z(Lm94;)Lo94;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lohc;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {}, Ln97;->a()Ln97;

    move-result-object v0

    invoke-direct {v3, v4, v2, v0}, Lohc;-><init>(Ljava/util/ArrayList;ZLn97;)V

    new-instance v0, Lir5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ln97;->a()Ln97;

    move-result-object v4

    new-instance v5, Lwr9;

    invoke-direct {v5, v3, v0, v1}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v5, v4}, Lohc;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    iget-object v0, p0, Lmoh;->s:Lf28;

    iget-object v3, v0, Lf28;->p:Lz8b;

    invoke-virtual {v3}, Lz8b;->O()J

    move-result-wide v3

    iget-object v5, v0, Lf28;->g:Lb2j;

    new-instance v6, Lz18;

    invoke-direct {v6, v0, v3, v4, v2}, Lz18;-><init>(Lf28;JB)V

    invoke-virtual {v5, v6}, Lb2j;->execute(Ljava/lang/Runnable;)V

    if-eqz p1, :cond_19e

    iget-object p0, p0, Lmoh;->s:Lf28;

    iget-object p1, p0, Lf28;->p:Lz8b;

    invoke-virtual {p1}, Lz8b;->O()J

    move-result-wide v2

    iget-object p1, p0, Lf28;->g:Lb2j;

    new-instance v0, Lz18;

    invoke-direct {v0, p0, v2, v3, v1}, Lz18;-><init>(Lf28;JB)V

    invoke-virtual {p1, v0}, Lb2j;->execute(Ljava/lang/Runnable;)V

    :cond_19e
    return-void

    :goto_19f
    :try_start_19f
    monitor-exit v0
    :try_end_1a0
    .catchall {:try_start_19f .. :try_end_1a0} :catchall_1a1

    throw p0

    :catchall_1a1
    move-exception p0

    goto :goto_19f

    nop

    :pswitch_data_1a4
    .packed-switch 0x1
        :pswitch_19
    .end packed-switch

    :pswitch_data_1aa
    .packed-switch 0x0
        :pswitch_11f
        :pswitch_d8
        :pswitch_d6
        :pswitch_c2
        :pswitch_ba
        :pswitch_b8
        :pswitch_b0
        :pswitch_c2
    .end packed-switch
.end method

.method public final p(Ljvg;)V
    .registers 8

    iget-object v0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v1, :cond_17

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lem;

    invoke-interface {v3, p1}, Lem;->a(Ljvg;)V

    goto :goto_9

    :cond_17
    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/ads/interactivemedia/v3/internal/zzeg;

    if-eqz p0, :cond_2c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v4, p1

    invoke-static/range {v0 .. v5}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbk;->d(JLcom/google/ads/interactivemedia/v3/impl/data/zzbi;Lcom/google/ads/interactivemedia/v3/impl/data/zzbj;Ljvg;Lcom/google/ads/interactivemedia/v3/impl/data/zzbp;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbk;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->a(Lcom/google/ads/interactivemedia/v3/impl/data/zzbk;)V

    :cond_2c
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Ln9h;->a:B

    sparse-switch v0, :sswitch_data_2e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_a
    iget-object p0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ErrorListenerSupport [errorListeners="

    const-string v1, "]"

    invoke-static {v0, p0, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_1b
    iget-object v0, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "SplitInstallRequest{modulesNames=%s,languages=%s}"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_2e
    .sparse-switch
        0x5 -> :sswitch_1b
        0x10 -> :sswitch_a
    .end sparse-switch
.end method
