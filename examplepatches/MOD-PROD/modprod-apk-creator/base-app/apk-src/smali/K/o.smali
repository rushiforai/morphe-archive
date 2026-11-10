.class public abstract LK/o;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lm/h;

.field public static final b:Ljava/lang/Object;

.field public static c:LF/d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lm/h;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, LK/o;->a:Lm/h;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, LK/o;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    sput-object v0, LK/o;->c:LF/d;

    return-void
.end method

.method public static a(Landroid/content/Context;)J
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_0

    invoke-static {v0, p0}, LK/m;->a(Landroid/content/pm/PackageManager;Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    return-wide v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    return-wide v0
.end method

.method public static b()LF/d;
    .locals 4

    new-instance v0, LF/d;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, LF/d;-><init>(I)V

    sput-object v0, LK/o;->c:LF/d;

    sget-object v1, LK/o;->a:Lm/h;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lm/g;->f:LD/g;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, v0}, LD/g;->b(Lm/g;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {v1}, Lm/g;->b(Lm/g;)V

    :cond_0
    sget-object v0, LK/o;->c:LF/d;

    return-object v0
.end method

.method public static c(Landroid/content/Context;Z)V
    .locals 18

    if-nez p1, :cond_0

    sget-object v0, LK/o;->c:LF/d;

    if-eqz v0, :cond_0

    goto/16 :goto_5

    :cond_0
    sget-object v1, LK/o;->b:Ljava/lang/Object;

    monitor-enter v1

    if-nez p1, :cond_1

    :try_start_0
    sget-object v0, LK/o;->c:LF/d;

    if-eqz v0, :cond_1

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    goto/16 :goto_7

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v0, v2, :cond_e

    const/16 v2, 0x1e

    if-ne v0, v2, :cond_2

    goto/16 :goto_6

    :cond_2
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    const-string v3, "/data/misc/profiles/ref/"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "primary.prof"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x1

    if-eqz v0, :cond_3

    cmp-long v0, v2, v5

    if-lez v0, :cond_3

    move v0, v7

    goto :goto_0

    :cond_3
    move v0, v4

    :goto_0
    new-instance v8, Ljava/io/File;

    new-instance v9, Ljava/io/File;

    const-string v10, "/data/misc/profiles/cur/0/"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "primary.prof"

    invoke-direct {v8, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v16

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v8, :cond_4

    cmp-long v5, v16, v5

    if-lez v5, :cond_4

    move v5, v7

    goto :goto_1

    :cond_4
    move v5, v4

    :goto_1
    :try_start_1
    invoke-static/range {p0 .. p0}, LK/o;->a(Landroid/content/Context;)J

    move-result-wide v14
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    new-instance v6, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v8

    const-string v9, "profileInstalled"

    invoke-direct {v6, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v8, :cond_5

    :try_start_3
    invoke-static {v6}, LK/n;->a(Ljava/io/File;)LK/n;

    move-result-object v8
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :catch_0
    :try_start_4
    invoke-static {}, LK/o;->b()LF/d;

    monitor-exit v1

    goto :goto_5

    :cond_5
    const/4 v8, 0x0

    :goto_2
    const/4 v9, 0x2

    if-eqz v8, :cond_7

    iget-wide v10, v8, LK/n;->c:J

    cmp-long v10, v10, v14

    if-nez v10, :cond_7

    iget v10, v8, LK/n;->b:I

    if-ne v10, v9, :cond_6

    goto :goto_3

    :cond_6
    move v4, v10

    goto :goto_4

    :cond_7
    :goto_3
    if-eqz v0, :cond_8

    move v4, v7

    goto :goto_4

    :cond_8
    if-eqz v5, :cond_9

    move v4, v9

    :cond_9
    :goto_4
    if-eqz p1, :cond_a

    if-eqz v5, :cond_a

    if-eq v4, v7, :cond_a

    move v4, v9

    :cond_a
    if-eqz v8, :cond_b

    iget v0, v8, LK/n;->b:I

    if-ne v0, v9, :cond_b

    if-ne v4, v7, :cond_b

    iget-wide v9, v8, LK/n;->d:J

    cmp-long v0, v2, v9

    if-gez v0, :cond_b

    const/4 v4, 0x3

    :cond_b
    move v13, v4

    new-instance v11, LK/n;

    const/4 v12, 0x1

    invoke-direct/range {v11 .. v17}, LK/n;-><init>(IIJJ)V

    if-eqz v8, :cond_c

    invoke-virtual {v8, v11}, LK/n;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-nez v0, :cond_d

    :cond_c
    :try_start_5
    invoke-virtual {v11, v6}, LK/n;->b(Ljava/io/File;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catch_1
    :cond_d
    :try_start_6
    invoke-static {}, LK/o;->b()LF/d;

    monitor-exit v1

    goto :goto_5

    :catch_2
    invoke-static {}, LK/o;->b()LF/d;

    monitor-exit v1

    :goto_5
    return-void

    :cond_e
    :goto_6
    invoke-static {}, LK/o;->b()LF/d;

    monitor-exit v1

    return-void

    :goto_7
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v0
.end method
