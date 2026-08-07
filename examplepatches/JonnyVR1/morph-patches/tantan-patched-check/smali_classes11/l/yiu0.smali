.class public final Ll/yiu0;
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


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yiu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yiu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yiu0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/yiu0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/yiu0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yiu0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v0, p0, Ll/yiu0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v0, Ll/kiu0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/kiu0;->a()Ll/wit0;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-object v0, p0, Ll/yiu0;->c:Ll/kqx0;

    .line 18
    .line 19
    check-cast v0, Ll/b0u0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/b0u0;->a()Ll/q6w0;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    iget-object v0, p0, Ll/yiu0;->d:Ll/kqx0;

    .line 26
    .line 27
    check-cast v0, Ll/vlt0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    iget-object p0, p0, Ll/yiu0;->e:Ll/kqx0;

    .line 34
    .line 35
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    move-object v6, p0

    .line 40
    check-cast v6, Lcom/google/android/gms/internal/ads/zzbbz;

    .line 41
    .line 42
    new-instance v1, Ll/xiu0;

    .line 43
    .line 44
    invoke-direct/range {v1 .. v6}, Ll/xiu0;-><init>(Landroid/content/Context;Ll/wit0;Ll/q6w0;Lcom/google/android/gms/internal/ads/zzcei;Lcom/google/android/gms/internal/ads/zzbbz;)V

    .line 45
    .line 46
    .line 47
    return-object v1
.end method
