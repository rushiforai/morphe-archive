.class public final Ll/inv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Lcom/google/android/gms/common/util/Clock;

.field public final b:Ll/o7w0;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/util/Clock;Ll/o7w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/inv0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 5
    .line 6
    iput-object p2, p0, Ll/inv0;->b:Ll/o7w0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 3

    .line 1
    new-instance v0, Ll/jnv0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/inv0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 4
    .line 5
    iget-object p0, p0, Ll/inv0;->b:Ll/o7w0;

    .line 6
    .line 7
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-direct {v0, p0, v1, v2}, Ll/jnv0;-><init>(Ll/o7w0;J)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
