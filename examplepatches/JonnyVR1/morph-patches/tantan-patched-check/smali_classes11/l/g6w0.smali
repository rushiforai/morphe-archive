.class public final Ll/g6w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lmv0;


# instance fields
.field public final synthetic a:Ll/h6w0;


# direct methods
.method public constructor <init>(Ll/h6w0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g6w0;->a:Ll/h6w0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g6w0;->a:Ll/h6w0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/g6w0;->a:Ll/h6w0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {p0, v1}, Ll/h6w0;->r8(Ll/h6w0;Ll/ksu0;)V

    .line 8
    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p0
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g6w0;->a:Ll/h6w0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/g6w0;->a:Ll/h6w0;

    .line 5
    .line 6
    move-object v2, p1

    .line 7
    check-cast v2, Ll/ksu0;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/h6w0;->r8(Ll/h6w0;Ll/ksu0;)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Ll/sgs0;->q3:Ll/dgs0;

    .line 13
    .line 14
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    check-cast p1, Ll/ksu0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/ksu0;->k()Ll/h7w0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v1, p0, Ll/g6w0;->a:Ll/h6w0;

    .line 37
    .line 38
    invoke-static {v1}, Ll/h6w0;->q8(Ll/h6w0;)Ll/c7w0;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, p1, Ll/h7w0;->a:Ll/c7w0;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/g6w0;->a:Ll/h6w0;

    .line 48
    .line 49
    invoke-static {p0}, Ll/h6w0;->p8(Ll/h6w0;)Ll/ksu0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/kzt0;->c()V

    .line 54
    .line 55
    .line 56
    monitor-exit v0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method
