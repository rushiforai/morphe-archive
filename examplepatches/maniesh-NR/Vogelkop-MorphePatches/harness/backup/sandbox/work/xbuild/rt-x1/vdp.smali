.class public final Lvdp;
.super Lejo;
.source "SourceFile"


# instance fields
.field public final b:Lpro;

.field public c:Ljava/lang/Integer;

.field public d:Ljava/util/ArrayList;

.field public e:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lpro;)V
    .registers 2

    invoke-direct {p0}, Lejo;-><init>()V

    iput-object p1, p0, Lvdp;->b:Lpro;

    return-void
.end method


# virtual methods
.method public final h(I)V
    .registers 12

    new-instance v0, Lbdp;

    iget-object v1, p0, Lvdp;->b:Lpro;

    move-object v2, v1

    iget-object v1, v2, Lpro;->e:Ljava/lang/String;

    iget-object v3, p0, Lvdp;->c:Ljava/lang/Integer;

    if-eqz v3, :cond_10

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_11

    :cond_10
    const/4 v3, -0x1

    :goto_11
    iget-object v4, p0, Lejo;->a:Ljava/lang/Object;

    check-cast v4, Lw9p;

    monitor-enter v4

    :try_start_16
    iget-wide v5, v4, Lw9p;->b:J

    iget-wide v7, v4, Lw9p;->c:J
    :try_end_1a
    .catchall {:try_start_16 .. :try_end_1a} :catchall_4e

    sub-long/2addr v7, v5

    monitor-exit v4

    long-to-int v4, v7

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v5

    invoke-virtual {v5}, Lt5p;->a()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v6

    iget-boolean v6, v6, Lt5p;->c:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iget-object v2, v2, Lpro;->a:Ljava/lang/String;

    iget-object v7, p0, Lvdp;->d:Ljava/util/ArrayList;

    if-nez v7, :cond_37

    sget-object v7, Ll08;->a:Ll08;

    :cond_37
    iget-object p0, p0, Lvdp;->e:Ljava/util/ArrayList;

    if-nez p0, :cond_3d

    sget-object p0, Ll08;->a:Ll08;

    :cond_3d
    move-object v8, v6

    move-object v6, v2

    move v2, v3

    move v3, v4

    move-object v4, v5

    move-object v5, v8

    move-object v8, p0

    move v9, p1

    invoke-direct/range {v0 .. v9}, Lbdp;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/util/List;Ljava/util/List;I)V

    invoke-static {v0}, Lp8p;->a(Lp8p;)V

    return-void

    :goto_4c
    :try_start_4c
    monitor-exit v4
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_4e

    throw p0

    :catchall_4e
    move-exception v0

    move-object p0, v0

    goto :goto_4c
.end method
