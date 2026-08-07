.class public Ll/uym;
.super Ll/v21;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/v21<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field public final o:Ll/utv$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/utv<",
            "Landroid/database/Cursor;",
            ">.a;"
        }
    .end annotation
.end field

.field public p:Landroid/net/Uri;

.field public q:[Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:[Ljava/lang/String;

.field public t:Ljava/lang/String;

.field public u:Landroid/database/Cursor;

.field public v:Landroid/os/CancellationSignal;

.field public w:I

.field public x:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/v21;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/utv$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/utv$a;-><init>(Ll/utv;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/uym;->o:Ll/utv$a;

    .line 10
    .line 11
    iput-object p2, p0, Ll/uym;->p:Landroid/net/Uri;

    .line 12
    .line 13
    iput-object p3, p0, Ll/uym;->q:[Ljava/lang/String;

    .line 14
    .line 15
    iput-object p4, p0, Ll/uym;->r:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p5, p0, Ll/uym;->s:[Ljava/lang/String;

    .line 18
    .line 19
    iput-object p6, p0, Ll/uym;->t:Ljava/lang/String;

    .line 20
    .line 21
    iput p7, p0, Ll/uym;->x:I

    .line 22
    .line 23
    iput p8, p0, Ll/uym;->w:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/v21;->A()V

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget-object v0, p0, Ll/uym;->v:Landroid/os/CancellationSignal;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw v0
.end method

.method public bridge synthetic F()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uym;->K()Landroid/database/Cursor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic G(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/database/Cursor;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uym;->L(Landroid/database/Cursor;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    const-string v1, "android:query-arg-sql-selection"

    .line 17
    .line 18
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    if-eqz p2, :cond_2

    .line 22
    .line 23
    const-string p1, "android:query-arg-sql-selection-args"

    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    if-eqz p3, :cond_3

    .line 29
    .line 30
    const-string p1, "android:query-arg-sql-sort-order"

    .line 31
    .line 32
    invoke-virtual {v0, p1, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget p1, p0, Ll/uym;->x:I

    .line 36
    .line 37
    if-eqz p1, :cond_4

    .line 38
    .line 39
    const-string p2, "android:query-arg-limit"

    .line 40
    .line 41
    invoke-virtual {v0, p2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    :cond_4
    iget p0, p0, Ll/uym;->w:I

    .line 45
    .line 46
    if-eqz p0, :cond_5

    .line 47
    .line 48
    const-string p1, "android:query-arg-offset"

    .line 49
    .line 50
    invoke-virtual {v0, p1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    :cond_5
    return-object v0
.end method

.method public J(Landroid/database/Cursor;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/utv;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/uym;->u:Landroid/database/Cursor;

    .line 14
    .line 15
    iput-object p1, p0, Ll/uym;->u:Landroid/database/Cursor;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/utv;->l()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-super {p0, p1}, Ll/utv;->f(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    if-eqz v0, :cond_2

    .line 27
    .line 28
    if-eq v0, p1, :cond_2

    .line 29
    .line 30
    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public K()Landroid/database/Cursor;
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/v21;->E()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Landroid/os/CancellationSignal;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/uym;->v:Landroid/os/CancellationSignal;

    .line 14
    .line 15
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 16
    const/4 v1, 0x0

    .line 17
    :try_start_1
    invoke-virtual {p0}, Ll/utv;->i()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object v4, p0, Ll/uym;->p:Landroid/net/Uri;

    .line 26
    .line 27
    iget-object v5, p0, Ll/uym;->q:[Ljava/lang/String;

    .line 28
    .line 29
    iget-object v6, p0, Ll/uym;->r:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v7, p0, Ll/uym;->s:[Ljava/lang/String;

    .line 32
    .line 33
    iget-object v8, p0, Ll/uym;->t:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v9, p0, Ll/uym;->v:Landroid/os/CancellationSignal;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 36
    .line 37
    move-object v2, p0

    .line 38
    :try_start_2
    invoke-virtual/range {v2 .. v9}, Ll/uym;->M(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 39
    .line 40
    .line 41
    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    :try_start_3
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    .line 45
    .line 46
    .line 47
    iget-object v0, v2, Ll/uym;->o:Ll/utv$a;

    .line 48
    .line 49
    invoke-interface {p0, v0}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :catchall_0
    move-exception v0

    .line 54
    :goto_0
    move-object p0, v0

    .line 55
    goto :goto_2

    .line 56
    :catch_0
    move-exception v0

    .line 57
    :try_start_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 58
    .line 59
    .line 60
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 61
    :cond_0
    :goto_1
    monitor-enter v2

    .line 62
    :try_start_5
    iput-object v1, v2, Ll/uym;->v:Landroid/os/CancellationSignal;

    .line 63
    .line 64
    monitor-exit v2

    .line 65
    return-object p0

    .line 66
    :catchall_1
    move-exception v0

    .line 67
    move-object p0, v0

    .line 68
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 69
    throw p0

    .line 70
    :catchall_2
    move-exception v0

    .line 71
    move-object v2, p0

    .line 72
    goto :goto_0

    .line 73
    :goto_2
    monitor-enter v2

    .line 74
    :try_start_6
    iput-object v1, v2, Ll/uym;->v:Landroid/os/CancellationSignal;

    .line 75
    .line 76
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 77
    throw p0

    .line 78
    :catchall_3
    move-exception v0

    .line 79
    move-object p0, v0

    .line 80
    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 81
    throw p0

    .line 82
    :catchall_4
    move-exception v0

    .line 83
    move-object v2, p0

    .line 84
    :goto_3
    move-object p0, v0

    .line 85
    goto :goto_4

    .line 86
    :cond_1
    move-object v2, p0

    .line 87
    :try_start_8
    new-instance p0, Landroidx/core/os/OperationCanceledException;

    .line 88
    .line 89
    invoke-direct {p0}, Landroidx/core/os/OperationCanceledException;-><init>()V

    .line 90
    .line 91
    .line 92
    throw p0

    .line 93
    :catchall_5
    move-exception v0

    .line 94
    goto :goto_3

    .line 95
    :goto_4
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 96
    throw p0
.end method

.method public L(Landroid/database/Cursor;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public M(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_1

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p0, p4, p5, p6}, Ll/uym;->I(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p2, p3, p0, p7}, Ll/hwv;->a(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 12
    .line 13
    .line 14
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return-object p0

    .line 16
    :catch_0
    move-exception v0

    .line 17
    move-object p0, v0

    .line 18
    instance-of p1, p0, Landroid/os/OperationCanceledException;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p0, Landroidx/core/os/OperationCanceledException;

    .line 23
    .line 24
    invoke-direct {p0}, Landroidx/core/os/OperationCanceledException;-><init>()V

    .line 25
    .line 26
    .line 27
    throw p0

    .line 28
    :cond_0
    throw p0

    .line 29
    :cond_1
    if-eqz p7, :cond_2

    .line 30
    .line 31
    invoke-virtual {p7}, Landroid/os/CancellationSignal;->throwIfCanceled()V

    .line 32
    .line 33
    .line 34
    :cond_2
    invoke-virtual/range {p1 .. p6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/database/Cursor;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uym;->J(Landroid/database/Cursor;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/utv;->q()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uym;->s()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/uym;->u:Landroid/database/Cursor;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/uym;->u:Landroid/database/Cursor;

    .line 18
    .line 19
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/uym;->u:Landroid/database/Cursor;

    .line 24
    .line 25
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uym;->u:Landroid/database/Cursor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/uym;->J(Landroid/database/Cursor;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/utv;->y()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Ll/uym;->u:Landroid/database/Cursor;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return-void

    .line 20
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/utv;->h()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/utv;->b()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method
