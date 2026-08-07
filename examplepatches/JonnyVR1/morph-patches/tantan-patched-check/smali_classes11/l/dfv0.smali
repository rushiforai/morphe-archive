.class public final Ll/dfv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;

.field public final e:Ll/kqx0;

.field public final f:Ll/kqx0;

.field public final g:Ll/kqx0;

.field public final h:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dfv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/dfv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/dfv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/dfv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/dfv0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/dfv0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/dfv0;->g:Ll/kqx0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/dfv0;->h:Ll/kqx0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/dfv0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Landroid/content/Context;

    .line 9
    .line 10
    iget-object v0, p0, Ll/dfv0;->b:Ll/kqx0;

    .line 11
    .line 12
    check-cast v0, Ll/vlt0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    iget-object v0, p0, Ll/dfv0;->c:Ll/kqx0;

    .line 19
    .line 20
    check-cast v0, Ll/z5u0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/z5u0;->a()Ll/o7w0;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget-object v0, p0, Ll/dfv0;->d:Ll/kqx0;

    .line 27
    .line 28
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    move-object v5, v0

    .line 33
    check-cast v5, Ljava/util/concurrent/Executor;

    .line 34
    .line 35
    iget-object v0, p0, Ll/dfv0;->e:Ll/kqx0;

    .line 36
    .line 37
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    move-object v6, v0

    .line 42
    check-cast v6, Ll/piu0;

    .line 43
    .line 44
    iget-object v0, p0, Ll/dfv0;->f:Ll/kqx0;

    .line 45
    .line 46
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    move-object v7, v0

    .line 51
    check-cast v7, Ll/ltu0;

    .line 52
    .line 53
    new-instance v8, Ll/dqs0;

    .line 54
    .line 55
    invoke-direct {v8}, Ll/dqs0;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/dfv0;->h:Ll/kqx0;

    .line 59
    .line 60
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    move-object v9, p0

    .line 65
    check-cast v9, Ll/qbv0;

    .line 66
    .line 67
    new-instance v1, Ll/cfv0;

    .line 68
    .line 69
    invoke-direct/range {v1 .. v9}, Ll/cfv0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/o7w0;Ljava/util/concurrent/Executor;Ll/piu0;Ll/ltu0;Ll/dqs0;Ll/qbv0;)V

    .line 70
    .line 71
    .line 72
    return-object v1
.end method
