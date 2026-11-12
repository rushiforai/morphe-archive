.class public final Lanf;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lanf;->a:B

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9

    iget-byte p0, p0, Lanf;->a:B

    const/4 v0, -0x1

    const-string v1, "android.media.extra.AUDIO_PLUG_STATE"

    const-string v2, "android.media.action.HDMI_AUDIO_PLUG"

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch p0, :pswitch_data_166

    sget-object p0, Ls8p;->d:Ls8p;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_23

    iget-boolean p1, p0, Ls8p;->c:Z

    invoke-virtual {p0, v5, p1}, Ls8p;->a(ZZ)V

    iput-boolean v5, p0, Ls8p;->b:Z

    goto :goto_36

    :cond_23
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.SCREEN_ON"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_36

    iget-boolean p1, p0, Ls8p;->c:Z

    invoke-virtual {p0, v4, p1}, Ls8p;->a(ZZ)V

    iput-boolean v4, p0, Ls8p;->b:Z

    :cond_36
    :goto_36
    return-void

    :pswitch_37
    const-string p0, "extra_download_id"

    const-wide/16 v0, -0x1

    invoke-virtual {p2, p0, v0, v1}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    sget-object p0, Lsjo;->a:Ljava/util/List;

    sget-object p0, Lphf;->a:Lx79;

    iget-object p0, p0, Lx79;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-string p2, "ad_config"

    invoke-virtual {p0, p2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-wide/16 v2, 0x0

    const-string p2, "reference"

    invoke-interface {p0, p2, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-nez p0, :cond_b0

    const-string p0, "download"

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/DownloadManager;

    if-eqz p0, :cond_b0

    new-instance p2, Landroid/app/DownloadManager$Query;

    invoke-direct {p2}, Landroid/app/DownloadManager$Query;-><init>()V

    new-array v2, v5, [J

    aput-wide v0, v2, v4

    invoke-virtual {p2, v2}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    invoke-virtual {p0, p2}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_b0

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_ad

    const-string p2, "status"

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    const-string v0, "local_uri"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_ad

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    const/16 v1, 0x8

    if-ne v1, p2, :cond_ad

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string v1, "application/vnd.android.package-archive"

    invoke-virtual {v0, p2, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    :try_start_aa
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_ad
    .catchall {:try_start_aa .. :try_end_ad} :catchall_ad

    :catchall_ad
    :cond_ad
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_b0
    return-void

    :pswitch_b1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    if-ne p0, v2, :cond_c4

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_c0

    sput-byte v5, Lr9h;->a:B

    goto :goto_c4

    :cond_c0
    if-ne p0, v5, :cond_c4

    sput-byte v3, Lr9h;->a:B

    :cond_c4
    :goto_c4
    return-void

    :pswitch_c5
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    if-ne p0, v2, :cond_d8

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_d4

    sput v5, Lj7h;->a:I

    goto :goto_d8

    :cond_d4
    if-ne p0, v5, :cond_d8

    sput v3, Lj7h;->a:I

    :cond_d8
    :goto_d8
    return-void

    :pswitch_d9
    const-string p0, "android.security.action.TRUST_STORE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_f5

    invoke-static {}, Lorg/chromium/net/X509Util;->c()Lp8o;

    move-result-object p0

    iget-object p1, p0, Lp8o;->a:Lsjn;

    invoke-virtual {p1}, Lsjn;->m()Lo8o;

    move-result-object p1

    iput-object p1, p0, Lp8o;->b:Lo8o;

    invoke-static {}, LJ/N;->M6C2IQIc()V

    goto :goto_11c

    :cond_f5
    const-string p0, "android.security.action.KEYCHAIN_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_105

    invoke-static {}, LJ/N;->MJdorYDE()V

    goto :goto_11c

    :cond_105
    const-string p0, "android.security.action.KEY_ACCESS_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_11c

    const-string p0, "android.security.extra.KEY_ACCESSIBLE"

    invoke-virtual {p2, p0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_11c

    invoke-static {}, LJ/N;->MJdorYDE()V

    :cond_11c
    :goto_11c
    return-void

    :pswitch_11d
    const-string p0, "android.os.action.POWER_SAVE_MODE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12c

    invoke-static {p1}, Lrog;->a(Landroid/content/Context;)V

    :cond_12c
    return-void

    :pswitch_12d
    const-string p0, "android.intent.action.ACTION_POWER_DISCONNECTED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    sget-boolean p1, Lorg/chromium/base/PowerMonitor;->a:Z

    if-eqz p0, :cond_13c

    move v3, v5

    :cond_13c
    sput-byte v3, Lorg/chromium/base/PowerMonitor;->b:B

    invoke-static {}, LJ/N;->MCImhGql()V

    return-void

    :pswitch_142
    const-string p0, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_165

    new-instance p0, Landroid/content/Intent;

    sget-object p1, Lbnf;->c:Landroid/util/SparseArray;

    sget-object p1, Lt8;->a:Landroid/content/Context;

    const-class v0, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PlaybackListenerService;

    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    sget-object p1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p1, p0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_165
    return-void

    :pswitch_data_166
    .packed-switch 0x0
        :pswitch_142
        :pswitch_12d
        :pswitch_11d
        :pswitch_d9
        :pswitch_c5
        :pswitch_b1
        :pswitch_37
    .end packed-switch
.end method
