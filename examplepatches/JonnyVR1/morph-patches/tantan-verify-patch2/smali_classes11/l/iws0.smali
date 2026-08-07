.class public final Ll/iws0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final a:Ll/gvs0;

.field public final b:Ll/hvs0;

.field public final c:Ljava/lang/String;

.field public final d:Ll/hpr;


# direct methods
.method public constructor <init>(Ll/hpr;Ljava/lang/String;Ll/hvs0;Ll/gvs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iws0;->d:Ll/hpr;

    .line 5
    .line 6
    const-string p1, "google.afma.activeView.handleUpdate"

    .line 7
    .line 8
    iput-object p1, p0, Ll/iws0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p3, p0, Ll/iws0;->b:Ll/hvs0;

    .line 11
    .line 12
    iput-object p4, p0, Ll/iws0;->a:Ll/gvs0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Object;Ll/cvs0;)Ll/hpr;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/tct0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tct0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Ll/aqs0;->o:Ll/qqs0;

    .line 18
    .line 19
    new-instance v3, Ll/hws0;

    .line 20
    .line 21
    invoke-direct {v3, p0, v0}, Ll/hws0;-><init>(Ll/iws0;Ll/tct0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v1, v3}, Ll/qqs0;->c(Ljava/lang/String;Ll/pqs0;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Lorg/json/JSONObject;

    .line 28
    .line 29
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v3, "id"

    .line 33
    .line 34
    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    const-string v1, "args"

    .line 38
    .line 39
    check-cast p1, Lorg/json/JSONObject;

    .line 40
    .line 41
    invoke-virtual {v2, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/iws0;->c:Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {p2, p0, v2}, Ll/xts0;->z0(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/iws0;->zzb(Ljava/lang/Object;)Ll/hpr;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final zzb(Ljava/lang/Object;)Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/gws0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/gws0;-><init>(Ll/iws0;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/iws0;->d:Ll/hpr;

    .line 7
    .line 8
    sget-object p1, Ll/oct0;->f:Ll/xvw0;

    .line 9
    .line 10
    invoke-static {p0, v0, p1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
