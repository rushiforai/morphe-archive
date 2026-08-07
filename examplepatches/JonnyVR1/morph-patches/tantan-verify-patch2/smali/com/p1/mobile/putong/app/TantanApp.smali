.class public Lcom/p1/mobile/putong/app/TantanApp;
.super Landroid/app/Application;
.source "SourceFile"


# static fields
.field public static b:Ll/uqb0;

.field public static c:Ll/cmb0;

.field public static final d:Ll/kxd0;

.field public static final e:Ll/gxd0;

.field public static f:J

.field public static g:Z

.field public static h:J

.field public static i:Ll/m9i0;

.field public static j:Ll/jxd0;

.field public static k:Z

.field public static l:Ljava/lang/Boolean;

.field public static m:J


# instance fields
.field public volatile a:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/kxd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    const-string v2, "putongUserMeSaved"

    .line 6
    .line 7
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Ll/kxd0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/app/TantanApp;->d:Ll/kxd0;

    .line 13
    .line 14
    new-instance v0, Ll/gxd0;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    const-string v3, "putongPref"

    .line 20
    .line 21
    const-string v4, "putongAuthdata"

    .line 22
    .line 23
    invoke-direct {v0, v1, v4, v2, v3}, Ll/gxd0;-><init>(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 27
    .line 28
    new-instance v0, Ll/jxd0;

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v3, "first_cold_launch_time_record_"

    .line 35
    .line 36
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget-object v3, Ll/uqb0;->s:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-direct {v0, v1, v2, v3}, Ll/jxd0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/p1/mobile/putong/app/TantanApp;->j:Ll/jxd0;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    sput-boolean v0, Lcom/p1/mobile/putong/app/TantanApp;->k:Z

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    sput-object v0, Lcom/p1/mobile/putong/app/TantanApp;->l:Ljava/lang/Boolean;

    .line 60
    .line 61
    const-wide/16 v0, 0x0

    .line 62
    .line 63
    sput-wide v0, Lcom/p1/mobile/putong/app/TantanApp;->m:J

    .line 64
    .line 65
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    throw p0
.end method


# virtual methods
.method public attachBaseContext(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->attachBaseContext(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->initialize(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    sput-wide v0, Lcom/p1/mobile/putong/app/TantanApp;->f:J

    .line 9
    .line 10
    invoke-static {p1}, Ll/tr10;->k(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget p0, p0, Landroid/content/res/Configuration;->mcc:I

    .line 22
    .line 23
    sput p0, Ll/uqb0;->f0:I

    .line 24
    .line 25
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/app/TantanApp$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/app/TantanApp$b;-><init>(Lcom/p1/mobile/putong/app/TantanApp;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/r1j0;->h(Ll/r1j0$c;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/oup0;->e(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/yxi0;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/yxi0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ll/yxi0;->e()V

    .line 18
    .line 19
    .line 20
    sget-boolean v0, Lcom/p1/mobile/android/app/App;->f:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Ll/de00;->n()Ll/de00;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/de00;->o(Landroid/app/Application;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    new-instance v0, Ll/m9i0;

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ll/m9i0;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/p1/mobile/putong/app/TantanApp;->i:Ll/m9i0;

    .line 42
    .line 43
    invoke-static {}, Ll/ls4;->c()V

    .line 44
    .line 45
    .line 46
    :try_start_0
    invoke-static {p0}, Ll/yup0;->b(Landroid/app/Application;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    new-instance p0, Ll/uqb0;

    .line 55
    .line 56
    invoke-direct {p0}, Ll/uqb0;-><init>()V

    .line 57
    .line 58
    .line 59
    sput-object p0, Lcom/p1/mobile/putong/app/TantanApp;->b:Ll/uqb0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/uqb0;->m()V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/sdh0;->a()V

    .line 65
    .line 66
    .line 67
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->j:Ll/jxd0;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    sput-boolean p0, Lcom/p1/mobile/putong/app/TantanApp;->g:Z

    .line 80
    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->j:Ll/jxd0;

    .line 84
    .line 85
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 91
    .line 92
    .line 93
    move-result-wide v0

    .line 94
    sput-wide v0, Lcom/p1/mobile/putong/app/TantanApp;->h:J

    .line 95
    .line 96
    return-void
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/app/TantanApp;->a:Landroid/content/res/Resources;

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    monitor-enter p0

    .line 17
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/app/TantanApp;->a:Landroid/content/res/Resources;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/mxw;

    .line 22
    .line 23
    invoke-super {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ll/mxw;-><init>(Landroid/content/res/Resources;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/app/TantanApp;->a:Landroid/content/res/Resources;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :goto_0
    monitor-exit p0

    .line 36
    goto :goto_2

    .line 37
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw v0

    .line 39
    :cond_2
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/app/TantanApp;->a:Landroid/content/res/Resources;

    .line 40
    .line 41
    return-object p0
.end method

.method public onCreate()V
    .locals 4

    .line 1
    const-string v0, "https"

    .line 2
    .line 3
    const-string v1, "tantan_save_value_dir"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    :try_start_0
    invoke-static {v2}, Landroidx/appcompat/app/b;->D(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    :catch_0
    invoke-static {p0}, Ll/b50;->b(Landroid/app/Application;)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 13
    .line 14
    .line 15
    sput-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 16
    .line 17
    invoke-static {}, Ll/l51;->C()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sput-boolean v2, Lcom/p1/mobile/android/app/App;->f:Z

    .line 22
    .line 23
    sget-object v2, Ll/x95;->INSTANCE:Ll/x95;

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ll/x95;->j(Lcom/p1/mobile/putong/app/TantanApp;)V

    .line 26
    .line 27
    .line 28
    sget-boolean v2, Lcom/p1/mobile/android/app/App;->f:Z

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    sput-wide v2, Lcom/p1/mobile/putong/app/TantanApp;->m:J

    .line 37
    .line 38
    invoke-static {}, Ll/g9r;->a()V

    .line 39
    .line 40
    .line 41
    :cond_0
    const/4 v2, 0x0

    .line 42
    :try_start_1
    invoke-static {p0, v2, v2}, Ll/kmk0;->a(Landroid/content/Context;ZZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/tencent/mmkv/MMKV;->getRootDir()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    :try_start_2
    new-instance v2, Ljava/io/File;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-instance v2, Lcom/p1/mobile/putong/app/TantanApp$a;

    .line 73
    .line 74
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/app/TantanApp$a;-><init>(Lcom/p1/mobile/putong/app/TantanApp;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    invoke-static {p0, v1, v2}, Lcom/tencent/mmkv/MMKV;->initialize(Landroid/content/Context;Ljava/lang/String;Lcom/tencent/mmkv/MMKV$LibLoader;)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :catchall_0
    move-exception v1

    .line 82
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :catchall_1
    move-exception v2

    .line 87
    :try_start_3
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lcom/tencent/mmkv/MMKV;->getRootDir()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_1

    .line 99
    .line 100
    :try_start_4
    new-instance v2, Ljava/io/File;

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    new-instance v2, Lcom/p1/mobile/putong/app/TantanApp$a;

    .line 118
    .line 119
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/app/TantanApp$a;-><init>(Lcom/p1/mobile/putong/app/TantanApp;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_1
    :goto_1
    :try_start_5
    invoke-static {}, Ll/rr2;->b()Ll/rr2;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1, p0}, Ll/rr2;->d(Landroid/content/Context;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :catchall_2
    move-exception v1

    .line 132
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 133
    .line 134
    .line 135
    :goto_2
    :try_start_6
    invoke-static {p0}, Ll/ymw;->b(Landroid/content/Context;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 136
    .line 137
    .line 138
    goto :goto_3

    .line 139
    :catchall_3
    move-exception v1

    .line 140
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 141
    .line 142
    .line 143
    :goto_3
    sget-boolean v1, Lcom/p1/mobile/android/app/App;->f:Z

    .line 144
    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    :try_start_7
    invoke-static {p0}, Ll/qu2;->p(Landroid/content/Context;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 148
    .line 149
    .line 150
    goto :goto_4

    .line 151
    :catchall_4
    move-exception v1

    .line 152
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    :goto_4
    new-instance v1, Ll/t9i0;

    .line 156
    .line 157
    invoke-direct {v1}, Ll/t9i0;-><init>()V

    .line 158
    .line 159
    .line 160
    new-instance v2, Ll/u9i0;

    .line 161
    .line 162
    invoke-direct {v2}, Ll/u9i0;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-static {v1, v2}, Lcom/tantanapp/common/utils/CrashHelper;->b(Ll/a30;Ll/a30;)V

    .line 166
    .line 167
    .line 168
    :try_start_8
    invoke-static {}, Ll/rr2;->b()Ll/rr2;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    const-string v2, "sp_protocal"

    .line 173
    .line 174
    invoke-virtual {v1, v2, v0}, Ll/rr2;->c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    invoke-static {}, Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->getInstance()Lcom/google/firebase/crashlytics/FirebaseCrashlytics;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {v1, v0}, Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->setCrashlyticsCollectionEnabled(Z)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 187
    .line 188
    .line 189
    goto :goto_5

    .line 190
    :catchall_5
    move-exception v0

    .line 191
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    :cond_2
    :goto_5
    :try_start_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/TantanApp;->d()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 195
    .line 196
    .line 197
    goto :goto_6

    .line 198
    :catch_1
    move-exception p0

    .line 199
    new-instance v0, Landroid/os/Handler;

    .line 200
    .line 201
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 202
    .line 203
    .line 204
    new-instance v1, Ll/v9i0;

    .line 205
    .line 206
    invoke-direct {v1, p0}, Ll/v9i0;-><init>(Ljava/lang/Exception;)V

    .line 207
    .line 208
    .line 209
    const-wide/16 v2, 0x3e8

    .line 210
    .line 211
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 212
    .line 213
    .line 214
    :goto_6
    return-void

    .line 215
    :catchall_6
    move-exception v0

    .line 216
    invoke-static {}, Lcom/tencent/mmkv/MMKV;->getRootDir()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    if-eqz v2, :cond_3

    .line 225
    .line 226
    :try_start_a
    new-instance v2, Ljava/io/File;

    .line 227
    .line 228
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    new-instance v2, Lcom/p1/mobile/putong/app/TantanApp$a;

    .line 244
    .line 245
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/app/TantanApp$a;-><init>(Lcom/p1/mobile/putong/app/TantanApp;)V

    .line 246
    .line 247
    .line 248
    invoke-static {p0, v1, v2}, Lcom/tencent/mmkv/MMKV;->initialize(Landroid/content/Context;Ljava/lang/String;Lcom/tencent/mmkv/MMKV$LibLoader;)Ljava/lang/String;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    .line 249
    .line 250
    .line 251
    goto :goto_7

    .line 252
    :catchall_7
    move-exception p0

    .line 253
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 254
    .line 255
    .line 256
    :cond_3
    :goto_7
    throw v0
.end method

.method public onLowMemory()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->b:Ll/uqb0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/uqb0;->P0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->b:Ll/uqb0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/uqb0;->Q0(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public unbindService(Landroid/content/ServiceConnection;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    :catchall_0
    return-void
.end method
