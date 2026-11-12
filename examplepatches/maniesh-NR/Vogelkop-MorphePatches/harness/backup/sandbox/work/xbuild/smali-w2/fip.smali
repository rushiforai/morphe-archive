.class public abstract Lfip;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashMap;

.field public static final b:Ljava/util/ArrayList;

.field public static final c:Lomj;

.field public static final d:Ljava/util/ArrayList;

.field public static e:I

.field public static f:Z

.field public static g:I

.field public static final h:Lkoj;

.field public static final i:Ljava/util/EnumMap;

.field public static final j:Lng2;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lfip;->a:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lfip;->b:Ljava/util/ArrayList;

    new-instance v0, Lomj;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lomj;-><init>(B)V

    sput-object v0, Lfip;->c:Lomj;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lfip;->d:Ljava/util/ArrayList;

    new-instance v0, Lkoj;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lkoj;-><init>(B)V

    sput-object v0, Lfip;->h:Lkoj;

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lvhp;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lfip;->i:Ljava/util/EnumMap;

    new-instance v0, Lng2;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lng2;-><init>(B)V

    sget-object v1, Lphf;->a:Lx79;

    iget-object v1, v1, Lx79;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    if-eqz v1, :cond_5e

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    if-eqz v1, :cond_5e

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_5e

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_5e

    const/4 v1, 0x4

    :goto_5b
    iput-byte v1, v0, Lng2;->b:B

    goto :goto_60

    :cond_5e
    const/4 v1, 0x2

    goto :goto_5b

    :goto_60
    sput-object v0, Lfip;->j:Lng2;

    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;IILvhp;Lzhp;)V
    .registers 8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_b

    invoke-interface {p5, v1}, Lzhp;->a(I)V

    return-void

    :cond_b
    new-instance v0, Lwhp;

    invoke-direct {v0, p1, p2, p3, p4}, Lwhp;-><init>(Ljava/lang/String;IILvhp;)V

    sget-object p1, Llep;->a:Lz4k;

    invoke-virtual {p1, v0}, Lz4k;->c(Lwhp;)Lxhp;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lgxo;->c:Lgxo;

    sget-object p1, Lfip;->a:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Laip;

    if-eqz p2, :cond_3b

    iget-object p0, p2, Laip;->c:Lwhp;

    iget-object p1, p2, Laip;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    sget-object p1, Lfip;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4e

    invoke-static {p0}, Lfip;->d(Lwhp;)V

    goto :goto_4e

    :cond_3b
    new-instance p2, Laip;

    invoke-direct {p2, p0, v0}, Laip;-><init>(Landroid/content/Context;Lwhp;)V

    iget-object p0, p2, Laip;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lfip;->d(Lwhp;)V

    :cond_4e
    :goto_4e
    return-void
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;Lzhp;)V
    .registers 10

    sget v0, Lfip;->g:I

    if-nez v0, :cond_25

    sget-object v0, Lsjo;->a:Ljava/util/List;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    float-to-int v1, v1

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    filled-new-array {v1, v2, v0}, [I

    move-result-object v0

    const/4 v1, 0x1

    aget v1, v0, v1

    const/4 v2, 0x2

    aget v0, v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    sput v0, Lfip;->g:I

    :cond_25
    move v3, v0

    sget-object v5, Lvhp;->b:Lvhp;

    move v4, v3

    move-object v1, p0

    move-object v2, p1

    move-object v6, p2

    invoke-static/range {v1 .. v6}, Lfip;->a(Landroid/content/Context;Ljava/lang/String;IILvhp;Lzhp;)V

    return-void
.end method

.method public static c(Lvhp;)Lz9p;
    .registers 6

    sget-object v0, Lfip;->i:Ljava/util/EnumMap;

    monitor-enter v0

    :try_start_3
    invoke-virtual {v0, p0}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz9p;

    if-nez v1, :cond_40

    invoke-virtual {v0, p0}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_14

    monitor-exit v0

    return-object v3

    :cond_14
    sget-object v2, Lgxo;->c:Lgxo;

    const/4 v2, 0x1

    invoke-static {v2}, Lsjo;->b(I)Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_21

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_44

    :cond_21
    if-eqz v3, :cond_3b

    :try_start_23
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lvhp;->a:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_33

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    :cond_33
    invoke-static {v2}, Lz9p;->l(Ljava/io/File;)Lz9p;

    move-result-object v1
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_37} :catch_38
    .catchall {:try_start_23 .. :try_end_37} :catchall_44

    goto :goto_3b

    :catch_38
    :try_start_38
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_3b
    :goto_3b
    sget-object v2, Lfip;->i:Ljava/util/EnumMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_40
    monitor-exit v0

    return-object v1

    :goto_42
    monitor-exit v0
    :try_end_43
    .catchall {:try_start_38 .. :try_end_43} :catchall_44

    throw p0

    :catchall_44
    move-exception p0

    goto :goto_42
.end method

.method public static d(Lwhp;)V
    .registers 4

    iget-object v0, p0, Lwhp;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/webkit/URLUtil;->isHttpUrl(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_14

    invoke-static {v0}, Landroid/webkit/URLUtil;->isHttpsUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lfip;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_14
    sget-object v0, Lfip;->a:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Laip;

    if-eqz p0, :cond_24

    sget-object v0, Lgxo;->c:Lgxo;

    iget-object v0, p0, Laip;->f:Liy8;

    if-eqz v0, :cond_25

    :cond_24
    return-void

    :cond_25
    new-instance v0, Liy8;

    invoke-direct {v0, p0}, Liy8;-><init>(Laip;)V

    iput-object v0, p0, Laip;->f:Liy8;

    invoke-virtual {p0}, Laip;->e()V

    :try_start_2f
    iget-object v0, p0, Laip;->f:Liy8;

    sget-object v1, Lgxo;->c:Lgxo;

    iget-object v1, v1, Lgxo;->a:Ljava/util/concurrent/ExecutorService;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_3b} :catch_3c

    return-void

    :catch_3c
    const/16 v0, 0xb

    iput v0, p0, Laip;->e:I

    invoke-virtual {p0}, Laip;->g()V

    return-void
.end method

.method public static e()V
    .registers 10

    sget-object v0, Lfip;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    sget-object v1, Lfip;->j:Lng2;

    iget-byte v2, v1, Lng2;->b:B

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_28

    sget v2, Lfip;->e:I

    iget-byte v3, v1, Lng2;->b:B

    if-ge v2, v3, :cond_28

    sget-object v2, Lfip;->c:Lomj;

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v2, 0x0

    move v3, v2

    :cond_1c
    :goto_1c
    sget v4, Lfip;->e:I

    iget-byte v5, v1, Lng2;->b:B

    if-ge v4, v5, :cond_28

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v3, v4, :cond_29

    :cond_28
    return-void

    :cond_29
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lwhp;

    add-int/lit8 v3, v3, 0x1

    sget-object v5, Lfip;->a:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Laip;

    if-eqz v5, :cond_1c

    iget-object v4, v4, Lwhp;->b:Ljava/lang/String;

    sget v4, Lfip;->e:I

    const/4 v6, 0x1

    add-int/2addr v4, v6

    sput v4, Lfip;->e:I

    sget-object v4, Lgxo;->c:Lgxo;

    iget-object v4, v5, Laip;->g:Lyhp;

    if-nez v4, :cond_1c

    new-instance v4, Lyhp;

    invoke-direct {v4, v5}, Lyhp;-><init>(Laip;)V

    iput-object v4, v5, Laip;->g:Lyhp;

    invoke-virtual {v5}, Laip;->e()V

    iget-object v4, v5, Laip;->g:Lyhp;

    sget-object v5, Ldpj;->c:Ldpj;

    if-nez v5, :cond_65

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Ldpj;

    const/16 v7, 0xb

    invoke-direct {v5, v7}, Ldpj;-><init>(B)V

    sput-object v5, Ldpj;->c:Ldpj;

    :cond_65
    iget-object v5, v4, Lyhp;->a:Laip;

    iget-object v5, v5, Laip;->c:Lwhp;

    iget-object v5, v5, Lwhp;->b:Ljava/lang/String;

    new-instance v7, Lrii;

    const/16 v8, 0x1c

    invoke-direct {v7, v4, v8}, Lrii;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Liro;

    invoke-direct {v4, v5, v7}, Liro;-><init>(Ljava/lang/String;Lrii;)V

    sget-object v5, Lev4;->g:Lev4;

    if-nez v5, :cond_84

    new-instance v5, Lev4;

    const/16 v7, 0x8

    invoke-direct {v5, v7}, Lev4;-><init>(B)V

    sput-object v5, Lev4;->g:Lev4;

    :cond_84
    iget-object v7, v5, Lev4;->e:Ljava/lang/Object;

    check-cast v7, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-virtual {v7, v4}, Ljava/util/concurrent/LinkedBlockingDeque;->push(Ljava/lang/Object;)V

    iget-boolean v4, v5, Lev4;->c:Z

    if-eqz v4, :cond_1c

    :goto_8f
    invoke-virtual {v7}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_aa

    invoke-virtual {v7}, Ljava/util/concurrent/LinkedBlockingDeque;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Liro;

    new-instance v8, Lttn;

    const/16 v9, 0xd

    invoke-direct {v8, v4, v9}, Lttn;-><init>(Ljava/lang/Object;B)V

    sget-object v4, Lgxo;->c:Lgxo;

    invoke-virtual {v4, v8}, Lgxo;->b(Ljava/lang/Runnable;)V

    iput-boolean v2, v5, Lev4;->c:Z

    goto :goto_8f

    :cond_aa
    iput-boolean v6, v5, Lev4;->c:Z

    goto/16 :goto_1c
.end method
