.class public final Ll/lvt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lvt0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lvt0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lvt0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/lvt0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/vlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    iget-object v0, p0, Ll/lvt0;->b:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    move-object v5, v0

    .line 16
    check-cast v5, Lorg/json/JSONObject;

    .line 17
    .line 18
    iget-object p0, p0, Ll/lvt0;->c:Ll/kqx0;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    move-object v4, p0

    .line 25
    check-cast v4, Ljava/lang/String;

    .line 26
    .line 27
    const-string p0, "native"

    .line 28
    .line 29
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    new-instance v1, Ll/v6s0;

    .line 34
    .line 35
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/4 v6, 0x0

    .line 47
    invoke-direct/range {v1 .. v7}, Ll/v6s0;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Lorg/json/JSONObject;ZZ)V

    .line 48
    .line 49
    .line 50
    return-object v1
.end method
