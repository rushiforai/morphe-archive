.class public final Ll/tku0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tku0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tku0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object p0, p0, Ll/tku0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast p0, Ll/vlt0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vlt0;->a()Lcom/google/android/gms/internal/ads/zzcei;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v0, Ll/v6s0;

    .line 10
    .line 11
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v4, Lorg/json/JSONObject;

    .line 23
    .line 24
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    const/4 v6, 0x1

    .line 29
    const-string v3, "native"

    .line 30
    .line 31
    invoke-direct/range {v0 .. v6}, Ll/v6s0;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Lorg/json/JSONObject;ZZ)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method
