.class public final Ll/qcw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/pcw0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/pcw0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qcw0;->a:Ll/pcw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qcw0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qcw0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/qcw0;->d:Ll/kqx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qcw0;->b:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/qcw0;->c:Ll/kqx0;

    .line 10
    .line 11
    check-cast v1, Ll/vlt0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p0, p0, Ll/qcw0;->d:Ll/kqx0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/hew0;

    .line 24
    .line 25
    new-instance v2, Ll/fvs0;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/fvs0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v0, v1, p0}, Ll/fvs0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/hew0;)Ll/ovs0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    return-object p0
.end method
