.class public final Lcy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/res/AssetManager;Ljava/util/concurrent/Executor;Lh4h;Ljava/lang/String;Ljava/io/File;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcy;->a:Z

    iput-object p2, p0, Lcy;->b:Ljava/lang/Object;

    iput-object p3, p0, Lcy;->c:Ljava/lang/Object;

    iput-object p4, p0, Lcy;->f:Ljava/lang/Object;

    iput-object p5, p0, Lcy;->e:Ljava/lang/Object;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1f

    if-lt p1, p2, :cond_17

    sget-object p1, Ly9m;->g:[B

    goto :goto_23

    :cond_17
    const/16 p2, 0x1d

    if-eq p1, p2, :cond_21

    const/16 p2, 0x1e

    if-eq p1, p2, :cond_21

    const/4 p1, 0x0

    goto :goto_23

    :cond_21
    sget-object p1, Ly9m;->h:[B

    :goto_23
    iput-object p1, p0, Lcy;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean p2, p0, Lcy;->a:Z

    .line 40
    iput-object p1, p0, Lcy;->b:Ljava/lang/Object;

    .line 41
    iput-object p3, p0, Lcy;->c:Ljava/lang/Object;

    .line 42
    iput-object p4, p0, Lcy;->d:Ljava/lang/Object;

    .line 43
    iput-object p5, p0, Lcy;->e:Ljava/lang/Object;

    .line 44
    iput-object p6, p0, Lcy;->f:Ljava/lang/Object;

    .line 45
    iput-object p7, p0, Lcy;->g:Ljava/lang/Object;

    .line 46
    iput-object p8, p0, Lcy;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lsf1;Ln27;Lmh9;Likl;Ljava/util/List;Z)V
    .registers 7

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcy;->b:Ljava/lang/Object;

    .line 49
    iput-object p4, p0, Lcy;->c:Ljava/lang/Object;

    .line 50
    iput-boolean p6, p0, Lcy;->a:Z

    .line 51
    iput-object p2, p0, Lcy;->d:Ljava/lang/Object;

    .line 52
    iput-object p3, p0, Lcy;->e:Ljava/lang/Object;

    .line 53
    iput-object p5, p0, Lcy;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltcc;Lcom/opera/android/feed/FeedScrollView;Lqdh;Lx5f;)V
    .registers 5

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p2, p0, Lcy;->b:Ljava/lang/Object;

    .line 56
    iput-object p3, p0, Lcy;->c:Ljava/lang/Object;

    .line 57
    new-instance p2, Lxdh;

    invoke-direct {p2, p3, p4}, Lxdh;-><init>(Lqdh;Lskm;)V

    iput-object p2, p0, Lcy;->d:Ljava/lang/Object;

    .line 58
    new-instance p2, Lwdh;

    invoke-direct {p2, p0}, Lwdh;-><init>(Lcy;)V

    iput-object p2, p0, Lcy;->e:Ljava/lang/Object;

    .line 59
    new-instance p2, Llw7;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p1, p3}, Llw7;-><init>(Ljava/lang/Object;Ltcc;B)V

    iput-object p2, p0, Lcy;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltw2;Lb59;Li5o;Lsy;Lrx;Lwjh;)V
    .registers 9

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lay;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcy;->b:Ljava/lang/Object;

    .line 62
    iput-object p1, p0, Lcy;->c:Ljava/lang/Object;

    .line 63
    iput-object p2, p0, Lcy;->d:Ljava/lang/Object;

    .line 64
    iput-object p3, p0, Lcy;->e:Ljava/lang/Object;

    .line 65
    iput-object p4, p0, Lcy;->f:Ljava/lang/Object;

    .line 66
    iput-object p5, p0, Lcy;->g:Ljava/lang/Object;

    .line 67
    iput-object p6, p0, Lcy;->h:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/content/SharedPreferences;)V
    .registers 2

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "controller_config_data"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "controller_config_url"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "controller_config_full_url"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "controller_config_timestamp"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "controller_config_request_time"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lcy;->d:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "controller_config_data"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final c()Lml;
    .registers 1

    invoke-virtual {p0}, Lcy;->i()V

    iget-object p0, p0, Lcy;->b:Ljava/lang/Object;

    check-cast p0, Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lml;

    return-object p0
.end method

.method public final d(Ld2c;)V
    .registers 10

    iget-object v0, p0, Lcy;->g:Ljava/lang/Object;

    check-cast v0, Lx79;

    if-eqz v0, :cond_12

    iget-object v1, p0, Lcy;->h:Ljava/lang/Object;

    check-cast v1, Ld2c;

    if-ne p1, v1, :cond_12

    invoke-virtual {v0}, Lx79;->B()Z

    move-result v1

    if-eqz v1, :cond_38

    :cond_12
    iput-object p1, p0, Lcy;->h:Ljava/lang/Object;

    iget-object v0, p0, Lcy;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lsf1;

    iget-object v0, p0, Lcy;->c:Ljava/lang/Object;

    check-cast v0, Likl;

    invoke-static {v0, p1}, Lxgh;->v(Likl;Ld2c;)Likl;

    move-result-object v5

    iget-object p1, p0, Lcy;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ln27;

    iget-object p1, p0, Lcy;->e:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lmh9;

    iget-object p1, p0, Lcy;->f:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Ljava/util/List;

    iget-boolean v7, p0, Lcy;->a:Z

    new-instance v1, Lx79;

    invoke-direct/range {v1 .. v7}, Lx79;-><init>(Lsf1;Ln27;Lmh9;Likl;Ljava/util/List;Z)V

    move-object v0, v1

    :cond_38
    iput-object v0, p0, Lcy;->g:Ljava/lang/Object;

    return-void
.end method

.method public final e(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/FileInputStream;
    .registers 3

    :try_start_0
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object p0
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_8} :catch_9

    return-object p0

    :catch_9
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_15

    const-string p1, "compressed"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    :cond_15
    const/4 p0, 0x0

    return-object p0
.end method

.method public final f(ILjava/io/Serializable;)V
    .registers 6

    iget-object v0, p0, Lcy;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/Executor;

    new-instance v1, Lkw4;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, p2, v2}, Lkw4;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final g(Z)V
    .registers 6

    iget-object v0, p0, Lcy;->f:Ljava/lang/Object;

    check-cast v0, Llw7;

    iget-object v1, p0, Lcy;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/feed/FeedScrollView;

    iget-object v2, p0, Lcy;->e:Ljava/lang/Object;

    check-cast v2, Lwdh;

    iget-boolean v3, p0, Lcy;->a:Z

    if-ne v3, p1, :cond_11

    return-void

    :cond_11
    iput-boolean p1, p0, Lcy;->a:Z

    iget-object v3, p0, Lcy;->h:Ljava/lang/Object;

    check-cast v3, Lsdh;

    if-eqz p1, :cond_2c

    if-eqz v3, :cond_1e

    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    :cond_1e
    invoke-virtual {v1, v2}, Lcom/opera/android/feed/FeedScrollView;->F(Lile;)V

    iget-object p0, v0, Llw7;->b:Ltcc;

    if-eqz p0, :cond_28

    invoke-virtual {p0, v0}, Ltcc;->a(Lmdc;)V

    :cond_28
    invoke-virtual {v2}, Lwdh;->j()V

    return-void

    :cond_2c
    if-eqz v3, :cond_31

    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    :cond_31
    iget-object p1, v1, Lcom/opera/android/feed/FeedScrollView;->D:Li7f;

    invoke-virtual {p1, v2}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p1, v0, Llw7;->b:Ltcc;

    if-eqz p1, :cond_3d

    invoke-virtual {p1, v0}, Ltcc;->b(Lmdc;)V

    :cond_3d
    iget-object p0, p0, Lcy;->d:Ljava/lang/Object;

    check-cast p0, Lxdh;

    invoke-virtual {p0}, Lo63;->i()V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/RecyclerView;Lsdh;)V
    .registers 5

    iget-object v0, p0, Lcy;->e:Ljava/lang/Object;

    check-cast v0, Lwdh;

    iget-boolean v1, p0, Lcy;->a:Z

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcy;->h:Ljava/lang/Object;

    check-cast v1, Lsdh;

    if-eqz v1, :cond_11

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    :cond_11
    iput-object p1, p0, Lcy;->g:Ljava/lang/Object;

    iput-object p2, p0, Lcy;->h:Ljava/lang/Object;

    iget-boolean p0, p0, Lcy;->a:Z

    if-eqz p0, :cond_21

    if-eqz p2, :cond_1e

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    :cond_1e
    invoke-virtual {v0}, Lwdh;->j()V

    :cond_21
    return-void
.end method

.method public final i()V
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lcy;->b:Ljava/lang/Object;

    check-cast v1, Lay;

    iget-object v2, v0, Lcy;->c:Ljava/lang/Object;

    check-cast v2, Ltw2;

    iget-object v3, v2, Ltw2;->b:Ljava/lang/Object;

    check-cast v3, Lwy;

    iget-boolean v3, v3, Lwy;->k:Z

    if-nez v3, :cond_18

    invoke-virtual {v0}, Lcy;->b()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_87

    :cond_18
    iget-boolean v3, v0, Lcy;->a:Z

    if-nez v3, :cond_87

    iget-object v3, v0, Lcy;->h:Ljava/lang/Object;

    check-cast v3, Lwjh;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lml;

    iget-wide v5, v4, Lml;->i:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    const/4 v6, 0x0

    const-wide/32 v9, 0x1499700

    const/4 v11, 0x1

    if-eqz v5, :cond_40

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    iget-wide v4, v4, Lml;->i:J

    add-long/2addr v4, v9

    cmp-long v4, v12, v4

    if-gtz v4, :cond_40

    move v4, v6

    goto :goto_41

    :cond_40
    move v4, v11

    :goto_41
    xor-int/2addr v4, v11

    iget-object v5, v3, Lwjh;->f:Ljava/lang/Object;

    check-cast v5, Lo59;

    if-eqz v5, :cond_50

    iget-wide v12, v5, Lo59;->d:J

    const-wide/16 v14, -0x1

    cmp-long v12, v12, v14

    if-lez v12, :cond_52

    :cond_50
    move-wide v15, v7

    goto :goto_65

    :cond_52
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    iget-object v14, v3, Lwjh;->f:Ljava/lang/Object;

    check-cast v14, Lo59;

    move-wide v15, v7

    iget-wide v7, v14, Lo59;->b:J

    sub-long/2addr v12, v7

    iput-wide v12, v5, Lo59;->d:J

    iput-boolean v4, v14, Lo59;->m:Z

    invoke-virtual {v3}, Lwjh;->p()V

    :goto_65
    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lml;

    iget-wide v3, v1, Lml;->i:J

    cmp-long v3, v3, v15

    if-eqz v3, :cond_7d

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-wide v7, v1, Lml;->i:J

    add-long/2addr v7, v9

    cmp-long v1, v3, v7

    if-gtz v1, :cond_7d

    return-void

    :cond_7d
    iget-object v1, v2, Ltw2;->b:Ljava/lang/Object;

    check-cast v1, Lwy;

    invoke-virtual {v1}, Lwy;->T()Z

    move-result v1

    if-eqz v1, :cond_88

    :cond_87
    return-void

    :cond_88
    iput-boolean v11, v0, Lcy;->a:Z

    iget-object v1, v0, Lcy;->f:Ljava/lang/Object;

    check-cast v1, Lsy;

    invoke-virtual {v1}, Lsy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr9i;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, v0, Lcy;->e:Ljava/lang/Object;

    check-cast v4, Li5o;

    new-instance v5, Lzx;

    invoke-direct {v5, v2, v3, v0, v1}, Lzx;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v1, Lr9i;->b:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v2, v4, Li5o;->a:Ljava/lang/Object;

    check-cast v2, Liy;

    new-instance v3, Lpy;

    new-instance v7, Lqy;

    iget-object v1, v1, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-direct {v7, v4, v6, v1, v8}, Loy;-><init>(Li5o;ILandroid/net/Uri;Ljava/lang/String;)V

    invoke-direct {v3, v4, v0, v7, v5}, Lpy;-><init>(Li5o;Landroid/net/Uri$Builder;Lqy;Lzx;)V

    invoke-virtual {v2, v3}, Liy;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method
