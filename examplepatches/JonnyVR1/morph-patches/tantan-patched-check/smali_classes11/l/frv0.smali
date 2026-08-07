.class public final Ll/frv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/o7w0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/o7w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/frv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/frv0;->b:Ll/o7w0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/grv0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/grv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/frv0;->b:Ll/o7w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 6
    .line 7
    const-string v1, "requester_type_2"

    .line 8
    .line 9
    invoke-static {p0}, Ll/qyv0;->b(Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-direct {v0, p0}, Ll/grv0;-><init>(Z)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x15

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/erv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/erv0;-><init>(Ll/frv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/frv0;->a:Ll/xvw0;

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
