.class public final Ll/cux0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/google/firebase/encoders/annotations/Encodable;
.end annotation


# instance fields
.field public final a:Ll/q4y0;

.field public final b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhy;

.field public final c:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhw;

.field public final d:Ll/tzx0;


# direct methods
.method public synthetic constructor <init>(Ll/ctx0;Ll/ytx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/ctx0;->i(Ll/ctx0;)Ll/q4y0;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Ll/cux0;->a:Ll/q4y0;

    .line 9
    .line 10
    invoke-static {p1}, Ll/ctx0;->b(Ll/ctx0;)Lcom/google/android/gms/internal/mlkit_language_id_common/zzhy;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/cux0;->b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhy;

    .line 15
    .line 16
    invoke-static {p1}, Ll/ctx0;->a(Ll/ctx0;)Lcom/google/android/gms/internal/mlkit_language_id_common/zzhw;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iput-object p2, p0, Ll/cux0;->c:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhw;

    .line 21
    .line 22
    invoke-static {p1}, Ll/ctx0;->h(Ll/ctx0;)Ll/tzx0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/cux0;->d:Ll/tzx0;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a()Lcom/google/android/gms/internal/mlkit_language_id_common/zzhw;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x3d
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cux0;->c:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhw;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lcom/google/android/gms/internal/mlkit_language_id_common/zzhy;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x2
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cux0;->b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhy;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/tzx0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x15
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cux0;->d:Ll/tzx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/q4y0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x1
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cux0;->a:Ll/q4y0;

    .line 2
    .line 3
    return-object p0
.end method
