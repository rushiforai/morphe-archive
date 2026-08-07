.class public final Ll/q5v0;
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


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q5v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/q5v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/q5v0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/q5v0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/q5v0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/q5v0;->f:Ll/kqx0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()Ll/p5v0;
    .locals 7

    .line 1
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/q5v0;->b:Ll/kqx0;

    .line 7
    .line 8
    check-cast v0, Ll/r4v0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/r4v0;->a()Ll/q4v0;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object v0, p0, Ll/q5v0;->c:Ll/kqx0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/fqx0;->a(Ll/kqx0;)Ll/dqx0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ll/tpx0;->a(Ll/dqx0;)Ll/kpx0;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v0, p0, Ll/q5v0;->d:Ll/kqx0;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    move-object v4, v0

    .line 31
    check-cast v4, Ll/hew0;

    .line 32
    .line 33
    iget-object v0, p0, Ll/q5v0;->e:Ll/kqx0;

    .line 34
    .line 35
    check-cast v0, Ll/jlt0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    iget-object p0, p0, Ll/q5v0;->f:Ll/kqx0;

    .line 42
    .line 43
    check-cast p0, Ll/vlt0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    new-instance v0, Ll/p5v0;

    .line 50
    .line 51
    invoke-direct/range {v0 .. v6}, Ll/p5v0;-><init>(Ll/xvw0;Ll/q4v0;Ll/kpx0;Ll/hew0;Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q5v0;->a()Ll/p5v0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
