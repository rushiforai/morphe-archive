.class public abstract Lf51;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/Set;

.field public static final b:Ljava/util/Set;

.field public static final c:Ljava/util/Set;

.field public static final d:Ljava/util/Set;

.field public static final e:Ljava/util/Set;

.field public static final f:Lkotlin/text/Regex;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    const-string v0, "/dev/socket/baseband_genyd"

    const-string v1, "/dev/com.genymotion.superuser.daemon"

    const-string v2, "/dev/socket/qemud"

    const-string v3, "/dev/qemu_pipe"

    const-string v4, "/dev/socket/genyd"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lf51;->a:Ljava/util/Set;

    const-string v0, "magisk"

    const-string v1, "su"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lf51;->b:Ljava/util/Set;

    const-string v13, "/system/usr/we-need-root"

    const-string v14, "/system/xbin"

    const-string v1, "/cache"

    const-string v2, "/data"

    const-string v3, "/data/local"

    const-string v4, "/data/local/bin"

    const-string v5, "/data/local/xbin"

    const-string v6, "/dev"

    const-string v7, "/sbin"

    const-string v8, "/su/bin"

    const-string v9, "/system/bin"

    const-string v10, "/system/bin/.ext"

    const-string v11, "/system/bin/failsafe"

    const-string v12, "/system/sd/xbin"

    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lf51;->c:Ljava/util/Set;

    const-string v6, "/system/xbin"

    const-string v7, "/vendor/bin"

    const-string v1, "/etc"

    const-string v2, "/sbin"

    const-string v3, "/system"

    const-string v4, "/system/bin"

    const-string v5, "/system/sbin"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lf51;->d:Ljava/util/Set;

    const-string v11, "com.zhiqupk.root.global"

    const-string v12, "eu.chainfire.supersu"

    const-string v1, "com.alephzain.framaroot"

    const-string v2, "com.kingo.root"

    const-string v3, "com.kingroot.kinguser"

    const-string v4, "com.koushikdutta.superuser"

    const-string v5, "com.noshufou.android.su"

    const-string v6, "com.noshufou.android.su.elite"

    const-string v7, "com.smedialink.oneclickroot"

    const-string v8, "com.thirdparty.superuser"

    const-string v9, "com.topjohnwu.magisk"

    const-string v10, "com.yellowes.su"

    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lf51;->e:Ljava/util/Set;

    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "\\[([^]]+)]: \\[([^]]*)]"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Lf51;->f:Lkotlin/text/Regex;

    return-void
.end method

.method public static final a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Z
    .registers 6

    const/4 v0, 0x0

    :try_start_1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object p0
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_9} :catch_4d

    if-eqz p0, :cond_4d

    :try_start_b
    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_44

    sget-object v2, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    new-instance v1, Ljava/io/BufferedReader;

    const/16 v2, 0x2000

    invoke-direct {v1, v3, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_1f
    .catchall {:try_start_b .. :try_end_1f} :catchall_48

    :cond_1f
    :try_start_1f
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_39

    invoke-interface {p1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2
    :try_end_2f
    .catchall {:try_start_1f .. :try_end_2f} :catchall_3d

    if-eqz v2, :cond_1f

    :try_start_31
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_34
    .catchall {:try_start_31 .. :try_end_34} :catchall_48

    const/4 p1, 0x1

    :try_start_35
    invoke-virtual {p0}, Ljava/lang/Process;->destroy()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_4d

    return p1

    :cond_39
    :try_start_39
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_3c
    .catchall {:try_start_39 .. :try_end_3c} :catchall_48

    goto :goto_44

    :catchall_3d
    move-exception p1

    :try_start_3e
    throw p1
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_3f

    :catchall_3f
    move-exception v2

    :try_start_40
    invoke-static {v1, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v2
    :try_end_44
    .catchall {:try_start_40 .. :try_end_44} :catchall_48

    :cond_44
    :goto_44
    :try_start_44
    invoke-virtual {p0}, Ljava/lang/Process;->destroy()V

    return v0

    :catchall_48
    move-exception p1

    invoke-virtual {p0}, Ljava/lang/Process;->destroy()V

    throw p1
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_4d} :catch_4d

    :catch_4d
    :cond_4d
    return v0
.end method

.method public static final b(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_17

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageManager;->getInstallSourceInfo(Ljava/lang/String;)Landroid/content/pm/InstallSourceInfo;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_17
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
