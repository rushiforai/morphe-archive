.class public final Ldxk;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lbxk;

.field public final c:Lk6l;

.field public final d:Lzwk;

.field public final e:Ldb;

.field public final f:Li3j;

.field public final g:Lx5f;

.field public final h:Lumi;

.field public i:Z

.field public j:Ljava/util/List;

.field public k:J

.field public l:Ljava/lang/String;

.field public m:Lq3i;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lk6l;Lzwk;Ldb;Lx5f;Lumi;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lbxk;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lbxk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ldxk;->b:Lbxk;

    const/4 v0, 0x1

    iput-boolean v0, p0, Ldxk;->i:Z

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ldxk;->a:Landroid/content/Context;

    iput-object p2, p0, Ldxk;->c:Lk6l;

    iput-object p3, p0, Ldxk;->d:Lzwk;

    iput-object p4, p0, Ldxk;->e:Ldb;

    new-instance p1, Li3j;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p0, p1, Li3j;->d:Ljava/lang/Object;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p1, Li3j;->a:Ljava/lang/Object;

    new-instance p3, Lcxk;

    invoke-direct {p3, p1}, Lcxk;-><init>(Li3j;)V

    iput-object p3, p1, Li3j;->b:Ljava/lang/Object;

    new-instance p3, Lqz;

    const/16 p4, 0x1b

    invoke-direct {p3, p1, p4}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p1, Li3j;->c:Ljava/lang/Object;

    iput-object p1, p0, Ldxk;->f:Li3j;

    iget-object p3, p1, Li3j;->b:Ljava/lang/Object;

    check-cast p3, Lcxk;

    invoke-virtual {p2, p3}, Lk6l;->c(Lj6l;)V

    iget-object p1, p1, Li3j;->c:Ljava/lang/Object;

    check-cast p1, Lqz;

    invoke-virtual {p2, p1}, Lk6l;->b(La2l;)V

    iput-object p5, p0, Ldxk;->g:Lx5f;

    iput-object p6, p0, Ldxk;->h:Lumi;

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 4

    if-eqz p1, :cond_1b

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1b

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1b

    const/4 v0, 0x5

    if-eq p1, v0, :cond_1b

    const/4 v0, 0x6

    if-eq p1, v0, :cond_1b

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Ldxk;->k:J

    iget-boolean p1, p0, Ldxk;->i:Z

    if-nez p1, :cond_1b

    invoke-virtual {p0}, Ldxk;->T()V

    :cond_1b
    return-void
.end method

.method public final R()V
    .registers 3

    iget-boolean v0, p0, Ldxk;->i:Z

    if-eqz v0, :cond_19

    iget-object v0, p0, Ldxk;->j:Ljava/util/List;

    if-nez v0, :cond_e

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_11

    :cond_e
    invoke-interface {v0}, Ljava/util/List;->clear()V

    :goto_11
    const-string v1, ""

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iput-object v0, p0, Ldxk;->j:Ljava/util/List;

    return-void

    :cond_19
    invoke-static {}, LJ/N;->MVJG3NBv()V

    iget-object p0, p0, Ldxk;->d:Lzwk;

    iget-object p0, p0, Lzwk;->a:Lh7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_25
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_35

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lywk;

    invoke-interface {p0}, Lywk;->g()V

    goto :goto_25

    :cond_35
    return-void
.end method

.method public final S(Ljava/util/List;)V
    .registers 5

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_69

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {p0}, Ldxk;->R()V

    return-void

    :cond_17
    iget-boolean v1, p0, Ldxk;->i:Z

    if-eqz v1, :cond_3c

    iget-object v1, p0, Ldxk;->j:Ljava/util/List;

    if-eqz v1, :cond_33

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_33

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_33

    :goto_31
    move-object p1, v1

    goto :goto_39

    :cond_33
    if-eqz v1, :cond_39

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_31

    :cond_39
    :goto_39
    iput-object p1, p0, Ldxk;->j:Ljava/util/List;

    return-void

    :cond_3c
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_40
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, LJ/N;->MOG3xMtV(Ljava/lang/Object;)V

    goto :goto_40

    :cond_50
    iget-object p0, p0, Ldxk;->d:Lzwk;

    iget-object p0, p0, Lzwk;->a:Lh7f;

    new-instance p1, Lg7f;

    invoke-direct {p1, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_59
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_69

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lywk;

    invoke-interface {p0}, Lywk;->g()V

    goto :goto_59

    :cond_69
    return-void
.end method

.method public final T()V
    .registers 6

    iget-object v0, p0, Ldxk;->m:Lq3i;

    if-nez v0, :cond_37

    new-instance v0, Lq3i;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lq3i;-><init>(Llim;B)V

    iput-object v0, p0, Ldxk;->m:Lq3i;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Ldxk;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object v0

    iget-object v2, p0, Ldxk;->m:Lq3i;

    iget-object v3, v0, Le59;->a:Ljava/util/HashMap;

    sget-object v4, Ld59;->c:Ld59;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc59;

    iget-object v3, v3, Lc59;->i:Lh7f;

    invoke-virtual {v3, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p0, Ldxk;->m:Lq3i;

    invoke-virtual {v0, v4}, Le59;->b(Ld59;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lq3i;->a(Ljava/lang/String;)V

    invoke-virtual {v0, v4, v1}, Le59;->c(Ld59;Z)V

    :cond_37
    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Ldxk;->d:Lzwk;

    invoke-virtual {p1, p0}, Lzwk;->a(Lywk;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 4

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Ldxk;->m:Lq3i;

    if-eqz p1, :cond_2d

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Ldxk;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p1

    iget-object v0, p0, Ldxk;->m:Lq3i;

    iget-object p1, p1, Le59;->a:Ljava/util/HashMap;

    sget-object v1, Ld59;->c:Ld59;

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc59;

    iget-object p1, p1, Lc59;->i:Lh7f;

    invoke-virtual {p1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    iput-object p1, p0, Ldxk;->m:Lq3i;

    :cond_2d
    iget-object p1, p0, Ldxk;->d:Lzwk;

    invoke-virtual {p1, p0}, Lzwk;->j(Lywk;)V

    iget-object p0, p0, Ldxk;->f:Li3j;

    iget-object p1, p0, Li3j;->d:Ljava/lang/Object;

    check-cast p1, Ldxk;

    iget-object v0, p1, Ldxk;->c:Lk6l;

    iget-object v1, p0, Li3j;->c:Ljava/lang/Object;

    check-cast v1, Lqz;

    invoke-virtual {v0, v1}, Lk6l;->v(La2l;)V

    iget-object p1, p1, Ldxk;->c:Lk6l;

    iget-object p0, p0, Li3j;->b:Ljava/lang/Object;

    check-cast p0, Lcxk;

    invoke-virtual {p1, p0}, Lk6l;->x(Lj6l;)V

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Ldxk;->i:Z

    sget-object p0, Llcp;->n:Ljava/lang/Object;

    monitor-enter p0

    const/4 p1, 0x0

    :try_start_7
    sput-object p1, Llcp;->o:Lbxk;

    monitor-exit p0

    return-void

    :goto_b
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_d

    throw p1

    :catchall_d
    move-exception p1

    goto :goto_b
.end method

.method public final onResume(Lndc;)V
    .registers 12

    const/4 p1, 0x0

    iput-boolean p1, p0, Ldxk;->i:Z

    iget-object v0, p0, Ldxk;->d:Lzwk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->f()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Ldxk;->T()V

    :cond_11
    iget-object v0, p0, Ldxk;->j:Ljava/util/List;

    const/4 v1, 0x0

    iput-object v1, p0, Ldxk;->j:Ljava/util/List;

    if-eqz v0, :cond_21

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_21

    invoke-virtual {p0, v0}, Ldxk;->S(Ljava/util/List;)V

    :cond_21
    iget-boolean v0, p0, Ldxk;->i:Z

    if-nez v0, :cond_9c

    iget-object v0, p0, Ldxk;->a:Landroid/content/Context;

    iget-object p0, p0, Ldxk;->b:Lbxk;

    sget-object v2, Llcp;->n:Ljava/lang/Object;

    monitor-enter v2

    :try_start_2c
    sget-object v3, Llcp;->o:Lbxk;

    const/4 v4, 0x1

    if-nez v3, :cond_33

    move v3, v4

    goto :goto_34

    :cond_33
    move v3, p1

    :goto_34
    sput-object p0, Llcp;->o:Lbxk;

    if-eqz v3, :cond_96

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const-string v5, ".syncpush"
    :try_end_3f
    .catchall {:try_start_2c .. :try_end_3f} :catchall_9a

    :try_start_3f
    new-instance v6, Ljava/io/RandomAccessFile;

    invoke-virtual {v0, v5}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    const-string v8, "rw"

    invoke-direct {v6, v7, v8}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_4a
    .catch Ljava/io/FileNotFoundException; {:try_start_3f .. :try_end_4a} :catch_82
    .catchall {:try_start_3f .. :try_end_4a} :catchall_7d

    move v1, p1

    move v7, v1

    :goto_4c
    :try_start_4c
    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->read()I

    move-result v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_56

    move v4, p1

    move p1, v1

    goto :goto_64

    :cond_56
    if-nez v8, :cond_5a

    move v1, v4

    goto :goto_4c

    :cond_5a
    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->readUTF()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_61} :catch_63
    .catchall {:try_start_4c .. :try_end_61} :catchall_74

    move v7, v4

    goto :goto_4c

    :catch_63
    move p1, v4

    :goto_64
    if-eqz p1, :cond_68

    if-eqz v4, :cond_6a

    :cond_68
    if-eqz v7, :cond_79

    :cond_6a
    const-wide/16 v7, 0x0

    :try_start_6c
    invoke-virtual {v6, v7, v8}, Ljava/io/RandomAccessFile;->setLength(J)V
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_6f} :catch_70
    .catchall {:try_start_6c .. :try_end_6f} :catchall_74

    goto :goto_79

    :catch_70
    :try_start_70
    invoke-virtual {v0, v5}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_73
    .catch Ljava/io/FileNotFoundException; {:try_start_70 .. :try_end_73} :catch_77
    .catchall {:try_start_70 .. :try_end_73} :catchall_74

    goto :goto_79

    :catchall_74
    move-exception p0

    move-object v1, v6

    goto :goto_7e

    :catch_77
    move-object v1, v6

    goto :goto_82

    :cond_79
    :goto_79
    :try_start_79
    invoke-static {v6}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_85

    :catchall_7d
    move-exception p0

    :goto_7e
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_82
    :goto_82
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_85
    if-eqz p1, :cond_8f

    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Ldxk;

    invoke-virtual {p0}, Ldxk;->R()V

    goto :goto_96

    :cond_8f
    iget-object p0, p0, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Ldxk;

    invoke-virtual {p0, v3}, Ldxk;->S(Ljava/util/List;)V

    :cond_96
    :goto_96
    monitor-exit v2

    goto :goto_9c

    :goto_98
    monitor-exit v2
    :try_end_99
    .catchall {:try_start_79 .. :try_end_99} :catchall_9a

    throw p0

    :catchall_9a
    move-exception p0

    goto :goto_98

    :cond_9c
    :goto_9c
    return-void
.end method
