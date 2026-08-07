.class public final Ll/vku0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vku0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vku0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/vku0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/vku0;->d:Ll/kqx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/vku0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/v6s0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/vku0;->b:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {v1}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/util/concurrent/Executor;

    .line 16
    .line 17
    iget-object v2, p0, Ll/vku0;->c:Ll/kqx0;

    .line 18
    .line 19
    invoke-interface {v2}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Landroid/content/Context;

    .line 24
    .line 25
    iget-object p0, p0, Ll/vku0;->d:Ll/kqx0;

    .line 26
    .line 27
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/google/android/gms/common/util/Clock;

    .line 32
    .line 33
    new-instance v3, Ll/rvt0;

    .line 34
    .line 35
    new-instance v4, Ll/wut0;

    .line 36
    .line 37
    invoke-direct {v4, v2, v0}, Ll/wut0;-><init>(Landroid/content/Context;Ll/v6s0;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {v3, v1, v4, p0}, Ll/rvt0;-><init>(Ljava/util/concurrent/Executor;Ll/wut0;Lcom/google/android/gms/common/util/Clock;)V

    .line 41
    .line 42
    .line 43
    return-object v3
.end method
