.class public final Ll/tiv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcv0;


# instance fields
.field public final a:Ll/dkv0;

.field public final b:Ll/huu0;


# direct methods
.method public constructor <init>(Ll/dkv0;Ll/huu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tiv0;->a:Ll/dkv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tiv0;->b:Ll/huu0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lorg/json/JSONObject;)Ll/scv0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    sget-object p2, Ll/sgs0;->E1:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    :try_start_0
    iget-object p0, p0, Ll/tiv0;->b:Ll/huu0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/huu0;->b(Ljava/lang/String;)Ll/hzs0;

    .line 23
    .line 24
    .line 25
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    const-string p2, "Coundn\'t create RTB adapter: "

    .line 29
    .line 30
    invoke-static {p2, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    move-object p0, v0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p0, p0, Ll/tiv0;->a:Ll/dkv0;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/dkv0;->a(Ljava/lang/String;)Ll/hzs0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :goto_0
    if-nez p0, :cond_1

    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_1
    new-instance p2, Ll/vev0;

    .line 45
    .line 46
    invoke-direct {p2}, Ll/vev0;-><init>()V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/scv0;

    .line 50
    .line 51
    invoke-direct {v0, p0, p2, p1}, Ll/scv0;-><init>(Ljava/lang/Object;Ll/g8u0;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method
