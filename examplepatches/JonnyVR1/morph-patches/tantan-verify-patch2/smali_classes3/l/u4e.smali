.class public Ll/u4e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/byd0;

.field public final b:Ll/byd0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "disk_nearly_full_dialog_time"

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/u4e;->a:Ll/byd0;

    .line 18
    .line 19
    new-instance v0, Ll/byd0;

    .line 20
    .line 21
    const-string v2, "disk_Full_Disk_Toast_Time"

    .line 22
    .line 23
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/u4e;->b:Ll/byd0;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/common/R$string;->w:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 19
    .line 20
    sget v2, Lcom/p1/mobile/putong/common/R$string;->v:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget v2, Lcom/p1/mobile/putong/common/R$string;->u:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/th0;->g()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    :catch_0
    return-void
.end method

.method public static synthetic b(Ll/u4e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u4e;->h()V

    return-void
.end method

.method public static synthetic c(Landroid/content/Context;)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/common/R$string;->t:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 19
    .line 20
    sget v2, Lcom/p1/mobile/putong/common/R$string;->s:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget v2, Lcom/p1/mobile/putong/common/R$string;->r:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {p0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance v1, Ll/s4e;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/s4e;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/th0;->g()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    :catch_0
    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/yx0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/u4e;->f()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0xc8

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    return v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return v0
.end method

.method public static f()J
    .locals 5

    .line 1
    new-instance v0, Landroid/os/StatFs;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSizeLong()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    mul-long/2addr v1, v3

    .line 23
    const-wide/16 v3, 0x400

    .line 24
    .line 25
    div-long/2addr v1, v3

    .line 26
    div-long/2addr v1, v3

    .line 27
    return-wide v1
.end method

.method public static g()J
    .locals 7

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    :try_start_0
    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 4
    .line 5
    const-string v3, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 6
    .line 7
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    new-instance v2, Landroid/os/StatFs;

    .line 28
    .line 29
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-direct {v2, v3}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockSizeLong()J

    .line 45
    .line 46
    .line 47
    move-result-wide v5

    .line 48
    mul-long/2addr v3, v5

    .line 49
    const-wide/16 v5, 0x400

    .line 50
    .line 51
    div-long/2addr v3, v5

    .line 52
    div-long/2addr v3, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    return-wide v3

    .line 54
    :catch_0
    move-exception v2

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    return-wide v0

    .line 57
    :goto_0
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-wide v0
.end method


# virtual methods
.method public final synthetic h()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->n()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/u4e;->b:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/u4e;->b:Ll/byd0;

    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->n()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 35
    .line 36
    sget v0, Lcom/p1/mobile/putong/common/R$string;->s:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Ll/o1j0;->u(Ljava/lang/String;)Landroid/widget/Toast;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 47
    .line 48
    .line 49
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 50
    .line 51
    new-instance v0, Ll/t4e;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/t4e;-><init>()V

    .line 54
    .line 55
    .line 56
    const-wide/16 v1, 0xbb8

    .line 57
    .line 58
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public i(Landroid/content/Context;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Ll/q4e;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/q4e;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j(Landroid/content/Context;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->n()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/u4e;->a:Ll/byd0;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ljava/lang/Long;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-gtz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p0, p0, Ll/u4e;->a:Ll/byd0;

    .line 25
    .line 26
    invoke-static {}, Ll/pzi0;->n()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    new-instance p0, Ll/p4e;

    .line 38
    .line 39
    invoke-direct {p0, p1}, Ll/p4e;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    new-instance v0, Ll/r4e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r4e;-><init>(Ll/u4e;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
