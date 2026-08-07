.class public final Ll/e6u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/d6u0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;

.field public final e:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/d6u0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e6u0;->a:Ll/d6u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/e6u0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/e6u0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/e6u0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/e6u0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final synthetic zzb()Ljava/lang/Object;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/e6u0;->b:Ll/kqx0;

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
    iget-object v0, p0, Ll/e6u0;->c:Ll/kqx0;

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
    iget-object p0, p0, Ll/e6u0;->d:Ll/kqx0;

    .line 19
    .line 20
    check-cast p0, Ll/b0u0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/b0u0;->a()Ll/q6w0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance v6, Ll/t8t0;

    .line 27
    .line 28
    invoke-direct {v6}, Ll/t8t0;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v4, p0, Ll/q6w0;->B:Lcom/google/android/gms/internal/ads/zzcbp;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/q6w0;->t:Ll/u6w0;

    .line 37
    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    :goto_0
    move-object v5, v0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    iget-object v0, p0, Ll/u6w0;->b:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :goto_1
    new-instance v1, Ll/s8t0;

    .line 46
    .line 47
    invoke-direct/range {v1 .. v6}, Ll/s8t0;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Lcom/google/android/gms/internal/ads/zzcbp;Ljava/lang/String;Ll/t8t0;)V

    .line 48
    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_1
    return-object v0
.end method
