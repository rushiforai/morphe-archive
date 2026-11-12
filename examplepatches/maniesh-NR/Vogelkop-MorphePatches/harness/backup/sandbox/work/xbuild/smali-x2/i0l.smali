.class public abstract Li0l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:J

.field public static final b:Lnx1;

.field public static final c:Lnx1;

.field public static final d:Ljava/lang/Object;

.field public static final e:Lii;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnx1;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Li0l;->b:Lnx1;

    new-instance v0, Lnx1;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Li0l;->c:Lnx1;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Li0l;->d:Ljava/lang/Object;

    new-instance v0, Lii;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Li0l;->e:Lii;

    return-void
.end method

.method public static a(Landroid/content/Context;)J
    .registers 5

    sget-wide v0, Li0l;->a:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1a

    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    invoke-virtual {p0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result p0

    int-to-long v0, p0

    const/16 p0, 0x14

    shl-long/2addr v0, p0

    sput-wide v0, Li0l;->a:J

    :cond_1a
    return-wide v0
.end method

.method public static b(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    sget-object v0, Li0l;->b:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbu6;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lbu6;->a(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static c(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    sget-object v0, Li0l;->b:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbu6;

    iget-byte v0, v0, Lbu6;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_66

    invoke-static {p0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    iget-object v0, v0, Ls6e;->b:Lvq8;

    iget-object v0, v0, Lvq8;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_35

    :pswitch_1d
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_34

    :try_start_27
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_34

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2
    :try_end_31
    .catch Ljava/lang/RuntimeException; {:try_start_27 .. :try_end_31} :catch_34

    const/4 v3, 0x2

    if-eq v2, v3, :cond_35

    :catch_34
    :cond_34
    move-object v0, v1

    :cond_35
    :goto_35
    const-string v2, "sys_utils"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    sget-object v2, Li0l;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3f
    const-string v3, "sysutil.sim_country"

    invoke-interface {p0, v3, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_60

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_60

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "sysutil.sim_country"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v2

    return-object v0

    :cond_60
    monitor-exit v2

    return-object v1

    :goto_62
    monitor-exit v2
    :try_end_63
    .catchall {:try_start_3f .. :try_end_63} :catchall_64

    throw p0

    :catchall_64
    move-exception p0

    goto :goto_62

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method

.method public static d(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    sget-object v0, Li0l;->b:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbu6;

    iget-byte v0, v0, Lbu6;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_68

    invoke-static {p0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    iget-object v0, v0, Ls6e;->b:Lvq8;

    iget-object v0, v0, Lvq8;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_36

    :pswitch_19
    :try_start_19
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_34

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_34

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0
    :try_end_33
    .catchall {:try_start_19 .. :try_end_33} :catchall_34

    goto :goto_36

    :catchall_34
    :cond_34
    const-string v0, ""

    :goto_36
    const-string v2, "sys_utils"

    invoke-virtual {p0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    sget-object v1, Li0l;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3f
    const-string v2, "sysutil.mcc"

    const-string v3, ""

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_62

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_62

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v2, "sysutil.mcc"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v1

    return-object v0

    :cond_62
    monitor-exit v1

    return-object v2

    :goto_64
    monitor-exit v1
    :try_end_65
    .catchall {:try_start_3f .. :try_end_65} :catchall_66

    throw p0

    :catchall_66
    move-exception p0

    goto :goto_64

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method

.method public static e(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    sget-object v0, Li0l;->b:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbu6;

    iget-byte v0, v0, Lbu6;->a:B

    packed-switch v0, :pswitch_data_68

    invoke-static {p0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    iget-object v0, v0, Ls6e;->b:Lvq8;

    iget-object v0, v0, Lvq8;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_35

    :pswitch_18
    :try_start_18
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_33

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0
    :try_end_32
    .catchall {:try_start_18 .. :try_end_32} :catchall_33

    goto :goto_35

    :catchall_33
    :cond_33
    const-string v0, ""

    :goto_35
    const-string v1, "sys_utils"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    sget-object v1, Li0l;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3f
    const-string v2, "sysutil.mnc"

    const-string v3, ""

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_62

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_62

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v2, "sysutil.mnc"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v1

    return-object v0

    :cond_62
    monitor-exit v1

    return-object v2

    :goto_64
    monitor-exit v1
    :try_end_65
    .catchall {:try_start_3f .. :try_end_65} :catchall_66

    throw p0

    :catchall_66
    move-exception p0

    goto :goto_64

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public static f(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/lang/ProcessBuilder;

    const-string v2, "/system/bin/getprop"

    filled-new-array {v2, p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object p0
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_14} :catch_44
    .catchall {:try_start_1 .. :try_end_14} :catchall_3c

    :try_start_14
    invoke-static {p0}, Lxvg;->z(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Laik;->a:[Ljava/lang/String;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_36

    if-lez v2, :cond_31

    add-int/lit8 v3, v2, -0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0xd

    if-ne v3, v4, :cond_31

    add-int/lit8 v2, v2, -0x1

    :cond_31
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_36} :catch_45
    .catchall {:try_start_14 .. :try_end_36} :catchall_3a

    :cond_36
    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v1

    :catchall_3a
    move-exception v0

    goto :goto_40

    :catchall_3c
    move-exception p0

    move-object v5, v0

    move-object v0, p0

    move-object p0, v5

    :goto_40
    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :catch_44
    move-object p0, v0

    :catch_45
    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v0
.end method

.method public static g()Z
    .registers 1

    sget-object v0, Li0l;->e:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static h(Landroid/content/Context;)Lcom/opera/android/Lazy;
    .registers 2

    sget-object v0, Li0l;->c:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/Lazy;

    return-object p0
.end method
