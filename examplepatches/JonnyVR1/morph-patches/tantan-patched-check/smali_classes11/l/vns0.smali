.class public final Ll/vns0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/yqw0;

.field public final b:Ll/byv0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ll/cms0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/yqw0;Ll/byv0;)V
    .locals 0
    .param p2    # Ll/byv0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vns0;->a:Ll/yqw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vns0;->b:Ll/byv0;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/vns0;)Ll/byv0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vns0;->b:Ll/byv0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/vns0;)Ll/yqw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vns0;->a:Ll/yqw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/vns0;Ll/bms0;)Ll/cms0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vns0;->f(Ll/bms0;)Ll/cms0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public final c()Ll/lms0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vns0;->b:Ll/byv0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    new-instance v0, Ll/sns0;

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ll/sns0;-><init>(Ll/vns0;Ll/rns0;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public final d()Ll/oms0;
    .locals 2

    .line 1
    new-instance v0, Ll/uns0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/uns0;-><init>(Ll/vns0;Ll/tns0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public final declared-synchronized f(Ll/bms0;)Ll/cms0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/vns0;->c:Ll/cms0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-object v0

    .line 8
    :cond_0
    :try_start_1
    new-instance v0, Ll/cms0;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/cms0;-><init>(Ll/bms0;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/vns0;->c:Ll/cms0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-object v0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 19
    throw p1
.end method
