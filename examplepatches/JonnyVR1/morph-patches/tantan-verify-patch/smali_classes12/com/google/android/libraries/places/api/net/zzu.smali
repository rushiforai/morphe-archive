.class final Lcom/google/android/libraries/places/api/net/zzu;
.super Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
.source "SourceFile"


# instance fields
.field private zza:Lcom/google/android/libraries/places/api/model/Place;

.field private zzb:Ljava/lang/String;

.field private zzc:J

.field private zzd:Ll/gg4;

.field private zze:B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public final getCancellationToken()Ll/gg4;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzd:Ll/gg4;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getPlace()Lcom/google/android/libraries/places/api/model/Place;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/net/zzu;->zza:Lcom/google/android/libraries/places/api/model/Place;

    return-object p0
.end method

.method public final getPlaceId()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public final getUtcTimeMillis()J
    .locals 2

    .line 1
    iget-byte v0, p0, Lcom/google/android/libraries/places/api/net/zzu;->zze:B

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzc:J

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    const-string p0, "Property \"utcTimeMillis\" has not been set"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    return-wide v0
.end method

.method public final setCancellationToken(Ll/gg4;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    .locals 0
    .param p1    # Ll/gg4;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzd:Ll/gg4;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setPlace(Lcom/google/android/libraries/places/api/model/Place;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/api/net/zzu;->zza:Lcom/google/android/libraries/places/api/model/Place;

    return-object p0
.end method

.method public final setPlaceId(Ljava/lang/String;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public final setUtcTimeMillis(J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzc:J

    const/4 p1, 0x1

    iput-byte p1, p0, Lcom/google/android/libraries/places/api/net/zzu;->zze:B

    return-object p0
.end method

.method public final zza()Lcom/google/android/libraries/places/api/net/IsOpenRequest;
    .locals 9

    .line 1
    iget-byte v0, p0, Lcom/google/android/libraries/places/api/net/zzu;->zze:B

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v2, Lcom/google/android/libraries/places/api/net/zzw;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/google/android/libraries/places/api/net/zzu;->zza:Lcom/google/android/libraries/places/api/model/Place;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzb:Ljava/lang/String;

    .line 11
    .line 12
    iget-wide v5, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzc:J

    .line 13
    .line 14
    iget-object v7, p0, Lcom/google/android/libraries/places/api/net/zzu;->zzd:Ll/gg4;

    .line 15
    .line 16
    const/4 v8, 0x0

    .line 17
    invoke-direct/range {v2 .. v8}, Lcom/google/android/libraries/places/api/net/zzw;-><init>(Lcom/google/android/libraries/places/api/model/Place;Ljava/lang/String;JLl/gg4;Lcom/google/android/libraries/places/api/net/zzv;)V

    .line 18
    .line 19
    .line 20
    return-object v2

    .line 21
    :cond_0
    const-string p0, "Missing required properties: utcTimeMillis"

    .line 22
    .line 23
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method
