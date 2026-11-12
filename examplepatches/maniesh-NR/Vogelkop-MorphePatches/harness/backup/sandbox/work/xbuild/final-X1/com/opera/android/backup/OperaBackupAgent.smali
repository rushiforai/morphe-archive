.class public Lcom/opera/android/backup/OperaBackupAgent;
.super Landroid/app/backup/BackupAgent;
.source "SourceFile"


# instance fields
.field public a:Lt28;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/backup/BackupAgent;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBackup(Landroid/os/ParcelFileDescriptor;Landroid/app/backup/BackupDataOutput;Landroid/os/ParcelFileDescriptor;)V
    .registers 4

    return-void
.end method

.method public final onCreate()V
    .registers 2

    sget-object v0, Li0i;->a:Lnx1;

    sget-object v0, Li0i;->b:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt28;

    iput-object v0, p0, Lcom/opera/android/backup/OperaBackupAgent;->a:Lt28;

    return-void
.end method

.method public final onFullBackup(Landroid/app/backup/FullBackupDataOutput;)V
    .registers 9

    invoke-super {p0, p1}, Landroid/app/backup/BackupAgent;->onFullBackup(Landroid/app/backup/FullBackupDataOutput;)V

    iget-object v0, p0, Lcom/opera/android/backup/OperaBackupAgent;->a:Lt28;

    iget-object v1, v0, Lt28;->a:Landroid/content/Context;

    const-string v2, "enc_bkgmgr"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    sget-object v4, Li0i;->a:Lnx1;

    const-string v4, "k2"

    const/4 v5, 0x0

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_35

    :try_start_19
    invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    sget-object v4, Li0i;->a:Lnx1;

    invoke-virtual {v4, v1}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc36;

    invoke-virtual {v1, v2}, Lc36;->b([B)[B

    move-result-object v1

    if-eqz v1, :cond_35

    sget-object v2, Lo36;->a:[I

    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "AES"

    invoke-direct {v2, v1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
    :try_end_34
    .catch Ljava/lang/IllegalArgumentException; {:try_start_19 .. :try_end_34} :catch_35

    goto :goto_36

    :catch_35
    :cond_35
    move-object v2, v5

    :goto_36
    if-eqz v2, :cond_91

    :try_start_38
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v4, "getData"

    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, p1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_46
    .catch Ljava/lang/IllegalAccessException; {:try_start_38 .. :try_end_46} :catch_49
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_38 .. :try_end_46} :catch_49
    .catch Ljava/lang/NoSuchMethodException; {:try_start_38 .. :try_end_46} :catch_49
    .catch Ljava/lang/SecurityException; {:try_start_38 .. :try_end_46} :catch_49

    if-nez v1, :cond_49

    const/4 v3, 0x1

    :catch_49
    :cond_49
    new-instance v1, Ljava/io/File;

    iget-object v4, v0, Lt28;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    const-string v6, ".prot.tmp"

    invoke-direct {v1, v4, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    if-nez v3, :cond_65

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_65

    invoke-virtual {p0, v1, p1}, Landroid/app/backup/BackupAgent;->fullBackupFile(Ljava/io/File;Landroid/app/backup/FullBackupDataOutput;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_91

    :cond_65
    :try_start_65
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_6a} :catch_8e
    .catchall {:try_start_65 .. :try_end_6a} :catchall_89

    :try_start_6a
    invoke-static {v4, v2}, Lo36;->b(Ljava/io/FileOutputStream;Ljavax/crypto/spec/SecretKeySpec;)Ljavax/crypto/CipherOutputStream;

    move-result-object v2
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_6a .. :try_end_6e} :catch_87
    .catchall {:try_start_6a .. :try_end_6e} :catchall_84

    :try_start_6e
    iget-object v4, v0, Lt28;->b:Lumi;

    invoke-virtual {v0, v2, v4}, Lt28;->a(Ljavax/crypto/CipherOutputStream;Lumi;)V

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_76
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_76} :catch_82
    .catchall {:try_start_6e .. :try_end_76} :catchall_7f

    :try_start_76
    invoke-virtual {p0, v1, p1}, Landroid/app/backup/BackupAgent;->fullBackupFile(Ljava/io/File;Landroid/app/backup/FullBackupDataOutput;)V

    if-nez v3, :cond_91

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_7e
    .catch Ljava/io/IOException; {:try_start_76 .. :try_end_7e} :catch_8e
    .catchall {:try_start_76 .. :try_end_7e} :catchall_89

    goto :goto_91

    :catchall_7f
    move-exception p0

    move-object v5, v2

    goto :goto_8a

    :catch_82
    move-object v5, v2

    goto :goto_8e

    :catchall_84
    move-exception p0

    move-object v5, v4

    goto :goto_8a

    :catch_87
    move-object v5, v4

    goto :goto_8e

    :catchall_89
    move-exception p0

    :goto_8a
    invoke-static {v5}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_8e
    :goto_8e
    invoke-static {v5}, Lxvg;->l(Ljava/io/Closeable;)V

    :cond_91
    :goto_91
    return-void
.end method

.method public final onRestore(Landroid/app/backup/BackupDataInput;ILandroid/os/ParcelFileDescriptor;)V
    .registers 4

    return-void
.end method

.method public final onRestoreFile(Landroid/os/ParcelFileDescriptor;JLjava/io/File;IJJ)V
    .registers 10

    invoke-super/range {p0 .. p9}, Landroid/app/backup/BackupAgent;->onRestoreFile(Landroid/os/ParcelFileDescriptor;JLjava/io/File;IJJ)V

    iget-object p0, p0, Lcom/opera/android/backup/OperaBackupAgent;->a:Lt28;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lt28;->a:Landroid/content/Context;

    :try_start_a
    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p2

    const-string p3, ".prot.tmp"

    invoke-direct {p1, p2, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p4}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string p2, ".prot.pending.tmp"

    invoke-direct {p1, p0, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_31} :catch_31

    :catch_31
    :cond_31
    return-void
.end method

.method public final onRestoreFinished()V
    .registers 6

    const-string v0, "onboarding_after_restore"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "need"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v2, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v4, "crypto.wallet.has_wallet"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v4, "crypto.wallet.new_wallet_migration"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v4, "crypto.wallet.has_new_wallet"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v4, "crypto.wallet.new_wallet_reset"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v4, "onboarding.id"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v4, "vpn_pro.kill_switch.on"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v4, "internal.override_ab_group"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    invoke-static {p0}, Loup;->Z(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "channels_version_key"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "persistent.installTime"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v0, "opera"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    new-instance v2, Lc37;

    const-string v4, "prefs.json"

    invoke-direct {v2, v4, v3}, Lc37;-><init>(Ljava/lang/String;B)V

    const-string v4, "opera.oauth2.last_device_name"

    invoke-virtual {v2, v4}, Lc37;->z(Ljava/lang/String;)V

    const-string v4, "opera.oauth2.session"

    invoke-virtual {v2, v4}, Lc37;->z(Ljava/lang/String;)V

    const-string v4, "opera.oauth2.last_session_info"

    invoke-virtual {v2, v4}, Lc37;->z(Ljava/lang/String;)V

    const-string v4, "opera.oauth2.sandbox.aria.session"

    invoke-virtual {v2, v4}, Lc37;->z(Ljava/lang/String;)V

    const-string v4, "opera.oauth2.sandbox.aria.last_session_info"

    invoke-virtual {v2, v4}, Lc37;->z(Ljava/lang/String;)V

    const-string v4, "sync"

    invoke-virtual {v2, v4}, Lc37;->z(Ljava/lang/String;)V

    const-string v4, "opera.account_push.device_ids"

    invoke-virtual {v2, v4}, Lc37;->z(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lc37;->c(Ljava/io/File;)V

    new-instance v0, Lc37;

    const-string v2, "favorites.json"

    invoke-direct {v0, v2, v3}, Lc37;-><init>(Ljava/lang/String;B)V

    iget-object v2, v0, Lc37;->a:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v4, "app_restored_from_backup"

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v0, v2}, Lc37;->c(Ljava/io/File;)V

    sget-object v0, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v0, "user_settings"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "downloads_location"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "offline_pages_location"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v0, "appboy-manager"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "huid"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "user_id"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "ab_group"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "last_launch"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "ad_set"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v0, "pushed-content-versions"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "version"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
