.class public final Ll/mls0;
.super Ll/xxr0;
.source "SourceFile"


# instance fields
.field public final synthetic o:[B

.field public final synthetic p:Ljava/util/Map;

.field public final synthetic q:Ll/cct0;


# direct methods
.method public constructor <init>(Ll/bts0;ILjava/lang/String;Ll/owr0;Ll/nwr0;[BLjava/util/Map;Ll/cct0;)V
    .locals 0

    .line 1
    iput-object p6, p0, Ll/mls0;->o:[B

    .line 2
    .line 3
    iput-object p7, p0, Ll/mls0;->p:Ljava/util/Map;

    .line 4
    .line 5
    iput-object p8, p0, Ll/mls0;->q:Ll/cct0;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3, p4, p5}, Ll/xxr0;-><init>(ILjava/lang/String;Ll/owr0;Ll/nwr0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final B()[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzapi;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mls0;->o:[B

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :cond_0
    return-object p0
.end method

.method public final F(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mls0;->q:Ll/cct0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/cct0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Ll/xxr0;->F(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final p()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzapi;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mls0;->p:Ljava/util/Map;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public final bridge synthetic s(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xxr0;->F(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
