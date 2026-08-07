.class public final Ll/sdw0;
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
    iput-object p1, p0, Ll/sdw0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/sdw0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/sdw0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/sdw0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/sdw0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/sdw0;->a:Ll/kqx0;

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
    iget-object v0, p0, Ll/sdw0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v0, Ll/vlt0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-object p0, p0, Ll/sdw0;->c:Ll/kqx0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    move-object v4, p0

    .line 24
    check-cast v4, Ll/xtu0;

    .line 25
    .line 26
    new-instance v5, Ll/o8v0;

    .line 27
    .line 28
    invoke-direct {v5}, Ll/o8v0;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v6, Ll/b5t0;

    .line 32
    .line 33
    invoke-direct {v6}, Ll/b5t0;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/hew0;

    .line 37
    .line 38
    invoke-direct/range {v1 .. v6}, Ll/hew0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/xtu0;Ll/o8v0;Ll/b5t0;)V

    .line 39
    .line 40
    .line 41
    return-object v1
.end method
