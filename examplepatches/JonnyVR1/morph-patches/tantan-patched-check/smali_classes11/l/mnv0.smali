.class public final Ll/mnv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/o7w0;

.field public final c:Ll/c8w0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/o7w0;Ll/c8w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mnv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mnv0;->b:Ll/o7w0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mnv0;->c:Ll/c8w0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/nnv0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/nnv0;

    .line 2
    .line 3
    sget-object v1, Ll/sgs0;->i7:Ll/dgs0;

    .line 4
    .line 5
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/mnv0;->b:Ll/o7w0;

    .line 23
    .line 24
    iget-object p0, p0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 25
    .line 26
    const-string v1, "requester_type_2"

    .line 27
    .line 28
    invoke-static {p0}, Ll/qyv0;->b(Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-static {}, Ll/c8w0;->a()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    :cond_0
    invoke-direct {v0, v2}, Ll/nnv0;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/4 p0, 0x5

    .line 2
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/lnv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lnv0;-><init>(Ll/mnv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/mnv0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
