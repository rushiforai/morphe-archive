.class public final Ll/dcv0;
.super Ll/kss0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/gdv0;


# direct methods
.method public synthetic constructor <init>(Ll/gdv0;Ll/xav0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dcv0;->a:Ll/gdv0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kss0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final m0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dcv0;->a:Ll/gdv0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gdv0;->g(Ll/gdv0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/dcv0;->a:Ll/gdv0;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v2}, Ll/gdv0;->j(Ll/gdv0;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/dcv0;->a:Ll/gdv0;

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    invoke-static {v1, v3}, Ll/gdv0;->i(Ll/gdv0;Z)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ljava/util/ArrayList;

    .line 21
    .line 22
    iget-object v3, p0, Ll/dcv0;->a:Ll/gdv0;

    .line 23
    .line 24
    invoke-static {v3}, Ll/gdv0;->h(Ll/gdv0;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/dcv0;->a:Ll/gdv0;

    .line 32
    .line 33
    invoke-static {p0}, Ll/gdv0;->h(Ll/gdv0;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 38
    .line 39
    .line 40
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    invoke-static {p1}, Ll/gdv0;->d(Ljava/util/List;)Ll/ium;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    :goto_0
    if-ge v2, p1, :cond_0

    .line 50
    .line 51
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ll/nm50;

    .line 56
    .line 57
    invoke-interface {v0, p0}, Ll/nm50;->a(Ll/ium;)V

    .line 58
    .line 59
    .line 60
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    return-void

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    throw p0
.end method
