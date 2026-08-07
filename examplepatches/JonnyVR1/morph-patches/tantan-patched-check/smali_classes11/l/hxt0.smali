.class public final Ll/hxt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/bxt0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;

.field public final e:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/bxt0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hxt0;->a:Ll/bxt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hxt0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/hxt0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/hxt0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/hxt0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hxt0;->b:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    iget-object v1, p0, Ll/hxt0;->c:Ll/kqx0;

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
    iget-object v2, p0, Ll/hxt0;->d:Ll/kqx0;

    .line 18
    .line 19
    check-cast v2, Ll/b0u0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/b0u0;->a()Ll/q6w0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object p0, p0, Ll/hxt0;->e:Ll/kqx0;

    .line 26
    .line 27
    check-cast p0, Ll/z5u0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/z5u0;->a()Ll/o7w0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v0, v1, v2, p0}, Ll/bxt0;->f(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/q6w0;Ll/o7w0;)Ll/yfu0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method
