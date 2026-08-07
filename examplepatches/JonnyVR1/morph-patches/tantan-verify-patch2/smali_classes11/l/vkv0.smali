.class public final Ll/vkv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lmv0;


# instance fields
.field public final synthetic a:Ll/wkv0;


# direct methods
.method public constructor <init>(Ll/wkv0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vkv0;->a:Ll/wkv0;

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
    iget-object v0, p0, Ll/vkv0;->a:Ll/wkv0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/vkv0;->a:Ll/wkv0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {p0, v1}, Ll/wkv0;->q8(Ll/wkv0;Ll/uwt0;)V

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
    iget-object v0, p0, Ll/vkv0;->a:Ll/wkv0;

    .line 2
    .line 3
    check-cast p1, Ll/uwt0;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/vkv0;->a:Ll/wkv0;

    .line 7
    .line 8
    invoke-static {v1}, Ll/wkv0;->p8(Ll/wkv0;)Ll/uwt0;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-static {v1}, Ll/wkv0;->p8(Ll/wkv0;)Ll/uwt0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/kzt0;->b()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/vkv0;->a:Ll/wkv0;

    .line 25
    .line 26
    invoke-static {v1, p1}, Ll/wkv0;->q8(Ll/wkv0;Ll/uwt0;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/vkv0;->a:Ll/wkv0;

    .line 30
    .line 31
    invoke-static {p0}, Ll/wkv0;->p8(Ll/wkv0;)Ll/uwt0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/kzt0;->c()V

    .line 36
    .line 37
    .line 38
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0
.end method
