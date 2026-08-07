.class public final Ll/gmv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lmv0;


# instance fields
.field public final synthetic a:Ll/hmv0;


# direct methods
.method public constructor <init>(Ll/hmv0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gmv0;->a:Ll/hmv0;

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
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gmv0;->a:Ll/hmv0;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    throw v0
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gmv0;->a:Ll/hmv0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/gmv0;->a:Ll/hmv0;

    .line 5
    .line 6
    move-object v1, p1

    .line 7
    check-cast v1, Ll/kzt0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/kzt0;->d()Ll/b6u0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {p0, v1}, Ll/hmv0;->c(Ll/hmv0;Ll/tlu0;)V

    .line 14
    .line 15
    .line 16
    check-cast p1, Ll/kzt0;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/kzt0;->c()V

    .line 19
    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method
